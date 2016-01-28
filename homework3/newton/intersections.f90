! $MYHPSC/homework3/newton/intersections.f90

program intersections

    use newton, only: solve
    use functions, only: g_cos, g_diff, gprime_diff

    implicit none
    real(kind=8) :: x, x0, gx
    real(kind=8) :: x0vals(4)
    integer :: iters, itest
	logical :: debug         ! set to .true. or .false.

    print *, "Test routine for computing zero of f"
    debug = .false.

    ! values to test as x0:
    x0vals = (/-3.d0, -2.d0, -1.d0, 1.6d0 /)

    do itest=1,4
        x0 = x0vals(itest)
		print *, ' '  ! blank line
        call solve(g_diff, gprime_diff, x0, x, iters, debug)

        print 14, x0
14      format('With initial guess x0 = ', es22.15)
        
        print 11, x, iters
11      format('solver returns x = ', es22.15, ' after', i3, ' iterations')

        gx = g_cos(x)
        print 12, gx
12      format('the value of g(x) is ', es22.15)

        enddo

end program intersections
