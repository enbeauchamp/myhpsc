! $MYHPSC/homework3/newton/functions.f90

module functions
    
    implicit none
    real(kind=8), parameter :: pi=3.1415926535897932d0

contains

    real(kind=8) function f_sqrt(x)
		
		implicit none
        real(kind=8), intent(in) :: x
        f_sqrt = x**2 - 4.d0

    end function f_sqrt


    real(kind=8) function fprime_sqrt(x)

		implicit none
        real(kind=8), intent(in) :: x   
        fprime_sqrt = 2.d0 * x

    end function fprime_sqrt  

    real(kind=8) function g_cos(x)

    	implicit none
        real(kind=8), intent(in) :: x
        g_cos = x*cos(pi*x)
    
    end function g_cos

    real(kind=8) function g_diff(x)

		implicit none    
        real(kind=8), intent(in) :: x
        real(kind=8) :: g_cos, g_x2
        g_cos = x*cos(pi*x)        
        g_x2 = 1.d0 - 6.d-1*x**2        
        g_diff = g_cos-g_x2
        
    end function g_diff
    
    real(kind=8) function gprime_diff(x)
		
		implicit none
        real(kind=8), intent(in) :: x
        real(kind=8) :: gprime_cos, gprime_x2
        gprime_cos = cos(pi*x) - pi*x*sin(pi*x)        
        gprime_x2 = -1.2d0*x
        gprime_diff = gprime_cos-gprime_x2
        
    end function gprime_diff

end module functions
