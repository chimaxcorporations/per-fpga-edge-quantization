import re
from pathlib import Path

netlist = Path("cnn_v3_post_route_functional.v").read_text()

start = netlist.index("module neuron_int8_configurable")
end = netlist.index("endmodule", start)

neuron = netlist[start:end]

pattern = re.compile(
    r"\b(FDRE|FDSE|FDCE|FDPE)\b"
    r"\s*(?:#\s*\(.*?\)\s*)?"
    r"(\\[^\s]+|[A-Za-z_][A-Za-z0-9_$]*)"
    r"\s*\((.*?)\);",
    re.DOTALL
)

groups = {
    "product": {},
    "product_alt": {},
    "magnitude": {},
    "quotient": {},
    "rounded": {},
}

for match in pattern.finditer(neuron):
    instance = match.group(2)
    ports = match.group(3)

    q = re.search(r"\.Q\s*\(\s*(.*?)\s*\)", ports, re.DOTALL)

    if not q:
        continue

    q_signal = q.group(1).strip()

    # Separate duplicated product register groups.
    if re.fullmatch(r"\\product_reg_reg\[\d+\]", instance):
        group = "product"

    elif re.fullmatch(r"\\product_reg_reg\[\d+\]__0", instance):
        group = "product_alt"

    elif re.fullmatch(r"\\magnitude_reg_reg\[\d+\]", instance):
        group = "magnitude"

    elif re.fullmatch(r"\\quotient_reg_reg\[\d+\]", instance):
        group = "quotient"

    elif re.fullmatch(r"\\rounded_reg_reg\[\d+\]", instance):
        group = "rounded"

    else:
        continue

    index = int(re.search(r"\[(\d+)\]", instance).group(1))

    groups[group][index] = q_signal


def verilog_signal(signal):
    # Escaped Verilog identifiers require terminating whitespace.
    if signal.startswith("\\"):
        return "dut.neuron." + signal + " "
    return "dut.neuron." + signal


def build_bus(group):
    bits = groups[group]

    if not bits:
        return "1'bx"

    maximum = max(bits)

    expressions = []

    for i in range(maximum, -1, -1):
        if i in bits:
            expressions.append(verilog_signal(bits[i]))
        else:
            expressions.append("1'bx")

    return "{\n          " + ",\n          ".join(expressions) + "\n        }"


for group, bits in groups.items():
    print(
        f"{group}: {len(bits)} bits, "
        f"index range {min(bits) if bits else '-'}.."
        f"{max(bits) if bits else '-'}"
    )

src = Path("tb_cnn_postroute_acc_dq.v").read_text()

src = src.replace(
    "module tb_cnn_postroute_acc_dq;",
    "module tb_cnn_postroute_pipeline;"
)

monitor = """

  // Post-route neuron pipeline diagnostic.
  // Observe registered Q values, not combinational D buses.
  always @(negedge clk) begin
    if (!rst && sample == 0 &&
        checked1 >= 39 && checked1 <= 40) begin

      #3;

      $display(
        "PIPE t=%0t checked=%0d done=%b result=%h",
        $time,
        checked1,
        dut.neuron.done,
        dut.neuron.result
      );

"""

for group in groups:
    monitor += f"""
      $display(
        "PIPE_{group.upper()} t=%0t checked=%0d value=%h",
        $time,
        checked1,
        {build_bus(group)}
      );
"""

monitor += """
    end
  end
"""

position = src.rfind("endmodule")

assert position >= 0

src = src[:position] + monitor + "\nendmodule\n"

Path("tb_cnn_postroute_pipeline.v").write_text(src)

print("Generated tb_cnn_postroute_pipeline.v")
