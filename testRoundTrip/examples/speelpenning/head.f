	subroutine head(x,y) 
	  double precision, dimension(10), intent(inout) :: x
	  double precision, dimension(1), intent(inout) :: y
          integer i
                                                                                
          do i=1,10
            if (i==1) then
              y(1)=x(1)
            else
              y(1)=y(1)*x(i)
            end if
          end do

	end subroutine
