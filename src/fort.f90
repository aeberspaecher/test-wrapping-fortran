module test
  use iso_c_binding
  implicit none

  private
  public c_set

contains

  function set(x) result(y)
    double precision :: x(:)
    double precision :: y(size(x))

    y = 2*x
  end function set

  ! C interoperable routine
  subroutine c_set(n, x, y) bind(c)
    integer(c_int), intent(in) :: n
    real(c_double), intent(in) :: x(n)
    real(c_double), intent(out) :: y(n)

    y = set(x)
  end subroutine c_set

end module test

