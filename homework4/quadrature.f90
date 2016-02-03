! Module to calculate the quadrature of a given function
! Developed by Eric Beauchamp
module quadrature

implicit none

contains

	! Calculates the quadrature of a given function by the Trapezoid Rule
	real(kind=8) function trapezoid(f, a, b, n)
		implicit none
		real(kind=8), intent(in) :: a, b
		integer, intent(in) :: n
		real(kind=8), external :: f
		
		integer :: i
		real(kind=8) :: h
		real(kind=8) :: xj(n), fj(n)
		
		h = (b-a)/(n-1)		
		xj(1:n) = (/ (a+(i-1)*h , i=1,n) /)
		fj(1:n) = (/ (f(xj(i)),   i=1,n) /)
		trapezoid = h*sum(fj) - 5.0d-1*h*(fj(1) + fj(n))
	
	end function trapezoid

	subroutine error_table(f, a, b, nvals, int_true )
		implicit none
		real(kind=8), external :: f
		real(kind=8), intent(in) :: a, b, int_true
		integer, dimension(:), intent(in) :: nvals
		
		real(kind=8) :: int_trap, error, error0, ratio
		integer :: i, n

		print *, "    n         trapezoid            error       ratio"
		error = 0.d0
		ratio = 0.d0
		
		do i=1,size(nvals)
			n = nvals(i)
			error0 = error
			int_trap = trapezoid(f, a, b, n)
			
			error = abs(int_trap - int_true)
			
			if (i > 1) then
				ratio = error0/error
			end if
			
			print 11, n, int_trap, error, ratio
			11 format(i8, es22.14, es13.3, es13.3)	
			
		end do
		
	end subroutine

end module quadrature
