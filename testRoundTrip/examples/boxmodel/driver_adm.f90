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
	call tape_init()
        do i=1,2*kdim
          call box_ini_params
          call box_ini_fields
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
          our_rev_mode%arg_store=.FALSE.
          our_rev_mode%arg_restore=.FALSE.
          our_rev_mode%res_store=.FALSE.
          our_rev_mode%res_restore=.FALSE.
          our_rev_mode%plain=.FALSE.
          our_rev_mode%tape=.TRUE.
          our_rev_mode%adjoint=.TRUE.
          call box_model_body
          do j=1,2*kdim
            write(*,'(F6.4,"  ")',ADVANCE='NO') xx(j)%d
          end do
          write(*,*)
        end do

	end program boxmodel_adm_driver
