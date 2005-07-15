program driver

  use active_module
  use OpenAD_rev
  use OpenAD_tape

  implicit none 

  external head

  double precision x0_1,x0_2
  type(active) :: x1, x2, x1ph, x2ph
  type(active) :: y1, y2, y1ph, y2ph
  double precision res_adj(2,2)
  real :: h=0.00001
  integer n,m
  integer i,j,k

  x0_1=1.0
  x0_2=2.0

  open(2,file='tmpOutput/dd.out')
  write(2,*) "DD"
  our_rev_mode%arg_store=.FALSE.
  our_rev_mode%arg_restore=.FALSE.
  our_rev_mode%res_store=.FALSE.
  our_rev_mode%res_restore=.FALSE.
  our_rev_mode%plain=.TRUE.
  our_rev_mode%tape=.FALSE.
  our_rev_mode%adjoint=.FALSE.
  x1%v=x0_1
  x2%v=x0_2
  x1ph%v=x0_1+h
  x2ph%v=x0_2
  call head(x1ph,x2ph,y1ph,y2ph)
  call head(x1,x2,y1,y2)
  write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",1,",",1,")=",(y1ph%v-y1%v)/h
  write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",2,",",1,")=",(y2ph%v-y2%v)/h
  x1%v=x0_1
  x2%v=x0_2
  x1ph%v=x0_1
  x2ph%v=x0_2+h
  call head(x1ph,x2ph,y1ph,y2ph)
  call head(x1,x2,y1,y2)
  write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",1,",",2,")=",(y1ph%v-y1%v)/h
  write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",2,",",2,")=",(y2ph%v-y2%v)/h
  close(2)

  call tape_init()
  open(2,file='tmpOutput/ad.out')
  write(2,*) "AD"
  x1%v=x0_1
  x2%v=x0_2
  x1%d=0.
  x2%d=0.
  y1%d=1.0
  y2%d=0.0
  our_rev_mode%arg_store=.FALSE.
  our_rev_mode%arg_restore=.FALSE.
  our_rev_mode%res_store=.FALSE.
  our_rev_mode%res_restore=.FALSE.
  our_rev_mode%plain=.FALSE.
  our_rev_mode%tape=.TRUE.
  our_rev_mode%adjoint=.FALSE.
  call head(x1,x2,y1,y2)
  our_rev_mode%arg_store=.FALSE.
  our_rev_mode%arg_restore=.FALSE.
  our_rev_mode%res_store=.FALSE.
  our_rev_mode%res_restore=.FALSE.
  our_rev_mode%plain=.FALSE.
  our_rev_mode%tape=.FALSE.
  our_rev_mode%adjoint=.TRUE.
  call head(x1,x2,y1,y2)
  res_adj(1,1)=x1%d
  res_adj(1,2)=x2%d
  x1%v=x0_1
  x2%v=x0_2
  x1%d=0.
  x2%d=0.
  y1%d=0.0
  y2%d=1.0
  our_rev_mode%arg_store=.FALSE.
  our_rev_mode%arg_restore=.FALSE.
  our_rev_mode%res_store=.FALSE.
  our_rev_mode%res_restore=.FALSE.
  our_rev_mode%plain=.FALSE.
  our_rev_mode%tape=.TRUE.
  our_rev_mode%adjoint=.FALSE.
  call head(x1,x2,y1,y2)
  our_rev_mode%arg_store=.FALSE.
  our_rev_mode%arg_restore=.FALSE.
  our_rev_mode%res_store=.FALSE.
  our_rev_mode%res_restore=.FALSE.
  our_rev_mode%plain=.FALSE.
  our_rev_mode%tape=.FALSE.
  our_rev_mode%adjoint=.TRUE.
  call head(x1,x2,y1,y2)
  res_adj(2,1)=x1%d
  res_adj(2,2)=x2%d

  do k=1,2
     do i=1,2   
        write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",i,",",k,")=",res_adj(i,k)
     end do
  end do

  close(2)

end program driver
