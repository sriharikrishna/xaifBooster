	subroutine head(x,y)
	  double precision, dimension(2), intent(in) :: x
	  double precision, dimension(2), intent(out) :: y
          integer i

          do i=1,2
            y(i)=x(i) 
          end do
          do i=1,2
            y(i)=y(i)*x(i)
          end do

	end subroutine
