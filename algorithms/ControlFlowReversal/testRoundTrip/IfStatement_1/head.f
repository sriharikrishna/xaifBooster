	subroutine head(x,y)
	  double precision, dimension(1), intent(in) :: x
	  double precision, dimension(1), intent(out) :: y

          y(1)=2. 
          if (x(1)>0.) then
            y(1)=x(1)
          end if
          y(1)=y(1)*y(1)

	end subroutine
