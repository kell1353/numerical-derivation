!-----------------------------------------------------------------------
!Module: read_write
!-----------------------------------------------------------------------
!! By: Austin Keller
!!
!! The subroutines in this module are for reading the users input
!! checking if that input is valid. (first subroutine) 
!!
!! Then writing the h_step we along the dervied analytical second derivative, 
!! the approximated 3 point numerical second derivative and the approximated 5 point 
!! second derivative into a file called results.dat for analysis in Jupyter. (second subroutine)
!!
!!----------------------------------------------------------------------
!! Included subroutines:
!!
!! read_input(x_zero)
!! write_derivatives(x_zero)
!-----------------------------------------------------------------------
module read_write
use types
use analytic_functions, only : second_derivative_f
use euler_formulas, only : euler_3points, euler_5points
implicit none


private
public read_input, write_derivatives

contains

!-----------------------------------------------------------------------
!Subroutine: read_input
!-----------------------------------------------------------------------
!! By: Austin Keller
!!
!! This subroutine provides the user with information about the program and 
!! status what information to provide for the program to run  effectively.
!! 
!! It then reads the users input converts it into a string and checks if the 
!! the value is not an empty string, then checks if there is an error and lets the user 
!! know with a message and loops back to allow user another entry.
!!
!! If there isn't an error the subroutine exits the loop and the program continues.
!!
!! If neither case is true the subroutine prints a message letting the user know they
!! enter a blank value and loops back to allow user another entry.
!! 
!!----------------------------------------------------------------------
!! Arguments:
!! x_zero  real  value at which the derivatives will be calculated
!-----------------------------------------------------------------------
subroutine read_input(x_zero)
    implicit none
    real(dp), intent(out) :: x_zero
    character(len=120) :: string
    integer :: ierror
  
    print *, 'This program calculates the second derivative of x*sin(x)'
    print *, 'Please provide a real number that you would like to derive at.'
    print *, '...'


    ! When reading input from a user, checks have to be made to make sure that
    ! the user provided the correct type of input. 
    ! 
    ! We enclose the input reading inside an infinite loop that can only
    ! be exited when a correct input is given.
    !
    ! We read a string containing
    ! the user's input and then make checks on that string by converting 
    ! it into a real number.
    ! 
    ! The first check is to make sure that the string is not empty 
    ! (i.e. the user simply pressed the enter key)
    ! 
    ! The second check is made by using the 'read' statement to convert
    ! the string into a number, if that is not possible iostat gives an
    ! error code different from zero.
    do
        read(*,'(a)', iostat=ierror) string
        if(string /= '') then
            read(string, *, iostat=ierror) x_zero
            if (ierror == 0 ) exit
            print *, "'"//trim(string)//"'"//' is not a number, please provide a number'
        else
            print *, 'that was an empty input, please provide a number'
        endif
    enddo
end subroutine read_input

!-----------------------------------------------------------------------
!Subroutine: write_derivatives
!-----------------------------------------------------------------------
!! By: Austin Keller
!!
!! This subroutine takes in the users input for x_zero as an input. 
!!
!! Then establishes the initial h_step, the h_increment and h_max. Defines 
!! d2_analytic (analytic f''(x)), d2_num3 (numerical f''(x) 3 points), and
!! d2_num5 (numerical f''(x) 5 points) and the file name to write to.
!!
!! Initiates a loop where it calculates the f''(x) euler_3points and euler_5points
!! using the x_zero and starting at h_step and writes the results into the file.
!! It continues looping and incrementing h_step by h_increment and performing
!! the calculations until h_step is less than h_max then exits the subroutine.
!! 
!!----------------------------------------------------------------------
!! Arguments:
!! x_zero  real  value at which the derivatives will be calculated
!-----------------------------------------------------------------------
subroutine write_derivatives(x_zero)
    implicit none
    real(dp), intent(in) :: x_zero

    real(dp) :: h_step = .1_dp
    real(dp), parameter :: h_increment = 0.9_dp, h_max = 0.01_dp
    real(dp) :: d2_analytic, d2_num3, d2_num5
    character(len=*), parameter :: file_name = 'results.dat'
    integer :: unit

    d2_analytic = second_derivative_f(x_zero)

    open(newunit=unit, file=file_name)
    write(unit,'(4a28)') 'h', 'analytic', '3 point', '5 point'
    do 
        d2_num3 = euler_3points(x_zero, h_step)
        d2_num5 = euler_5points(x_zero, h_step)
        write(unit,'(4e28.16)') h_step, d2_analytic, d2_num3, d2_num5
        if(h_step < h_max) exit
        h_step = h_step*h_increment
    enddo
    close(unit)

    print *, 'The derivatives were written in the '//file_name//' file'
end subroutine write_derivatives

end module read_write
