	subroutine head(x,y) 
	  double precision, dimension(10), intent(in) :: x
	  double precision, dimension(1), intent(out) :: y
          integer i
                                                                                
          y(1)=1.D0
          do i=1,10
            y(1)=y(1)*x(i)
          end do

	end subroutine
