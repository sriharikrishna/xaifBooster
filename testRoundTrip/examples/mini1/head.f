	subroutine head(x,y) 
	  double precision,intent(in) :: x
	  double precision,intent(out) :: y
	  y=sin(x*x)
	end subroutine
