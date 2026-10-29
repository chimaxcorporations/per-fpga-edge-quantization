import numpy as np
from src.integer_ptq import quantize, dense, conv1d, fixedpoint_params, round_shift_even

def test_rounding():
    x=np.array([-7,-5,-3,-1,0,1,3,5,7],dtype=np.int64)
    assert np.array_equal(round_shift_even(x,1),np.array([-4,-2,-2,0,0,0,2,2,4]))

def test_dense():
    x=np.array([[1,2,-3],[4,0,2]],dtype=np.int64)
    w=np.array([[.25,-.5,.75],[-.1,.2,.3]],dtype=np.float64)
    b=np.array([.1,-.2]); y=dense(x,w,b,.01,.02,8)
    assert y.shape==(2,2)
    assert y.dtype==np.int64

def test_conv():
    x=np.ones((2,4,10),dtype=np.int64)
    w=np.ones((16,4,3),dtype=np.float64)*.1
    b=np.zeros(16)
    y=conv1d(x,w,b,.01,.02,8)
    assert y.shape==(2,16,10)

test_rounding();test_dense();test_conv()
print('INTEGER PTQ UNIT TESTS PASSED')
