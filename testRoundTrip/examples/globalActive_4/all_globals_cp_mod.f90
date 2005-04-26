module all_globals_cp_mod

  use all_globals_mod
  use OpenAD_checkpoints

  implicit none
  public :: cp_store_globals, cp_restore_globals

  interface cp_store_globals
     module procedure cp_store_globals_impl
  end interface

  interface cp_restore_globals
     module procedure cp_restore_globals_impl
  end interface

contains 

  subroutine cp_store_globals_impl(sd,cd,ad,si,ci,ai,ss,cs,as,sb,cb,ab)
    implicit none
    integer :: cd,ad,ci,ai,cs,as,cb,ab
    double precision, dimension(:), allocatable :: sd
    integer, dimension(:), allocatable :: si
    character(80), dimension(:), allocatable :: ss
    logical, dimension(:), allocatable :: sb
    integer i

    call cp_store_real_vector(x,2,sd,cd,ad)
    call cp_store_real_vector(y,1,sd,cd,ad)

  end subroutine cp_store_globals_impl

  subroutine cp_restore_globals_impl(sd,cd,si,ci,ss,cs,sb,cb)
    implicit none
    integer :: cd,ad,ci,ai,cs,as,cb,ab
    double precision, dimension(*) :: sd
    integer, dimension(*) :: si
    character(80), dimension(*) :: ss
    logical, dimension(*) :: sb
    integer i,j

    do i=ubound(y,1),lbound(y,1),-1
       y(i)%v=sd(cd); cd=cd-1
    end do
    do i=ubound(x,1),lbound(x,1),-1
       x(i)%v=sd(cd); cd=cd-1
    end do

  end subroutine cp_restore_globals_impl

end module all_globals_cp_mod

