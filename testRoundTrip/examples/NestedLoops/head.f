	subroutine head(x,y)
	  double precision, dimension(2), intent(in) :: x
	  double precision, dimension(2), intent(out) :: y
          integer i,j

          do i=1,2
            do j=1,2
              y(i)=x(i)*x(j)
            end do
          end do

	end subroutine
