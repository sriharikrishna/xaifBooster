	subroutine head(x,y) 
	  double precision, dimension(2), intent(in) :: x
	  double precision, dimension(4), intent(out) :: y
	  double precision t1,t2

	  t1=x(1)/x(2)
	  t2=cos(t1)
          y(1)=exp(t2)
          y(2)=3.14*t2
	  y(3)=sin(t2)
          y(4)=t2*t1

	end subroutine
