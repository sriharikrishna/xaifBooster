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
c$openad INDEPENDENT(x)
	  do i=1,2
	    ax(1,i)=x(i)
          end do
	  call foo(ax(1,1),y)
	  call foo(apx(1,1),py)
c$openad DEPENDENT(y)
	end subroutine

