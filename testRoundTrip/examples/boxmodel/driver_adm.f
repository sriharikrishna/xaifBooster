       program boxmodel_adm_driver

         use active_module
         use OpenAD_rev
         use OpenAD_tape
         use all_globals_mod
         implicit none

      integer, parameter :: kdim=3
      integer i,j

      external box_model_body

!
! ACTS code
!
        print*, "Jacobian (computed by split adjoint)"
        do i=1,2*kdim
          call box_ini_params
          call box_ini_fields
          call taping_mode()
          call box_model_body
          do j=1,kdim
            call zero_deriv(tnew(j))
            call zero_deriv(snew(j))
          enddo
          if (i>kdim) then
            do j=1,kdim
              if (j==i+kdim) then
                snew(j)%d=1
              end if
            end do
          else
            do j=1,kdim
              if (j==i) then
                tnew(j)%d=1
              end if
            end do
          end if
          call adjoint_mode()
          call box_model_body
          do j=1,2*kdim
            write(*,'(F6.4,"  ")',ADVANCE='NO') xx(j)%d
          end do
          write(*,*)
        end do

	end program boxmodel_adm_driver



