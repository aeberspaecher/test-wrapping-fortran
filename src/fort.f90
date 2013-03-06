module myTypes
  implicit none
  integer, parameter :: dp = kind(1.0d0)
end module myTypes

module test
  use myTypes
  implicit none

  public

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

end module test
