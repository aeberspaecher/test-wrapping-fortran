module myTypes
    integer, parameter :: dp = kind(1.0d0)
end module

module test
  use myTypes
  use iso_c_binding
  implicit none

  private
  public c_set

contains

  function set(x) result(y)
    real(dp) :: x(:)
    complex(dp) :: y(size(x))

    y = (0.0d0, 2.0d0)*x
  end function set

  ! C interoperable routine
  subroutine c_set(n, x, y) bind(c)
    integer(c_int), intent(in) :: n
    real(c_double), intent(in) :: x(n)
    complex(c_double_complex), intent(out) :: y(n)

    y = set(x)
  end subroutine c_set

end module test

