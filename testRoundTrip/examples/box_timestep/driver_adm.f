! ADM driver
       program driver

         use active_module
         implicit none

      integer, parameter :: kdim=3
      integer i,j

!     from box_ini_fields

! passive in
      type(active) :: gamma_t
      type(active) :: nullforce(1 : 2)
      type(active) :: tstar(1 : 2)


! active in
      type(active) :: told(1 : 3)
      type(active) :: tnow(1 : 3)
      type(active) :: uvel
! active out
      type(active) :: tnew(1 : 3)

      external box_timestep

        do i=1,kdim
          gamma_t=active(1,0)
          nullforce=(/active(1,0),active(1,0)/)
          tstar=(/active(1,0),active(1,0)/)
          told=(/active(1,0),active(1,0),active(1,0)/)
          tnow=(/active(1,0),active(1,0),active(1,0)/)
          tnew=(/active(0,0),active(0,0),active(0,0)/)
          uvel=active(1,0)
          do j=1,kdim
            if (j==i) then
              tnew(i)%d=1.
            endif
          end do 
          call box_timestep(gamma_t,tStar,nullforce,uvel, &
     & tnow,told,tnew,3)
          do j=1,kdim
            print*, "tnow(",j,")%d=", tnow(j)%d
          end do
        end do

	end program driver


