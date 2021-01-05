!-----------------------------------------------------------------------
!Module: analytic_functions
!-----------------------------------------------------------------------
!! By: Austin Keller
!!
!! The functions in this module are used to perform analytical calculations
!! for the rest of the modules.
!! First function is designed to calulate x*sin(x) at a given x value.
!!
!! Second function is used to calculate the analytical second derivative
!! of x*sin(x) at a given x for the rest of the modules.
!!
!!----------------------------------------------------------------------
!! Included functions:
!!
!! analytic_f(x)
!! second_derivative_f(x)
!-----------------------------------------------------------------------
module analytic_functions
use types
implicit none

! The private statement restricts every function, parameter and variable
! defined in this module to be visible only by this module
private
! The public statement to only make visible to other modules 
! the few functions or subroutines that will be used by them
public analytic_f, second_derivative_f

contains

!-----------------------------------------------------------------------
!Function: analytic_f
!-----------------------------------------------------------------------
!! By: Austin Keller
!!
!! This function is used to calculates the function x*sin(x) at a given 
!! x value (named x_zero) and stores the resulting value in y_zero 
!! which is then returned by the function.
!!
!!----------------------------------------------------------------------
!! Arguments:
!!
!! x_zero	real	point x_0 at which to evaluate f(x_0)
!-----------------------------------------------------------------------
!! Result:
!!
!! y_zero	real	x_0 sin(x_0)
!-----------------------------------------------------------------------
function analytic_f(x_zero) result(y_zero)
    implicit none
    real(dp), intent(in) :: x_zero
    real(dp) :: y_zero
    real(dp) :: function

    function = (x_zero)*sin(x_zero)
    y_zero = function
end function analytic_f

!-----------------------------------------------------------------------
!Function: second_derivative_f
!-----------------------------------------------------------------------
!! By: Austin Keller
!!
!! This fucntion is used to calculate the analytic second derivative 
!! for the function of x*sin(x) at a given x value (named x_zero) and 
!! stores the resulting value in y_zero which is then returned by the function.
!!
!!----------------------------------------------------------------------
!! Arguments:
!!
!! x_zero	real	point x_0 at which to evaluate f''(x_0)
!-----------------------------------------------------------------------
!! Result:
!!
!! y_zero	real	
!-----------------------------------------------------------------------
function second_derivative_f(x_zero) result(y_zero)
    implicit none
    real(dp), intent(in) :: x_zero
    real(dp) :: y_zero
    real(dp) :: analytical_second_derivative

    analytical_second_derivative = 2*cos(x_zero) - x_zero*sin(x_zero)
    y_zero = analytical_second_derivative
end function second_derivative_f
    
end module analytic_functions
