	subroutine head(x,y) 
	  double precision, dimension(1), intent(inout) :: x
	  double precision, dimension(1), intent(inout) :: y
	  double precision t1,t2,y1,y2,y3,y4

	  t1=x(1)+x(1)
	  t2=2*t1
          y1=t2
          y(1)=y1

	end subroutine
