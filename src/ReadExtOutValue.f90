! this file reads value in Fortran format.

subroutine read_three_double(readstr, valuep1, valuep2, valuep3)
  implicit none
  character(len=66), intent(in) :: readstr
  real(kind=8), intent(out) :: valuep1, valuep2, valuep3

  read(readstr, "(3D22.13)") valuep1, valuep2, valuep3

  return
end subroutine read_three_double

subroutine read_one_double(readstr, valuep)
  implicit none
  character(len=13), intent(in) :: readstr
  real(kind=8), intent(out) :: valuep

  read(readstr, "(D13.6)") valuep

  return
end subroutine read_one_double

