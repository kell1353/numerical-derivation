!-----------------------------------------------------------------------
!Module: euler_formulas
!-----------------------------------------------------------------------
!! By: Austin Keller
!!
!! These two functions established two serperate ways of of calculating
!! the numerical second derivative of a given analytical function using
!! the symmetric three-point and five-point formulas.
!!
!!----------------------------------------------------------------------
!! Included functions:
!!
!! euler_3points(x,h)
!-----------------------------------------------------------------------
module euler_formulas
use types
use analytic_functions, only : analytic_f
implicit none

private
public euler_3points, euler_5points

contains

!-----------------------------------------------------------------------
!Function: euler_3points
!-----------------------------------------------------------------------
!! By: Austin Keller
!!
!! This function calculates the numerical second derivative of any analytical 
!! function using the symmetric 3 point method. Takes in a values of x and h.
!! Then established the f(x + h), f(x - h), and f(x) as variables.
!! Then calculates the function and stores the resulting value in y_zero 
!! which is then returned by the function.
!!
!!----------------------------------------------------------------------
!! Arguments:
!!
!! x_zero   real    point x_0 at which to evaluate f''(x_0)
!! h_step   real    step size in the numerical expression
!-----------------------------------------------------------------------
!! Result:
!!
!! y_zero   real    (f(x+h)-2f(x)+f(x-h))/(h^2)
!-----------------------------------------------------------------------
function euler_3points(x_zero,h_step) result(y_zero)
    implicit none
    real(dp), intent(in) :: x_zero, h_step
    real(dp) :: y_zero
    real(dp) :: f_plus, f_zero, f_minus
    real(dp) :: numerical_second_derivative_3_points
    ! This evaluates the analytic function defined in the analytic_functions
    ! module at x+h, x, and x-h.
    f_plus = analytic_f(x_zero + h_step)
    f_zero = analytic_f(x_zero)
    f_minus = analytic_f(x_zero - h_step)

    ! approximation to the second derivative
    numerical_second_derivative_3_points = (f_plus - 2*f_zero + f_minus)/(h_step**2)
    y_zero = numerical_second_derivative_3_points
end function euler_3points



!-----------------------------------------------------------------------
!Function: euler_5points
!-----------------------------------------------------------------------
!! By: Austin Keller
!!
!! This function calculates the numerical second derivative of any analytical 
!! function using the symmetric 5 point method. Takes in a values of x and h.
!! Then established the f(x + h), f(x + 2h), f(x), f(x - h) and f(x - 2h) 
!! as variables.Then calculates the function and stores the resulting value 
!! in y_zero which is then returned by the function.
!!
!!----------------------------------------------------------------------
!! Arguments:
!!
!! x_zero   real    point x_0 at which to evaluate f''(x_0)
!! h_step   real    step size in the numerical expression
!-----------------------------------------------------------------------
!! Result:
!!
!! y_zero   real    (-f(x+2h)+16f(x+h)-30f(x)+16f(x-h)-f(x-2h))/(12h^2)
!-----------------------------------------------------------------------
function euler_5points(x_zero,h_step) result(y_zero)
    implicit none
    real(dp), intent(in) :: x_zero, h_step
    real(dp) :: y_zero
    real(dp) :: f_plus, f_zero, f_minus, f_2plus, f_2minus
    real(dp) :: numerical_second_derivative_5_points

    ! This evaluates the analytic function defined in the analytic_functions
    ! module at x+h, x+2h, x, x-h, and x-2h. 
    f_plus = analytic_f(x_zero + h_step)
    f_2plus = analytic_f(x_zero + 2*h_step)
    f_zero = analytic_f(x_zero)
    f_minus = analytic_f(x_zero - h_step)
    f_2minus = analytic_f(x_zero - 2*h_step)

    ! using the evaluated values to calculate the numerical
    ! approximation to the second derivative
    numerical_second_derivative_5_points = ((-f_2plus) + (16*f_plus) - 30*f_zero + 16*f_minus - f_2minus)/(12*(h_step**2))
    y_zero = numerical_second_derivative_5_points
end function euler_5points
    
end module euler_formulas