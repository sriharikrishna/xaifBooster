program driver

  use active_module
  use all_globals_mod
  use OpenAD_rev
  use OpenAD_tape

  implicit none 

  external head

  double precision, dimension(:), allocatable :: x0,y0
  double precision, dimension(:,:), allocatable :: res_adj
  real h
  integer n,m
  integer i,j,k

  n=2
  m=1
  h=0.00001

  allocate(x0(n))
  allocate(y0(m))
  allocate(res_adj(m,n))

  do i=1,n   
     x0(i)=i/2.
  end do

  open(2,file='tmpOutput/dd.out')
  write(2,*) "DD"
  our_rev_mode%arg_store=.FALSE.
  our_rev_mode%arg_restore=.FALSE.
  our_rev_mode%res_store=.FALSE.
  our_rev_mode%res_restore=.FALSE.
  our_rev_mode%plain=.TRUE.
  our_rev_mode%tape=.FALSE.
  our_rev_mode%adjoint=.FALSE.
  do j=1,n   
     x(j)%v=x0(j)
  end do
  call head()
  do k=1,m
     y0(k)=y(k)%v
  end do
  do i=1,n   
     do j=1,n   
        x(j)%v=x0(j)
        if (i==j) then 
           x(j)%v=x0(j)+h
        end if
     end do
     call head()
     do k=1,m
        write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",k,",",i,")=",(y(k)%v-y0(k))/h
     end do
  end do
  close(2)

  call tape_init()
  open(2,file='tmpOutput/ad.out')
  write(2,*) "AD"

  do i=1,m   
     do j=1,m   
        y(j)%v=0.0
        if (i==j) then 
           y(j)%d=1.0
        else
           y(j)%d=0.0
        end if
     end do
     do k=1,n
        x(k)%d=0.0
        x(k)%v=x0(k)
     end do
     our_rev_mode%arg_store=.FALSE.
     our_rev_mode%arg_restore=.FALSE.
     our_rev_mode%res_store=.FALSE.
     our_rev_mode%res_restore=.FALSE.
     our_rev_mode%plain=.FALSE.
     our_rev_mode%tape=.TRUE.
     our_rev_mode%adjoint=.TRUE.
     call head()
     do k=1,n
        res_adj(i,k)=x(k)%d
     end do
  end do

  do k=1,n
     do i=1,m   
        write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",i,",",k,")=",res_adj(i,k)
     end do
  end do

  close(2)

  deallocate(x0)
  deallocate(y0)
  deallocate(res_adj)

end program driver


