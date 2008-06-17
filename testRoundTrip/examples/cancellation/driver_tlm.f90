program driver

  use active_module
  implicit none 

  external head

  ! inputs
  type(active) x1, x2
  type(active) x_ph1, x_ph2

  ! outputs
  type(active) y
  type(active) y_ph

  double precision, dimension(2) :: x0
  real :: h
  integer:: n,m
  integer i,j,k

  open(2,action='read',file='params.conf')
  read(2,'(I5,/,I5,/,F8.1)') n, m, h
  close(2)

  do i=1,n   
     x0(i)=sqrt(1.*i)
  end do

  open(2,file='tmpOutput/dd.out')
  write(2,*) "DD"
  x1%v=x0(1)
  x2%v=x0(2)

  call head (x1, x2, y)

  do i=1,n   
     x_ph1%v=x0(1)
     x_ph2%v=x0(2)

     if (i==1) x_ph1%v=x_ph1%v+h
     if (i==2) x_ph2%v=x_ph2%v+h
     call head (x_ph1, x_ph2, y_ph)
     write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",1,",",i,")=",(y_ph%v-y%v)/h
  end do
  close(2)

  open(2,file='tmpOutput/ad.out')
  write(2,*) "AD"
  do i=1,n   
     x1%v=x0(1)
     x2%v=x0(2)

     x1%d=0.
     x2%d=0.
     if (i==1) x1%d=1.
     if (i==2) x2%d=1.
     call head (x1, x2, y)
     write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",1,",",i,")=",y%d
  end do
  close(2)

end program driver
