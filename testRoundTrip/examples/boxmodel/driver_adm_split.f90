program boxmodel_adm_driver

  use active_module
  use OpenAD_rev
  use OpenAD_tape
  use all_globals_mod
  implicit none

  integer, parameter :: kdim=3
  integer i,j
  double precision :: h=.00001
  double precision tnew_o(kdim), snew_o(kdim)
  double precision jac(2*kdim,2*kdim)


  external box_model_body

  !
  ! DD code
  !
  open(2,file='tmpOutput/dd.out')
  write(2,*) "DD"
  our_rev_mode%arg_store=.FALSE.
  our_rev_mode%arg_restore=.FALSE.
  our_rev_mode%res_store=.FALSE.
  our_rev_mode%res_restore=.FALSE.
  our_rev_mode%plain=.TRUE.
  our_rev_mode%tape=.FALSE.
  our_rev_mode%adjoint=.FALSE.
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
        jac(j,i)=(tnew(j)%v-tnew_o(j))/h
        jac(j+kdim,i)=(snew(j)%v-snew_o(j))/h
     end do
  end do
  do i=1,2*kdim
     do j=1,2*kdim
        write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",i,",",j,")=",jac(i,j)
     end do
  end do
  close(2)

  !
  ! ACTS code
  !
  open(2,file='tmpOutput/ad.out')
  write(2,*) "AD (adm split)"
  call tape_init()
  do i=1,2*kdim
     do j=1,2*kdim
        call zero_deriv(xx(j))
     end do
     our_rev_mode%arg_store=.FALSE.
     our_rev_mode%arg_restore=.FALSE.
     our_rev_mode%res_store=.FALSE.
     our_rev_mode%res_restore=.FALSE.
     our_rev_mode%plain=.TRUE.
     our_rev_mode%tape=.FALSE.
     our_rev_mode%adjoint=.FALSE.
     call box_ini_params
     call box_ini_fields
     do j=1,kdim
        call zero_deriv(tnew(j))
        call zero_deriv(snew(j))
     enddo
     if (i>kdim) then
        do j=1,kdim
           if (j==i-kdim) then
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
     our_rev_mode%adjoint=.FALSE.
     call box_model_body
     our_rev_mode%arg_store=.FALSE.
     our_rev_mode%arg_restore=.FALSE.
     our_rev_mode%res_store=.FALSE.
     our_rev_mode%res_restore=.FALSE.
     our_rev_mode%plain=.FALSE.
     our_rev_mode%tape=.FALSE.
     our_rev_mode%adjoint=.TRUE.
     call box_model_body
     do j=1,2*kdim
        write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",i,",",j,")=",xx(j)%d
     end do
  end do
  close(2)

end program boxmodel_adm_driver