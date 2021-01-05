! Program: numerical_derivatives
! By: Austin Keller
!-----------------------------------------------------------------------------
!
! Calculates the second derivative of f(x) = x sin(x) using Euler's method.
!
! The program takes an individual x value and calculates the 
! derivative of f(x)= x*sin(x) using both the Symmetric Euler 3-point and 
! Euler 5-point approximations to the derivative given a specified h_step.
! 
! The program also calculates the analytical second derivative for f(x) at 
! the user defined point. 
! 
! It then takes the values h_step, the analytical second derivative, the 
! Euler 3-point second derivative, and Euler 5-point derivative for each
! incrementation of h_step. Then writes the values to a filed named results.dat.
!
!
!-----------------------------------------------------------------------------
program numerical_derivatives
use types 
use read_write

implicit none
real(dp) :: x_zero

! the dp inside of the real(dp) declaration was defined in the types module
! and allows to use reals with double precision 
call read_input(x_zero)
call write_derivatives(x_zero)
end program numerical_derivatives