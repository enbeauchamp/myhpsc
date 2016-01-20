
"""
Module for quadratic interpolation.

Modified by: Eric Beauchamp
"""


import numpy as np
import matplotlib.pyplot as plt
from numpy.linalg import solve

def quad_interp(xi,yi):
    """
    Quadratic interpolation.  Compute the coefficients of the polynomial
    interpolating the points (xi[i],yi[i]) for i = 0,1,2.
    Returns c, an array containing the coefficients of
      p(x) = c[0] + c[1]*x + c[2]*x**2.

    """

    # check inputs and print error message if not valid:

    error_message = "xi and yi should have type numpy.ndarray"
    assert (type(xi) is np.ndarray) and (type(yi) is np.ndarray), error_message

    error_message = "xi and yi should have length 3"
    assert len(xi)==3 and len(yi)==3, error_message

    # Set up linear system to interpolate through data points:
    A = np.vstack([np.ones(3), xi, xi**2]).T  # stacks vertically each arg
    b = yi
    c = solve(A,b)

    return c

def cubic_interp(xi,yi):
    """
    Cubic interpolation.  Compute the coefficients of the polynomial
    interpolating the points (xi[i],yi[i]) for i = 0,1,2,3.
    Returns c, an array containing the coefficients of
      p(x) = c[0] + c[1]*x + c[2]*x**2 + c[3]*x**3.

    """

    # check inputs and print error message if not valid:

    error_message = "xi and yi should have type numpy.ndarray"
    assert (type(xi) is np.ndarray) and (type(yi) is np.ndarray), error_message

    error_message = "xi and yi should have length 4"
    assert len(xi)==4 and len(yi)==4, error_message

    # Set up linear system to interpolate through data points:
    A = np.vstack([np.ones(4), xi, xi**2, xi**3]).T  # stacks vertically each arg
    b = yi
    c = solve(A,b)

    return c   
     
def poly_interp(xi,yi):
    """
    Poly interpolation.  Compute the coefficients of the polynomial
    interpolating the points (xi[i],yi[i]) for i = 0,1,2,...,n-1
    Returns c, an array containing the coefficients of
      p(x) = c[0] + c[1]*x + c[2]*x**2 + ... + c[n-1]*x**n-1.

    """

    # check inputs and print error message if not valid:

    error_message = "xi and yi should have type numpy.ndarray"
    assert (type(xi) is np.ndarray) and (type(yi) is np.ndarray), error_message

    error_message = "xi and yi should have the same length"
    assert len(xi)==len(yi), error_message

    n = len(xi)
    A = np.ones(n)
    for i in range(1,n,1):
        A = np.vstack([A, xi**i])

    A = A.T
    b = yi
    c = solve(A,b)

    return c 
   
def plot_quad(xi, yi):
    c = quad_interp(xi, yi)
    x = np.linspace(xi.min() - 1, xi.max() + 1, 1000)
    y = c[0] + c[1]*x + c[2]*x**2
    
    plt.figure(1)
    plt.clf()
    plt.plot(x,y,'b-')
    
    plt.plot(xi, yi, 'ro')
    plt.ylim(yi.min()-1, yi.max()+1)
    
    plt.title("Data points and interpolating polynomial")
    
    plt.savefig('quadratic.png')
    print("Plot saved under quadratic.png!")

def plot_cubic(xi, yi):
    c = cubic_interp(xi, yi)
    x = np.linspace(xi.min() - 1, xi.max() + 1, 1000)
    y = c[0] + c[1]*x + c[2]*x**2 + c[3]*x**3
    
    plt.figure(1)
    plt.clf()
    plt.plot(x,y,'b-')
    
    plt.plot(xi, yi, 'ro')
    plt.ylim(yi.min()-1, yi.max()+1)
    
    plt.title("Data points and interpolating polynomial")
    
    plt.savefig('cubic.png')
    print("Plot saved under cubic.png!")

def plot_poly(xi, yi):
    c = poly_interp(xi, yi)
    x = np.linspace(xi.min() - 1, xi.max() + 1, 1000)

    n = len(c) 
    y =  c[n-1]
    for j in range(n-1, 0, -1):
        y = y*x + c[j-1]
    
    plt.figure(1)
    plt.clf()
    plt.plot(x,y,'b-')
    
    plt.plot(xi, yi, 'ro')
    plt.ylim(y.min()-1, y.max()+1)
    
    plt.title("Data points and interpolating polynomial")
    
    plt.savefig('poly.png')
    print("Plot saved under poly.png!")

def test_quad1():
    """
    Test code, no return value or exception if test runs properly.
    """
    xi = np.array([-1.,  0.,  2.])
    yi = np.array([ 1., -1.,  7.])
    c = quad_interp(xi,yi)
    c_true = np.array([-1.,  0.,  2.])
    print "c =      ", c
    print "c_true = ", c_true
    # test that all elements have small error:
    assert np.allclose(c, c_true), \
        "Incorrect result, c = %s, Expected: c = %s" % (c,c_true)

def test_cubic1():
    """
    Test code, no return value or exception if test runs properly.
    """
    xi = np.array([ 1., 2., 3., 4.])
    yi = np.array([ 5., 2., 4., 3.])
    c = cubic_interp(xi,yi)
    c_true = np.array([21.,  -25.16666667,  10.5, -1.33333333])
    print "c =      ", c
    print "c_true = ", c_true
    # test that all elements have small error:
    assert np.allclose(c, c_true), \
        "Incorrect result, c = %s, Expected: c = %s" % (c,c_true)    

def test_poly1():
    """
    Test code, no return value or exception if test runs properly.
    """
    xi = np.array([ 1., 2., 3., 4.])
    yi = np.array([ 5., 2., 4., 3.])
    c = poly_interp(xi,yi)
    c_true = np.array([21.,  -25.16666667,  10.5, -1.33333333])
    print "c =      ", c
    print "c_true = ", c_true
    # test that all elements have small error:
    assert np.allclose(c, c_true), \
        "Incorrect result, c = %s, Expected: c = %s" % (c,c_true)    

def test_poly2():
    """
    Test code, no return value or exception if test runs properly.
    """
    xi = np.array([ 1., 2., 3., 4., 6.])
    yi = np.array([ 5., 4., 2., 4., 3.])
    c = poly_interp(xi,yi)
    c_true = np.array([-7.4,  25.08333333,  -16.29166667, 3.91666667, -0.308333333])
    print "c =      ", c
    print "c_true = ", c_true
    # test that all elements have small error:
    assert np.allclose(c, c_true), \
        "Incorrect result, c = %s, Expected: c = %s" % (c,c_true)    
                        
if __name__=="__main__":
    # "main program"
    # the code below is executed only if the module is executed at the command line,
    #    $ python demo2.py
    # or run from within Python, e.g. in IPython with
    #    In[ ]:  run demo2
    # not if the module is imported.
    print "Test for quadratic interpolation..."
    test_quad1()
    print "Test for cubic interpolation..."    
    test_cubic1()
    print "Test for n=4 interpolation..."    
    test_poly1()    
    print "Test for n=5 interpolation..."    
    test_poly2()    
