"""
Script to find intersections of two functions.
g1(x) = x*cos(pi*x) and g2(x) = 1-0.6x^2
Developed by Eric Beauchamp
"""

import newton
import numpy as np

def gvals(x):
    """
    Return the values of g1(x) - g2(x), and g1'(x) - g2'(x),
    to solve with Newton's Method
    """
    g1 = x*np.cos(np.pi*x)
    g1p = np.cos(np.pi*x) - (np.pi*x*np.sin(np.pi*x))
    
    g2 = 1. - 0.6*x**2
    g2p = -1.2*x
    
    gdiff = g1-g2
    gpdiff = g1p-g2p
    return gdiff, gpdiff  

def gvals2(x):
    """
    Return the values of g1(x) - g2(x), and g1'(x) - g2'(x),
    to solve with Newton's Method
    """
    g1 = np.sin(x)
    g1p = np.cos(x)
    
    g2 = 1. - x**2
    g2p = -2.*x
    
    gdiff = g1-g2
    gpdiff = g1p-g2p
    return gdiff, gpdiff  
    
for x0 in [-0.5, 0.5]:#[-3., -2., -1., -0.5, 1., 2.]:
    print " "
    x, iters = newton.solve(gvals2, x0, debug=True)
    print "With initial guess x0 = %22.15e" %x0
    print "      solve returns x = %22.15e after %s iterations" %(x, iters)
    print "        g1(x) - g2(x) = %22.15e" %gvals(x)[0]
