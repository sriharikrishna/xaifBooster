module OpenAD_checkpoints

  use active_module

  implicit none

  private

  integer, parameter :: store_increase=20000

  public ::  cp_store_real_scalar, cp_store_real_vector, cp_store_int_scalar, cp_store_int_vector, cp_store_string_scalar, cp_store_bool_scalar

  interface cp_store_real_scalar
    module procedure cp_store_real_scalar_impl
  end interface cp_store_real_scalar

  interface cp_store_real_vector
    module procedure cp_store_real_vector_impl
  end interface cp_store_real_vector

  interface cp_store_int_scalar
    module procedure cp_store_int_scalar_impl
  end interface cp_store_int_scalar

  interface cp_store_int_vector
    module procedure cp_store_int_vector_impl
  end interface cp_store_int_vector

  interface cp_store_string_scalar
    module procedure cp_store_string_scalar_impl
  end interface cp_store_string_scalar

  interface cp_store_bool_scalar
    module procedure cp_store_bool_scalar_impl
  end interface cp_store_bool_scalar

contains

  subroutine cp_store_real_scalar_impl(x,s,c,a)
    ! store x in stack s of allocated size a in current position c
    implicit none
    double precision, intent(in) :: x
    integer :: c,a,i
    double precision, dimension(:), allocatable :: s
    ! temp array for potential reallocation
    double precision, dimension(:), allocatable :: temp
    if(a<c+1) then 
      if (a>0) then 
        allocate(temp(a))
        temp=s
        deallocate(s)
      end if 
      allocate(s(a+store_increase))
      if (a>0) then 
        s(1:a) = temp
        deallocate(temp)
      end if 
      a=a+store_increase
    end if
    c=c+1
    s(c)=x
  end subroutine

  subroutine cp_store_real_vector_impl(x,n,s,c,a)
    ! store x of size n in stack s of allocated size a in current position c
    implicit none
    type(active), dimension(:), intent(in) :: x
    integer, intent(in) :: n
    integer :: c,a,i
    double precision, dimension(:), allocatable :: s
    ! temp array for potential reallocation
    double precision, dimension(:), allocatable :: temp
    if(a<c+n) then 
      if (a>0) then 
        allocate(temp(a))
        temp=s
        deallocate(s)
      end if 
      allocate(s(a+store_increase))
      if (a>0) then 
        s(1:a) = temp
        deallocate(temp)
      end if 
      a=a+store_increase
    end if
    do i=1,n
      s(i)=x(i)%v
    end do 
    c=c+n
  end subroutine 

  subroutine cp_store_int_scalar_impl(x,s,c,a)
    ! store x in stack s of allocated size a in current position c
    implicit none
    integer, intent(in) :: x
    integer :: c,a,i
    integer, dimension(:), allocatable :: s
    ! temp array for potential reallocation
    integer, dimension(:), allocatable :: temp
    if(a<c+1) then 
      if (a>0) then 
        allocate(temp(a))
        temp=s
        deallocate(s)
      end if 
      allocate(s(a+store_increase))
      if (a>0) then 
        s(1:a) = temp
        deallocate(temp)
      end if 
      a=a+store_increase
    end if
    c=c+1
    s(c)=x
  end subroutine 

  subroutine cp_store_int_vector_impl(x,n,s,c,a)
    ! store x of size n in stack s of allocated size a in current position c
    implicit none
    integer, dimension(:), intent(in) :: x
    integer, intent(in) :: n
    integer :: c,a,i
    integer, dimension(:), allocatable :: s
    ! temp array for potential reallocation
    integer, dimension(:), allocatable :: temp
    if(a<c+n) then 
      if (a>0) then 
        allocate(temp(a))
        temp=s
        deallocate(s)
      end if 
      allocate(s(a+store_increase))
      if (a>0) then 
        s(1:a) = temp
        deallocate(temp)
      end if 
      a=a+store_increase
    end if
    s(c+1:c+n)=x
    c=c+n
  end subroutine 

  subroutine cp_store_string_scalar_impl(x,s,c,a)
    ! store x in stack s of allocated size a in current position c
    implicit none
    character(80), intent(in) :: x
    integer :: c,a,i
    character(80), dimension(:), allocatable :: s
    ! temp array for potential reallocation
    character(80), dimension(:), allocatable :: temp
    if(a<c+1) then 
      if (a>0) then 
        allocate(temp(a))
        temp=s
        deallocate(s)
      end if 
      allocate(s(a+store_increase))
      if (a>0) then 
        s(1:a) = temp
        deallocate(temp)
      end if 
      a=a+store_increase
    end if
    c=c+1
    s(c)=x
  end subroutine 

  subroutine cp_store_bool_scalar_impl(x,s,c,a)
    ! store x in stack s of allocated size a in current position c
    implicit none
    logical, intent(in) :: x
    integer :: c,a,i
    logical, dimension(:), allocatable :: s
    ! temp array for potential reallocation
    logical, dimension(:), allocatable :: temp
    if(a<c+1) then 
      if (a>0) then 
        allocate(temp(a))
        temp=s
        deallocate(s)
      end if 
      allocate(s(a+store_increase))
      if (a>0) then 
        s(1:a) = temp
        deallocate(temp)
      end if 
      a=a+store_increase
    end if
    c=c+1
    s(c)=x
  end subroutine 

end module OpenAD_checkpoints
