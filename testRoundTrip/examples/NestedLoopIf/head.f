	subroutine head(x,y)
	  double precision, dimension(2), intent(in) :: x
	  double precision, dimension(2), intent(out) :: y
          integer i

          do i=1,2
            if (i==1) then
              y(i)=x(i)*x(i)
            else
              y(i)=x(i)+x(i)
            end if
          end do

	end subroutine
