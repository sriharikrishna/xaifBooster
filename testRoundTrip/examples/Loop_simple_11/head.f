c$openad XXX Template ad_template.f
	subroutine head(x,y)
	  double precision, dimension(1), intent(in) :: x
	  double precision, dimension(1), intent(out) :: y
c$openad INDEPENDENT(x)
          do i=1,2
            if (x(1).ge.1.0) then
              y(1)=y(1)*x(1)
            else
              y(1)=y(1)-x(1)
            end if
          end do
c$openad DEPENDENT(y)
	end subroutine
