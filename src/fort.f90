module myTypes
  implicit none
  integer, parameter :: dp = kind(1.0d0)
end module myTypes

module test
  use myTypes
  use iso_c_binding
  implicit none

  private
  public c_set

contains

  ! multiply a real array by 2i
  function set(x) result(y)
    real(dp), intent(in) :: x(:)
    complex(dp) :: y(size(x))

    y = (0.0d0, 2.0d0)*x
  end function set

  ! multiply of a 2d array by 2i -- also set element 1,2 to 0 (if array is large enough)
  function set_array(x) result (y)
    real(dp), intent(in) :: x(:, :)
    complex(dp) :: y(size(x, 1), size(x, 2))

    y = x  ! copy input array to output array
    y = (0.0d0, 2.0d0)*y
    if (size(y, 2) >= 2) then
      y(1,2) = 0.0d0
    endif
  end function set_array

  ! C interoperable routine for 'set'
  subroutine c_set(n, x, y) bind(c)
    integer(c_int), intent(in) :: n
    real(c_double), intent(in) :: x(n)
    complex(c_double_complex), intent(out) :: y(n)

    y = set(x)
  end subroutine c_set

  subroutine c_set_array(n, m, x, y) bind(c)
    integer(c_int), intent(in) :: n, m
    real(c_double), intent(in) :: x(n, m)
    complex(c_double_complex), intent(out) :: y(n, m)
!    write(*, *) shape(x)  ! debugging output
    y = set_array(x)
  end subroutine

end module test

