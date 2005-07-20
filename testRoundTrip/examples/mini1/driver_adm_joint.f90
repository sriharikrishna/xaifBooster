program driver

  use active_module
  use OpenAD_rev
  use OpenAD_tape

  implicit none 

  external head

  type(active):: x, y
  real h

  type(active):: xph, yph

  x%v=.5D0
  h=0.0001

  open(2,file='tmpOutput/dd.out')
  write(2,*) "DD"
  our_rev_mode%arg_store=.FALSE.
  our_rev_mode%arg_restore=.FALSE.
  our_rev_mode%res_store=.FALSE.
  our_rev_mode%res_restore=.FALSE.
  our_rev_mode%plain=.TRUE.
  our_rev_mode%tape=.FALSE.
  our_rev_mode%adjoint=.FALSE.
  xph%v=x%v+h
  call head(xph,yph)
  call head(x,y)
  write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",1,",",1,")=",(yph%v-y%v)/h
  close(2)

  call tape_init()
  open(2,file='tmpOutput/ad.out')
  write(2,*) "AD"
  y%d=1.0
  our_rev_mode%arg_store=.FALSE.
  our_rev_mode%arg_restore=.FALSE.
  our_rev_mode%res_store=.FALSE.
  our_rev_mode%res_restore=.FALSE.
  our_rev_mode%plain=.FALSE.
  our_rev_mode%tape=.TRUE.
  our_rev_mode%adjoint=.TRUE.
  call head(x,y)
  write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",1,",",1,")=",x%d
  close(2)

end program driver


