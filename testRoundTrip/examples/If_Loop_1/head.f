	subroutine head(x,y)
	  double precision, dimension(1), intent(inout) :: x
	  double precision, dimension(1), intent(inout) :: y
          integer i

          
          y(1)=x(1) 
          if (y(1)>0.) then
            do i=1,3
              y(1)=y(1)*x(1)
            end do
          else
            y(1)=y(1)/x(1)
          end if 
            

	end subroutine
