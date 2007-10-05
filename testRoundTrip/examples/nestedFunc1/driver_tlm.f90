program driver

  use active_module
  implicit none 

  external head

  double precision, dimension(:), allocatable :: x0
  type(active), dimension(:), allocatable :: x, y, y0 
  real h
  integer n,m
  integer i,j,k

  open(2,action='read',file='params.conf')
  read(2,'(I5,/,I5,/,F8.1)') n, m, h
  close(2)


  allocate(x(n))
  allocate(x0(n))
  allocate(y(m))
  allocate(y0(m))

  do i=1,n   
     x0(i)=i/2.
  end do

  open(2,file='tmpOutput/dd.out')
  write(2,*) "DD"
  do j=1,n   
     x(j)%v=x0(j)
  end do
  call head(n,x,y0)
  do i=1,n   
     do j=1,n   
        x(j)%v=x0(j)
        if (i==j) then 
           x(j)%v=x0(j)+h
        end if
     end do
     call head(n,x,y)
     do k=1,m
        write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",k,",",i,")=",(y(k)%v-y0(k)%v)/h
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
     call head(n,x,y)
     do k=1,m
        write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",k,",",i,")=",y(k)%d
     end do
  end do
  close(2)

  deallocate(x)
  deallocate(x0)
  deallocate(y)
  deallocate(y0)

end program driver


