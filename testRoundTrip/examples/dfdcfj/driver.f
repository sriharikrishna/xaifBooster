	program driver

	  use active_module
          implicit none 

          external head

	  double precision, dimension(:), allocatable :: x0
	  double precision, dimension(:), allocatable :: res_dd, res_ad
	  type(active), dimension(:), allocatable :: x, xph
	  type(active), dimension(:), allocatable :: y, yph
          real h
          integer n,m,nx1,nx2
          integer i,j,k
	  double precision  hx1,hx2,xx2,xx1,r
	  double precision zero,one,two,three,four
	  parameter(zero=0.0d0,one=1.0d0,two=2.0d0,three=3.0d0,four=4.0d0)

	  nx1=5
	  nx2=5
!	  n should nx1*nx2 
	  n=25
	  m=25
	  h=0.00001
	  r=10.0
	  
          allocate(x0(n))
          allocate(res_dd(m))
          allocate(res_ad(m))
          allocate(x(n))
          allocate(xph(n))
          allocate(y(m))
          allocate(yph(m))

!         initial value 

	  hx1 = one/dble(nx1 + 1)
	  hx2 = one/dble(nx2 + 1)

	  xx2 = hx2
	  do i = 1, nx2
	     xx1 = hx1
	     do j = 1, nx1
		k = (i - 1)*nx1 + j
		x0(k) = - xx1*(one - xx1)*xx2*(one - xx2)
		xx1 = xx1 + hx1
	     end do
	     xx1 = hx1
	     xx2 = xx2 + hx2
	  end do
	  
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
	      call head(nx1,nx2,xph,yph,r)
	      call head(nx1,nx2,x,y,r)
              do k=1,m
                res_dd(k)=(yph(k)%v-y(k)%v)/h
              end do
            end do
            write(2,*) "F(", i , ",:)= ", res_dd
          end do
          close(2)

	  call head(nx1,nx2,x,y,r)
	  do i=1,n
	     write(*,*) "x(",i,")= ",x(i)%v
	  end do
	  do i=1,n
	     write(*,*) "y(",i,")= ",y(i)%v
	  end do
	 
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
	    call head(nx1,nx2,x,y,r)
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

        end


