c$openad XXX Template ad_template.f
	subroutine foo(x,y) 
	  double precision, dimension(2) :: x
	  double precision y
	  y=x(1)*x(2)
	end subroutine

c$openad XXX Template ad_template.f
	subroutine head(x,y) 
	  double precision, dimension(2) :: x, px
	  double precision y, py
c$openad INDEPENDENT(x)
	  px(1)=1.0
	  px(2)=2.0
	  call foo(x,y)
	  call foo(px,py)
	  call foo(px,py)
c$openad DEPENDENT(y)
	end subroutine

