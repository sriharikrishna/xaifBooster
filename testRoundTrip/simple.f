	subroutine head(x1,x2,x3,x4)
	  double precision, intent(inout) :: x1,x2,x3,x4
	  double precision t1,t2,t3

 	  t1=x1*x2
 	  t2=x3*x4
          t3=t1*t2
 	  x1=t1*t3
 	  x2=cos(t3)
 	  x3=sin(t3)
          x4=t3*t2

	end subroutine
