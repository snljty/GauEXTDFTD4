! this file outputs data to string.

subroutine write_four_double(writestr, valuep1, valuep2, valuep3, valuep4)
  implicit none
  character(len=80), intent(out) :: writestr
  real(kind=8), intent(in) :: valuep1, valuep2, valuep3, valuep4

  write(writestr, "(4D20.12)") valuep1, valuep2, valuep3, valuep4
  return
end subroutine write_four_double

subroutine write_three_double(writestr, valuep1, valuep2, valuep3)
  implicit none
  character(len=60), intent(out) :: writestr
  real(kind=8), intent(in) :: valuep1, valuep2, valuep3

  write(writestr, "(3D20.12)") valuep1, valuep2, valuep3
  return
end subroutine write_three_double

