	program driver

	use active_module
	use OpenAD_rev

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
	do i=1,n   
	   do j=1,n   
              x(j)%v=x0(j)
              if (i==j) then 
		 xph(j)%v=x0(j)+h
              else
		 xph(j)%v=x0(j)
              end if
	   end do 
	   call forward_mode()
	   call head(xph,yph)
	   call restore_mode()
	   call forward_arg_store_mode()
	   call head(x,y)
	   call restore_mode()
	   do k=1,m
	      write(2,*) "F(",k,",",i,")=",(yph(k)%v-y(k)%v)/h
	   end do
	end do
	close(2)

!       we need enough argument checkpoints
	do i=n+1,m
	   call forward_arg_store_mode()
	   call head(x,y)
	   call restore_mode()
	end do

        call reverse_mode()
	open(2,file='tmpOutput/ad.out')
	write(2,*) "AD"

	do i=1,m   
	   do j=1,m   
              if (i==j) then 
		 y(j)%d=1.0
              else
		 y(j)%d=0.0
              end if
	   end do
	   do k=1,n
	      x(k)%d=0.0
	   end do
	   call head(x,y)
	   do k=1,n
              res_adj(i,k)=x(k)%d
	   end do
	end do

	do k=1,n
	   do i=1,m   
              write(2,*) "F(",i,",",k,")=",res_adj(i,k)
	   end do
	end do

	close(2)

	deallocate(x0)
	deallocate(x)
	deallocate(xph)
	deallocate(y)
	deallocate(yph)
	deallocate(res_adj)

        end


