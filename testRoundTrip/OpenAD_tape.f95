module OpenAD_tape
  implicit none

  private
  public :: double_tape, double_tape_pointer, &
&           integer_tape, integer_tape_pointer, &
&           tape_init, tape_dump

  integer, parameter :: max_double_tape_size=1000
  integer, parameter :: max_integer_tape_size=1000
  double precision :: double_tape(max_double_tape_size)
  integer :: integer_tape(max_integer_tape_size)
  integer double_tape_pointer, integer_tape_pointer

  interface tape_init
    module procedure init
  end interface tape_init

  interface tape_dump
    module procedure dump
  end interface tape_dump

contains

  subroutine init
    double_tape_pointer=1
    integer_tape_pointer=1
  end subroutine init

  subroutine dump
    integer i
    print*, "double tape"
    do i=1,double_tape_pointer-1
      print*, double_tape(i)
    enddo
    print*, "integer tape"
    do i=1,integer_tape_pointer-1
      print*, integer_tape(i)
    enddo
  end subroutine dump

end module OpenAD_tape
