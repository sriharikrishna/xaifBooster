	subroutine head(x,y) 
	  double precision, dimension(4), intent(in) :: x
	  double precision, dimension(4), intent(out) :: y
	  double precision t1,t2,t3

	  t1=x(1)/x(2)
	  t2=x(3)*x(4)
          t3=t1*t2
	  y(1)=t1*t3
	  y(2)=1./t3
	  y(3)=sin(t3)
	  y(4)=t3*t2

	end subroutine
