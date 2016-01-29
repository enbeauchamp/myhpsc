! $MYHPSC/homework3/problem7/test_quartic.f90

program test_quartic

    use newton, only: solve, set_tol
    use functions, only: f_quartic, fprime_quartic, set_epsilon

    implicit none
    real(kind=8) :: x, x0, fx, tol, eps, xstar
    real(kind=8) :: tols(3), epss(3), xstars(3)
    integer :: iters, itest, jtest
	logical :: debug         ! set to .true. or .false.

	x0 = 4.d0
    print 10, x0
10  format("Starting with initial guess ", es22.15)
	print *, ''
	print *, '    epsilon        tol    iters          x                 f(x)        x-xstar'
    debug = .false.

    ! values to test as tols and eps:
    tols = (/1.d-5, 1.d-10, 1.d-14 /)
    epss = (/1.d-4, 1.d-8, 1.d-12 /)
    xstars = (/1.1d0, 1.01d0, 1.001d0 /)
	
	do jtest=1,3
		eps = epss(jtest)ls
		call set_epsilon(eps)
		
		do itest=1,3
			tol = tols(itest)
		    call set_tol(tol)
		    call solve(f_quartic, fprime_quartic, x0, x, iters, debug)
		    fx = f_quartic(x)
			xstar = x-xstars(jtest)
			
		    print 11, eps, tol, iters, x, fx, xstar
		11  format(2es13.3, i4, es24.15, 2es13.3)

		enddo

		print *, ''
	end do
			
end program test_quartic
