	program driver

	use active_module
	implicit none 

	external head

	double precision, dimension(:), allocatable :: x0
	double precision, dimension(:,:), allocatable :: res_dd, res_ad
	type(active), dimension(:), allocatable :: x, xph
	type(active), dimension(:), allocatable :: y, yph
	real h
	integer n,m
	integer i,j,k

	open(2,action='read',file='params.conf')
	read(2,'(I5,/,I5,/,F8.1)') n, m, h
	close(2)

	
	allocate(x0(n))
	allocate(res_dd(m,n))
	allocate(res_ad(m,n))
	allocate(x(n))
	allocate(xph(n))
	allocate(y(m))
	allocate(yph(m))

	do i=1,n   
	   x0(i)=i/2.
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
	   end do
	   call head(xph,yph)
	   call head(x,y)
	   do k=1,m
	      res_dd(k,i)=(yph(k)%v-y(k)%v)/h
	   end do
	end do
	do k=1,n
	   do i=1,m   
              write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",i,",",k,")=",res_dd(i,k)
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
	   call head(x,y)
	   do k=1,m
              res_ad(k,i)=y(k)%d
	   end do
	end do
	do k=1,n
	   do i=1,m   
              write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",i,",",k,")=",res_ad(i,k)
	   end do
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


