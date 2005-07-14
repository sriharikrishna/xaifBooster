program driver

  use active_module
  implicit none 

  external head

  double precision, dimension(:), allocatable :: x0
  double precision, dimension(:), allocatable :: res_dd, res_ad
  type(active), dimension(:), allocatable :: x, xph
  type(active), dimension(:), allocatable :: y, yph
  real h
  integer n,m
  integer i,j,k

  open(2,action='read',file='params.conf')
  read(2,'(I5,/,I5,/,F8.1)') n, m, h
  close(2)


  allocate(x0(n))
  allocate(res_dd(m))
  allocate(res_ad(m))
  allocate(x(n))
  allocate(xph(n))
  allocate(y(m))
  allocate(yph(m))

  x0(1) = 2.5d-1
  x0(2) = 3.9d-1
  x0(3) = 4.15d-1
  x0(4) = 3.9d-1

  open(2,file='tmpOutput/dd.out')
  write(2,*) "DD"
  do i=1,n   
     do j=1,n   
        x(j)%v=x0(j)
        if (i==j) then 
           xph(j)%v=x0(j)+h
        else
           xph(j)%v=x0(j)
        end if
        call head(xph,yph)
        call head(x,y)
        do k=1,m
           res_dd(k)=(yph(k)%v-y(k)%v)/h
        end do
     end do
     write(2,*) "F(", i , ",:)= ", res_dd
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
     call head(x,y)
     do k=1,m
        res_ad(k)=y(k)%d
     end do
     write(2,*) "F(", i , ",:)= ", res_ad
  end do
  close(2)

  deallocate(x0)
  deallocate(res_dd)
  deallocate(res_ad)
  deallocate(x)
  deallocate(xph)
  deallocate(y)
  deallocate(yph)

end program driver


