program driver

  use active_module
  use OpenAD_rev
  use OpenAD_tape

  implicit none 

  external head

  double precision, dimension(:), allocatable :: x0
  double precision, dimension(:,:), allocatable :: res_adj
  type(active), dimension(:), allocatable :: x, xph
  type(active), dimension(:), allocatable :: y, yph
  real h
  integer n,m
  integer i,j,k

  open(2,action='read',file='params.conf')
  read(2,'(I5,/,I5,/,F8.1)') n, m, h
  close(2)


  allocate(x0(n))
  allocate(x(n))
  allocate(xph(n))
  allocate(y(m))
  allocate(yph(m))
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
  do i=1,n   
     do j=1,n   
        x(j)%v=x0(j)
        if (i==j) then 
           xph(j)%v=x0(j)+h
        else
           xph(j)%v=x0(j)
        end if
     end do
     call head(xph,yph)
     call head(x,y)
     do k=1,m
        write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",k,",",i,")=",(yph(k)%v-y(k)%v)/h
     end do
  end do
  close(2)

  call tape_init()
  open(2,file='tmpOutput/ad.out')
  write(2,*) "AD"

  do i=1,m   
     do j=1,m   
        x(j)%v=x0(j)
        if (i==j) then 
           y(j)%d=1.0
        else
           y(j)%d=0.0
        end if
     end do
     do k=1,n
        x(k)%d=0.0
     end do
     do j=1,m   
        x(j)%v=x0(j)
     end do
     our_rev_mode%arg_store=.FALSE.
     our_rev_mode%arg_restore=.FALSE.
     our_rev_mode%res_store=.FALSE.
     our_rev_mode%res_restore=.FALSE.
     our_rev_mode%plain=.FALSE.
     our_rev_mode%tape=.TRUE.
     our_rev_mode%adjoint=.TRUE.
     call head(x,y)
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
  deallocate(x)
  deallocate(xph)
  deallocate(y)
  deallocate(yph)
  deallocate(res_adj)

end program driver


