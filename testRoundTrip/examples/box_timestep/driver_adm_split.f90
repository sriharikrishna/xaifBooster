program driver

  use active_module
  use OpenAD_rev
  use OpenAD_tape

  implicit none

  integer, parameter :: kdim=3
  integer i,j
  double precision :: h=0.0001
  double precision jac(kdim,kdim)

  type(active) :: gamma_t
  type(active) :: nullforce(1 : 2)
  type(active) :: tstar(1 : 2)


  type(active) :: told(1 : 3)
  type(active) :: tnow(1 : 3)
  type(active) :: tnow_ph(1 : 3)
  type(active) :: uvel

  type(active) :: tnew(1 : 3)
  type(active) :: tnew_ph(1 : 3)

  external box_timestep


  open(2,file='tmpOutput/dd.out')
  write(2,*) "DD"
  our_rev_mode%arg_store=.FALSE.
  our_rev_mode%arg_restore=.FALSE.
  our_rev_mode%res_store=.FALSE.
  our_rev_mode%res_restore=.FALSE.
  our_rev_mode%plain=.TRUE.
  our_rev_mode%tape=.FALSE.
  our_rev_mode%adjoint=.FALSE.
  do i=1,kdim
     gamma_t=active(1,0)
     nullforce=(/active(1,0),active(1,0)/)
     tstar=(/active(1,0),active(1,0)/)
     told=(/active(1,0),active(1,0),active(1,0)/)
     tnow=(/active(1,0),active(1,0),active(1,0)/)
     tnow_ph=tnow
     tnew=(/active(0,0),active(0,0),active(0,0)/)
     tnew_ph=tnew
     uvel=active(1,0)
     do j=1,kdim
        if (j==i) then
           tnow_ph(i)%v=tnow_ph(i)%v+h
        endif
     end do
     call box_timestep(gamma_t,tStar,nullforce,uvel, &
& tnow,told,tnew)
     call box_timestep(gamma_t,tStar,nullforce,uvel, &
& tnow_ph,told,tnew_ph)
     do j=1,kdim
        jac(j,i)=(tnew_ph(j)%v-tnew(j)%v)/h
     end do
  end do
  do i=1,kdim
     do j=1,kdim
        write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",i,",",j,")=",jac(i,j)
     end do
  end do
  close(2)

  call tape_init()
  open(2,file='tmpOutput/ad.out')
  write(2,*) "AD"
  do i=1,kdim   
     do j=1,kdim   
        tnew(j)%v=0.0
        if (i==j) then 
           tnew(j)%d=1.0
        else
           tnew(j)%d=0.0
        end if
     end do
     gamma_t=active(1,0)
     nullforce=(/active(1,0),active(1,0)/)
     tstar=(/active(1,0),active(1,0)/)
     told=(/active(1,0),active(1,0),active(1,0)/)
     tnow=(/active(1,0),active(1,0),active(1,0)/)
     uvel=active(1,0)
     our_rev_mode%arg_store=.FALSE.
     our_rev_mode%arg_restore=.FALSE.
     our_rev_mode%res_store=.FALSE.
     our_rev_mode%res_restore=.FALSE.
     our_rev_mode%plain=.FALSE.
     our_rev_mode%tape=.TRUE.
     our_rev_mode%adjoint=.FALSE.
     call box_timestep(gamma_t,tStar,nullforce,uvel,tnow,told,tnew)
     our_rev_mode%arg_store=.FALSE.
     our_rev_mode%arg_restore=.FALSE.
     our_rev_mode%res_store=.FALSE.
     our_rev_mode%res_restore=.FALSE.
     our_rev_mode%plain=.FALSE.
     our_rev_mode%tape=.FALSE.
     our_rev_mode%adjoint=.TRUE.
     call box_timestep(gamma_t,tStar,nullforce,uvel,tnow,told,tnew)
     do j=1,kdim
        jac(i,j)=tnow(j)%d
     end do
  end do
  do i=1,kdim
     do j=1,kdim
        write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",i,",",j,")=",jac(i,j)
     end do
  end do
  close(2)

end program driver
