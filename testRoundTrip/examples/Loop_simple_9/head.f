c$openad XXX Template ad_template.f
	subroutine head(x,y)
	  double precision, dimension(4), intent(in) :: x
	  double precision, dimension(4), intent(out) :: y
          integer i,j
c$openad INDEPENDENT(x)
	 if (x(1) .eq. 0.0) then
	    k=1
	 else
	    k=2
	 end if
c$openad xxx simple loop
	 do i=1,2
	    y(i)=x(k) 
	 end do
c$openad DEPENDENT(y)
	end subroutine
