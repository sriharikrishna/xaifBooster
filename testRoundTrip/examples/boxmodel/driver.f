       program boxmodel_tl_driver

         use active_module
         implicit none

      integer, parameter :: kdim=3
      integer i,j

!     from box_ini_fields

      COMMON /fi_state_r/ TOLD, TNOW, TNEW, SOLD, SNOW, SNEW
      type(active) :: TOLD(1 : 3)
      type(active) :: TNOW(1 : 3)
      type(active) :: TNEW(1 : 3)
      type(active) :: SOLD(1 : 3)
      type(active) :: SNOW(1 : 3)
      type(active) :: SNEW(1 : 3)

      common /fi_controls_r/ xx
      type(active) :: xx(1:6)

      external box_model_body

!
! ACTS code
!
        print*, "Jacobian (computed by TLM, output transposed)"
        do i=1,2*kdim
          call box_ini_params
          call box_ini_fields
          do j=1,2*kdim
            call zero_deriv(xx(j))
          enddo
          xx(i)%d=1.D0
          call box_model_body
          do j=1,kdim
            write(*,'(F6.4,"  ")',ADVANCE='NO') tnew(j)%d
          end do
          do j=1,kdim
            write(*,'(F6.4,"  ")',ADVANCE='NO') snew(j)%d
          end do
          write(*,*)
        end do

	end program boxmodel_tl_driver



