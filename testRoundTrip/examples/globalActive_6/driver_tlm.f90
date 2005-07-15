program driver

  use active_module
  use all_globals_mod

  implicit none 

  external head

  double precision, dimension(:), allocatable :: x0,y0
  real h
  integer n,m
  integer i,j,k

  n=2
  m=1
  h=0.00001

  allocate(x0(n))
  allocate(y0(m))

  do i=1,n   
     x0(i)=i/2.
  end do

  open(2,file='tmpOutput/dd.out')
  write(2,*) "DD"
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

  open(2,file='tmpOutput/ad.out')
  write(2,*) "AD"
  do i=1,n   
     do j=1,n   
        x(j)%v=x0(j)
        if (i==j) then 
           x(j)%d=1.0
        else
           x(j)%d=0.0
        end if
     end do
     call head()
     do k=1,m
        write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",k,",",i,")=",y(k)%d
     end do
  end do
  close(2)

  deallocate(x0)
  deallocate(y0)

end program driver


