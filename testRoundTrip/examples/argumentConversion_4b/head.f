c$openad XXX Template ad_template.f
	subroutine foo(x,y) 
	  double precision x(2)
	  double precision y
	  y=x(1)*x(2)
	end subroutine

c$openad XXX Template ad_template.f
	subroutine head(x,y) 
	  double precision, dimension(2) :: x
	  double precision, dimension(1,2) :: ax,apx
	  double precision y,py
	  integer i,j
c$openad INDEPENDENT(x)
c$openad xxx simple loop
	  do i=1,2
	    ax(1,i)=x(i)
          end do
c$openad xxx simple loop
	  do i=1,1
            do j=1,2
	      call foo(ax(i,j),y)
	      call foo(apx(i,j),py)
            end do 
          end do
c$openad DEPENDENT(y)
	end subroutine

