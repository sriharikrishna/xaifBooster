c$openad XXX Template ad_template.f
	subroutine head(x1,x2,y) 
	  double precision:: x1,x2
	  double precision, dimension(2), intent(inout) :: y
	  double precision t1,t2
c$openad INDEPENDENT(x1)
c$openad INDEPENDENT(x2)
	  t1=x1/x2
	  t2=x1*x2
	  y(1)=t1*t2
	  y(2)=t1/t2
c$openad DEPENDENT(y)
	end subroutine
