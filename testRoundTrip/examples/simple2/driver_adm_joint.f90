! ========== begin copyright notice ==============
! This file is part of 
! ---------------
! xaifBooster
! ---------------
! Distributed under the BSD license as follows:
! Copyright (c) 2005, The University of Chicago
! All rights reserved.
!
! Redistribution and use in source and binary forms, 
! with or without modification, are permitted provided that the following conditions are met:
!
!    - Redistributions of source code must retain the above copyright notice, 
!      this list of conditions and the following disclaimer.
!    - Redistributions in binary form must reproduce the above copyright notice, 
!      this list of conditions and the following disclaimer in the documentation 
!      and/or other materials provided with the distribution.
!    - Neither the name of The University of Chicago nor the names of its contributors 
!      may be used to endorse or promote products derived from this software without 
!      specific prior written permission.
!
! THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
! EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
! OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
! SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
! INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
! PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
! INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
! LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
! OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
! 
! General Information:
! xaifBooster is intended for the transformation of 
! numerical programs represented as xml files according 
! to the XAIF schema. It is part of the OpenAD framework. 
! The main application is automatic 
! differentiation, i.e. the generation of code for 
! the computation of derivatives. 
! The following people are the principal authors of the 
! current version: 
! 	Uwe Naumann
!	Jean Utke
! Additional contributors are: 
!	Andrew Lyons
!	Peter Fine
!
! For more details about xaifBooster and its use in OpenAD please visit:
!   http://www.mcs.anl.gov/openad
!
! This work is partially supported by:
! 	NSF-ITR grant OCE-0205590
! ========== end copyright notice ==============
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
  real :: h
  integer n,m
  integer i,j,k

  open(2,action='read',file='params.conf')
  read(2,'(I5,/,I5,/,F8.1)') n, m, h
  close(2)

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
