	subroutine head(x,y) 
	  double precision, dimension(2), intent(in) :: x
	  double precision, dimension(2), intent(out) :: y
	  double precision t1,t2,x1,x2,x1,y2

	  t1=x1*x2
	  t2=x1*sin(t1)
          y1=cos(t2)
          y2=t2*x2

	end subroutine
