	subroutine head(x,y)
	  double precision, dimension(1), intent(in) :: x
	  double precision, dimension(1), intent(out) :: y
          integer i

          
          y(1)=x(1) 
          do i=1,3
            y(1)=y(1)*x(1)
          end do
          y(1)=x(1) 

	end subroutine
