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
  implicit none 

  external ad_roehf5

  ! inputs
  type(active) nrm(3), priml(5), primr(5) 
  type(active) gamma, gm1, gm1inv, nlefix
  type(active) lefix, mcheps

  type(active)  nrm_ph(3), priml_ph(5), primr_ph(5)
  type(active) gamma_ph, gm1_ph, gm1inv_ph, nlefix_ph
  type(active) lefix_ph, mcheps_ph

  ! outputs
  type(active) flux(5)
  type(active) flux_ph(5)

  double precision, dimension(19) :: x0
  real :: h=0.00001
  integer, parameter :: n=19, m=5
  integer i,j,k

  do i=1,n   
     x0(i)=sqrt(1.*i)
  end do

  open(2,file='tmpOutput/dd.out')
  write(2,*) "DD"
  nrm(1)%v=x0(1)
  nrm(2)%v=x0(2)
  nrm(3)%v=x0(3)
  priml(1)%v=x0(4)
  priml(2)%v=x0(5)
  priml(3)%v=x0(6)
  priml(4)%v=x0(7)
  priml(5)%v=x0(8)
  primr(1)%v=x0(9)
  primr(2)%v=x0(10)
  primr(3)%v=x0(11)
  primr(4)%v=x0(12)
  primr(5)%v=x0(13)
  gamma%v=x0(14) 
  gm1%v=x0(15) 
  gm1inv%v=x0(16) 
  nlefix%v=x0(17)
  lefix%v=x0(18)
  mcheps%v=x0(19)

  call ad_roehf5 (nrm, priml, primr, gamma, gm1, gm1inv, nlefix, lefix, mcheps, flux)

  do i=1,n   
     nrm_ph(1)%v=x0(1)
     nrm_ph(2)%v=x0(2)
     nrm_ph(3)%v=x0(3)
     priml_ph(1)%v=x0(4)
     priml_ph(2)%v=x0(5)
     priml_ph(3)%v=x0(6)
     priml_ph(4)%v=x0(7)
     priml_ph(5)%v=x0(8)
     primr_ph(1)%v=x0(9)
     primr_ph(2)%v=x0(10)
     primr_ph(3)%v=x0(11)
     primr_ph(4)%v=x0(12)
     primr_ph(5)%v=x0(13)
     gamma_ph%v=x0(14) 
     gm1_ph%v=x0(15) 
     gm1inv_ph%v=x0(16) 
     nlefix_ph%v=x0(17)
     lefix_ph%v=x0(18)
     mcheps_ph%v=x0(19)


     if (i==1) nrm_ph(1)%v=nrm_ph(1)%v+h
     if (i==2) nrm_ph(2)%v=nrm_ph(2)%v+h
     if (i==3) nrm_ph(3)%v=nrm_ph(3)%v+h
     if (i==4) priml_ph(1)%v=priml_ph(1)%v+h
     if (i==5) priml_ph(2)%v=priml_ph(2)%v+h
     if (i==6) priml_ph(3)%v=priml_ph(3)%v+h
     if (i==7) priml_ph(4)%v=priml_ph(4)%v+h
     if (i==8) priml_ph(5)%v=priml_ph(5)%v+h
     if (i==9) primr_ph(1)%v=primr_ph(1)%v+h
     if (i==10) primr_ph(2)%v=primr_ph(2)%v+h
     if (i==11) primr_ph(3)%v=primr_ph(3)%v+h
     if (i==12) primr_ph(4)%v=primr_ph(4)%v+h
     if (i==13) primr_ph(5)%v=primr_ph(5)%v+h
     if (i==14) gamma_ph%v=gamma_ph%v+h
     if (i==15) gm1_ph%v=gm1_ph%v+h
     if (i==16) gm1inv_ph%v=gm1inv_ph%v+h
     if (i==17) nlefix_ph%v=nlefix_ph%v+h
     if (i==18) lefix_ph%v=lefix_ph%v+h
     if (i==19) mcheps_ph%v=mcheps_ph%v+h
     call ad_roehf5 (nrm_ph, priml_ph, primr_ph, gamma_ph, gm1_ph, gm1inv_ph, nlefix_ph, lefix_ph, mcheps_ph, flux_ph)
     do k=1,m
        write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",k,",",i,")=",(flux_ph(k)%v-flux(k)%v)/h
     end do
  end do
  close(2)

  open(2,file='tmpOutput/ad.out')
  write(2,*) "AD"
  do i=1,n   
     nrm(1)%v=x0(1)
     nrm(2)%v=x0(2)
     nrm(3)%v=x0(3)
     priml(1)%v=x0(4)
     priml(2)%v=x0(5)
     priml(3)%v=x0(6)
     priml(4)%v=x0(7)
     priml(5)%v=x0(8)
     primr(1)%v=x0(9)
     primr(2)%v=x0(10)
     primr(3)%v=x0(11)
     primr(4)%v=x0(12)
     primr(5)%v=x0(13)
     gamma%v=x0(14) 
     gm1%v=x0(15) 
     gm1inv%v=x0(16) 
     nlefix%v=x0(17)
     lefix%v=x0(18)
     mcheps%v=x0(19)

     nrm(1)%d=0.
     nrm(2)%d=0.
     nrm(3)%d=0.
     priml(1)%d=0.
     priml(2)%d=0.
     priml(3)%d=0.
     priml(4)%d=0.
     priml(5)%d=0.
     primr(1)%d=0.
     primr(2)%d=0.
     primr(3)%d=0.
     primr(4)%d=0.
     primr(5)%d=0.
     gamma%d=0.
     gm1%d=0.
     gm1inv%d=0.
     nlefix%d=0.
     lefix%d=0.
     mcheps%d=0.
     if (i==1) nrm(1)%d=1.
     if (i==2) nrm(2)%d=1.
     if (i==3) nrm(3)%d=1.
     if (i==4) priml(1)%d=1.
     if (i==5) priml(2)%d=1.
     if (i==6) priml(3)%d=1.
     if (i==7) priml(4)%d=1.
     if (i==8) priml(5)%d=1.
     if (i==9) primr(1)%d=1.
     if (i==10) primr(2)%d=1.
     if (i==11) primr(3)%d=1.
     if (i==12) primr(4)%d=1.
     if (i==13) primr(5)%d=1.
     if (i==14) gamma%d=1.
     if (i==15) gm1%d=1.
     if (i==16) gm1inv%d=1.
     if (i==17) nlefix%d=1.
     if (i==18) lefix%d=1.
     if (i==19) mcheps%d=1.
     call ad_roehf5 (nrm, priml, primr, gamma, gm1, gm1inv, nlefix, lefix, mcheps, flux)
     do k=1,m
        write(2,'(A,I3,A,I3,A,EN26.16E3)') "F(",k,",",i,")=",flux(k)%d
     end do
  end do
  close(2)

end program driver
