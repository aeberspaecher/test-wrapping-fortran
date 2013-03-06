module c_test
  use test
  use iso_c_binding, only: c_int, c_double, c_double_complex
  implicit none

  public

contains

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
  end subroutine c_set_array

end module c_test
