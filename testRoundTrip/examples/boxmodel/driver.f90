       program boxmodel_tl_driver

         use active_module
         use all_globals_mod
         implicit none

      integer, parameter :: kdim=3
      integer i,j
      double precision :: h=.00001
      double precision tnew_o(kdim), snew_o(kdim)


      external box_model_body

!
! DD code
!
	open(2,file='tmpOutput/dd.out')
        write(2,*) "Jacobian (computed by DD, output transposed)"
        do i=1,2*kdim
          call box_ini_params
          call box_ini_fields
          call box_model_body
          do j=1,kdim
            tnew_o(j)=tnew(j)%v
          end do
          do j=1,kdim
            snew_o(j)=snew(j)%v
          end do
          call box_ini_params
          call box_ini_fields
          xx(i)%v=xx(i)%v+h
          call box_model_body
          do j=1,kdim
            write(2,'(F11.8,"  ")',ADVANCE='NO') (tnew(j)%v-tnew_o(j))/h
          end do
          do j=1,kdim
            write(2,'(F11.8,"  ")',ADVANCE='NO') (snew(j)%v-snew_o(j))/h
          end do
          write(2,*)
        end do
	close(2)

!
! ACTS code
!
	open(2,file='tmpOutput/ad.out')
        write(2,*) "Jacobian (computed by TLM, output transposed)"
        do i=1,2*kdim
          call box_ini_params
          call box_ini_fields
          do j=1,2*kdim
            call zero_deriv(xx(j))
          enddo
          xx(i)%d=1.D0
          call box_model_body
          do j=1,kdim
            write(2,'(F11.8,"  ")',ADVANCE='NO') tnew(j)%d
          end do
          do j=1,kdim
            write(2,'(F11.8,"  ")',ADVANCE='NO') snew(j)%d
          end do
          write(2,*)
        end do
        close(2)

	end program boxmodel_tl_driver



