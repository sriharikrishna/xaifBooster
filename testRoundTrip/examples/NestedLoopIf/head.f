	subroutine head(x,y)
	  double precision, dimension(2), intent(in) :: x
	  double precision, dimension(2), intent(out) :: y
          integer i
c$openad INDEPENDENT(x)
          do i=1,2
            if (i==1) then
              y(i)=x(i)*x(i)
            else
              y(i)=x(i)+x(i)
            end if
          end do
c$openad DEPENDENT(y)
	end subroutine
