module OpenAD_checkpoints
  implicit none

  private
  public :: double_argument_checkpoints, double_result_checkpoints, &
&double_arguments_pointer, double_results_pointer, checkpoints_init, &
&checkpoints_dump

  integer, parameter :: max_double_arguments_size=2000
  integer, parameter :: max_double_results_size=2000
  double precision :: double_argument_checkpoints(max_double_arguments_size)
  double precision :: double_result_checkpoints(max_double_results_size)
  integer double_arguments_pointer, double_results_pointer

  interface checkpoints_init
    module procedure init
  end interface checkpoints_init

  interface checkpoints_dump
    module procedure dump
  end interface checkpoints_dump

contains

  subroutine init
    double_arguments_pointer=1
    double_results_pointer=1
  end subroutine init

  subroutine dump
    integer i
    print*, "arguments"
    do i=1,double_arguments_pointer-1
      print*, double_argument_checkpoints(i)  
    enddo
    print*, "results"
    do i=1,double_results_pointer-1
      print*, double_result_checkpoints(i)  
    enddo
  end subroutine dump

end module OpenAD_checkpoints
