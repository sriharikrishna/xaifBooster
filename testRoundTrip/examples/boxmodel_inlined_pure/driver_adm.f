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
          allocate(res_ad(n))
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
	      call head(xph,yph,3)
	      call head(x,y,3)
              do k=1,m
                res_dd(k)=(yph(k)%v-y(k)%v)/h
              end do
            end do
            write(2,*) "F(", i , ",:)= ", res_dd
          end do
          close(2)

          open(2,file='tmpOutput/ad.out')
          write(2,*) "AD"
	  do i=1,m   
	    do j=1,m   
	      do k=1,n   
                x(k)%v=x0(k)
                x(k)%d=0.
              end do 
              if (i==j) then 
                y(j)%d=1.0
              else
                y(j)%d=0.0
              end if
            end do
	    call head(x,y,3)
            do k=1,n
              write(2,*) "F(", i , ",",k,")= ", x(k)%d
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


