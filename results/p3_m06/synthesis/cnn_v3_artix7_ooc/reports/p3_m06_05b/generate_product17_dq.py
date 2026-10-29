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

registers = {}

for match in pattern.finditer(neuron):
    instance = match.group(2)
    ports = match.group(3)

    m = re.fullmatch(r"\\product_reg_reg\[(\d+)\]", instance)

    if not m:
        continue

    index = int(m.group(1))

    d = re.search(r"\.D\s*\(\s*(.*?)\s*\)", ports, re.DOTALL)
    q = re.search(r"\.Q\s*\(\s*(.*?)\s*\)", ports, re.DOTALL)

    if d and q:
        registers[index] = {
            "D": d.group(1).strip(),
            "Q": q.group(1).strip(),
        }

assert sorted(registers) == list(range(17)), sorted(registers)


def ref(signal):
    if signal.startswith("\\"):
        return "dut.neuron." + signal + " "
    return "dut.neuron." + signal


def bus(port):
    return "{\n" + ",\n".join(
        "    " + ref(registers[i][port])
        for i in reversed(range(17))
    ) + "\n}"


source = Path("tb_cnn_postroute_pipeline.v").read_text()

source = source.replace(
    "module tb_cnn_postroute_pipeline;",
    "module tb_cnn_postroute_product17_dq;",
    1
)

monitor = r"""
  reg [16:0] product17_d_pre;
  reg [16:0] product17_q_pre;
  reg [16:0] product17_q_post;
  reg [16:0] product17_expected;
  reg product17_ce_pre;
  reg product17_rst_pre;

  always @(negedge clk) begin
    if (!rst && sample == 0 &&
        checked1 >= 39 && checked1 <= 40) begin

      #4;

      product17_d_pre = PRODUCT_D_BUS;
      product17_q_pre = PRODUCT_Q_BUS;

      product17_ce_pre =
          dut.neuron.\product_reg[16]_i_1_n_0 ;

      product17_rst_pre = dut.neuron.rst;

      product17_expected =
          product17_rst_pre ? 17'd0 :
          product17_ce_pre ? product17_d_pre :
          product17_q_pre;

      #3;

      product17_q_post = PRODUCT_Q_BUS;

      $display(
        "PRODUCT17_DQ t=%0t checked=%0d CE=%b R=%b D=%05h Q_PRE=%05h EXPECTED=%05h Q_POST=%05h MATCH=%b",
        $time,
        checked1,
        product17_ce_pre,
        product17_rst_pre,
        product17_d_pre,
        product17_q_pre,
        product17_expected,
        product17_q_post,
        product17_q_post === product17_expected
      );

    end
  end
"""

monitor = monitor.replace("PRODUCT_D_BUS", bus("D"))
monitor = monitor.replace("PRODUCT_Q_BUS", bus("Q"))

pos = source.rfind("endmodule")
assert pos >= 0

source = source[:pos] + monitor + "\nendmodule\n"

Path("tb_cnn_postroute_product17_dq.v").write_text(source)

print("Generated 17-bit product D/Q monitor")
