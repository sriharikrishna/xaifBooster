C ***********************************************************
<<<<<<< /sandbox/ikarlin/bin2/OpenAD/xaifBooster_karlin_new/xaifBooster/testRoundTrip/examples/boxmodel/refOutput/admjointhead_sf.xb.x2w.w2f.pp.f
C Fortran file translated from WHIRL Wed Oct 18 22:44:21 2006
=======
C Fortran file translated from WHIRL Thu Dec 21 09:33:21 2006
>>>>>>> /tmp/admjointhead_sf.xb.x2w.w2f.pp.f~other.lGAHrG
C ***********************************************************
C ***********************************************************

      MODULE all_globals_mod
      use w2f__types
      use active_module
      IMPLICIT NONE
      SAVE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) ALPHA
      REAL(w2f__8) AREA(1 : 3)
      REAL(w2f__8) BETA
      REAL(w2f__8) BHEIGHT(1 : 3)
      REAL(w2f__8) BLENGTH(1 : 3)
      REAL(w2f__8) BWIDTH
      REAL(w2f__8) DAY
      REAL(w2f__8) DAYS_PER_50M_MIXED_LAYER
      REAL(w2f__8) DELTA
      REAL(w2f__8) DELTA_T
      REAL(w2f__8) EPSILON_IC
      REAL(w2f__8) EPSILON_REGULARIZE
      REAL(w2f__8) FDEPS
      REAL(w2f__8) FW(1 : 2)
      REAL(w2f__8) GAMMA_S
      REAL(w2f__8) GAMMA_T
      REAL(w2f__8) HUNDRED
      REAL(w2f__8) INTEGRATION_TIME
      REAL(w2f__8) METRIC
      REAL(w2f__8) METRIC1
      REAL(w2f__8) METRIC2
      REAL(w2f__8) NOISE_CORRELATION_TIME
      REAL(w2f__8) NULLFORCE(1 : 2)
      INTEGER(w2f__i4) N_MAX
      REAL(w2f__8) PROJ_S(1 : 6)
      REAL(w2f__8) PROJ_T(1 : 6)
      REAL(w2f__8) R(1 : 6)
      REAL(w2f__8) R1(1 : 6)
      type(active) :: RHO(1 : 3)
      REAL(w2f__8) ROBERT_FILTER_COEFF
      REAL(w2f__8) R_S(1 : 6)
      REAL(w2f__8) R_T(1 : 6)
      type(active) :: S(1 : 3)
      type(active) :: SNEW(1 : 3)
      type(active) :: SNOW(1 : 3)
      type(active) :: SOLD(1 : 3)
      REAL(w2f__8) SSTAR(1 : 2)
      REAL(w2f__8) SV
      type(active) :: T(1 : 3)
      REAL(w2f__8) THC_S
      REAL(w2f__8) THC_T
      REAL(w2f__8) THC_TOT
      REAL(w2f__8) THOUSAND
      type(active) :: TNEW(1 : 3)
      type(active) :: TNOW(1 : 3)
      type(active) :: TOLD(1 : 3)
      REAL(w2f__8) TSTAR(1 : 2)
      REAL(w2f__8) TSVEC(1 : 6)
      REAL(w2f__8) U0
      REAL(w2f__8) UBAR
      type(active) :: UVEL
      LOGICAL(w2f__i4) VERBMODE
      REAL(w2f__8) VOL(1 : 3)
      REAL(w2f__8) X(1 : 6, 1 : 6)
      type(active) :: XX(1 : 6)
      REAL(w2f__8) Y(1 : 6)
      REAL(w2f__8) YEAR
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) NDIM
      PARAMETER ( NDIM = 3)
C
C     **** Statements ****
C
      END MODULE
C ========== begin copyright notice ==============
C This file is part of 
C ---------------
C xaifBooster
C ---------------
C Distributed under the BSD license as follows:
C Copyright (c) 2005, The University of Chicago
C All rights reserved.
C
C Redistribution and use in source and binary forms, 
C with or without modification, are permitted provided that the following conditions are met:
C
C    - Redistributions of source code must retain the above copyright notice, 
C      this list of conditions and the following disclaimer.
C    - Redistributions in binary form must reproduce the above copyright notice, 
C      this list of conditions and the following disclaimer in the documentation 
C      and/or other materials provided with the distribution.
C    - Neither the name of The University of Chicago nor the names of its contributors 
C      may be used to endorse or promote products derived from this software without 
C      specific prior written permission.
C
C THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
C EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
C OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
C SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
C INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
C PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
C INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
C LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
C OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
C 
C General Information:
C xaifBooster is intended for the transformation of 
C numerical programs represented as xml files according 
C to the XAIF schema. It is part of the OpenAD framework. 
C The main application is automatic 
C differentiation, i.e. the generation of code for 
C the computation of derivatives. 
C The following people are the principal authors of the 
C current version: 
C 	Uwe Naumann
C	Jean Utke
C Additional contributors are: 
C	Andrew Lyons
C	Peter Fine
C
C For more details about xaifBooster and its use in OpenAD please visit:
C   http://www.mcs.anl.gov/openad
C
C This work is partially supported by:
C 	NSF-ITR grant OCE-0205590
C ========== end copyright notice ==============
       subroutine box_forward(ILEV1)
          use OpenAD_dct
          use OpenAD_tape
          use OpenAD_rev
          use OpenAD_checkpoints
          use checkpoint_module
          use graph_module

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

      use w2f__types
      use active_module
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      INTEGER(w2f__i8) OpenAD_Symbol_260
      INTEGER(w2f__i8) OpenAD_Symbol_261
      INTEGER(w2f__i8) OpenAD_Symbol_262
      INTEGER(w2f__i8) OpenAD_Symbol_263
      INTEGER(w2f__i8) OpenAD_Symbol_264
      INTEGER(w2f__i8) OpenAD_Symbol_265
C
C     **** Parameters and Result ****
C
      INTEGER(w2f__i4) ILEV1
C
C     **** Local Variables and Functions ****
C
      EXTERNAL box_cycle_fields
      EXTERNAL box_density
      EXTERNAL box_robert_filter
      EXTERNAL box_timestep
      EXTERNAL box_transport
      INTEGER(w2f__i4) IKEY
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) L
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
      INTEGER(w2f__i8) OpenAD_Symbol_266
C
C     **** Statements ****
C


          !counters
          integer, save :: theSwitch = 0

          !Graph variables
          integer, save :: prevint = 1
          integer, save :: prevdouble = 1
          integer, save :: prevBStack = 0
          integer, save :: prevIStack = 0
          integer, save :: prevFStack = 0
          
          ! checkpointing stacks and offsets
          integer :: cp_loop_variable_1,cp_loop_variable_2,
     +cp_loop_variable_3,cp_loop_variable_4,cp_loop_variable_5
          ! floats 'F'
          double precision, dimension(:), allocatable, save :: 
     +theArgFStack
          integer, save :: theArgFStackoffset=0, theArgFStackSize=0
          ! integers 'I'
          integer, dimension(:), allocatable, save :: 
     +theArgIStack
          integer, save :: theArgIStackoffset=0, theArgIStackSize=0
          ! booleans 'B'
          logical, dimension(:), allocatable, save :: 
     +theArgBStack
          integer, save :: theArgBStackoffset=0, theArgBStackSize=0
          ! strings 'S'
          character*(80), dimension(:), allocatable, save :: 
     +theArgSStack
          integer, save :: theArgSStackoffset=0, theArgSStackSize=0

          type(modeType) :: our_orig_mode

          !Variables for making graphs

         type (list), pointer :: prev => NULL()
         integer :: ierror, counter, counter2, counter3
         
         character (len = 20) itoa 
         character (len = 20) itoa2

         !end graph varibables

	  ! call external C function used in inlined code
          !integer iaddr
          !external iaddr

           ! call external Fortran function used in inlined code
          external makelines

C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"b:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

!function to make graphs
          if (our_rev_mode%tape) then
            Call makelinks('box_forward', prev)
          endif
!end function to make graphs
       
          if (our_rev_mode%arg_store) then 
C            print*, " arg_store  ", our_rev_mode
C store arguments
          call cp_store_int_scalar(ILEV1,theArgIStack,theArgIStackoffset
     +,theArgIStackSize)
          call cp_store_real_scalar(ALPHA,theArgFStack,theArgFStackoffse
     +t,theArgFStackSize)
          call cp_store_real_scalar(BETA,theArgFStack,theArgFStackoffset
     +,theArgFStackSize)
          call cp_store_real_scalar(DELTA,theArgFStack,theArgFStackoffse
     +t,theArgFStackSize)
          call cp_store_real_scalar(DELTA_T,theArgFStack,theArgFStackoff
     +set,theArgFStackSize)
          call cp_store_real_scalar(GAMMA_S,theArgFStack,theArgFStackoff
     +set,theArgFStackSize)
          call cp_store_real_scalar(GAMMA_T,theArgFStack,theArgFStackoff
     +set,theArgFStackSize)
          call cp_store_real_scalar(ROBERT_FILTER_COEFF,theArgFStack,the
     +ArgFStackoffset,theArgFStackSize)
          call cp_store_real_scalar(U0,theArgFStack,theArgFStackoffset,t
     +heArgFStackSize)
          call cp_store_real_scalar(UVEL%v,theArgFStack,theArgFStackoffs
     +et,theArgFStackSize)
          call cp_store_p_real_vector(FW,size(FW),theArgFStack,theArgFSt
     +ackoffset,theArgFStackSize)
          call cp_store_p_real_vector(NULLFORCE,size(NULLFORCE),theArgFS
     +tack,theArgFStackoffset,theArgFStackSize)
          call cp_store_real_vector(RHO,size(RHO),theArgFStack,theArgFSt
     +ackoffset,theArgFStackSize)
          call cp_store_real_vector(SNEW,size(SNEW),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          call cp_store_real_vector(SNOW,size(SNOW),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          call cp_store_real_vector(SOLD,size(SOLD),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          call cp_store_p_real_vector(SSTAR,size(SSTAR),theArgFStack,the
     +ArgFStackoffset,theArgFStackSize)
          call cp_store_real_vector(TNEW,size(TNEW),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          call cp_store_real_vector(TNOW,size(TNOW),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          call cp_store_real_vector(TOLD,size(TOLD),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          call cp_store_p_real_vector(TSTAR,size(TSTAR),theArgFStack,the
     +ArgFStackoffset,theArgFStackSize)
          call cp_store_p_real_vector(VOL,size(VOL),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          end if 
          if (our_rev_mode%arg_restore) then
C            print*, " arg_restore", our_rev_mode
C restore arguments
          do cp_loop_variable_1 = ubound(VOL,1),lbound(VOL,1),-1
             VOL(cp_loop_variable_1) = theArgFStack(theArgFStackoffset)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+VOL(cp_loop_variable_1)
          end do
          do cp_loop_variable_1 = ubound(TSTAR,1),lbound(TSTAR,1),-1
             TSTAR(cp_loop_variable_1) = theArgFStack(theArgFStackoffset
     +)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+TSTAR(cp_loop_variable_1)
          end do
          do cp_loop_variable_1 = ubound(TOLD,1),lbound(TOLD,1),-1
             TOLD(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffse
     +t)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+TOLD(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(TNOW,1),lbound(TNOW,1),-1
             TNOW(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffse
     +t)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+TNOW(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(TNEW,1),lbound(TNEW,1),-1
             TNEW(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffse
     +t)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+TNEW(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(SSTAR,1),lbound(SSTAR,1),-1
             SSTAR(cp_loop_variable_1) = theArgFStack(theArgFStackoffset
     +)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+SSTAR(cp_loop_variable_1)
          end do
          do cp_loop_variable_1 = ubound(SOLD,1),lbound(SOLD,1),-1
             SOLD(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffse
     +t)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+SOLD(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(SNOW,1),lbound(SNOW,1),-1
             SNOW(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffse
     +t)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+SNOW(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(SNEW,1),lbound(SNEW,1),-1
             SNEW(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffse
     +t)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+SNEW(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(RHO,1),lbound(RHO,1),-1
             RHO(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffset
     +)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+RHO(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(NULLFORCE,1),lbound(NULLFORCE,1
     +),-1
             NULLFORCE(cp_loop_variable_1) = theArgFStack(theArgFStackof
     +fset)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+NULLFORCE(cp_loop_variable_1)
          end do
          do cp_loop_variable_1 = ubound(FW,1),lbound(FW,1),-1
             FW(cp_loop_variable_1) = theArgFStack(theArgFStackoffset)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+FW(cp_loop_variable_1)
          end do
          UVEL%v = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",UVEL%v
          theArgFStackoffset = theArgFStackoffset-1
          U0 = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",U0
          theArgFStackoffset = theArgFStackoffset-1
          ROBERT_FILTER_COEFF = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",ROBERT_FILTER_COEFF
          theArgFStackoffset = theArgFStackoffset-1
          GAMMA_T = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",GAMMA_T
          theArgFStackoffset = theArgFStackoffset-1
          GAMMA_S = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",GAMMA_S
          theArgFStackoffset = theArgFStackoffset-1
          DELTA_T = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",DELTA_T
          theArgFStackoffset = theArgFStackoffset-1
          DELTA = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",DELTA
          theArgFStackoffset = theArgFStackoffset-1
          BETA = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",BETA
          theArgFStackoffset = theArgFStackoffset-1
          ALPHA = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",ALPHA
          theArgFStackoffset = theArgFStackoffset-1
          ILEV1 = theArgIStack(theArgIStackoffset)
          theArgIStackoffset = theArgIStackoffset-1
C write(*,'(A,I5)')"restore(s)  ",ILEV1
          end if
          if (our_rev_mode%plain) then
C            print*, " plain      ", our_rev_mode
            our_orig_mode=our_rev_mode
            our_rev_mode%arg_store=.FALSE.
C original function
C$OPENAD XXX Template ad_template.f
      IKEY = ILEV1
      CALL box_density(TNOW,SNOW,RHO)
      CALL box_transport(RHO,UVEL)
      CALL box_timestep(GAMMA_T,TSTAR,NULLFORCE,UVEL,TNOW,TOLD,TNEW)
      CALL box_timestep(GAMMA_S,SSTAR,FW,UVEL,SNOW,SOLD,SNEW)
      CALL box_robert_filter(TNOW,TOLD,TNEW)
      CALL box_robert_filter(SNOW,SOLD,SNEW)
      CALL box_cycle_fields()
      DO L = 1, 3, 1
        IF (TNOW(L)%v .LT. (-2.0D00)) THEN
          TNOW(INT(L))%v = 2.0D00
        ENDIF
      END DO
      RETURN
            our_rev_mode=our_orig_mode
          end if 
          if (our_rev_mode%tape) then
C            print*, " tape       ", our_rev_mode
            our_rev_mode%arg_store=.TRUE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.TRUE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.FALSE.
C taping
C$OPENAD XXX Template ad_template.f
      IKEY = ILEV1
      CALL box_density(TNOW,SNOW,RHO)
      CALL box_transport(RHO,UVEL)
      CALL box_timestep(GAMMA_T,TSTAR,NULLFORCE,UVEL,TNOW,TOLD,TNEW)
      CALL box_timestep(GAMMA_S,SSTAR,FW,UVEL,SNOW,SOLD,SNEW)
      CALL box_robert_filter(TNOW,TOLD,TNEW)
      CALL box_robert_filter(SNOW,SOLD,SNEW)
      CALL box_cycle_fields()
      OpenAD_Symbol_263 = 0_w2f__i8
      DO L = 1, 3, 1
        IF (TNOW(L)%v .LT. (-2.0D00)) THEN
          TNOW(INT(L))%v = 2.0D00
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          OpenAD_Symbol_264 = 1_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_264
          integer_tape_pointer = integer_tape_pointer+1
        ELSE
          OpenAD_Symbol_265 = 0_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_265
          integer_tape_pointer = integer_tape_pointer+1
        ENDIF
        OpenAD_Symbol_263 = (INT(OpenAD_Symbol_263) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_263
          integer_tape_pointer = integer_tape_pointer+1
      RETURN
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.TRUE.

            !Part of making graphs
              if (.not. associated(prev)) then
                tree%doubles = double_tape_pointer - prevdouble-1
                tree%integers = integer_tape_pointer - prevint-1
                tree%argInts = -1*(theArgIStackOffset - prevIStack)
                tree%argFloats = -1*(theArgFStackOffset - prevFStack)
                tree%argBools =  -1*(theArgBStackOffset - prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset                
              else
                prev%called%doubles = double_tape_pointer - prevdouble
                prev%called%integers = integer_tape_pointer- prevint
                prev%called%argInts =-1*(theArgIStackOffset-prevIStack)
                prev%called%argFloats=-1*(theArgFStackOffset-prevFStack)
                prev%called%argBools= -1*(theArgBStackOffset-prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset
              endif
             !end Graph code
C                call diff tape storage only once flag
          end if 
          if (our_rev_mode%adjoint) then
C            print*, " adjoint    ", our_rev_mode
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
C adjoint
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_260 = integer_tape(integer_tape_pointer)
      OpenAD_Symbol_261 = 1
      DO WHILE(INT(OpenAD_Symbol_261) .LE. INT(OpenAD_Symbol_260))
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_262 = integer_tape(integer_tape_pointer)
        IF(OpenAD_Symbol_262 .ne. 0) THEN
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_266 = integer_tape(integer_tape_pointer)
          TNOW(INT(OpenAD_Symbol_266))%d = 0.0d0
        ENDIF
        OpenAD_Symbol_261 = INT(OpenAD_Symbol_261) + 1
      END DO
      CALL box_cycle_fields()
      CALL box_robert_filter(SNOW,SOLD,SNEW)
      CALL box_robert_filter(TNOW,TOLD,TNEW)
      CALL box_timestep(GAMMA_S,SSTAR,FW,UVEL,SNOW,SOLD,SNEW)
      CALL box_timestep(GAMMA_T,TSTAR,NULLFORCE,UVEL,TNOW,TOLD,TNEW)
      CALL box_transport(RHO,UVEL)
      CALL box_density(TNOW,SNOW,RHO)
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
          end if 
C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"a:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

         !graph code
         prevint = integer_tape_pointer
         prevdouble = double_tape_pointer
         prevBStack = theArgBStackOffset
         prevIStack = theArgIStackOffset
         prevFStack = theArgFStackOffset
         if (our_rev_mode%tape) then
          if( associated(prev)) then
             cur => prev
           else  
             !if(tree%first%called%value .eq. cur%called%value) then
           Open (Unit=10, File='/tmp/calltree.out', status='replace', 
     + action='write', iostat=ierror)
           write(10, *) 'digraph G {'
           write(10, *) 'nodesep=.05;'
           write(10, *) 'ranksep=.05;'
           graph%value = tree%value
           graph%doubles = tree%doubles
           graph%integers = tree%integers
           write(itoa, '(I)') tree%doubles
           itoa = adjustl(itoa)
           write(itoa2, '(I)') tree%integers
           itoa2 = adjustl(itoa2)
           write(10, '(I, A, A, A, A, A, A, A)'), iaddr(tree),
     + '[shape="box" height=.25 label="', trim(tree%value), ' ', 
     + trim(itoa), ':', trim(itoa2), '"];'
            Call graphprint(tree)
            write(10, *) '1[ height=.25 label="SubroutineName',
     + ' double:integer"];'
            write(10, '(A,A)') '2[height=.25 label="Edge checkpoint',
     + ' double:integer:boolean"];'
            write(10, *) '}'
            close(10)
            Open (Unit=11, File='/tmp/callgraph.out', status='replace',
     + action='write', iostat=ierror)
            write(11, *) 'digraph G {'
            write(11, *) 'nodesep=.05;'
            write(11, *) 'ranksep=.05;'
            call graph2print()
            write(11, '(A,A)') '1[ height=.25 label="SubroutineName',
     + ' tape double:integer checkpoint double:integer:boolean"];'
            write(11, *) '}'
            close(11)
             !read *, five
             !endif
             endif
           endif    
         !end graph code

        end subroutine box_forward
C ========== begin copyright notice ==============
C This file is part of 
C ---------------
C xaifBooster
C ---------------
C Distributed under the BSD license as follows:
C Copyright (c) 2005, The University of Chicago
C All rights reserved.
C
C Redistribution and use in source and binary forms, 
C with or without modification, are permitted provided that the following conditions are met:
C
C    - Redistributions of source code must retain the above copyright notice, 
C      this list of conditions and the following disclaimer.
C    - Redistributions in binary form must reproduce the above copyright notice, 
C      this list of conditions and the following disclaimer in the documentation 
C      and/or other materials provided with the distribution.
C    - Neither the name of The University of Chicago nor the names of its contributors 
C      may be used to endorse or promote products derived from this software without 
C      specific prior written permission.
C
C THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
C EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
C OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
C SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
C INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
C PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
C INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
C LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
C OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
C 
C General Information:
C xaifBooster is intended for the transformation of 
C numerical programs represented as xml files according 
C to the XAIF schema. It is part of the OpenAD framework. 
C The main application is automatic 
C differentiation, i.e. the generation of code for 
C the computation of derivatives. 
C The following people are the principal authors of the 
C current version: 
C 	Uwe Naumann
C	Jean Utke
C Additional contributors are: 
C	Andrew Lyons
C	Peter Fine
C
C For more details about xaifBooster and its use in OpenAD please visit:
C   http://www.mcs.anl.gov/openad
C
C This work is partially supported by:
C 	NSF-ITR grant OCE-0205590
C ========== end copyright notice ==============
       subroutine box_final_state()
          use OpenAD_dct
          use OpenAD_tape
          use OpenAD_rev
          use OpenAD_checkpoints
          use checkpoint_module
          use graph_module

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

      use w2f__types
      use active_module
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      INTEGER(w2f__i8) OpenAD_Symbol_330
      INTEGER(w2f__i8) OpenAD_Symbol_331
      INTEGER(w2f__i8) OpenAD_Symbol_332
      INTEGER(w2f__i8) OpenAD_Symbol_333
      INTEGER(w2f__i8) OpenAD_Symbol_334
      INTEGER(w2f__i8) OpenAD_Symbol_335
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) L
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
C
C     **** Statements ****
C


          !counters
          integer, save :: theSwitch = 0

          !Graph variables
          integer, save :: prevint = 1
          integer, save :: prevdouble = 1
          integer, save :: prevBStack = 0
          integer, save :: prevIStack = 0
          integer, save :: prevFStack = 0
          
          ! checkpointing stacks and offsets
          integer :: cp_loop_variable_1,cp_loop_variable_2,
     +cp_loop_variable_3,cp_loop_variable_4,cp_loop_variable_5
          ! floats 'F'
          double precision, dimension(:), allocatable, save :: 
     +theArgFStack
          integer, save :: theArgFStackoffset=0, theArgFStackSize=0
          ! integers 'I'
          integer, dimension(:), allocatable, save :: 
     +theArgIStack
          integer, save :: theArgIStackoffset=0, theArgIStackSize=0
          ! booleans 'B'
          logical, dimension(:), allocatable, save :: 
     +theArgBStack
          integer, save :: theArgBStackoffset=0, theArgBStackSize=0
          ! strings 'S'
          character*(80), dimension(:), allocatable, save :: 
     +theArgSStack
          integer, save :: theArgSStackoffset=0, theArgSStackSize=0

          type(modeType) :: our_orig_mode

          !Variables for making graphs

         type (list), pointer :: prev => NULL()
         integer :: ierror, counter, counter2, counter3
         
         character (len = 20) itoa 
         character (len = 20) itoa2

         !end graph varibables

	  ! call external C function used in inlined code
          !integer iaddr
          !external iaddr

           ! call external Fortran function used in inlined code
          external makelines

C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"b:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

!function to make graphs
          if (our_rev_mode%tape) then
            Call makelinks('box_final_state', prev)
          endif
!end function to make graphs
       
          if (our_rev_mode%arg_store) then 
C            print*, " arg_store  ", our_rev_mode
C store arguments
          call cp_store_real_vector(SNOW,size(SNOW),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          call cp_store_real_vector(TNOW,size(TNOW),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          end if 
          if (our_rev_mode%arg_restore) then
C            print*, " arg_restore", our_rev_mode
C restore arguments
          do cp_loop_variable_1 = ubound(TNOW,1),lbound(TNOW,1),-1
             TNOW(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffse
     +t)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+TNOW(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(SNOW,1),lbound(SNOW,1),-1
             SNOW(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffse
     +t)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+SNOW(cp_loop_variable_1)%v
          end do
          end if
          if (our_rev_mode%plain) then
C            print*, " plain      ", our_rev_mode
            our_orig_mode=our_rev_mode
            our_rev_mode%arg_store=.FALSE.
C original function
C$OPENAD XXX Template ad_template.f
      DO L = 1, 6, 1
        TSVEC(INT(L)) = 0.0D00
      END DO
      DO L = 1, 3, 1
        TSVEC(INT(L)) = TNOW(L)%v
        TSVEC(INT(L+3)) = SNOW(L)%v
      END DO
      RETURN
            our_rev_mode=our_orig_mode
          end if 
          if (our_rev_mode%tape) then
C            print*, " tape       ", our_rev_mode
            our_rev_mode%arg_store=.TRUE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.TRUE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.FALSE.
C taping
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_334 = 0_w2f__i8
      DO L = 1, 6, 1
        TSVEC(INT(L)) = 0.0D00
        OpenAD_Symbol_334 = (INT(OpenAD_Symbol_334) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_334
          integer_tape_pointer = integer_tape_pointer+1
      OpenAD_Symbol_335 = 0_w2f__i8
      DO L = 1, 3, 1
        TSVEC(INT(L)) = TNOW(L)%v
        TSVEC(INT(L+3)) = SNOW(L)%v
        OpenAD_Symbol_335 = (INT(OpenAD_Symbol_335) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_335
          integer_tape_pointer = integer_tape_pointer+1
      RETURN
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.TRUE.

            !Part of making graphs
              if (.not. associated(prev)) then
                tree%doubles = double_tape_pointer - prevdouble-1
                tree%integers = integer_tape_pointer - prevint-1
                tree%argInts = -1*(theArgIStackOffset - prevIStack)
                tree%argFloats = -1*(theArgFStackOffset - prevFStack)
                tree%argBools =  -1*(theArgBStackOffset - prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset                
              else
                prev%called%doubles = double_tape_pointer - prevdouble
                prev%called%integers = integer_tape_pointer- prevint
                prev%called%argInts =-1*(theArgIStackOffset-prevIStack)
                prev%called%argFloats=-1*(theArgFStackOffset-prevFStack)
                prev%called%argBools= -1*(theArgBStackOffset-prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset
              endif
             !end Graph code
C                call diff tape storage only once flag
          end if 
          if (our_rev_mode%adjoint) then
C            print*, " adjoint    ", our_rev_mode
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
C adjoint
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_330 = integer_tape(integer_tape_pointer)
      OpenAD_Symbol_331 = 1
      DO WHILE(INT(OpenAD_Symbol_331) .LE. INT(OpenAD_Symbol_330))
        OpenAD_Symbol_331 = INT(OpenAD_Symbol_331) + 1
      END DO
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_332 = integer_tape(integer_tape_pointer)
      OpenAD_Symbol_333 = 1
      DO WHILE(INT(OpenAD_Symbol_333) .LE. INT(OpenAD_Symbol_332))
        OpenAD_Symbol_333 = INT(OpenAD_Symbol_333) + 1
      END DO
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
          end if 
C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"a:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

         !graph code
         prevint = integer_tape_pointer
         prevdouble = double_tape_pointer
         prevBStack = theArgBStackOffset
         prevIStack = theArgIStackOffset
         prevFStack = theArgFStackOffset
         if (our_rev_mode%tape) then
          if( associated(prev)) then
             cur => prev
           else  
             !if(tree%first%called%value .eq. cur%called%value) then
           Open (Unit=10, File='/tmp/calltree.out', status='replace', 
     + action='write', iostat=ierror)
           write(10, *) 'digraph G {'
           write(10, *) 'nodesep=.05;'
           write(10, *) 'ranksep=.05;'
           graph%value = tree%value
           graph%doubles = tree%doubles
           graph%integers = tree%integers
           write(itoa, '(I)') tree%doubles
           itoa = adjustl(itoa)
           write(itoa2, '(I)') tree%integers
           itoa2 = adjustl(itoa2)
           write(10, '(I, A, A, A, A, A, A, A)'), iaddr(tree),
     + '[shape="box" height=.25 label="', trim(tree%value), ' ', 
     + trim(itoa), ':', trim(itoa2), '"];'
            Call graphprint(tree)
            write(10, *) '1[ height=.25 label="SubroutineName',
     + ' double:integer"];'
            write(10, '(A,A)') '2[height=.25 label="Edge checkpoint',
     + ' double:integer:boolean"];'
            write(10, *) '}'
            close(10)
            Open (Unit=11, File='/tmp/callgraph.out', status='replace',
     + action='write', iostat=ierror)
            write(11, *) 'digraph G {'
            write(11, *) 'nodesep=.05;'
            write(11, *) 'ranksep=.05;'
            call graph2print()
            write(11, '(A,A)') '1[ height=.25 label="SubroutineName',
     + ' tape double:integer checkpoint double:integer:boolean"];'
            write(11, *) '}'
            close(11)
             !read *, five
             !endif
             endif
           endif    
         !end graph code

        end subroutine box_final_state
C ========== begin copyright notice ==============
C This file is part of 
C ---------------
C xaifBooster
C ---------------
C Distributed under the BSD license as follows:
C Copyright (c) 2005, The University of Chicago
C All rights reserved.
C
C Redistribution and use in source and binary forms, 
C with or without modification, are permitted provided that the following conditions are met:
C
C    - Redistributions of source code must retain the above copyright notice, 
C      this list of conditions and the following disclaimer.
C    - Redistributions in binary form must reproduce the above copyright notice, 
C      this list of conditions and the following disclaimer in the documentation 
C      and/or other materials provided with the distribution.
C    - Neither the name of The University of Chicago nor the names of its contributors 
C      may be used to endorse or promote products derived from this software without 
C      specific prior written permission.
C
C THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
C EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
C OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
C SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
C INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
C PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
C INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
C LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
C OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
C 
C General Information:
C xaifBooster is intended for the transformation of 
C numerical programs represented as xml files according 
C to the XAIF schema. It is part of the OpenAD framework. 
C The main application is automatic 
C differentiation, i.e. the generation of code for 
C the computation of derivatives. 
C The following people are the principal authors of the 
C current version: 
C 	Uwe Naumann
C	Jean Utke
C Additional contributors are: 
C	Andrew Lyons
C	Peter Fine
C
C For more details about xaifBooster and its use in OpenAD please visit:
C   http://www.mcs.anl.gov/openad
C
C This work is partially supported by:
C 	NSF-ITR grant OCE-0205590
C ========== end copyright notice ==============
       subroutine box_ini_fields()
          use OpenAD_dct
          use OpenAD_tape
          use OpenAD_rev
          use OpenAD_checkpoints
          use checkpoint_module
          use graph_module

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

      use w2f__types
      use active_module
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_136
      REAL(w2f__8) OpenAD_Symbol_137
      REAL(w2f__8) OpenAD_Symbol_138
      REAL(w2f__8) OpenAD_Symbol_139
      REAL(w2f__8) OpenAD_Symbol_242
      type(active) :: OpenAD_Symbol_243
      REAL(w2f__8) OpenAD_Symbol_244
      type(active) :: OpenAD_Symbol_245
      REAL(w2f__8) OpenAD_Symbol_246
      type(active) :: OpenAD_Symbol_247
      REAL(w2f__8) OpenAD_Symbol_248
      type(active) :: OpenAD_Symbol_249
      type(active) :: OpenAD_Symbol_250
      type(active) :: OpenAD_Symbol_251
      type(active) :: OpenAD_Symbol_252
      type(active) :: OpenAD_Symbol_253
      type(active) :: OpenAD_Symbol_254
      type(active) :: OpenAD_Symbol_255
      INTEGER(w2f__i8) OpenAD_Symbol_336
      INTEGER(w2f__i8) OpenAD_Symbol_337
      INTEGER(w2f__i8) OpenAD_Symbol_338
      INTEGER(w2f__i8) OpenAD_Symbol_339
      INTEGER(w2f__i8) OpenAD_Symbol_340
      INTEGER(w2f__i8) OpenAD_Symbol_341
      INTEGER(w2f__i8) OpenAD_Symbol_342
      INTEGER(w2f__i8) OpenAD_Symbol_343
      INTEGER(w2f__i8) OpenAD_Symbol_344
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) L
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
      INTEGER(w2f__i8) OpenAD_Symbol_345
      INTEGER(w2f__i8) OpenAD_Symbol_346
      REAL(w2f__8) OpenAD_Symbol_347
      INTEGER(w2f__i8) OpenAD_Symbol_348
      REAL(w2f__8) OpenAD_Symbol_349
      INTEGER(w2f__i8) OpenAD_Symbol_350
      REAL(w2f__8) OpenAD_Symbol_351
      INTEGER(w2f__i8) OpenAD_Symbol_352
      REAL(w2f__8) OpenAD_Symbol_353
      INTEGER(w2f__i8) OpenAD_Symbol_354
      INTEGER(w2f__i8) OpenAD_Symbol_355
      INTEGER(w2f__i8) OpenAD_Symbol_356
      INTEGER(w2f__i8) OpenAD_Symbol_357
      INTEGER(w2f__i8) OpenAD_Symbol_358
      INTEGER(w2f__i8) OpenAD_Symbol_359
      INTEGER(w2f__i8) OpenAD_Symbol_360
      INTEGER(w2f__i8) OpenAD_Symbol_361
      INTEGER(w2f__i8) OpenAD_Symbol_362
      INTEGER(w2f__i8) OpenAD_Symbol_363
      INTEGER(w2f__i8) OpenAD_Symbol_364
      INTEGER(w2f__i8) OpenAD_Symbol_365
      INTEGER(w2f__i8) OpenAD_Symbol_366
      INTEGER(w2f__i8) OpenAD_Symbol_367
      INTEGER(w2f__i8) OpenAD_Symbol_368
      INTEGER(w2f__i8) OpenAD_Symbol_369
C
C     **** Statements ****
C


          !counters
          integer, save :: theSwitch = 0

          !Graph variables
          integer, save :: prevint = 1
          integer, save :: prevdouble = 1
          integer, save :: prevBStack = 0
          integer, save :: prevIStack = 0
          integer, save :: prevFStack = 0
          
          ! checkpointing stacks and offsets
          integer :: cp_loop_variable_1,cp_loop_variable_2,
     +cp_loop_variable_3,cp_loop_variable_4,cp_loop_variable_5
          ! floats 'F'
          double precision, dimension(:), allocatable, save :: 
     +theArgFStack
          integer, save :: theArgFStackoffset=0, theArgFStackSize=0
          ! integers 'I'
          integer, dimension(:), allocatable, save :: 
     +theArgIStack
          integer, save :: theArgIStackoffset=0, theArgIStackSize=0
          ! booleans 'B'
          logical, dimension(:), allocatable, save :: 
     +theArgBStack
          integer, save :: theArgBStackoffset=0, theArgBStackSize=0
          ! strings 'S'
          character*(80), dimension(:), allocatable, save :: 
     +theArgSStack
          integer, save :: theArgSStackoffset=0, theArgSStackSize=0

          type(modeType) :: our_orig_mode

          !Variables for making graphs

         type (list), pointer :: prev => NULL()
         integer :: ierror, counter, counter2, counter3
         
         character (len = 20) itoa 
         character (len = 20) itoa2

         !end graph varibables

	  ! call external C function used in inlined code
          !integer iaddr
          !external iaddr

           ! call external Fortran function used in inlined code
          external makelines

C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"b:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

!function to make graphs
          if (our_rev_mode%tape) then
            Call makelinks('box_ini_fields', prev)
          endif
!end function to make graphs
       
          if (our_rev_mode%arg_store) then 
C            print*, " arg_store  ", our_rev_mode
C store arguments
          call cp_store_real_scalar(HUNDRED,theArgFStack,theArgFStackoff
     +set,theArgFStackSize)
          call cp_store_real_scalar(SV,theArgFStack,theArgFStackoffset,t
     +heArgFStackSize)
          call cp_store_real_scalar(YEAR,theArgFStack,theArgFStackoffset
     +,theArgFStackSize)
          call cp_store_p_real_vector(AREA,size(AREA),theArgFStack,theAr
     +gFStackoffset,theArgFStackSize)
          call cp_store_p_real_vector(FW,size(FW),theArgFStack,theArgFSt
     +ackoffset,theArgFStackSize)
          call cp_store_real_vector(S,size(S),theArgFStack,theArgFStacko
     +ffset,theArgFStackSize)
          call cp_store_real_vector(T,size(T),theArgFStack,theArgFStacko
     +ffset,theArgFStackSize)
          call cp_store_real_vector(XX,size(XX),theArgFStack,theArgFStac
     +koffset,theArgFStackSize)
          end if 
          if (our_rev_mode%arg_restore) then
C            print*, " arg_restore", our_rev_mode
C restore arguments
          do cp_loop_variable_1 = ubound(XX,1),lbound(XX,1),-1
             XX(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffset)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+XX(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(T,1),lbound(T,1),-1
             T(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffset)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+T(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(S,1),lbound(S,1),-1
             S(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffset)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+S(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(FW,1),lbound(FW,1),-1
             FW(cp_loop_variable_1) = theArgFStack(theArgFStackoffset)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+FW(cp_loop_variable_1)
          end do
          do cp_loop_variable_1 = ubound(AREA,1),lbound(AREA,1),-1
             AREA(cp_loop_variable_1) = theArgFStack(theArgFStackoffset)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+AREA(cp_loop_variable_1)
          end do
          YEAR = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",YEAR
          theArgFStackoffset = theArgFStackoffset-1
          SV = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",SV
          theArgFStackoffset = theArgFStackoffset-1
          HUNDRED = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",HUNDRED
          theArgFStackoffset = theArgFStackoffset-1
          end if
          if (our_rev_mode%plain) then
C            print*, " plain      ", our_rev_mode
            our_orig_mode=our_rev_mode
            our_rev_mode%arg_store=.FALSE.
C original function
C$OPENAD XXX Template ad_template.f
      THC_TOT = 0.0D00
      THC_T = 0.0D00
      THC_S = 0.0D00
      METRIC1 = 0.0D00
      METRIC2 = 0.0D00
      METRIC = 0.0D00
      NULLFORCE(1) = 0.0D00
      NULLFORCE(2) = 0.0D00
      FW(1) = (AREA(1) *(HUNDRED / YEAR) * 3.5D+01)
      FW(2) = (- FW(1))
      TSTAR(1) = 2.2D+01
      TSTAR(2) = 0.0D00
      SSTAR(1) = 3.6D+01
      SSTAR(2) = 3.4D+01
      UBAR = (SV * 2.0D+01)
      T(1)%v = 2.0D+01
      T(2)%v = 1.0D00
      T(3)%v = 1.0D00
      S(1)%v = 3.55D+01
      S(2)%v = 3.45D+01
      S(3)%v = 3.45D+01
      DO L = 1, 6, 1
        TSVEC(INT(L)) = 0.0D00
      END DO
      DO L = 1, 3, 1
        T(INT(L))%v = (T(L)%v+XX(L)%v)
        S(INT(L))%v = (S(L)%v+XX(L+3)%v)
      END DO
      DO L = 1, 3, 1
        TNEW(INT(L))%v = T(L)%v
        SNEW(INT(L))%v = S(L)%v
        TOLD(INT(L))%v = T(L)%v
        SOLD(INT(L))%v = S(L)%v
        TNOW(INT(L))%v = T(L)%v
        SNOW(INT(L))%v = S(L)%v
      END DO
      UVEL%v = UBAR
      RETURN
            our_rev_mode=our_orig_mode
          end if 
          if (our_rev_mode%tape) then
C            print*, " tape       ", our_rev_mode
            our_rev_mode%arg_store=.TRUE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.TRUE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.FALSE.
C taping
C$OPENAD XXX Template ad_template.f
      THC_TOT = 0.0D00
      THC_T = 0.0D00
      THC_S = 0.0D00
      METRIC1 = 0.0D00
      METRIC2 = 0.0D00
      METRIC = 0.0D00
      NULLFORCE(1) = 0.0D00
      NULLFORCE(2) = 0.0D00
      FW(1) = (AREA(1) *(HUNDRED / YEAR) * 3.5D+01)
      FW(2) = (- FW(1))
      TSTAR(1) = 2.2D+01
      TSTAR(2) = 0.0D00
      SSTAR(1) = 3.6D+01
      SSTAR(2) = 3.4D+01
      UBAR = (SV * 2.0D+01)
      T(1)%v = 2.0D+01
      T(2)%v = 1.0D00
      T(3)%v = 1.0D00
      S(1)%v = 3.55D+01
      S(2)%v = 3.45D+01
      S(3)%v = 3.45D+01
      OpenAD_Symbol_342 = 0_w2f__i8
      DO L = 1, 6, 1
        TSVEC(INT(L)) = 0.0D00
        OpenAD_Symbol_342 = (INT(OpenAD_Symbol_342) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_342
          integer_tape_pointer = integer_tape_pointer+1
      OpenAD_Symbol_343 = 0_w2f__i8
      DO L = 1, 3, 1
        T(INT(L))%v = (T(L)%v+XX(L)%v)
        OpenAD_Symbol_136 = 1_w2f__i8
        OpenAD_Symbol_137 = 1_w2f__i8
        S(INT(L))%v = (S(L)%v+XX(L+3)%v)
        OpenAD_Symbol_138 = 1_w2f__i8
        OpenAD_Symbol_139 = 1_w2f__i8
        OpenAD_Symbol_242 = OpenAD_Symbol_136
        OpenAD_Symbol_244 = OpenAD_Symbol_137
        OpenAD_Symbol_246 = OpenAD_Symbol_138
        OpenAD_Symbol_248 = OpenAD_Symbol_139
        OpenAD_Symbol_345 = (L + INT(3_w2f__i8))
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_345
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_242
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_244
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_246
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_248
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
        OpenAD_Symbol_343 = (INT(OpenAD_Symbol_343) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_343
          integer_tape_pointer = integer_tape_pointer+1
      OpenAD_Symbol_344 = 0_w2f__i8
      DO L = 1, 3, 1
        TNEW(INT(L))%v = T(L)%v
        SNEW(INT(L))%v = S(L)%v
        TOLD(INT(L))%v = T(L)%v
        SOLD(INT(L))%v = S(L)%v
        TNOW(INT(L))%v = T(L)%v
        SNOW(INT(L))%v = S(L)%v
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
        OpenAD_Symbol_344 = (INT(OpenAD_Symbol_344) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_344
          integer_tape_pointer = integer_tape_pointer+1
      UVEL%v = UBAR
      RETURN
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.TRUE.

            !Part of making graphs
              if (.not. associated(prev)) then
                tree%doubles = double_tape_pointer - prevdouble-1
                tree%integers = integer_tape_pointer - prevint-1
                tree%argInts = -1*(theArgIStackOffset - prevIStack)
                tree%argFloats = -1*(theArgFStackOffset - prevFStack)
                tree%argBools =  -1*(theArgBStackOffset - prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset                
              else
                prev%called%doubles = double_tape_pointer - prevdouble
                prev%called%integers = integer_tape_pointer- prevint
                prev%called%argInts =-1*(theArgIStackOffset-prevIStack)
                prev%called%argFloats=-1*(theArgFStackOffset-prevFStack)
                prev%called%argBools= -1*(theArgBStackOffset-prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset
              endif
             !end Graph code
C                call diff tape storage only once flag
          end if 
          if (our_rev_mode%adjoint) then
C            print*, " adjoint    ", our_rev_mode
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
C adjoint
          UVEL%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_336 = integer_tape(integer_tape_pointer)
      OpenAD_Symbol_337 = 1
      DO WHILE(INT(OpenAD_Symbol_337) .LE. INT(OpenAD_Symbol_336))
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_358 = integer_tape(integer_tape_pointer)
          if (iaddr(SNOW(INT(OpenAD_Symbol_358))) .ne. iaddr(OpenAD_Symb
     +ol_255)) then
            OpenAD_Symbol_255%d = OpenAD_Symbol_255%d+SNOW(INT(OpenAD_Sy
     +mbol_358))%d
            SNOW(INT(OpenAD_Symbol_358))%d = 0
          end if
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_359 = integer_tape(integer_tape_pointer)
          if (iaddr(TNOW(INT(OpenAD_Symbol_359))) .ne. iaddr(OpenAD_Symb
     +ol_254)) then
            OpenAD_Symbol_254%d = OpenAD_Symbol_254%d+TNOW(INT(OpenAD_Sy
     +mbol_359))%d
            TNOW(INT(OpenAD_Symbol_359))%d = 0
          end if
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_360 = integer_tape(integer_tape_pointer)
          if (iaddr(SOLD(INT(OpenAD_Symbol_360))) .ne. iaddr(OpenAD_Symb
     +ol_253)) then
            OpenAD_Symbol_253%d = OpenAD_Symbol_253%d+SOLD(INT(OpenAD_Sy
     +mbol_360))%d
            SOLD(INT(OpenAD_Symbol_360))%d = 0
          end if
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_361 = integer_tape(integer_tape_pointer)
          if (iaddr(TOLD(INT(OpenAD_Symbol_361))) .ne. iaddr(OpenAD_Symb
     +ol_252)) then
            OpenAD_Symbol_252%d = OpenAD_Symbol_252%d+TOLD(INT(OpenAD_Sy
     +mbol_361))%d
            TOLD(INT(OpenAD_Symbol_361))%d = 0
          end if
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_362 = integer_tape(integer_tape_pointer)
          if (iaddr(SNEW(INT(OpenAD_Symbol_362))) .ne. iaddr(OpenAD_Symb
     +ol_251)) then
            OpenAD_Symbol_251%d = OpenAD_Symbol_251%d+SNEW(INT(OpenAD_Sy
     +mbol_362))%d
            SNEW(INT(OpenAD_Symbol_362))%d = 0
          end if
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_363 = integer_tape(integer_tape_pointer)
          if (iaddr(TNEW(INT(OpenAD_Symbol_363))) .ne. iaddr(OpenAD_Symb
     +ol_250)) then
            OpenAD_Symbol_250%d = OpenAD_Symbol_250%d+TNEW(INT(OpenAD_Sy
     +mbol_363))%d
            TNEW(INT(OpenAD_Symbol_363))%d = 0
          end if
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_364 = integer_tape(integer_tape_pointer)
          T(INT(OpenAD_Symbol_364))%d = T(INT(OpenAD_Symbol_364))%d+Open
     +AD_Symbol_250%d
          OpenAD_Symbol_250%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_365 = integer_tape(integer_tape_pointer)
          S(INT(OpenAD_Symbol_365))%d = S(INT(OpenAD_Symbol_365))%d+Open
     +AD_Symbol_251%d
          OpenAD_Symbol_251%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_366 = integer_tape(integer_tape_pointer)
          T(INT(OpenAD_Symbol_366))%d = T(INT(OpenAD_Symbol_366))%d+Open
     +AD_Symbol_252%d
          OpenAD_Symbol_252%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_367 = integer_tape(integer_tape_pointer)
          S(INT(OpenAD_Symbol_367))%d = S(INT(OpenAD_Symbol_367))%d+Open
     +AD_Symbol_253%d
          OpenAD_Symbol_253%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_368 = integer_tape(integer_tape_pointer)
          T(INT(OpenAD_Symbol_368))%d = T(INT(OpenAD_Symbol_368))%d+Open
     +AD_Symbol_254%d
          OpenAD_Symbol_254%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_369 = integer_tape(integer_tape_pointer)
          S(INT(OpenAD_Symbol_369))%d = S(INT(OpenAD_Symbol_369))%d+Open
     +AD_Symbol_255%d
          OpenAD_Symbol_255%d = 0.0d0
        OpenAD_Symbol_337 = INT(OpenAD_Symbol_337) + 1
      END DO
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_338 = integer_tape(integer_tape_pointer)
      OpenAD_Symbol_339 = 1
      DO WHILE(INT(OpenAD_Symbol_339) .LE. INT(OpenAD_Symbol_338))
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_346 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_347 = double_tape(double_tape_pointer)
          OpenAD_Symbol_249%d = OpenAD_Symbol_249%d+S(INT(OpenAD_Symbol_
     +346))%d*OpenAD_Symbol_347
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_348 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_349 = double_tape(double_tape_pointer)
          OpenAD_Symbol_247%d = OpenAD_Symbol_247%d+S(INT(OpenAD_Symbol_
     +348))%d*OpenAD_Symbol_349
          S(INT(OpenAD_Symbol_348))%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_350 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_351 = double_tape(double_tape_pointer)
          OpenAD_Symbol_245%d = OpenAD_Symbol_245%d+T(INT(OpenAD_Symbol_
     +350))%d*OpenAD_Symbol_351
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_352 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_353 = double_tape(double_tape_pointer)
          OpenAD_Symbol_243%d = OpenAD_Symbol_243%d+T(INT(OpenAD_Symbol_
     +352))%d*OpenAD_Symbol_353
          T(INT(OpenAD_Symbol_352))%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_354 = integer_tape(integer_tape_pointer)
          T(INT(OpenAD_Symbol_354))%d = T(INT(OpenAD_Symbol_354))%d+Open
     +AD_Symbol_243%d
          OpenAD_Symbol_243%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_355 = integer_tape(integer_tape_pointer)
          XX(INT(OpenAD_Symbol_355))%d = XX(INT(OpenAD_Symbol_355))%d+Op
     +enAD_Symbol_245%d
          OpenAD_Symbol_245%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_356 = integer_tape(integer_tape_pointer)
          S(INT(OpenAD_Symbol_356))%d = S(INT(OpenAD_Symbol_356))%d+Open
     +AD_Symbol_247%d
          OpenAD_Symbol_247%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_357 = integer_tape(integer_tape_pointer)
          XX(INT(OpenAD_Symbol_357))%d = XX(INT(OpenAD_Symbol_357))%d+Op
     +enAD_Symbol_249%d
          OpenAD_Symbol_249%d = 0.0d0
        OpenAD_Symbol_339 = INT(OpenAD_Symbol_339) + 1
      END DO
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_340 = integer_tape(integer_tape_pointer)
      OpenAD_Symbol_341 = 1
      DO WHILE(INT(OpenAD_Symbol_341) .LE. INT(OpenAD_Symbol_340))
        OpenAD_Symbol_341 = INT(OpenAD_Symbol_341) + 1
      END DO
          S(3)%d = 0.0d0
          S(2)%d = 0.0d0
          S(1)%d = 0.0d0
          T(3)%d = 0.0d0
          T(2)%d = 0.0d0
          T(1)%d = 0.0d0
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
          end if 
C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"a:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

         !graph code
         prevint = integer_tape_pointer
         prevdouble = double_tape_pointer
         prevBStack = theArgBStackOffset
         prevIStack = theArgIStackOffset
         prevFStack = theArgFStackOffset
         if (our_rev_mode%tape) then
          if( associated(prev)) then
             cur => prev
           else  
             !if(tree%first%called%value .eq. cur%called%value) then
           Open (Unit=10, File='/tmp/calltree.out', status='replace', 
     + action='write', iostat=ierror)
           write(10, *) 'digraph G {'
           write(10, *) 'nodesep=.05;'
           write(10, *) 'ranksep=.05;'
           graph%value = tree%value
           graph%doubles = tree%doubles
           graph%integers = tree%integers
           write(itoa, '(I)') tree%doubles
           itoa = adjustl(itoa)
           write(itoa2, '(I)') tree%integers
           itoa2 = adjustl(itoa2)
           write(10, '(I, A, A, A, A, A, A, A)'), iaddr(tree),
     + '[shape="box" height=.25 label="', trim(tree%value), ' ', 
     + trim(itoa), ':', trim(itoa2), '"];'
            Call graphprint(tree)
            write(10, *) '1[ height=.25 label="SubroutineName',
     + ' double:integer"];'
            write(10, '(A,A)') '2[height=.25 label="Edge checkpoint',
     + ' double:integer:boolean"];'
            write(10, *) '}'
            close(10)
            Open (Unit=11, File='/tmp/callgraph.out', status='replace',
     + action='write', iostat=ierror)
            write(11, *) 'digraph G {'
            write(11, *) 'nodesep=.05;'
            write(11, *) 'ranksep=.05;'
            call graph2print()
            write(11, '(A,A)') '1[ height=.25 label="SubroutineName',
     + ' tape double:integer checkpoint double:integer:boolean"];'
            write(11, *) '}'
            close(11)
             !read *, five
             !endif
             endif
           endif    
         !end graph code

        end subroutine box_ini_fields
C ========== begin copyright notice ==============
C This file is part of 
C ---------------
C xaifBooster
C ---------------
C Distributed under the BSD license as follows:
C Copyright (c) 2005, The University of Chicago
C All rights reserved.
C
C Redistribution and use in source and binary forms, 
C with or without modification, are permitted provided that the following conditions are met:
C
C    - Redistributions of source code must retain the above copyright notice, 
C      this list of conditions and the following disclaimer.
C    - Redistributions in binary form must reproduce the above copyright notice, 
C      this list of conditions and the following disclaimer in the documentation 
C      and/or other materials provided with the distribution.
C    - Neither the name of The University of Chicago nor the names of its contributors 
C      may be used to endorse or promote products derived from this software without 
C      specific prior written permission.
C
C THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
C EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
C OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
C SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
C INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
C PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
C INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
C LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
C OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
C 
C General Information:
C xaifBooster is intended for the transformation of 
C numerical programs represented as xml files according 
C to the XAIF schema. It is part of the OpenAD framework. 
C The main application is automatic 
C differentiation, i.e. the generation of code for 
C the computation of derivatives. 
C The following people are the principal authors of the 
C current version: 
C 	Uwe Naumann
C	Jean Utke
C Additional contributors are: 
C	Andrew Lyons
C	Peter Fine
C
C For more details about xaifBooster and its use in OpenAD please visit:
C   http://www.mcs.anl.gov/openad
C
C This work is partially supported by:
C 	NSF-ITR grant OCE-0205590
C ========== end copyright notice ==============
       subroutine box_ini_params()
          use OpenAD_dct
          use OpenAD_tape
          use OpenAD_rev
          use OpenAD_checkpoints
          use checkpoint_module
          use graph_module

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

      use w2f__types
      use active_module
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      INTEGER(w2f__i8) OpenAD_Symbol_370
      INTEGER(w2f__i8) OpenAD_Symbol_371
      INTEGER(w2f__i8) OpenAD_Symbol_372
      INTEGER(w2f__i8) OpenAD_Symbol_373
      INTEGER(w2f__i8) OpenAD_Symbol_374
      INTEGER(w2f__i8) OpenAD_Symbol_375
      INTEGER(w2f__i8) OpenAD_Symbol_376
      INTEGER(w2f__i8) OpenAD_Symbol_377
      INTEGER(w2f__i8) OpenAD_Symbol_378
      INTEGER(w2f__i8) OpenAD_Symbol_379
      INTEGER(w2f__i8) OpenAD_Symbol_380
      INTEGER(w2f__i8) OpenAD_Symbol_381
      INTEGER(w2f__i8) OpenAD_Symbol_382
      INTEGER(w2f__i8) OpenAD_Symbol_383
      INTEGER(w2f__i8) OpenAD_Symbol_384
      INTEGER(w2f__i8) OpenAD_Symbol_385
      INTEGER(w2f__i8) OpenAD_Symbol_386
      INTEGER(w2f__i8) OpenAD_Symbol_387
      INTEGER(w2f__i8) OpenAD_Symbol_388
      INTEGER(w2f__i8) OpenAD_Symbol_389
      INTEGER(w2f__i8) OpenAD_Symbol_390
      INTEGER(w2f__i8) OpenAD_Symbol_391
      INTEGER(w2f__i8) OpenAD_Symbol_392
      INTEGER(w2f__i8) OpenAD_Symbol_393
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) J
      INTEGER(w2f__i4) L
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
C
C     **** Statements ****
C


          !counters
          integer, save :: theSwitch = 0

          !Graph variables
          integer, save :: prevint = 1
          integer, save :: prevdouble = 1
          integer, save :: prevBStack = 0
          integer, save :: prevIStack = 0
          integer, save :: prevFStack = 0
          
          ! checkpointing stacks and offsets
          integer :: cp_loop_variable_1,cp_loop_variable_2,
     +cp_loop_variable_3,cp_loop_variable_4,cp_loop_variable_5
          ! floats 'F'
          double precision, dimension(:), allocatable, save :: 
     +theArgFStack
          integer, save :: theArgFStackoffset=0, theArgFStackSize=0
          ! integers 'I'
          integer, dimension(:), allocatable, save :: 
     +theArgIStack
          integer, save :: theArgIStackoffset=0, theArgIStackSize=0
          ! booleans 'B'
          logical, dimension(:), allocatable, save :: 
     +theArgBStack
          integer, save :: theArgBStackoffset=0, theArgBStackSize=0
          ! strings 'S'
          character*(80), dimension(:), allocatable, save :: 
     +theArgSStack
          integer, save :: theArgSStackoffset=0, theArgSStackSize=0

          type(modeType) :: our_orig_mode

          !Variables for making graphs

         type (list), pointer :: prev => NULL()
         integer :: ierror, counter, counter2, counter3
         
         character (len = 20) itoa 
         character (len = 20) itoa2

         !end graph varibables

	  ! call external C function used in inlined code
          !integer iaddr
          !external iaddr

           ! call external Fortran function used in inlined code
          external makelines

C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"b:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

!function to make graphs
          if (our_rev_mode%tape) then
            Call makelinks('box_ini_params', prev)
          endif
!end function to make graphs
       
          if (our_rev_mode%arg_store) then 
C            print*, " arg_store  ", our_rev_mode
C store arguments
          call cp_store_p_real_vector(AREA,size(AREA),theArgFStack,theAr
     +gFStackoffset,theArgFStackSize)
          call cp_store_p_real_vector(BHEIGHT,size(BHEIGHT),theArgFStack
     +,theArgFStackoffset,theArgFStackSize)
          call cp_store_p_real_vector(BLENGTH,size(BLENGTH),theArgFStack
     +,theArgFStackoffset,theArgFStackSize)
          call cp_store_p_real_vector(PROJ_S,size(PROJ_S),theArgFStack,t
     +heArgFStackoffset,theArgFStackSize)
          call cp_store_p_real_vector(PROJ_T,size(PROJ_T),theArgFStack,t
     +heArgFStackoffset,theArgFStackSize)
          call cp_store_p_real_vector(R,size(R),theArgFStack,theArgFStac
     +koffset,theArgFStackSize)
          do cp_loop_variable_2 = lbound(X,2),ubound(X,2)
          call cp_store_p_real_vector(X(:,cp_loop_variable_2),size(X(:,c
     +p_loop_variable_2)),theArgFStack,theArgFStackoffset,theArgFStackSi
     +ze)
          end do
          end if 
          if (our_rev_mode%arg_restore) then
C            print*, " arg_restore", our_rev_mode
C restore arguments
          do cp_loop_variable_2 = ubound(X,2),lbound(X,2),-1
             do cp_loop_variable_1 = ubound(X,1),lbound(X,1),-1
                X(cp_loop_variable_1,cp_loop_variable_2) = theArgFStack(
     +theArgFStackoffset)
                theArgFStackoffset = theArgFStackoffset-1
             end do
          end do
          do cp_loop_variable_1 = ubound(R,1),lbound(R,1),-1
             R(cp_loop_variable_1) = theArgFStack(theArgFStackoffset)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+R(cp_loop_variable_1)
          end do
          do cp_loop_variable_1 = ubound(PROJ_T,1),lbound(PROJ_T,1),-1
             PROJ_T(cp_loop_variable_1) = theArgFStack(theArgFStackoffse
     +t)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+PROJ_T(cp_loop_variable_1)
          end do
          do cp_loop_variable_1 = ubound(PROJ_S,1),lbound(PROJ_S,1),-1
             PROJ_S(cp_loop_variable_1) = theArgFStack(theArgFStackoffse
     +t)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+PROJ_S(cp_loop_variable_1)
          end do
          do cp_loop_variable_1 = ubound(BLENGTH,1),lbound(BLENGTH,1),-1
             BLENGTH(cp_loop_variable_1) = theArgFStack(theArgFStackoffs
     +et)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+BLENGTH(cp_loop_variable_1)
          end do
          do cp_loop_variable_1 = ubound(BHEIGHT,1),lbound(BHEIGHT,1),-1
             BHEIGHT(cp_loop_variable_1) = theArgFStack(theArgFStackoffs
     +et)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+BHEIGHT(cp_loop_variable_1)
          end do
          do cp_loop_variable_1 = ubound(AREA,1),lbound(AREA,1),-1
             AREA(cp_loop_variable_1) = theArgFStack(theArgFStackoffset)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+AREA(cp_loop_variable_1)
          end do
          end if
          if (our_rev_mode%plain) then
C            print*, " plain      ", our_rev_mode
            our_orig_mode=our_rev_mode
            our_rev_mode%arg_store=.FALSE.
C original function
C$OPENAD XXX Template ad_template.f
      VERBMODE = .FALSE.
      BLENGTH(1) = 5.0D+08
      BLENGTH(2) = 1.0D+08
      BLENGTH(3) = BLENGTH(1)
      BHEIGHT(1) = 1.0D+05
      BHEIGHT(3) = 4.0D+05
      BHEIGHT(2) = (BHEIGHT(1) + BHEIGHT(3))
      DELTA = (BHEIGHT(1) /(BHEIGHT(1) + BHEIGHT(3)))
      BWIDTH = 4.0D+08
      AREA(1) = (BLENGTH(1) * BWIDTH)
      AREA(2) = (BLENGTH(2) * BWIDTH)
      AREA(3) = (BLENGTH(3) * BWIDTH)
      VOL(1) = (AREA(1) * BHEIGHT(1))
      VOL(2) = (AREA(2) *(BHEIGHT(1) + BHEIGHT(3)))
      VOL(3) = (AREA(3) * BHEIGHT(3))
      ROBERT_FILTER_COEFF = 2.5D-01
      HUNDRED = 1.0D+02
      THOUSAND = 1.0D+03
      DAY = 8.64D+04
      YEAR = (DAY * 3.65D+02)
      SV = 1.0D+12
      U0 = ((SV * 1.6D+01) / 4.00000000000000019169D-04)
      ALPHA = 1.6679999999999998864D-04
      BETA = 7.81000000000000010186D-04
      DAYS_PER_50M_MIXED_LAYER = 5.0D+01
      GAMMA_T = (1.0D00 /(DAY * 3.0D+02))
      GAMMA_S = (0.0D00 /((BHEIGHT(1) / 5.0D+03) * DAY *  DAYS_PER_50M_M
     +IXED_LAYER))
      EPSILON_IC = (-1.00000000000000004792D-04)
      NOISE_CORRELATION_TIME = (DAY * 1.5D+01)
      DELTA_T = (DAY * 5.0D00)
      INTEGRATION_TIME = (YEAR * 5.0D+01)
      N_MAX = INT((INTEGRATION_TIME / DELTA_T))
      FDEPS = 9.99999999999999954748D-07
      Y(1) = (THOUSAND / 3.2680000000000000715D-02)
      Y(2) = (THOUSAND / 7.9399999999999991418D-03)
      Y(3) = (THOUSAND / 1.39999999999999998578D-03)
      Y(4) = (THOUSAND / 1.41699999999999992628D-01)
      Y(5) = (THOUSAND / 1.28599999999999992095D-01)
      Y(6) = (THOUSAND / 8.7800000000000003042D-02)
      R(1) = (ALPHA * DELTA)
      R(2) = (- ALPHA)
      R(3) = (ALPHA *(1.0D00 - DELTA))
      R(4) = (-(BETA * DELTA))
      R(5) = BETA
      R(6) = (-(BETA *(1.0D00 - DELTA)))
      DO L = 1, 6, 1
        R(INT(L)) = ((R(L) * U0) / SV)
      END DO
      DO L = 1, 6, 1
        IF(L .LE. INT(3_w2f__i8)) THEN
          PROJ_T(INT(L)) = 1.0D00
          PROJ_S(INT(L)) = 0.0D00
        ELSE
          PROJ_T(INT(L)) = 0.0D00
          PROJ_S(INT(L)) = 1.0D00
        ENDIF
      END DO
      DO L = 1, 6, 1
        R_T(INT(L)) = (PROJ_T(L) * R(L))
        R_S(INT(L)) = (PROJ_S(L) * R(L))
      END DO
      R1(1) = 1.0D00
      R1(2) = (-1.0D00)
      R1(3) = 0.0D00
      R1(4) = 0.0D00
      R1(5) = 0.0D00
      R1(6) = 0.0D00
      DO J = 1, 6, 1
        DO I = 1, 6, 1
          X(INT(I), INT(J)) = (R(I) * R(J))
        END DO
      END DO
      EPSILON_REGULARIZE = 1.00000000000000002092D-08
      DO J = 1, 6, 1
        DO I = 1, 6, 1
          X(INT(I), INT(J)) = (X(I, J) + EPSILON_REGULARIZE)
        END DO
      END DO
      RETURN
            our_rev_mode=our_orig_mode
          end if 
          if (our_rev_mode%tape) then
C            print*, " tape       ", our_rev_mode
            our_rev_mode%arg_store=.TRUE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.TRUE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.FALSE.
C taping
C$OPENAD XXX Template ad_template.f
      VERBMODE = .FALSE.
      BLENGTH(1) = 5.0D+08
      BLENGTH(2) = 1.0D+08
      BLENGTH(3) = BLENGTH(1)
      BHEIGHT(1) = 1.0D+05
      BHEIGHT(3) = 4.0D+05
      BHEIGHT(2) = (BHEIGHT(1) + BHEIGHT(3))
      DELTA = (BHEIGHT(1) /(BHEIGHT(1) + BHEIGHT(3)))
      BWIDTH = 4.0D+08
      AREA(1) = (BLENGTH(1) * BWIDTH)
      AREA(2) = (BLENGTH(2) * BWIDTH)
      AREA(3) = (BLENGTH(3) * BWIDTH)
      VOL(1) = (AREA(1) * BHEIGHT(1))
      VOL(2) = (AREA(2) *(BHEIGHT(1) + BHEIGHT(3)))
      VOL(3) = (AREA(3) * BHEIGHT(3))
      ROBERT_FILTER_COEFF = 2.5D-01
      HUNDRED = 1.0D+02
      THOUSAND = 1.0D+03
      DAY = 8.64D+04
      YEAR = (DAY * 3.65D+02)
      SV = 1.0D+12
      U0 = ((SV * 1.6D+01) / 4.00000000000000019169D-04)
      ALPHA = 1.6679999999999998864D-04
      BETA = 7.81000000000000010186D-04
      DAYS_PER_50M_MIXED_LAYER = 5.0D+01
      GAMMA_T = (1.0D00 /(DAY * 3.0D+02))
      GAMMA_S = (0.0D00 /((BHEIGHT(1) / 5.0D+03) * DAY *  DAYS_PER_50M_M
     +IXED_LAYER))
      EPSILON_IC = (-1.00000000000000004792D-04)
      NOISE_CORRELATION_TIME = (DAY * 1.5D+01)
      DELTA_T = (DAY * 5.0D00)
      INTEGRATION_TIME = (YEAR * 5.0D+01)
      N_MAX = INT((INTEGRATION_TIME / DELTA_T))
      FDEPS = 9.99999999999999954748D-07
      Y(1) = (THOUSAND / 3.2680000000000000715D-02)
      Y(2) = (THOUSAND / 7.9399999999999991418D-03)
      Y(3) = (THOUSAND / 1.39999999999999998578D-03)
      Y(4) = (THOUSAND / 1.41699999999999992628D-01)
      Y(5) = (THOUSAND / 1.28599999999999992095D-01)
      Y(6) = (THOUSAND / 8.7800000000000003042D-02)
      R(1) = (ALPHA * DELTA)
      R(2) = (- ALPHA)
      R(3) = (ALPHA *(1.0D00 - DELTA))
      R(4) = (-(BETA * DELTA))
      R(5) = BETA
      R(6) = (-(BETA *(1.0D00 - DELTA)))
      OpenAD_Symbol_385 = 0_w2f__i8
      DO L = 1, 6, 1
        R(INT(L)) = ((R(L) * U0) / SV)
        OpenAD_Symbol_385 = (INT(OpenAD_Symbol_385) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_385
          integer_tape_pointer = integer_tape_pointer+1
      OpenAD_Symbol_386 = 0_w2f__i8
      DO L = 1, 6, 1
        IF(L .LE. INT(3_w2f__i8)) THEN
          PROJ_T(INT(L)) = 1.0D00
          PROJ_S(INT(L)) = 0.0D00
          OpenAD_Symbol_387 = 1_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_387
          integer_tape_pointer = integer_tape_pointer+1
        ELSE
          PROJ_T(INT(L)) = 0.0D00
          PROJ_S(INT(L)) = 1.0D00
          OpenAD_Symbol_388 = 0_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_388
          integer_tape_pointer = integer_tape_pointer+1
        ENDIF
        OpenAD_Symbol_386 = (INT(OpenAD_Symbol_386) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_386
          integer_tape_pointer = integer_tape_pointer+1
      OpenAD_Symbol_389 = 0_w2f__i8
      DO L = 1, 6, 1
        R_T(INT(L)) = (PROJ_T(L) * R(L))
        R_S(INT(L)) = (PROJ_S(L) * R(L))
        OpenAD_Symbol_389 = (INT(OpenAD_Symbol_389) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_389
          integer_tape_pointer = integer_tape_pointer+1
      R1(1) = 1.0D00
      R1(2) = (-1.0D00)
      R1(3) = 0.0D00
      R1(4) = 0.0D00
      R1(5) = 0.0D00
      R1(6) = 0.0D00
      OpenAD_Symbol_390 = 0_w2f__i8
      DO J = 1, 6, 1
        OpenAD_Symbol_391 = 0_w2f__i8
        DO I = 1, 6, 1
          X(INT(I), INT(J)) = (R(I) * R(J))
          OpenAD_Symbol_391 = (INT(OpenAD_Symbol_391) + INT(1_w2f__i8))
        END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_391
          integer_tape_pointer = integer_tape_pointer+1
        OpenAD_Symbol_390 = (INT(OpenAD_Symbol_390) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_390
          integer_tape_pointer = integer_tape_pointer+1
      EPSILON_REGULARIZE = 1.00000000000000002092D-08
      OpenAD_Symbol_392 = 0_w2f__i8
      DO J = 1, 6, 1
        OpenAD_Symbol_393 = 0_w2f__i8
        DO I = 1, 6, 1
          X(INT(I), INT(J)) = (X(I, J) + EPSILON_REGULARIZE)
          OpenAD_Symbol_393 = (INT(OpenAD_Symbol_393) + INT(1_w2f__i8))
        END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_393
          integer_tape_pointer = integer_tape_pointer+1
        OpenAD_Symbol_392 = (INT(OpenAD_Symbol_392) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_392
          integer_tape_pointer = integer_tape_pointer+1
      RETURN
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.TRUE.

            !Part of making graphs
              if (.not. associated(prev)) then
                tree%doubles = double_tape_pointer - prevdouble-1
                tree%integers = integer_tape_pointer - prevint-1
                tree%argInts = -1*(theArgIStackOffset - prevIStack)
                tree%argFloats = -1*(theArgFStackOffset - prevFStack)
                tree%argBools =  -1*(theArgBStackOffset - prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset                
              else
                prev%called%doubles = double_tape_pointer - prevdouble
                prev%called%integers = integer_tape_pointer- prevint
                prev%called%argInts =-1*(theArgIStackOffset-prevIStack)
                prev%called%argFloats=-1*(theArgFStackOffset-prevFStack)
                prev%called%argBools= -1*(theArgBStackOffset-prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset
              endif
             !end Graph code
C                call diff tape storage only once flag
          end if 
          if (our_rev_mode%adjoint) then
C            print*, " adjoint    ", our_rev_mode
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
C adjoint
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_370 = integer_tape(integer_tape_pointer)
      OpenAD_Symbol_371 = 1
      DO WHILE(INT(OpenAD_Symbol_371) .LE. INT(OpenAD_Symbol_370))
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_372 = integer_tape(integer_tape_pointer)
        OpenAD_Symbol_373 = 1
        DO WHILE(INT(OpenAD_Symbol_373) .LE. INT(OpenAD_Symbol_372))
          OpenAD_Symbol_373 = INT(OpenAD_Symbol_373) + 1
        END DO
        OpenAD_Symbol_371 = INT(OpenAD_Symbol_371) + 1
      END DO
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_374 = integer_tape(integer_tape_pointer)
      OpenAD_Symbol_375 = 1
      DO WHILE(INT(OpenAD_Symbol_375) .LE. INT(OpenAD_Symbol_374))
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_376 = integer_tape(integer_tape_pointer)
        OpenAD_Symbol_377 = 1
        DO WHILE(INT(OpenAD_Symbol_377) .LE. INT(OpenAD_Symbol_376))
          OpenAD_Symbol_377 = INT(OpenAD_Symbol_377) + 1
        END DO
        OpenAD_Symbol_375 = INT(OpenAD_Symbol_375) + 1
      END DO
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_378 = integer_tape(integer_tape_pointer)
      OpenAD_Symbol_379 = 1
      DO WHILE(INT(OpenAD_Symbol_379) .LE. INT(OpenAD_Symbol_378))
        OpenAD_Symbol_379 = INT(OpenAD_Symbol_379) + 1
      END DO
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_380 = integer_tape(integer_tape_pointer)
      OpenAD_Symbol_381 = 1
      DO WHILE(INT(OpenAD_Symbol_381) .LE. INT(OpenAD_Symbol_380))
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_382 = integer_tape(integer_tape_pointer)
        IF(OpenAD_Symbol_382 .ne. 0) THEN
        ENDIF
        OpenAD_Symbol_381 = INT(OpenAD_Symbol_381) + 1
      END DO
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_383 = integer_tape(integer_tape_pointer)
      OpenAD_Symbol_384 = 1
      DO WHILE(INT(OpenAD_Symbol_384) .LE. INT(OpenAD_Symbol_383))
        OpenAD_Symbol_384 = INT(OpenAD_Symbol_384) + 1
      END DO
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
          end if 
C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"a:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

         !graph code
         prevint = integer_tape_pointer
         prevdouble = double_tape_pointer
         prevBStack = theArgBStackOffset
         prevIStack = theArgIStackOffset
         prevFStack = theArgFStackOffset
         if (our_rev_mode%tape) then
          if( associated(prev)) then
             cur => prev
           else  
             !if(tree%first%called%value .eq. cur%called%value) then
           Open (Unit=10, File='/tmp/calltree.out', status='replace', 
     + action='write', iostat=ierror)
           write(10, *) 'digraph G {'
           write(10, *) 'nodesep=.05;'
           write(10, *) 'ranksep=.05;'
           graph%value = tree%value
           graph%doubles = tree%doubles
           graph%integers = tree%integers
           write(itoa, '(I)') tree%doubles
           itoa = adjustl(itoa)
           write(itoa2, '(I)') tree%integers
           itoa2 = adjustl(itoa2)
           write(10, '(I, A, A, A, A, A, A, A)'), iaddr(tree),
     + '[shape="box" height=.25 label="', trim(tree%value), ' ', 
     + trim(itoa), ':', trim(itoa2), '"];'
            Call graphprint(tree)
            write(10, *) '1[ height=.25 label="SubroutineName',
     + ' double:integer"];'
            write(10, '(A,A)') '2[height=.25 label="Edge checkpoint',
     + ' double:integer:boolean"];'
            write(10, *) '}'
            close(10)
            Open (Unit=11, File='/tmp/callgraph.out', status='replace',
     + action='write', iostat=ierror)
            write(11, *) 'digraph G {'
            write(11, *) 'nodesep=.05;'
            write(11, *) 'ranksep=.05;'
            call graph2print()
            write(11, '(A,A)') '1[ height=.25 label="SubroutineName',
     + ' tape double:integer checkpoint double:integer:boolean"];'
            write(11, *) '}'
            close(11)
             !read *, five
             !endif
             endif
           endif    
         !end graph code

        end subroutine box_ini_params
C ========== begin copyright notice ==============
C This file is part of 
C ---------------
C xaifBooster
C ---------------
C Distributed under the BSD license as follows:
C Copyright (c) 2005, The University of Chicago
C All rights reserved.
C
C Redistribution and use in source and binary forms, 
C with or without modification, are permitted provided that the following conditions are met:
C
C    - Redistributions of source code must retain the above copyright notice, 
C      this list of conditions and the following disclaimer.
C    - Redistributions in binary form must reproduce the above copyright notice, 
C      this list of conditions and the following disclaimer in the documentation 
C      and/or other materials provided with the distribution.
C    - Neither the name of The University of Chicago nor the names of its contributors 
C      may be used to endorse or promote products derived from this software without 
C      specific prior written permission.
C
C THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
C EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
C OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
C SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
C INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
C PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
C INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
C LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
C OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
C 
C General Information:
C xaifBooster is intended for the transformation of 
C numerical programs represented as xml files according 
C to the XAIF schema. It is part of the OpenAD framework. 
C The main application is automatic 
C differentiation, i.e. the generation of code for 
C the computation of derivatives. 
C The following people are the principal authors of the 
C current version: 
C 	Uwe Naumann
C	Jean Utke
C Additional contributors are: 
C	Andrew Lyons
C	Peter Fine
C
C For more details about xaifBooster and its use in OpenAD please visit:
C   http://www.mcs.anl.gov/openad
C
C This work is partially supported by:
C 	NSF-ITR grant OCE-0205590
C ========== end copyright notice ==============
       subroutine box_model_body()
          use OpenAD_dct
          use OpenAD_tape
          use OpenAD_rev
          use OpenAD_checkpoints
          use checkpoint_module
          use graph_module

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

      use w2f__types
      use active_module
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      INTEGER(w2f__i8) OpenAD_Symbol_394
      INTEGER(w2f__i8) OpenAD_Symbol_395
      INTEGER(w2f__i8) OpenAD_Symbol_396
      INTEGER(w2f__i8) OpenAD_Symbol_397
      INTEGER(w2f__i8) OpenAD_Symbol_398
      INTEGER(w2f__i8) OpenAD_Symbol_399
      INTEGER(w2f__i8) OpenAD_Symbol_400
      INTEGER(w2f__i8) OpenAD_Symbol_401
      INTEGER(w2f__i8) OpenAD_Symbol_402
      INTEGER(w2f__i8) OpenAD_Symbol_403
      INTEGER(w2f__i8) OpenAD_Symbol_404
      INTEGER(w2f__i8) OpenAD_Symbol_405
      INTEGER(w2f__i8) OpenAD_Symbol_406
      INTEGER(w2f__i8) OpenAD_Symbol_407
      INTEGER(w2f__i8) OpenAD_Symbol_408
C
C     **** Local Variables and Functions ****
C
      EXTERNAL box_final_state
      EXTERNAL box_forward
      EXTERNAL box_ini_fields
      INTEGER(w2f__i4) ILEV1
      INTEGER(w2f__i4) ILEV2
      INTEGER(w2f__i4) ILOOP
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) MAXLEV2
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(XX)
C$OPENAD DEPENDENT(TNEW)
C$OPENAD DEPENDENT(SNEW)
C
C     **** Statements ****
C


          !counters
          integer, save :: theSwitch = 0

          !Graph variables
          integer, save :: prevint = 1
          integer, save :: prevdouble = 1
          integer, save :: prevBStack = 0
          integer, save :: prevIStack = 0
          integer, save :: prevFStack = 0
          
          ! checkpointing stacks and offsets
          integer :: cp_loop_variable_1,cp_loop_variable_2,
     +cp_loop_variable_3,cp_loop_variable_4,cp_loop_variable_5
          ! floats 'F'
          double precision, dimension(:), allocatable, save :: 
     +theArgFStack
          integer, save :: theArgFStackoffset=0, theArgFStackSize=0
          ! integers 'I'
          integer, dimension(:), allocatable, save :: 
     +theArgIStack
          integer, save :: theArgIStackoffset=0, theArgIStackSize=0
          ! booleans 'B'
          logical, dimension(:), allocatable, save :: 
     +theArgBStack
          integer, save :: theArgBStackoffset=0, theArgBStackSize=0
          ! strings 'S'
          character*(80), dimension(:), allocatable, save :: 
     +theArgSStack
          integer, save :: theArgSStackoffset=0, theArgSStackSize=0

          type(modeType) :: our_orig_mode

          !Variables for making graphs

         type (list), pointer :: prev => NULL()
         integer :: ierror, counter, counter2, counter3
         
         character (len = 20) itoa 
         character (len = 20) itoa2

         !end graph varibables

	  ! call external C function used in inlined code
          !integer iaddr
          !external iaddr

           ! call external Fortran function used in inlined code
          external makelines

C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"b:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

!function to make graphs
          if (our_rev_mode%tape) then
            Call makelinks('box_model_body', prev)
          endif
!end function to make graphs
       
          if (our_rev_mode%arg_store) then 
C            print*, " arg_store  ", our_rev_mode
C store arguments
          call cp_store_real_scalar(ALPHA,theArgFStack,theArgFStackoffse
     +t,theArgFStackSize)
          call cp_store_real_scalar(BETA,theArgFStack,theArgFStackoffset
     +,theArgFStackSize)
          call cp_store_real_scalar(DELTA,theArgFStack,theArgFStackoffse
     +t,theArgFStackSize)
          call cp_store_real_scalar(DELTA_T,theArgFStack,theArgFStackoff
     +set,theArgFStackSize)
          call cp_store_real_scalar(GAMMA_S,theArgFStack,theArgFStackoff
     +set,theArgFStackSize)
          call cp_store_real_scalar(GAMMA_T,theArgFStack,theArgFStackoff
     +set,theArgFStackSize)
          call cp_store_real_scalar(HUNDRED,theArgFStack,theArgFStackoff
     +set,theArgFStackSize)
          call cp_store_int_scalar(N_MAX,theArgIStack,theArgIStackoffset
     +,theArgIStackSize)
          call cp_store_real_scalar(ROBERT_FILTER_COEFF,theArgFStack,the
     +ArgFStackoffset,theArgFStackSize)
          call cp_store_real_scalar(SV,theArgFStack,theArgFStackoffset,t
     +heArgFStackSize)
          call cp_store_real_scalar(U0,theArgFStack,theArgFStackoffset,t
     +heArgFStackSize)
          call cp_store_real_scalar(UVEL%v,theArgFStack,theArgFStackoffs
     +et,theArgFStackSize)
          call cp_store_real_scalar(YEAR,theArgFStack,theArgFStackoffset
     +,theArgFStackSize)
          call cp_store_p_real_vector(AREA,size(AREA),theArgFStack,theAr
     +gFStackoffset,theArgFStackSize)
          call cp_store_p_real_vector(FW,size(FW),theArgFStack,theArgFSt
     +ackoffset,theArgFStackSize)
          call cp_store_p_real_vector(NULLFORCE,size(NULLFORCE),theArgFS
     +tack,theArgFStackoffset,theArgFStackSize)
          call cp_store_real_vector(RHO,size(RHO),theArgFStack,theArgFSt
     +ackoffset,theArgFStackSize)
          call cp_store_real_vector(S,size(S),theArgFStack,theArgFStacko
     +ffset,theArgFStackSize)
          call cp_store_real_vector(SNEW,size(SNEW),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          call cp_store_real_vector(SNOW,size(SNOW),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          call cp_store_real_vector(SOLD,size(SOLD),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          call cp_store_p_real_vector(SSTAR,size(SSTAR),theArgFStack,the
     +ArgFStackoffset,theArgFStackSize)
          call cp_store_real_vector(T,size(T),theArgFStack,theArgFStacko
     +ffset,theArgFStackSize)
          call cp_store_real_vector(TNEW,size(TNEW),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          call cp_store_real_vector(TNOW,size(TNOW),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          call cp_store_real_vector(TOLD,size(TOLD),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          call cp_store_p_real_vector(TSTAR,size(TSTAR),theArgFStack,the
     +ArgFStackoffset,theArgFStackSize)
          call cp_store_p_real_vector(VOL,size(VOL),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          call cp_store_real_vector(XX,size(XX),theArgFStack,theArgFStac
     +koffset,theArgFStackSize)
          end if 
          if (our_rev_mode%arg_restore) then
C            print*, " arg_restore", our_rev_mode
C restore arguments
          do cp_loop_variable_1 = ubound(XX,1),lbound(XX,1),-1
             XX(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffset)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+XX(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(VOL,1),lbound(VOL,1),-1
             VOL(cp_loop_variable_1) = theArgFStack(theArgFStackoffset)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+VOL(cp_loop_variable_1)
          end do
          do cp_loop_variable_1 = ubound(TSTAR,1),lbound(TSTAR,1),-1
             TSTAR(cp_loop_variable_1) = theArgFStack(theArgFStackoffset
     +)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+TSTAR(cp_loop_variable_1)
          end do
          do cp_loop_variable_1 = ubound(TOLD,1),lbound(TOLD,1),-1
             TOLD(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffse
     +t)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+TOLD(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(TNOW,1),lbound(TNOW,1),-1
             TNOW(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffse
     +t)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+TNOW(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(TNEW,1),lbound(TNEW,1),-1
             TNEW(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffse
     +t)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+TNEW(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(T,1),lbound(T,1),-1
             T(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffset)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+T(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(SSTAR,1),lbound(SSTAR,1),-1
             SSTAR(cp_loop_variable_1) = theArgFStack(theArgFStackoffset
     +)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+SSTAR(cp_loop_variable_1)
          end do
          do cp_loop_variable_1 = ubound(SOLD,1),lbound(SOLD,1),-1
             SOLD(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffse
     +t)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+SOLD(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(SNOW,1),lbound(SNOW,1),-1
             SNOW(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffse
     +t)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+SNOW(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(SNEW,1),lbound(SNEW,1),-1
             SNEW(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffse
     +t)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+SNEW(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(S,1),lbound(S,1),-1
             S(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffset)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+S(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(RHO,1),lbound(RHO,1),-1
             RHO(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffset
     +)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+RHO(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(NULLFORCE,1),lbound(NULLFORCE,1
     +),-1
             NULLFORCE(cp_loop_variable_1) = theArgFStack(theArgFStackof
     +fset)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+NULLFORCE(cp_loop_variable_1)
          end do
          do cp_loop_variable_1 = ubound(FW,1),lbound(FW,1),-1
             FW(cp_loop_variable_1) = theArgFStack(theArgFStackoffset)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+FW(cp_loop_variable_1)
          end do
          do cp_loop_variable_1 = ubound(AREA,1),lbound(AREA,1),-1
             AREA(cp_loop_variable_1) = theArgFStack(theArgFStackoffset)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+AREA(cp_loop_variable_1)
          end do
          YEAR = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",YEAR
          theArgFStackoffset = theArgFStackoffset-1
          UVEL%v = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",UVEL%v
          theArgFStackoffset = theArgFStackoffset-1
          U0 = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",U0
          theArgFStackoffset = theArgFStackoffset-1
          SV = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",SV
          theArgFStackoffset = theArgFStackoffset-1
          ROBERT_FILTER_COEFF = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",ROBERT_FILTER_COEFF
          theArgFStackoffset = theArgFStackoffset-1
          N_MAX = theArgIStack(theArgIStackoffset)
          theArgIStackoffset = theArgIStackoffset-1
C write(*,'(A,I5)')"restore(s)  ",N_MAX
          HUNDRED = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",HUNDRED
          theArgFStackoffset = theArgFStackoffset-1
          GAMMA_T = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",GAMMA_T
          theArgFStackoffset = theArgFStackoffset-1
          GAMMA_S = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",GAMMA_S
          theArgFStackoffset = theArgFStackoffset-1
          DELTA_T = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",DELTA_T
          theArgFStackoffset = theArgFStackoffset-1
          DELTA = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",DELTA
          theArgFStackoffset = theArgFStackoffset-1
          BETA = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",BETA
          theArgFStackoffset = theArgFStackoffset-1
          ALPHA = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",ALPHA
          theArgFStackoffset = theArgFStackoffset-1
          end if
          if (our_rev_mode%plain) then
C            print*, " plain      ", our_rev_mode
            our_orig_mode=our_rev_mode
            our_rev_mode%arg_store=.FALSE.
C original function
C$OPENAD XXX Template ad_template.f
      CALL box_ini_fields()
      MAXLEV2 = (N_MAX / 73) + 1
      IF(N_MAX .GT. INT(3650_w2f__i8)) THEN
        WRITE(*, *) 'NEED TO SET nlev1*nlev2 >= n_max '
      ELSE
        DO ILEV2 = 1, 50, 1
          IF(ILEV2 .LE. MAXLEV2) THEN
            DO ILEV1 = 1, 73, 1
              ILOOP = ILEV1 + ILEV2 * 73 +(-73)
              IF(ILOOP .LE. N_MAX) THEN
                CALL box_forward(ILEV1)
              ENDIF
            END DO
          ENDIF
        END DO
        CALL box_final_state()
      ENDIF
      RETURN
            our_rev_mode=our_orig_mode
          end if 
          if (our_rev_mode%tape) then
C            print*, " tape       ", our_rev_mode
            our_rev_mode%arg_store=.TRUE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.TRUE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.FALSE.
C taping
C$OPENAD XXX Template ad_template.f
      CALL box_ini_fields()
      MAXLEV2 = (N_MAX / 73) + 1
      IF(N_MAX .GT. INT(3650_w2f__i8)) THEN
        WRITE(*, *) 'NEED TO SET nlev1*nlev2 >= n_max '
        OpenAD_Symbol_407 = 1_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_407
          integer_tape_pointer = integer_tape_pointer+1
      ELSE
        OpenAD_Symbol_401 = 0_w2f__i8
        DO ILEV2 = 1, 50, 1
          IF(ILEV2 .LE. MAXLEV2) THEN
            OpenAD_Symbol_402 = 0_w2f__i8
            DO ILEV1 = 1, 73, 1
              ILOOP = ILEV1 + ILEV2 * 73 +(-73)
              IF(ILOOP .LE. N_MAX) THEN
                CALL box_forward(ILEV1)
                OpenAD_Symbol_403 = 1_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_403
          integer_tape_pointer = integer_tape_pointer+1
              ELSE
                OpenAD_Symbol_404 = 0_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_404
          integer_tape_pointer = integer_tape_pointer+1
              ENDIF
              OpenAD_Symbol_402 = (INT(OpenAD_Symbol_402) + INT( 1_w2f__
     +i8))
            END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_402
          integer_tape_pointer = integer_tape_pointer+1
            OpenAD_Symbol_406 = 1_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_406
          integer_tape_pointer = integer_tape_pointer+1
          ELSE
            OpenAD_Symbol_405 = 0_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_405
          integer_tape_pointer = integer_tape_pointer+1
          ENDIF
          OpenAD_Symbol_401 = (INT(OpenAD_Symbol_401) + INT(1_w2f__i8))
        END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_401
          integer_tape_pointer = integer_tape_pointer+1
        CALL box_final_state()
        OpenAD_Symbol_408 = 0_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_408
          integer_tape_pointer = integer_tape_pointer+1
      ENDIF
      RETURN
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.TRUE.

            !Part of making graphs
              if (.not. associated(prev)) then
                tree%doubles = double_tape_pointer - prevdouble-1
                tree%integers = integer_tape_pointer - prevint-1
                tree%argInts = -1*(theArgIStackOffset - prevIStack)
                tree%argFloats = -1*(theArgFStackOffset - prevFStack)
                tree%argBools =  -1*(theArgBStackOffset - prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset                
              else
                prev%called%doubles = double_tape_pointer - prevdouble
                prev%called%integers = integer_tape_pointer- prevint
                prev%called%argInts =-1*(theArgIStackOffset-prevIStack)
                prev%called%argFloats=-1*(theArgFStackOffset-prevFStack)
                prev%called%argBools= -1*(theArgBStackOffset-prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset
              endif
             !end Graph code
C                call diff tape storage only once flag
          end if 
          if (our_rev_mode%adjoint) then
C            print*, " adjoint    ", our_rev_mode
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
C adjoint
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_394 = integer_tape(integer_tape_pointer)
      IF(OpenAD_Symbol_394 .ne. 0) THEN
      ELSE
        CALL box_final_state()
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_395 = integer_tape(integer_tape_pointer)
        OpenAD_Symbol_396 = 1
        DO WHILE(INT(OpenAD_Symbol_396) .LE. INT(OpenAD_Symbol_395))
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_397 = integer_tape(integer_tape_pointer)
          IF(OpenAD_Symbol_397 .ne. 0) THEN
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_398 = integer_tape(integer_tape_pointer)
            OpenAD_Symbol_399 = 1
            DO WHILE(INT(OpenAD_Symbol_399) .LE. INT(OpenAD_Symbol_398) 
     +)
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_400 = integer_tape(integer_tape_pointer)
              IF(OpenAD_Symbol_400 .ne. 0) THEN
                CALL box_forward(ILEV1)
              ENDIF
              OpenAD_Symbol_399 = INT(OpenAD_Symbol_399) + 1
            END DO
          ENDIF
          OpenAD_Symbol_396 = INT(OpenAD_Symbol_396) + 1
        END DO
      ENDIF
      CALL box_ini_fields()
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
          end if 
C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"a:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

         !graph code
         prevint = integer_tape_pointer
         prevdouble = double_tape_pointer
         prevBStack = theArgBStackOffset
         prevIStack = theArgIStackOffset
         prevFStack = theArgFStackOffset
         if (our_rev_mode%tape) then
          if( associated(prev)) then
             cur => prev
           else  
             !if(tree%first%called%value .eq. cur%called%value) then
           Open (Unit=10, File='/tmp/calltree.out', status='replace', 
     + action='write', iostat=ierror)
           write(10, *) 'digraph G {'
           write(10, *) 'nodesep=.05;'
           write(10, *) 'ranksep=.05;'
           graph%value = tree%value
           graph%doubles = tree%doubles
           graph%integers = tree%integers
           write(itoa, '(I)') tree%doubles
           itoa = adjustl(itoa)
           write(itoa2, '(I)') tree%integers
           itoa2 = adjustl(itoa2)
           write(10, '(I, A, A, A, A, A, A, A)'), iaddr(tree),
     + '[shape="box" height=.25 label="', trim(tree%value), ' ', 
     + trim(itoa), ':', trim(itoa2), '"];'
            Call graphprint(tree)
            write(10, *) '1[ height=.25 label="SubroutineName',
     + ' double:integer"];'
            write(10, '(A,A)') '2[height=.25 label="Edge checkpoint',
     + ' double:integer:boolean"];'
            write(10, *) '}'
            close(10)
            Open (Unit=11, File='/tmp/callgraph.out', status='replace',
     + action='write', iostat=ierror)
            write(11, *) 'digraph G {'
            write(11, *) 'nodesep=.05;'
            write(11, *) 'ranksep=.05;'
            call graph2print()
            write(11, '(A,A)') '1[ height=.25 label="SubroutineName',
     + ' tape double:integer checkpoint double:integer:boolean"];'
            write(11, *) '}'
            close(11)
             !read *, five
             !endif
             endif
           endif    
         !end graph code

        end subroutine box_model_body
C ========== begin copyright notice ==============
C This file is part of 
C ---------------
C xaifBooster
C ---------------
C Distributed under the BSD license as follows:
C Copyright (c) 2005, The University of Chicago
C All rights reserved.
C
C Redistribution and use in source and binary forms, 
C with or without modification, are permitted provided that the following conditions are met:
C
C    - Redistributions of source code must retain the above copyright notice, 
C      this list of conditions and the following disclaimer.
C    - Redistributions in binary form must reproduce the above copyright notice, 
C      this list of conditions and the following disclaimer in the documentation 
C      and/or other materials provided with the distribution.
C    - Neither the name of The University of Chicago nor the names of its contributors 
C      may be used to endorse or promote products derived from this software without 
C      specific prior written permission.
C
C THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
C EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
C OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
C SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
C INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
C PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
C INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
C LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
C OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
C 
C General Information:
C xaifBooster is intended for the transformation of 
C numerical programs represented as xml files according 
C to the XAIF schema. It is part of the OpenAD framework. 
C The main application is automatic 
C differentiation, i.e. the generation of code for 
C the computation of derivatives. 
C The following people are the principal authors of the 
C current version: 
C 	Uwe Naumann
C	Jean Utke
C Additional contributors are: 
C	Andrew Lyons
C	Peter Fine
C
C For more details about xaifBooster and its use in OpenAD please visit:
C   http://www.mcs.anl.gov/openad
C
C This work is partially supported by:
C 	NSF-ITR grant OCE-0205590
C ========== end copyright notice ==============
       subroutine box_density(TLOC,SLOC,RHOLOC)
          use OpenAD_dct
          use OpenAD_tape
          use OpenAD_rev
          use OpenAD_checkpoints
          use checkpoint_module
          use graph_module

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

      use w2f__types
      use active_module
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_146
      type(active) :: OpenAD_Symbol_147
      REAL(w2f__8) OpenAD_Symbol_148
      type(active) :: OpenAD_Symbol_149
      REAL(w2f__8) OpenAD_Symbol_2
      INTEGER(w2f__i8) OpenAD_Symbol_267
      INTEGER(w2f__i8) OpenAD_Symbol_268
      INTEGER(w2f__i8) OpenAD_Symbol_269
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_6
C
C     **** Parameters and Result ****
C
      type(active) :: TLOC(1 : 3)
      type(active) :: SLOC(1 : 3)
      type(active) :: RHOLOC(1 : 3)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) L
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
      INTEGER(w2f__i8) OpenAD_Symbol_270
      REAL(w2f__8) OpenAD_Symbol_271
      INTEGER(w2f__i8) OpenAD_Symbol_272
      REAL(w2f__8) OpenAD_Symbol_273
      INTEGER(w2f__i8) OpenAD_Symbol_274
      INTEGER(w2f__i8) OpenAD_Symbol_275
C
C     **** Statements ****
C


          !counters
          integer, save :: theSwitch = 0

          !Graph variables
          integer, save :: prevint = 1
          integer, save :: prevdouble = 1
          integer, save :: prevBStack = 0
          integer, save :: prevIStack = 0
          integer, save :: prevFStack = 0
          
          ! checkpointing stacks and offsets
          integer :: cp_loop_variable_1,cp_loop_variable_2,
     +cp_loop_variable_3,cp_loop_variable_4,cp_loop_variable_5
          ! floats 'F'
          double precision, dimension(:), allocatable, save :: 
     +theArgFStack
          integer, save :: theArgFStackoffset=0, theArgFStackSize=0
          ! integers 'I'
          integer, dimension(:), allocatable, save :: 
     +theArgIStack
          integer, save :: theArgIStackoffset=0, theArgIStackSize=0
          ! booleans 'B'
          logical, dimension(:), allocatable, save :: 
     +theArgBStack
          integer, save :: theArgBStackoffset=0, theArgBStackSize=0
          ! strings 'S'
          character*(80), dimension(:), allocatable, save :: 
     +theArgSStack
          integer, save :: theArgSStackoffset=0, theArgSStackSize=0

          type(modeType) :: our_orig_mode

          !Variables for making graphs

         type (list), pointer :: prev => NULL()
         integer :: ierror, counter, counter2, counter3
         
         character (len = 20) itoa 
         character (len = 20) itoa2

         !end graph varibables

	  ! call external C function used in inlined code
          !integer iaddr
          !external iaddr

           ! call external Fortran function used in inlined code
          external makelines

C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"b:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

!function to make graphs
          if (our_rev_mode%tape) then
            Call makelinks('box_density', prev)
          endif
!end function to make graphs
       
          if (our_rev_mode%arg_store) then 
C            print*, " arg_store  ", our_rev_mode
C store arguments
          call cp_store_real_scalar(ALPHA,theArgFStack,theArgFStackoffse
     +t,theArgFStackSize)
          call cp_store_real_scalar(BETA,theArgFStack,theArgFStackoffset
     +,theArgFStackSize)
          call cp_store_real_vector(TLOC,size(TLOC),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          call cp_store_real_vector(SLOC,size(SLOC),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          end if 
          if (our_rev_mode%arg_restore) then
C            print*, " arg_restore", our_rev_mode
C restore arguments
          do cp_loop_variable_1 = ubound(SLOC,1),lbound(SLOC,1),-1
             SLOC(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffse
     +t)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+SLOC(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(TLOC,1),lbound(TLOC,1),-1
             TLOC(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffse
     +t)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+TLOC(cp_loop_variable_1)%v
          end do
          BETA = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",BETA
          theArgFStackoffset = theArgFStackoffset-1
          ALPHA = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",ALPHA
          theArgFStackoffset = theArgFStackoffset-1
          end if
          if (our_rev_mode%plain) then
C            print*, " plain      ", our_rev_mode
            our_orig_mode=our_rev_mode
            our_rev_mode%arg_store=.FALSE.
C original function
C$OPENAD XXX Template ad_template.f
      DO L = 1, 3, 1
        RHOLOC(INT(L))%v = (SLOC(L)%v*BETA-TLOC(L)%v*ALPHA)
      END DO
      RETURN
            our_rev_mode=our_orig_mode
          end if 
          if (our_rev_mode%tape) then
C            print*, " tape       ", our_rev_mode
            our_rev_mode%arg_store=.TRUE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.TRUE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.FALSE.
C taping
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_269 = 0_w2f__i8
      DO L = 1, 3, 1
        OpenAD_Symbol_6 = (SLOC(L)%v*BETA-TLOC(L)%v*ALPHA)
        OpenAD_Symbol_2 = BETA
        OpenAD_Symbol_0 = 1_w2f__i8
        OpenAD_Symbol_4 = ALPHA
        OpenAD_Symbol_1 = (-1_w2f__i8)
        RHOLOC(INT(L))%v = OpenAD_Symbol_6
        OpenAD_Symbol_146 = (OpenAD_Symbol_2 * OpenAD_Symbol_0)
        OpenAD_Symbol_148 = (OpenAD_Symbol_4 * OpenAD_Symbol_1)
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_146
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_148
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
        OpenAD_Symbol_269 = (INT(OpenAD_Symbol_269) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_269
          integer_tape_pointer = integer_tape_pointer+1
      RETURN
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.TRUE.

            !Part of making graphs
              if (.not. associated(prev)) then
                tree%doubles = double_tape_pointer - prevdouble-1
                tree%integers = integer_tape_pointer - prevint-1
                tree%argInts = -1*(theArgIStackOffset - prevIStack)
                tree%argFloats = -1*(theArgFStackOffset - prevFStack)
                tree%argBools =  -1*(theArgBStackOffset - prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset                
              else
                prev%called%doubles = double_tape_pointer - prevdouble
                prev%called%integers = integer_tape_pointer- prevint
                prev%called%argInts =-1*(theArgIStackOffset-prevIStack)
                prev%called%argFloats=-1*(theArgFStackOffset-prevFStack)
                prev%called%argBools= -1*(theArgBStackOffset-prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset
              endif
             !end Graph code
C                call diff tape storage only once flag
          end if 
          if (our_rev_mode%adjoint) then
C            print*, " adjoint    ", our_rev_mode
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
C adjoint
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_267 = integer_tape(integer_tape_pointer)
      OpenAD_Symbol_268 = 1
      DO WHILE(INT(OpenAD_Symbol_268) .LE. INT(OpenAD_Symbol_267))
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_270 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_271 = double_tape(double_tape_pointer)
          OpenAD_Symbol_149%d = OpenAD_Symbol_149%d+RHOLOC(INT(OpenAD_Sy
     +mbol_270))%d*OpenAD_Symbol_271
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_272 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_273 = double_tape(double_tape_pointer)
          OpenAD_Symbol_147%d = OpenAD_Symbol_147%d+RHOLOC(INT(OpenAD_Sy
     +mbol_272))%d*OpenAD_Symbol_273
          RHOLOC(INT(OpenAD_Symbol_272))%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_274 = integer_tape(integer_tape_pointer)
          SLOC(INT(OpenAD_Symbol_274))%d = SLOC(INT(OpenAD_Symbol_274))%
     +d+OpenAD_Symbol_147%d
          OpenAD_Symbol_147%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_275 = integer_tape(integer_tape_pointer)
          TLOC(INT(OpenAD_Symbol_275))%d = TLOC(INT(OpenAD_Symbol_275))%
     +d+OpenAD_Symbol_149%d
          OpenAD_Symbol_149%d = 0.0d0
        OpenAD_Symbol_268 = INT(OpenAD_Symbol_268) + 1
      END DO
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
          end if 
C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"a:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

         !graph code
         prevint = integer_tape_pointer
         prevdouble = double_tape_pointer
         prevBStack = theArgBStackOffset
         prevIStack = theArgIStackOffset
         prevFStack = theArgFStackOffset
         if (our_rev_mode%tape) then
          if( associated(prev)) then
             cur => prev
           else  
             !if(tree%first%called%value .eq. cur%called%value) then
           Open (Unit=10, File='/tmp/calltree.out', status='replace', 
     + action='write', iostat=ierror)
           write(10, *) 'digraph G {'
           write(10, *) 'nodesep=.05;'
           write(10, *) 'ranksep=.05;'
           graph%value = tree%value
           graph%doubles = tree%doubles
           graph%integers = tree%integers
           write(itoa, '(I)') tree%doubles
           itoa = adjustl(itoa)
           write(itoa2, '(I)') tree%integers
           itoa2 = adjustl(itoa2)
           write(10, '(I, A, A, A, A, A, A, A)'), iaddr(tree),
     + '[shape="box" height=.25 label="', trim(tree%value), ' ', 
     + trim(itoa), ':', trim(itoa2), '"];'
            Call graphprint(tree)
            write(10, *) '1[ height=.25 label="SubroutineName',
     + ' double:integer"];'
            write(10, '(A,A)') '2[height=.25 label="Edge checkpoint',
     + ' double:integer:boolean"];'
            write(10, *) '}'
            close(10)
            Open (Unit=11, File='/tmp/callgraph.out', status='replace',
     + action='write', iostat=ierror)
            write(11, *) 'digraph G {'
            write(11, *) 'nodesep=.05;'
            write(11, *) 'ranksep=.05;'
            call graph2print()
            write(11, '(A,A)') '1[ height=.25 label="SubroutineName',
     + ' tape double:integer checkpoint double:integer:boolean"];'
            write(11, *) '}'
            close(11)
             !read *, five
             !endif
             endif
           endif    
         !end graph code

        end subroutine box_density
C ========== begin copyright notice ==============
C This file is part of 
C ---------------
C xaifBooster
C ---------------
C Distributed under the BSD license as follows:
C Copyright (c) 2005, The University of Chicago
C All rights reserved.
C
C Redistribution and use in source and binary forms, 
C with or without modification, are permitted provided that the following conditions are met:
C
C    - Redistributions of source code must retain the above copyright notice, 
C      this list of conditions and the following disclaimer.
C    - Redistributions in binary form must reproduce the above copyright notice, 
C      this list of conditions and the following disclaimer in the documentation 
C      and/or other materials provided with the distribution.
C    - Neither the name of The University of Chicago nor the names of its contributors 
C      may be used to endorse or promote products derived from this software without 
C      specific prior written permission.
C
C THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
C EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
C OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
C SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
C INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
C PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
C INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
C LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
C OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
C 
C General Information:
C xaifBooster is intended for the transformation of 
C numerical programs represented as xml files according 
C to the XAIF schema. It is part of the OpenAD framework. 
C The main application is automatic 
C differentiation, i.e. the generation of code for 
C the computation of derivatives. 
C The following people are the principal authors of the 
C current version: 
C 	Uwe Naumann
C	Jean Utke
C Additional contributors are: 
C	Andrew Lyons
C	Peter Fine
C
C For more details about xaifBooster and its use in OpenAD please visit:
C   http://www.mcs.anl.gov/openad
C
C This work is partially supported by:
C 	NSF-ITR grant OCE-0205590
C ========== end copyright notice ==============
       subroutine box_transport(RHOLOC,UVELLOC)
          use OpenAD_dct
          use OpenAD_tape
          use OpenAD_rev
          use OpenAD_checkpoints
          use checkpoint_module
          use graph_module

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

      use w2f__types
      use active_module
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_150
      REAL(w2f__8) OpenAD_Symbol_151
      REAL(w2f__8) OpenAD_Symbol_152
      type(active) :: OpenAD_Symbol_153
      REAL(w2f__8) OpenAD_Symbol_154
      REAL(w2f__8) OpenAD_Symbol_155
      REAL(w2f__8) OpenAD_Symbol_156
      type(active) :: OpenAD_Symbol_157
      REAL(w2f__8) OpenAD_Symbol_158
      type(active) :: OpenAD_Symbol_159
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
C
C     **** Parameters and Result ****
C
      type(active) :: RHOLOC(1 : 3)
      type(active) :: UVELLOC
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
      REAL(w2f__8) OpenAD_Symbol_276
      REAL(w2f__8) OpenAD_Symbol_277
      REAL(w2f__8) OpenAD_Symbol_278
C
C     **** Statements ****
C


          !counters
          integer, save :: theSwitch = 0

          !Graph variables
          integer, save :: prevint = 1
          integer, save :: prevdouble = 1
          integer, save :: prevBStack = 0
          integer, save :: prevIStack = 0
          integer, save :: prevFStack = 0
          
          ! checkpointing stacks and offsets
          integer :: cp_loop_variable_1,cp_loop_variable_2,
     +cp_loop_variable_3,cp_loop_variable_4,cp_loop_variable_5
          ! floats 'F'
          double precision, dimension(:), allocatable, save :: 
     +theArgFStack
          integer, save :: theArgFStackoffset=0, theArgFStackSize=0
          ! integers 'I'
          integer, dimension(:), allocatable, save :: 
     +theArgIStack
          integer, save :: theArgIStackoffset=0, theArgIStackSize=0
          ! booleans 'B'
          logical, dimension(:), allocatable, save :: 
     +theArgBStack
          integer, save :: theArgBStackoffset=0, theArgBStackSize=0
          ! strings 'S'
          character*(80), dimension(:), allocatable, save :: 
     +theArgSStack
          integer, save :: theArgSStackoffset=0, theArgSStackSize=0

          type(modeType) :: our_orig_mode

          !Variables for making graphs

         type (list), pointer :: prev => NULL()
         integer :: ierror, counter, counter2, counter3
         
         character (len = 20) itoa 
         character (len = 20) itoa2

         !end graph varibables

	  ! call external C function used in inlined code
          !integer iaddr
          !external iaddr

           ! call external Fortran function used in inlined code
          external makelines

C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"b:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

!function to make graphs
          if (our_rev_mode%tape) then
            Call makelinks('box_transport', prev)
          endif
!end function to make graphs
       
          if (our_rev_mode%arg_store) then 
C            print*, " arg_store  ", our_rev_mode
C store arguments
          call cp_store_real_scalar(DELTA,theArgFStack,theArgFStackoffse
     +t,theArgFStackSize)
          call cp_store_real_scalar(U0,theArgFStack,theArgFStackoffset,t
     +heArgFStackSize)
          call cp_store_real_vector(RHOLOC,size(RHOLOC),theArgFStack,the
     +ArgFStackoffset,theArgFStackSize)
          end if 
          if (our_rev_mode%arg_restore) then
C            print*, " arg_restore", our_rev_mode
C restore arguments
          do cp_loop_variable_1 = ubound(RHOLOC,1),lbound(RHOLOC,1),-1
             RHOLOC(cp_loop_variable_1)%v = theArgFStack(theArgFStackoff
     +set)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+RHOLOC(cp_loop_variable_1)%v
          end do
          U0 = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",U0
          theArgFStackoffset = theArgFStackoffset-1
          DELTA = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",DELTA
          theArgFStackoffset = theArgFStackoffset-1
          end if
          if (our_rev_mode%plain) then
C            print*, " plain      ", our_rev_mode
            our_orig_mode=our_rev_mode
            our_rev_mode%arg_store=.FALSE.
C original function
C$OPENAD XXX Template ad_template.f
      UVELLOC%v = (-(U0*(RHOLOC(1)%v*DELTA+RHOLOC(3)%v*(1.0D00-DELTA)-RH
     +OLOC(2)%v)))
      RETURN
            our_rev_mode=our_orig_mode
          end if 
          if (our_rev_mode%tape) then
C            print*, " tape       ", our_rev_mode
            our_rev_mode%arg_store=.TRUE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.TRUE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.FALSE.
C taping
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_17 = (1.0D00 - DELTA)
      OpenAD_Symbol_8 = (RHOLOC(1)%v*DELTA+RHOLOC(3)%v*OpenAD_Symbol_17-
     +RHOLOC(2)%v)
      OpenAD_Symbol_20 = (-(U0 * OpenAD_Symbol_8))
      OpenAD_Symbol_15 = DELTA
      OpenAD_Symbol_13 = 1_w2f__i8
      OpenAD_Symbol_18 = OpenAD_Symbol_17
      OpenAD_Symbol_14 = 1_w2f__i8
      OpenAD_Symbol_11 = 1_w2f__i8
      OpenAD_Symbol_12 = (-1_w2f__i8)
      OpenAD_Symbol_10 = U0
      OpenAD_Symbol_7 = (-1_w2f__i8)
      UVELLOC%v = OpenAD_Symbol_20
      OpenAD_Symbol_150 = (OpenAD_Symbol_10 * OpenAD_Symbol_7)
      OpenAD_Symbol_151 = (OpenAD_Symbol_11 * OpenAD_Symbol_150)
      OpenAD_Symbol_152 = (OpenAD_Symbol_12 * OpenAD_Symbol_150)
      OpenAD_Symbol_154 = (OpenAD_Symbol_13 * OpenAD_Symbol_151)
      OpenAD_Symbol_155 = (OpenAD_Symbol_14 * OpenAD_Symbol_151)
      OpenAD_Symbol_156 = (OpenAD_Symbol_18 * OpenAD_Symbol_155)
      OpenAD_Symbol_158 = (OpenAD_Symbol_15 * OpenAD_Symbol_154)
          double_tape(double_tape_pointer) = OpenAD_Symbol_152
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_156
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_158
          double_tape_pointer = double_tape_pointer+1
      RETURN
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.TRUE.

            !Part of making graphs
              if (.not. associated(prev)) then
                tree%doubles = double_tape_pointer - prevdouble-1
                tree%integers = integer_tape_pointer - prevint-1
                tree%argInts = -1*(theArgIStackOffset - prevIStack)
                tree%argFloats = -1*(theArgFStackOffset - prevFStack)
                tree%argBools =  -1*(theArgBStackOffset - prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset                
              else
                prev%called%doubles = double_tape_pointer - prevdouble
                prev%called%integers = integer_tape_pointer- prevint
                prev%called%argInts =-1*(theArgIStackOffset-prevIStack)
                prev%called%argFloats=-1*(theArgFStackOffset-prevFStack)
                prev%called%argBools= -1*(theArgBStackOffset-prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset
              endif
             !end Graph code
C                call diff tape storage only once flag
          end if 
          if (our_rev_mode%adjoint) then
C            print*, " adjoint    ", our_rev_mode
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
C adjoint
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_276 = double_tape(double_tape_pointer)
          OpenAD_Symbol_159%d = OpenAD_Symbol_159%d+UVELLOC%d*OpenAD_Sym
     +bol_276
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_277 = double_tape(double_tape_pointer)
          OpenAD_Symbol_157%d = OpenAD_Symbol_157%d+UVELLOC%d*OpenAD_Sym
     +bol_277
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_278 = double_tape(double_tape_pointer)
          OpenAD_Symbol_153%d = OpenAD_Symbol_153%d+UVELLOC%d*OpenAD_Sym
     +bol_278
          UVELLOC%d = 0.0d0
          RHOLOC(2)%d = RHOLOC(2)%d+OpenAD_Symbol_153%d
          OpenAD_Symbol_153%d = 0.0d0
          RHOLOC(3)%d = RHOLOC(3)%d+OpenAD_Symbol_157%d
          OpenAD_Symbol_157%d = 0.0d0
          RHOLOC(1)%d = RHOLOC(1)%d+OpenAD_Symbol_159%d
          OpenAD_Symbol_159%d = 0.0d0
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
          end if 
C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"a:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

         !graph code
         prevint = integer_tape_pointer
         prevdouble = double_tape_pointer
         prevBStack = theArgBStackOffset
         prevIStack = theArgIStackOffset
         prevFStack = theArgFStackOffset
         if (our_rev_mode%tape) then
          if( associated(prev)) then
             cur => prev
           else  
             !if(tree%first%called%value .eq. cur%called%value) then
           Open (Unit=10, File='/tmp/calltree.out', status='replace', 
     + action='write', iostat=ierror)
           write(10, *) 'digraph G {'
           write(10, *) 'nodesep=.05;'
           write(10, *) 'ranksep=.05;'
           graph%value = tree%value
           graph%doubles = tree%doubles
           graph%integers = tree%integers
           write(itoa, '(I)') tree%doubles
           itoa = adjustl(itoa)
           write(itoa2, '(I)') tree%integers
           itoa2 = adjustl(itoa2)
           write(10, '(I, A, A, A, A, A, A, A)'), iaddr(tree),
     + '[shape="box" height=.25 label="', trim(tree%value), ' ', 
     + trim(itoa), ':', trim(itoa2), '"];'
            Call graphprint(tree)
            write(10, *) '1[ height=.25 label="SubroutineName',
     + ' double:integer"];'
            write(10, '(A,A)') '2[height=.25 label="Edge checkpoint',
     + ' double:integer:boolean"];'
            write(10, *) '}'
            close(10)
            Open (Unit=11, File='/tmp/callgraph.out', status='replace',
     + action='write', iostat=ierror)
            write(11, *) 'digraph G {'
            write(11, *) 'nodesep=.05;'
            write(11, *) 'ranksep=.05;'
            call graph2print()
            write(11, '(A,A)') '1[ height=.25 label="SubroutineName',
     + ' tape double:integer checkpoint double:integer:boolean"];'
            write(11, *) '}'
            close(11)
             !read *, five
             !endif
             endif
           endif    
         !end graph code

        end subroutine box_transport
C ========== begin copyright notice ==============
C This file is part of 
C ---------------
C xaifBooster
C ---------------
C Distributed under the BSD license as follows:
C Copyright (c) 2005, The University of Chicago
C All rights reserved.
C
C Redistribution and use in source and binary forms, 
C with or without modification, are permitted provided that the following conditions are met:
C
C    - Redistributions of source code must retain the above copyright notice, 
C      this list of conditions and the following disclaimer.
C    - Redistributions in binary form must reproduce the above copyright notice, 
C      this list of conditions and the following disclaimer in the documentation 
C      and/or other materials provided with the distribution.
C    - Neither the name of The University of Chicago nor the names of its contributors 
C      may be used to endorse or promote products derived from this software without 
C      specific prior written permission.
C
C THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
C EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
C OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
C SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
C INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
C PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
C INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
C LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
C OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
C 
C General Information:
C xaifBooster is intended for the transformation of 
C numerical programs represented as xml files according 
C to the XAIF schema. It is part of the OpenAD framework. 
C The main application is automatic 
C differentiation, i.e. the generation of code for 
C the computation of derivatives. 
C The following people are the principal authors of the 
C current version: 
C 	Uwe Naumann
C	Jean Utke
C Additional contributors are: 
C	Andrew Lyons
C	Peter Fine
C
C For more details about xaifBooster and its use in OpenAD please visit:
C   http://www.mcs.anl.gov/openad
C
C This work is partially supported by:
C 	NSF-ITR grant OCE-0205590
C ========== end copyright notice ==============
       subroutine box_robert_filter(FLDNOW,FLDOLD,FLDNEW)
          use OpenAD_dct
          use OpenAD_tape
          use OpenAD_rev
          use OpenAD_checkpoints
          use checkpoint_module
          use graph_module

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

      use w2f__types
      use active_module
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_124
      REAL(w2f__8) OpenAD_Symbol_125
      REAL(w2f__8) OpenAD_Symbol_126
      REAL(w2f__8) OpenAD_Symbol_128
      REAL(w2f__8) OpenAD_Symbol_129
      REAL(w2f__8) OpenAD_Symbol_130
      REAL(w2f__8) OpenAD_Symbol_131
      REAL(w2f__8) OpenAD_Symbol_132
      REAL(w2f__8) OpenAD_Symbol_133
      REAL(w2f__8) OpenAD_Symbol_135
      REAL(w2f__8) OpenAD_Symbol_227
      REAL(w2f__8) OpenAD_Symbol_228
      type(active) :: OpenAD_Symbol_229
      REAL(w2f__8) OpenAD_Symbol_230
      REAL(w2f__8) OpenAD_Symbol_231
      type(active) :: OpenAD_Symbol_232
      REAL(w2f__8) OpenAD_Symbol_233
      REAL(w2f__8) OpenAD_Symbol_234
      type(active) :: OpenAD_Symbol_235
      REAL(w2f__8) OpenAD_Symbol_236
      type(active) :: OpenAD_Symbol_237
      INTEGER(w2f__i8) OpenAD_Symbol_304
      INTEGER(w2f__i8) OpenAD_Symbol_305
      INTEGER(w2f__i8) OpenAD_Symbol_306
C
C     **** Parameters and Result ****
C
      type(active) :: FLDNOW(1 : 3)
      type(active) :: FLDOLD(1 : 3)
      type(active) :: FLDNEW(1 : 3)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) L
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
      INTEGER(w2f__i8) OpenAD_Symbol_307
      REAL(w2f__8) OpenAD_Symbol_308
      INTEGER(w2f__i8) OpenAD_Symbol_309
      REAL(w2f__8) OpenAD_Symbol_310
      INTEGER(w2f__i8) OpenAD_Symbol_311
      REAL(w2f__8) OpenAD_Symbol_312
      INTEGER(w2f__i8) OpenAD_Symbol_313
      REAL(w2f__8) OpenAD_Symbol_314
      INTEGER(w2f__i8) OpenAD_Symbol_315
      INTEGER(w2f__i8) OpenAD_Symbol_316
      INTEGER(w2f__i8) OpenAD_Symbol_317
      INTEGER(w2f__i8) OpenAD_Symbol_318
C
C     **** Statements ****
C


          !counters
          integer, save :: theSwitch = 0

          !Graph variables
          integer, save :: prevint = 1
          integer, save :: prevdouble = 1
          integer, save :: prevBStack = 0
          integer, save :: prevIStack = 0
          integer, save :: prevFStack = 0
          
          ! checkpointing stacks and offsets
          integer :: cp_loop_variable_1,cp_loop_variable_2,
     +cp_loop_variable_3,cp_loop_variable_4,cp_loop_variable_5
          ! floats 'F'
          double precision, dimension(:), allocatable, save :: 
     +theArgFStack
          integer, save :: theArgFStackoffset=0, theArgFStackSize=0
          ! integers 'I'
          integer, dimension(:), allocatable, save :: 
     +theArgIStack
          integer, save :: theArgIStackoffset=0, theArgIStackSize=0
          ! booleans 'B'
          logical, dimension(:), allocatable, save :: 
     +theArgBStack
          integer, save :: theArgBStackoffset=0, theArgBStackSize=0
          ! strings 'S'
          character*(80), dimension(:), allocatable, save :: 
     +theArgSStack
          integer, save :: theArgSStackoffset=0, theArgSStackSize=0

          type(modeType) :: our_orig_mode

          !Variables for making graphs

         type (list), pointer :: prev => NULL()
         integer :: ierror, counter, counter2, counter3
         
         character (len = 20) itoa 
         character (len = 20) itoa2

         !end graph varibables

	  ! call external C function used in inlined code
          !integer iaddr
          !external iaddr

           ! call external Fortran function used in inlined code
          external makelines

C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"b:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

!function to make graphs
          if (our_rev_mode%tape) then
            Call makelinks('box_robert_filter', prev)
          endif
!end function to make graphs
       
          if (our_rev_mode%arg_store) then 
C            print*, " arg_store  ", our_rev_mode
C store arguments
          call cp_store_real_scalar(ROBERT_FILTER_COEFF,theArgFStack,the
     +ArgFStackoffset,theArgFStackSize)
          call cp_store_real_vector(FLDNOW,size(FLDNOW),theArgFStack,the
     +ArgFStackoffset,theArgFStackSize)
          call cp_store_real_vector(FLDOLD,size(FLDOLD),theArgFStack,the
     +ArgFStackoffset,theArgFStackSize)
          call cp_store_real_vector(FLDNEW,size(FLDNEW),theArgFStack,the
     +ArgFStackoffset,theArgFStackSize)
          end if 
          if (our_rev_mode%arg_restore) then
C            print*, " arg_restore", our_rev_mode
C restore arguments
          do cp_loop_variable_1 = ubound(FLDNEW,1),lbound(FLDNEW,1),-1
             FLDNEW(cp_loop_variable_1)%v = theArgFStack(theArgFStackoff
     +set)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+FLDNEW(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(FLDOLD,1),lbound(FLDOLD,1),-1
             FLDOLD(cp_loop_variable_1)%v = theArgFStack(theArgFStackoff
     +set)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+FLDOLD(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(FLDNOW,1),lbound(FLDNOW,1),-1
             FLDNOW(cp_loop_variable_1)%v = theArgFStack(theArgFStackoff
     +set)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+FLDNOW(cp_loop_variable_1)%v
          end do
          ROBERT_FILTER_COEFF = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",ROBERT_FILTER_COEFF
          theArgFStackoffset = theArgFStackoffset-1
          end if
          if (our_rev_mode%plain) then
C            print*, " plain      ", our_rev_mode
            our_orig_mode=our_rev_mode
            our_rev_mode%arg_store=.FALSE.
C original function
C$OPENAD XXX Template ad_template.f
      DO L = 1, 3, 1
        FLDNOW(INT(L))%v = (FLDNOW(L)%v+ROBERT_FILTER_COEFF*(FLDOLD(L)%v
     ++FLDNEW(L)%v-FLDNOW(L)%v*2.0D00))
      END DO
      RETURN
            our_rev_mode=our_orig_mode
          end if 
          if (our_rev_mode%tape) then
C            print*, " tape       ", our_rev_mode
            our_rev_mode%arg_store=.TRUE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.TRUE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.FALSE.
C taping
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_306 = 0_w2f__i8
      DO L = 1, 3, 1
        OpenAD_Symbol_126 = (FLDOLD(L)%v+FLDNEW(L)%v-FLDNOW(L)%v*2.0D00)
        OpenAD_Symbol_135 = (FLDNOW(L)%v+ROBERT_FILTER_COEFF*OpenAD_Symb
     +ol_126)
        OpenAD_Symbol_124 = 1_w2f__i8
        OpenAD_Symbol_129 = 1_w2f__i8
        OpenAD_Symbol_131 = 1_w2f__i8
        OpenAD_Symbol_133 = 2.0D00
        OpenAD_Symbol_132 = (-1_w2f__i8)
        OpenAD_Symbol_130 = 1_w2f__i8
        OpenAD_Symbol_128 = ROBERT_FILTER_COEFF
        OpenAD_Symbol_125 = 1_w2f__i8
        FLDNOW(INT(L))%v = OpenAD_Symbol_135
        OpenAD_Symbol_227 = (OpenAD_Symbol_128 * OpenAD_Symbol_125)
        OpenAD_Symbol_228 = (OpenAD_Symbol_129 * OpenAD_Symbol_227)
        OpenAD_Symbol_230 = (OpenAD_Symbol_130 * OpenAD_Symbol_227)
        OpenAD_Symbol_231 = (OpenAD_Symbol_131 * OpenAD_Symbol_230)
        OpenAD_Symbol_233 = (OpenAD_Symbol_132 * OpenAD_Symbol_230)
        OpenAD_Symbol_234 = (OpenAD_Symbol_133 * OpenAD_Symbol_233)
        OpenAD_Symbol_236 = OpenAD_Symbol_124
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_228
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_231
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_234
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_236
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
        OpenAD_Symbol_306 = (INT(OpenAD_Symbol_306) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_306
          integer_tape_pointer = integer_tape_pointer+1
      RETURN
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.TRUE.

            !Part of making graphs
              if (.not. associated(prev)) then
                tree%doubles = double_tape_pointer - prevdouble-1
                tree%integers = integer_tape_pointer - prevint-1
                tree%argInts = -1*(theArgIStackOffset - prevIStack)
                tree%argFloats = -1*(theArgFStackOffset - prevFStack)
                tree%argBools =  -1*(theArgBStackOffset - prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset                
              else
                prev%called%doubles = double_tape_pointer - prevdouble
                prev%called%integers = integer_tape_pointer- prevint
                prev%called%argInts =-1*(theArgIStackOffset-prevIStack)
                prev%called%argFloats=-1*(theArgFStackOffset-prevFStack)
                prev%called%argBools= -1*(theArgBStackOffset-prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset
              endif
             !end Graph code
C                call diff tape storage only once flag
          end if 
          if (our_rev_mode%adjoint) then
C            print*, " adjoint    ", our_rev_mode
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
C adjoint
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_304 = integer_tape(integer_tape_pointer)
      OpenAD_Symbol_305 = 1
      DO WHILE(INT(OpenAD_Symbol_305) .LE. INT(OpenAD_Symbol_304))
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_307 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_308 = double_tape(double_tape_pointer)
          OpenAD_Symbol_237%d = OpenAD_Symbol_237%d+FLDNOW(INT(OpenAD_Sy
     +mbol_307))%d*OpenAD_Symbol_308
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_309 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_310 = double_tape(double_tape_pointer)
          OpenAD_Symbol_235%d = OpenAD_Symbol_235%d+FLDNOW(INT(OpenAD_Sy
     +mbol_309))%d*OpenAD_Symbol_310
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_311 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_312 = double_tape(double_tape_pointer)
          OpenAD_Symbol_232%d = OpenAD_Symbol_232%d+FLDNOW(INT(OpenAD_Sy
     +mbol_311))%d*OpenAD_Symbol_312
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_313 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_314 = double_tape(double_tape_pointer)
          OpenAD_Symbol_229%d = OpenAD_Symbol_229%d+FLDNOW(INT(OpenAD_Sy
     +mbol_313))%d*OpenAD_Symbol_314
          FLDNOW(INT(OpenAD_Symbol_313))%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_315 = integer_tape(integer_tape_pointer)
          FLDOLD(INT(OpenAD_Symbol_315))%d = FLDOLD(INT(OpenAD_Symbol_31
     +5))%d+OpenAD_Symbol_229%d
          OpenAD_Symbol_229%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_316 = integer_tape(integer_tape_pointer)
          FLDNEW(INT(OpenAD_Symbol_316))%d = FLDNEW(INT(OpenAD_Symbol_31
     +6))%d+OpenAD_Symbol_232%d
          OpenAD_Symbol_232%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_317 = integer_tape(integer_tape_pointer)
          FLDNOW(INT(OpenAD_Symbol_317))%d = FLDNOW(INT(OpenAD_Symbol_31
     +7))%d+OpenAD_Symbol_235%d
          OpenAD_Symbol_235%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_318 = integer_tape(integer_tape_pointer)
          FLDNOW(INT(OpenAD_Symbol_318))%d = FLDNOW(INT(OpenAD_Symbol_31
     +8))%d+OpenAD_Symbol_237%d
          OpenAD_Symbol_237%d = 0.0d0
        OpenAD_Symbol_305 = INT(OpenAD_Symbol_305) + 1
      END DO
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
          end if 
C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"a:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

         !graph code
         prevint = integer_tape_pointer
         prevdouble = double_tape_pointer
         prevBStack = theArgBStackOffset
         prevIStack = theArgIStackOffset
         prevFStack = theArgFStackOffset
         if (our_rev_mode%tape) then
          if( associated(prev)) then
             cur => prev
           else  
             !if(tree%first%called%value .eq. cur%called%value) then
           Open (Unit=10, File='/tmp/calltree.out', status='replace', 
     + action='write', iostat=ierror)
           write(10, *) 'digraph G {'
           write(10, *) 'nodesep=.05;'
           write(10, *) 'ranksep=.05;'
           graph%value = tree%value
           graph%doubles = tree%doubles
           graph%integers = tree%integers
           write(itoa, '(I)') tree%doubles
           itoa = adjustl(itoa)
           write(itoa2, '(I)') tree%integers
           itoa2 = adjustl(itoa2)
           write(10, '(I, A, A, A, A, A, A, A)'), iaddr(tree),
     + '[shape="box" height=.25 label="', trim(tree%value), ' ', 
     + trim(itoa), ':', trim(itoa2), '"];'
            Call graphprint(tree)
            write(10, *) '1[ height=.25 label="SubroutineName',
     + ' double:integer"];'
            write(10, '(A,A)') '2[height=.25 label="Edge checkpoint',
     + ' double:integer:boolean"];'
            write(10, *) '}'
            close(10)
            Open (Unit=11, File='/tmp/callgraph.out', status='replace',
     + action='write', iostat=ierror)
            write(11, *) 'digraph G {'
            write(11, *) 'nodesep=.05;'
            write(11, *) 'ranksep=.05;'
            call graph2print()
            write(11, '(A,A)') '1[ height=.25 label="SubroutineName',
     + ' tape double:integer checkpoint double:integer:boolean"];'
            write(11, *) '}'
            close(11)
             !read *, five
             !endif
             endif
           endif    
         !end graph code

        end subroutine box_robert_filter
C ========== begin copyright notice ==============
C This file is part of 
C ---------------
C xaifBooster
C ---------------
C Distributed under the BSD license as follows:
C Copyright (c) 2005, The University of Chicago
C All rights reserved.
C
C Redistribution and use in source and binary forms, 
C with or without modification, are permitted provided that the following conditions are met:
C
C    - Redistributions of source code must retain the above copyright notice, 
C      this list of conditions and the following disclaimer.
C    - Redistributions in binary form must reproduce the above copyright notice, 
C      this list of conditions and the following disclaimer in the documentation 
C      and/or other materials provided with the distribution.
C    - Neither the name of The University of Chicago nor the names of its contributors 
C      may be used to endorse or promote products derived from this software without 
C      specific prior written permission.
C
C THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
C EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
C OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
C SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
C INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
C PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
C INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
C LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
C OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
C 
C General Information:
C xaifBooster is intended for the transformation of 
C numerical programs represented as xml files according 
C to the XAIF schema. It is part of the OpenAD framework. 
C The main application is automatic 
C differentiation, i.e. the generation of code for 
C the computation of derivatives. 
C The following people are the principal authors of the 
C current version: 
C 	Uwe Naumann
C	Jean Utke
C Additional contributors are: 
C	Andrew Lyons
C	Peter Fine
C
C For more details about xaifBooster and its use in OpenAD please visit:
C   http://www.mcs.anl.gov/openad
C
C This work is partially supported by:
C 	NSF-ITR grant OCE-0205590
C ========== end copyright notice ==============
       subroutine box_cycle_fields()
          use OpenAD_dct
          use OpenAD_tape
          use OpenAD_rev
          use OpenAD_checkpoints
          use checkpoint_module
          use graph_module

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

      use w2f__types
      use active_module
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      type(active) :: OpenAD_Symbol_238
      type(active) :: OpenAD_Symbol_239
      type(active) :: OpenAD_Symbol_240
      type(active) :: OpenAD_Symbol_241
      INTEGER(w2f__i8) OpenAD_Symbol_319
      INTEGER(w2f__i8) OpenAD_Symbol_320
      INTEGER(w2f__i8) OpenAD_Symbol_321
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) L
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
      INTEGER(w2f__i8) OpenAD_Symbol_322
      INTEGER(w2f__i8) OpenAD_Symbol_323
      INTEGER(w2f__i8) OpenAD_Symbol_324
      INTEGER(w2f__i8) OpenAD_Symbol_325
      INTEGER(w2f__i8) OpenAD_Symbol_326
      INTEGER(w2f__i8) OpenAD_Symbol_327
      INTEGER(w2f__i8) OpenAD_Symbol_328
      INTEGER(w2f__i8) OpenAD_Symbol_329
C
C     **** Statements ****
C


          !counters
          integer, save :: theSwitch = 0

          !Graph variables
          integer, save :: prevint = 1
          integer, save :: prevdouble = 1
          integer, save :: prevBStack = 0
          integer, save :: prevIStack = 0
          integer, save :: prevFStack = 0
          
          ! checkpointing stacks and offsets
          integer :: cp_loop_variable_1,cp_loop_variable_2,
     +cp_loop_variable_3,cp_loop_variable_4,cp_loop_variable_5
          ! floats 'F'
          double precision, dimension(:), allocatable, save :: 
     +theArgFStack
          integer, save :: theArgFStackoffset=0, theArgFStackSize=0
          ! integers 'I'
          integer, dimension(:), allocatable, save :: 
     +theArgIStack
          integer, save :: theArgIStackoffset=0, theArgIStackSize=0
          ! booleans 'B'
          logical, dimension(:), allocatable, save :: 
     +theArgBStack
          integer, save :: theArgBStackoffset=0, theArgBStackSize=0
          ! strings 'S'
          character*(80), dimension(:), allocatable, save :: 
     +theArgSStack
          integer, save :: theArgSStackoffset=0, theArgSStackSize=0

          type(modeType) :: our_orig_mode

          !Variables for making graphs

         type (list), pointer :: prev => NULL()
         integer :: ierror, counter, counter2, counter3
         
         character (len = 20) itoa 
         character (len = 20) itoa2

         !end graph varibables

	  ! call external C function used in inlined code
          !integer iaddr
          !external iaddr

           ! call external Fortran function used in inlined code
          external makelines

C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"b:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

!function to make graphs
          if (our_rev_mode%tape) then
            Call makelinks('box_cycle_fields', prev)
          endif
!end function to make graphs
       
          if (our_rev_mode%arg_store) then 
C            print*, " arg_store  ", our_rev_mode
C store arguments
          call cp_store_real_vector(SNEW,size(SNEW),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          call cp_store_real_vector(SNOW,size(SNOW),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          call cp_store_real_vector(TNEW,size(TNEW),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          call cp_store_real_vector(TNOW,size(TNOW),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          end if 
          if (our_rev_mode%arg_restore) then
C            print*, " arg_restore", our_rev_mode
C restore arguments
          do cp_loop_variable_1 = ubound(TNOW,1),lbound(TNOW,1),-1
             TNOW(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffse
     +t)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+TNOW(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(TNEW,1),lbound(TNEW,1),-1
             TNEW(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffse
     +t)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+TNEW(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(SNOW,1),lbound(SNOW,1),-1
             SNOW(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffse
     +t)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+SNOW(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(SNEW,1),lbound(SNEW,1),-1
             SNEW(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffse
     +t)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+SNEW(cp_loop_variable_1)%v
          end do
          end if
          if (our_rev_mode%plain) then
C            print*, " plain      ", our_rev_mode
            our_orig_mode=our_rev_mode
            our_rev_mode%arg_store=.FALSE.
C original function
C$OPENAD XXX Template ad_template.f
      DO L = 1, 3, 1
        TOLD(INT(L))%v = TNOW(L)%v
        TNOW(INT(L))%v = TNEW(L)%v
        SOLD(INT(L))%v = SNOW(L)%v
        SNOW(INT(L))%v = SNEW(L)%v
      END DO
      RETURN
            our_rev_mode=our_orig_mode
          end if 
          if (our_rev_mode%tape) then
C            print*, " tape       ", our_rev_mode
            our_rev_mode%arg_store=.TRUE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.TRUE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.FALSE.
C taping
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_321 = 0_w2f__i8
      DO L = 1, 3, 1
        TOLD(INT(L))%v = TNOW(L)%v
        TNOW(INT(L))%v = TNEW(L)%v
        SOLD(INT(L))%v = SNOW(L)%v
        SNOW(INT(L))%v = SNEW(L)%v
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
        OpenAD_Symbol_321 = (INT(OpenAD_Symbol_321) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_321
          integer_tape_pointer = integer_tape_pointer+1
      RETURN
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.TRUE.

            !Part of making graphs
              if (.not. associated(prev)) then
                tree%doubles = double_tape_pointer - prevdouble-1
                tree%integers = integer_tape_pointer - prevint-1
                tree%argInts = -1*(theArgIStackOffset - prevIStack)
                tree%argFloats = -1*(theArgFStackOffset - prevFStack)
                tree%argBools =  -1*(theArgBStackOffset - prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset                
              else
                prev%called%doubles = double_tape_pointer - prevdouble
                prev%called%integers = integer_tape_pointer- prevint
                prev%called%argInts =-1*(theArgIStackOffset-prevIStack)
                prev%called%argFloats=-1*(theArgFStackOffset-prevFStack)
                prev%called%argBools= -1*(theArgBStackOffset-prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset
              endif
             !end Graph code
C                call diff tape storage only once flag
          end if 
          if (our_rev_mode%adjoint) then
C            print*, " adjoint    ", our_rev_mode
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
C adjoint
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_319 = integer_tape(integer_tape_pointer)
      OpenAD_Symbol_320 = 1
      DO WHILE(INT(OpenAD_Symbol_320) .LE. INT(OpenAD_Symbol_319))
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_322 = integer_tape(integer_tape_pointer)
          if (iaddr(SNOW(INT(OpenAD_Symbol_322))) .ne. iaddr(OpenAD_Symb
     +ol_241)) then
            OpenAD_Symbol_241%d = OpenAD_Symbol_241%d+SNOW(INT(OpenAD_Sy
     +mbol_322))%d
            SNOW(INT(OpenAD_Symbol_322))%d = 0
          end if
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_323 = integer_tape(integer_tape_pointer)
          if (iaddr(SOLD(INT(OpenAD_Symbol_323))) .ne. iaddr(OpenAD_Symb
     +ol_240)) then
            OpenAD_Symbol_240%d = OpenAD_Symbol_240%d+SOLD(INT(OpenAD_Sy
     +mbol_323))%d
            SOLD(INT(OpenAD_Symbol_323))%d = 0
          end if
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_324 = integer_tape(integer_tape_pointer)
          if (iaddr(TNOW(INT(OpenAD_Symbol_324))) .ne. iaddr(OpenAD_Symb
     +ol_239)) then
            OpenAD_Symbol_239%d = OpenAD_Symbol_239%d+TNOW(INT(OpenAD_Sy
     +mbol_324))%d
            TNOW(INT(OpenAD_Symbol_324))%d = 0
          end if
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_325 = integer_tape(integer_tape_pointer)
          if (iaddr(TOLD(INT(OpenAD_Symbol_325))) .ne. iaddr(OpenAD_Symb
     +ol_238)) then
            OpenAD_Symbol_238%d = OpenAD_Symbol_238%d+TOLD(INT(OpenAD_Sy
     +mbol_325))%d
            TOLD(INT(OpenAD_Symbol_325))%d = 0
          end if
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_326 = integer_tape(integer_tape_pointer)
          TNOW(INT(OpenAD_Symbol_326))%d = TNOW(INT(OpenAD_Symbol_326))%
     +d+OpenAD_Symbol_238%d
          OpenAD_Symbol_238%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_327 = integer_tape(integer_tape_pointer)
          TNEW(INT(OpenAD_Symbol_327))%d = TNEW(INT(OpenAD_Symbol_327))%
     +d+OpenAD_Symbol_239%d
          OpenAD_Symbol_239%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_328 = integer_tape(integer_tape_pointer)
          SNOW(INT(OpenAD_Symbol_328))%d = SNOW(INT(OpenAD_Symbol_328))%
     +d+OpenAD_Symbol_240%d
          OpenAD_Symbol_240%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_329 = integer_tape(integer_tape_pointer)
          SNEW(INT(OpenAD_Symbol_329))%d = SNEW(INT(OpenAD_Symbol_329))%
     +d+OpenAD_Symbol_241%d
          OpenAD_Symbol_241%d = 0.0d0
        OpenAD_Symbol_320 = INT(OpenAD_Symbol_320) + 1
      END DO
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
          end if 
C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"a:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

         !graph code
         prevint = integer_tape_pointer
         prevdouble = double_tape_pointer
         prevBStack = theArgBStackOffset
         prevIStack = theArgIStackOffset
         prevFStack = theArgFStackOffset
         if (our_rev_mode%tape) then
          if( associated(prev)) then
             cur => prev
           else  
             !if(tree%first%called%value .eq. cur%called%value) then
           Open (Unit=10, File='/tmp/calltree.out', status='replace', 
     + action='write', iostat=ierror)
           write(10, *) 'digraph G {'
           write(10, *) 'nodesep=.05;'
           write(10, *) 'ranksep=.05;'
           graph%value = tree%value
           graph%doubles = tree%doubles
           graph%integers = tree%integers
           write(itoa, '(I)') tree%doubles
           itoa = adjustl(itoa)
           write(itoa2, '(I)') tree%integers
           itoa2 = adjustl(itoa2)
           write(10, '(I, A, A, A, A, A, A, A)'), iaddr(tree),
     + '[shape="box" height=.25 label="', trim(tree%value), ' ', 
     + trim(itoa), ':', trim(itoa2), '"];'
            Call graphprint(tree)
            write(10, *) '1[ height=.25 label="SubroutineName',
     + ' double:integer"];'
            write(10, '(A,A)') '2[height=.25 label="Edge checkpoint',
     + ' double:integer:boolean"];'
            write(10, *) '}'
            close(10)
            Open (Unit=11, File='/tmp/callgraph.out', status='replace',
     + action='write', iostat=ierror)
            write(11, *) 'digraph G {'
            write(11, *) 'nodesep=.05;'
            write(11, *) 'ranksep=.05;'
            call graph2print()
            write(11, '(A,A)') '1[ height=.25 label="SubroutineName',
     + ' tape double:integer checkpoint double:integer:boolean"];'
            write(11, *) '}'
            close(11)
             !read *, five
             !endif
             endif
           endif    
         !end graph code

        end subroutine box_cycle_fields
C ========== begin copyright notice ==============
C This file is part of 
C ---------------
C xaifBooster
C ---------------
C Distributed under the BSD license as follows:
C Copyright (c) 2005, The University of Chicago
C All rights reserved.
C
C Redistribution and use in source and binary forms, 
C with or without modification, are permitted provided that the following conditions are met:
C
C    - Redistributions of source code must retain the above copyright notice, 
C      this list of conditions and the following disclaimer.
C    - Redistributions in binary form must reproduce the above copyright notice, 
C      this list of conditions and the following disclaimer in the documentation 
C      and/or other materials provided with the distribution.
C    - Neither the name of The University of Chicago nor the names of its contributors 
C      may be used to endorse or promote products derived from this software without 
C      specific prior written permission.
C
C THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
C EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
C OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
C SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
C INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
C PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
C INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
C LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
C OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
C 
C General Information:
C xaifBooster is intended for the transformation of 
C numerical programs represented as xml files according 
C to the XAIF schema. It is part of the OpenAD framework. 
C The main application is automatic 
C differentiation, i.e. the generation of code for 
C the computation of derivatives. 
C The following people are the principal authors of the 
C current version: 
C 	Uwe Naumann
C	Jean Utke
C Additional contributors are: 
C	Andrew Lyons
C	Peter Fine
C
C For more details about xaifBooster and its use in OpenAD please visit:
C   http://www.mcs.anl.gov/openad
C
C This work is partially supported by:
C 	NSF-ITR grant OCE-0205590
C ========== end copyright notice ==============
       subroutine box_update(FLDNEW,FLDOLD,DFLDDT)
          use OpenAD_dct
          use OpenAD_tape
          use OpenAD_rev
          use OpenAD_checkpoints
          use checkpoint_module
          use graph_module

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

      use w2f__types
      use active_module
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_140
      REAL(w2f__8) OpenAD_Symbol_141
      REAL(w2f__8) OpenAD_Symbol_142
      REAL(w2f__8) OpenAD_Symbol_143
      REAL(w2f__8) OpenAD_Symbol_145
      REAL(w2f__8) OpenAD_Symbol_256
      type(active) :: OpenAD_Symbol_257
      REAL(w2f__8) OpenAD_Symbol_258
      type(active) :: OpenAD_Symbol_259
      INTEGER(w2f__i8) OpenAD_Symbol_409
      INTEGER(w2f__i8) OpenAD_Symbol_410
      INTEGER(w2f__i8) OpenAD_Symbol_411
C
C     **** Parameters and Result ****
C
      type(active) :: FLDNEW(1 : 3)
      type(active) :: FLDOLD(1 : 3)
      type(active) :: DFLDDT(1 : 3)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) L
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
      INTEGER(w2f__i8) OpenAD_Symbol_412
      REAL(w2f__8) OpenAD_Symbol_413
      INTEGER(w2f__i8) OpenAD_Symbol_414
      REAL(w2f__8) OpenAD_Symbol_415
      INTEGER(w2f__i8) OpenAD_Symbol_416
      INTEGER(w2f__i8) OpenAD_Symbol_417
C
C     **** Statements ****
C


          !counters
          integer, save :: theSwitch = 0

          !Graph variables
          integer, save :: prevint = 1
          integer, save :: prevdouble = 1
          integer, save :: prevBStack = 0
          integer, save :: prevIStack = 0
          integer, save :: prevFStack = 0
          
          ! checkpointing stacks and offsets
          integer :: cp_loop_variable_1,cp_loop_variable_2,
     +cp_loop_variable_3,cp_loop_variable_4,cp_loop_variable_5
          ! floats 'F'
          double precision, dimension(:), allocatable, save :: 
     +theArgFStack
          integer, save :: theArgFStackoffset=0, theArgFStackSize=0
          ! integers 'I'
          integer, dimension(:), allocatable, save :: 
     +theArgIStack
          integer, save :: theArgIStackoffset=0, theArgIStackSize=0
          ! booleans 'B'
          logical, dimension(:), allocatable, save :: 
     +theArgBStack
          integer, save :: theArgBStackoffset=0, theArgBStackSize=0
          ! strings 'S'
          character*(80), dimension(:), allocatable, save :: 
     +theArgSStack
          integer, save :: theArgSStackoffset=0, theArgSStackSize=0

          type(modeType) :: our_orig_mode

          !Variables for making graphs

         type (list), pointer :: prev => NULL()
         integer :: ierror, counter, counter2, counter3
         
         character (len = 20) itoa 
         character (len = 20) itoa2

         !end graph varibables

	  ! call external C function used in inlined code
          !integer iaddr
          !external iaddr

           ! call external Fortran function used in inlined code
          external makelines

C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"b:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

!function to make graphs
          if (our_rev_mode%tape) then
            Call makelinks('box_update', prev)
          endif
!end function to make graphs
       
          if (our_rev_mode%arg_store) then 
C            print*, " arg_store  ", our_rev_mode
C store arguments
          call cp_store_real_scalar(DELTA_T,theArgFStack,theArgFStackoff
     +set,theArgFStackSize)
          call cp_store_real_vector(FLDOLD,size(FLDOLD),theArgFStack,the
     +ArgFStackoffset,theArgFStackSize)
          call cp_store_real_vector(DFLDDT,size(DFLDDT),theArgFStack,the
     +ArgFStackoffset,theArgFStackSize)
          end if 
          if (our_rev_mode%arg_restore) then
C            print*, " arg_restore", our_rev_mode
C restore arguments
          do cp_loop_variable_1 = ubound(DFLDDT,1),lbound(DFLDDT,1),-1
             DFLDDT(cp_loop_variable_1)%v = theArgFStack(theArgFStackoff
     +set)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+DFLDDT(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(FLDOLD,1),lbound(FLDOLD,1),-1
             FLDOLD(cp_loop_variable_1)%v = theArgFStack(theArgFStackoff
     +set)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+FLDOLD(cp_loop_variable_1)%v
          end do
          DELTA_T = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",DELTA_T
          theArgFStackoffset = theArgFStackoffset-1
          end if
          if (our_rev_mode%plain) then
C            print*, " plain      ", our_rev_mode
            our_orig_mode=our_rev_mode
            our_rev_mode%arg_store=.FALSE.
C original function
C$OPENAD XXX Template ad_template.f
      DO L = 1, 3, 1
        FLDNEW(INT(L))%v = (FLDOLD(L)%v+DFLDDT(L)%v*DELTA_T*2.0D00)
      END DO
      RETURN
            our_rev_mode=our_orig_mode
          end if 
          if (our_rev_mode%tape) then
C            print*, " tape       ", our_rev_mode
            our_rev_mode%arg_store=.TRUE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.TRUE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.FALSE.
C taping
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_411 = 0_w2f__i8
      DO L = 1, 3, 1
        OpenAD_Symbol_142 = (DELTA_T * 2.0D00)
        OpenAD_Symbol_145 = (FLDOLD(L)%v+DFLDDT(L)%v*OpenAD_Symbol_142)
        OpenAD_Symbol_140 = 1_w2f__i8
        OpenAD_Symbol_143 = OpenAD_Symbol_142
        OpenAD_Symbol_141 = 1_w2f__i8
        FLDNEW(INT(L))%v = OpenAD_Symbol_145
        OpenAD_Symbol_256 = (OpenAD_Symbol_143 * OpenAD_Symbol_141)
        OpenAD_Symbol_258 = OpenAD_Symbol_140
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_256
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_258
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
        OpenAD_Symbol_411 = (INT(OpenAD_Symbol_411) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_411
          integer_tape_pointer = integer_tape_pointer+1
      RETURN
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.TRUE.

            !Part of making graphs
              if (.not. associated(prev)) then
                tree%doubles = double_tape_pointer - prevdouble-1
                tree%integers = integer_tape_pointer - prevint-1
                tree%argInts = -1*(theArgIStackOffset - prevIStack)
                tree%argFloats = -1*(theArgFStackOffset - prevFStack)
                tree%argBools =  -1*(theArgBStackOffset - prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset                
              else
                prev%called%doubles = double_tape_pointer - prevdouble
                prev%called%integers = integer_tape_pointer- prevint
                prev%called%argInts =-1*(theArgIStackOffset-prevIStack)
                prev%called%argFloats=-1*(theArgFStackOffset-prevFStack)
                prev%called%argBools= -1*(theArgBStackOffset-prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset
              endif
             !end Graph code
C                call diff tape storage only once flag
          end if 
          if (our_rev_mode%adjoint) then
C            print*, " adjoint    ", our_rev_mode
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
C adjoint
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_409 = integer_tape(integer_tape_pointer)
      OpenAD_Symbol_410 = 1
      DO WHILE(INT(OpenAD_Symbol_410) .LE. INT(OpenAD_Symbol_409))
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_412 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_413 = double_tape(double_tape_pointer)
          OpenAD_Symbol_259%d = OpenAD_Symbol_259%d+FLDNEW(INT(OpenAD_Sy
     +mbol_412))%d*OpenAD_Symbol_413
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_414 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_415 = double_tape(double_tape_pointer)
          OpenAD_Symbol_257%d = OpenAD_Symbol_257%d+FLDNEW(INT(OpenAD_Sy
     +mbol_414))%d*OpenAD_Symbol_415
          FLDNEW(INT(OpenAD_Symbol_414))%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_416 = integer_tape(integer_tape_pointer)
          DFLDDT(INT(OpenAD_Symbol_416))%d = DFLDDT(INT(OpenAD_Symbol_41
     +6))%d+OpenAD_Symbol_257%d
          OpenAD_Symbol_257%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_417 = integer_tape(integer_tape_pointer)
          FLDOLD(INT(OpenAD_Symbol_417))%d = FLDOLD(INT(OpenAD_Symbol_41
     +7))%d+OpenAD_Symbol_259%d
          OpenAD_Symbol_259%d = 0.0d0
        OpenAD_Symbol_410 = INT(OpenAD_Symbol_410) + 1
      END DO
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
          end if 
C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"a:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

         !graph code
         prevint = integer_tape_pointer
         prevdouble = double_tape_pointer
         prevBStack = theArgBStackOffset
         prevIStack = theArgIStackOffset
         prevFStack = theArgFStackOffset
         if (our_rev_mode%tape) then
          if( associated(prev)) then
             cur => prev
           else  
             !if(tree%first%called%value .eq. cur%called%value) then
           Open (Unit=10, File='/tmp/calltree.out', status='replace', 
     + action='write', iostat=ierror)
           write(10, *) 'digraph G {'
           write(10, *) 'nodesep=.05;'
           write(10, *) 'ranksep=.05;'
           graph%value = tree%value
           graph%doubles = tree%doubles
           graph%integers = tree%integers
           write(itoa, '(I)') tree%doubles
           itoa = adjustl(itoa)
           write(itoa2, '(I)') tree%integers
           itoa2 = adjustl(itoa2)
           write(10, '(I, A, A, A, A, A, A, A)'), iaddr(tree),
     + '[shape="box" height=.25 label="', trim(tree%value), ' ', 
     + trim(itoa), ':', trim(itoa2), '"];'
            Call graphprint(tree)
            write(10, *) '1[ height=.25 label="SubroutineName',
     + ' double:integer"];'
            write(10, '(A,A)') '2[height=.25 label="Edge checkpoint',
     + ' double:integer:boolean"];'
            write(10, *) '}'
            close(10)
            Open (Unit=11, File='/tmp/callgraph.out', status='replace',
     + action='write', iostat=ierror)
            write(11, *) 'digraph G {'
            write(11, *) 'nodesep=.05;'
            write(11, *) 'ranksep=.05;'
            call graph2print()
            write(11, '(A,A)') '1[ height=.25 label="SubroutineName',
     + ' tape double:integer checkpoint double:integer:boolean"];'
            write(11, *) '}'
            close(11)
             !read *, five
             !endif
             endif
           endif    
         !end graph code

        end subroutine box_update
C ========== begin copyright notice ==============
C This file is part of 
C ---------------
C xaifBooster
C ---------------
C Distributed under the BSD license as follows:
C Copyright (c) 2005, The University of Chicago
C All rights reserved.
C
C Redistribution and use in source and binary forms, 
C with or without modification, are permitted provided that the following conditions are met:
C
C    - Redistributions of source code must retain the above copyright notice, 
C      this list of conditions and the following disclaimer.
C    - Redistributions in binary form must reproduce the above copyright notice, 
C      this list of conditions and the following disclaimer in the documentation 
C      and/or other materials provided with the distribution.
C    - Neither the name of The University of Chicago nor the names of its contributors 
C      may be used to endorse or promote products derived from this software without 
C      specific prior written permission.
C
C THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
C EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
C OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
C SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
C INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
C PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
C INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
C LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
C OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
C 
C General Information:
C xaifBooster is intended for the transformation of 
C numerical programs represented as xml files according 
C to the XAIF schema. It is part of the OpenAD framework. 
C The main application is automatic 
C differentiation, i.e. the generation of code for 
C the computation of derivatives. 
C The following people are the principal authors of the 
C current version: 
C 	Uwe Naumann
C	Jean Utke
C Additional contributors are: 
C	Andrew Lyons
C	Peter Fine
C
C For more details about xaifBooster and its use in OpenAD please visit:
C   http://www.mcs.anl.gov/openad
C
C This work is partially supported by:
C 	NSF-ITR grant OCE-0205590
C ========== end copyright notice ==============
       subroutine box_timestep(GAMMALOC,FLDSTAR,EXTFORLOC,UVELLOC,FLDNOW
     +,FLDOLD,FLDNEW)
          use OpenAD_dct
          use OpenAD_tape
          use OpenAD_rev
          use OpenAD_checkpoints
          use checkpoint_module
          use graph_module

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

      use w2f__types
      use active_module
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_100
      REAL(w2f__8) OpenAD_Symbol_102
      REAL(w2f__8) OpenAD_Symbol_103
      REAL(w2f__8) OpenAD_Symbol_105
      REAL(w2f__8) OpenAD_Symbol_107
      REAL(w2f__8) OpenAD_Symbol_108
      REAL(w2f__8) OpenAD_Symbol_109
      REAL(w2f__8) OpenAD_Symbol_110
      REAL(w2f__8) OpenAD_Symbol_111
      REAL(w2f__8) OpenAD_Symbol_112
      REAL(w2f__8) OpenAD_Symbol_113
      REAL(w2f__8) OpenAD_Symbol_114
      REAL(w2f__8) OpenAD_Symbol_115
      REAL(w2f__8) OpenAD_Symbol_116
      REAL(w2f__8) OpenAD_Symbol_118
      REAL(w2f__8) OpenAD_Symbol_119
      REAL(w2f__8) OpenAD_Symbol_120
      REAL(w2f__8) OpenAD_Symbol_121
      REAL(w2f__8) OpenAD_Symbol_122
      REAL(w2f__8) OpenAD_Symbol_123
      REAL(w2f__8) OpenAD_Symbol_160
      REAL(w2f__8) OpenAD_Symbol_161
      REAL(w2f__8) OpenAD_Symbol_162
      REAL(w2f__8) OpenAD_Symbol_163
      REAL(w2f__8) OpenAD_Symbol_164
      type(active) :: OpenAD_Symbol_165
      REAL(w2f__8) OpenAD_Symbol_166
      REAL(w2f__8) OpenAD_Symbol_167
      REAL(w2f__8) OpenAD_Symbol_168
      REAL(w2f__8) OpenAD_Symbol_169
      REAL(w2f__8) OpenAD_Symbol_170
      REAL(w2f__8) OpenAD_Symbol_171
      type(active) :: OpenAD_Symbol_172
      REAL(w2f__8) OpenAD_Symbol_173
      type(active) :: OpenAD_Symbol_174
      REAL(w2f__8) OpenAD_Symbol_175
      type(active) :: OpenAD_Symbol_176
      REAL(w2f__8) OpenAD_Symbol_177
      type(active) :: OpenAD_Symbol_178
      REAL(w2f__8) OpenAD_Symbol_179
      type(active) :: OpenAD_Symbol_180
      REAL(w2f__8) OpenAD_Symbol_181
      type(active) :: OpenAD_Symbol_182
      REAL(w2f__8) OpenAD_Symbol_183
      REAL(w2f__8) OpenAD_Symbol_184
      REAL(w2f__8) OpenAD_Symbol_185
      REAL(w2f__8) OpenAD_Symbol_186
      REAL(w2f__8) OpenAD_Symbol_187
      REAL(w2f__8) OpenAD_Symbol_188
      REAL(w2f__8) OpenAD_Symbol_189
      type(active) :: OpenAD_Symbol_190
      REAL(w2f__8) OpenAD_Symbol_191
      type(active) :: OpenAD_Symbol_192
      REAL(w2f__8) OpenAD_Symbol_193
      REAL(w2f__8) OpenAD_Symbol_194
      REAL(w2f__8) OpenAD_Symbol_195
      REAL(w2f__8) OpenAD_Symbol_196
      REAL(w2f__8) OpenAD_Symbol_197
      type(active) :: OpenAD_Symbol_198
      REAL(w2f__8) OpenAD_Symbol_199
      REAL(w2f__8) OpenAD_Symbol_200
      REAL(w2f__8) OpenAD_Symbol_201
      REAL(w2f__8) OpenAD_Symbol_202
      type(active) :: OpenAD_Symbol_203
      REAL(w2f__8) OpenAD_Symbol_204
      type(active) :: OpenAD_Symbol_205
      REAL(w2f__8) OpenAD_Symbol_206
      type(active) :: OpenAD_Symbol_207
      REAL(w2f__8) OpenAD_Symbol_208
      type(active) :: OpenAD_Symbol_209
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_210
      REAL(w2f__8) OpenAD_Symbol_211
      REAL(w2f__8) OpenAD_Symbol_212
      REAL(w2f__8) OpenAD_Symbol_213
      REAL(w2f__8) OpenAD_Symbol_214
      REAL(w2f__8) OpenAD_Symbol_215
      type(active) :: OpenAD_Symbol_216
      REAL(w2f__8) OpenAD_Symbol_217
      type(active) :: OpenAD_Symbol_218
      REAL(w2f__8) OpenAD_Symbol_219
      REAL(w2f__8) OpenAD_Symbol_22
      REAL(w2f__8) OpenAD_Symbol_220
      REAL(w2f__8) OpenAD_Symbol_221
      REAL(w2f__8) OpenAD_Symbol_222
      REAL(w2f__8) OpenAD_Symbol_223
      type(active) :: OpenAD_Symbol_224
      REAL(w2f__8) OpenAD_Symbol_225
      type(active) :: OpenAD_Symbol_226
      REAL(w2f__8) OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_27
      INTEGER(w2f__i8) OpenAD_Symbol_279
      REAL(w2f__8) OpenAD_Symbol_28
      INTEGER(w2f__i8) OpenAD_Symbol_280
      INTEGER(w2f__i8) OpenAD_Symbol_281
      REAL(w2f__8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_31
      REAL(w2f__8) OpenAD_Symbol_33
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_36
      REAL(w2f__8) OpenAD_Symbol_37
      REAL(w2f__8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_42
      REAL(w2f__8) OpenAD_Symbol_43
      REAL(w2f__8) OpenAD_Symbol_45
      REAL(w2f__8) OpenAD_Symbol_46
      REAL(w2f__8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_51
      REAL(w2f__8) OpenAD_Symbol_52
      REAL(w2f__8) OpenAD_Symbol_54
      REAL(w2f__8) OpenAD_Symbol_56
      REAL(w2f__8) OpenAD_Symbol_57
      REAL(w2f__8) OpenAD_Symbol_58
      REAL(w2f__8) OpenAD_Symbol_59
      REAL(w2f__8) OpenAD_Symbol_60
      REAL(w2f__8) OpenAD_Symbol_61
      REAL(w2f__8) OpenAD_Symbol_62
      REAL(w2f__8) OpenAD_Symbol_63
      REAL(w2f__8) OpenAD_Symbol_64
      REAL(w2f__8) OpenAD_Symbol_66
      REAL(w2f__8) OpenAD_Symbol_67
      REAL(w2f__8) OpenAD_Symbol_68
      REAL(w2f__8) OpenAD_Symbol_69
      REAL(w2f__8) OpenAD_Symbol_70
      REAL(w2f__8) OpenAD_Symbol_71
      REAL(w2f__8) OpenAD_Symbol_72
      REAL(w2f__8) OpenAD_Symbol_73
      REAL(w2f__8) OpenAD_Symbol_75
      REAL(w2f__8) OpenAD_Symbol_76
      REAL(w2f__8) OpenAD_Symbol_78
      REAL(w2f__8) OpenAD_Symbol_79
      REAL(w2f__8) OpenAD_Symbol_81
      REAL(w2f__8) OpenAD_Symbol_82
      REAL(w2f__8) OpenAD_Symbol_84
      REAL(w2f__8) OpenAD_Symbol_86
      REAL(w2f__8) OpenAD_Symbol_87
      REAL(w2f__8) OpenAD_Symbol_88
      REAL(w2f__8) OpenAD_Symbol_89
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_91
      REAL(w2f__8) OpenAD_Symbol_92
      REAL(w2f__8) OpenAD_Symbol_93
      REAL(w2f__8) OpenAD_Symbol_94
      REAL(w2f__8) OpenAD_Symbol_96
      REAL(w2f__8) OpenAD_Symbol_97
      REAL(w2f__8) OpenAD_Symbol_99
C
C     **** Parameters and Result ****
C
      REAL(w2f__8) GAMMALOC
      REAL(w2f__8) FLDSTAR(1 : 2)
      REAL(w2f__8) EXTFORLOC(1 : 2)
      type(active) :: UVELLOC
      type(active) :: FLDNOW(1 : 3)
      type(active) :: FLDOLD(1 : 3)
      type(active) :: FLDNEW(1 : 3)
C
C     **** Local Variables and Functions ****
C
      EXTERNAL box_update
      type(active) :: DFLDDT(1 : 3)
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
      REAL(w2f__8) OpenAD_Symbol_282
      REAL(w2f__8) OpenAD_Symbol_283
      REAL(w2f__8) OpenAD_Symbol_284
      REAL(w2f__8) OpenAD_Symbol_285
      REAL(w2f__8) OpenAD_Symbol_286
      REAL(w2f__8) OpenAD_Symbol_287
      REAL(w2f__8) OpenAD_Symbol_288
      REAL(w2f__8) OpenAD_Symbol_289
      REAL(w2f__8) OpenAD_Symbol_290
      REAL(w2f__8) OpenAD_Symbol_291
      REAL(w2f__8) OpenAD_Symbol_292
      REAL(w2f__8) OpenAD_Symbol_293
      REAL(w2f__8) OpenAD_Symbol_294
      REAL(w2f__8) OpenAD_Symbol_295
      REAL(w2f__8) OpenAD_Symbol_296
      REAL(w2f__8) OpenAD_Symbol_297
      REAL(w2f__8) OpenAD_Symbol_298
      REAL(w2f__8) OpenAD_Symbol_299
      REAL(w2f__8) OpenAD_Symbol_300
      REAL(w2f__8) OpenAD_Symbol_301
      REAL(w2f__8) OpenAD_Symbol_302
      REAL(w2f__8) OpenAD_Symbol_303
C
C     **** Statements ****
C


          !counters
          integer, save :: theSwitch = 0

          !Graph variables
          integer, save :: prevint = 1
          integer, save :: prevdouble = 1
          integer, save :: prevBStack = 0
          integer, save :: prevIStack = 0
          integer, save :: prevFStack = 0
          
          ! checkpointing stacks and offsets
          integer :: cp_loop_variable_1,cp_loop_variable_2,
     +cp_loop_variable_3,cp_loop_variable_4,cp_loop_variable_5
          ! floats 'F'
          double precision, dimension(:), allocatable, save :: 
     +theArgFStack
          integer, save :: theArgFStackoffset=0, theArgFStackSize=0
          ! integers 'I'
          integer, dimension(:), allocatable, save :: 
     +theArgIStack
          integer, save :: theArgIStackoffset=0, theArgIStackSize=0
          ! booleans 'B'
          logical, dimension(:), allocatable, save :: 
     +theArgBStack
          integer, save :: theArgBStackoffset=0, theArgBStackSize=0
          ! strings 'S'
          character*(80), dimension(:), allocatable, save :: 
     +theArgSStack
          integer, save :: theArgSStackoffset=0, theArgSStackSize=0

          type(modeType) :: our_orig_mode

          !Variables for making graphs

         type (list), pointer :: prev => NULL()
         integer :: ierror, counter, counter2, counter3
         
         character (len = 20) itoa 
         character (len = 20) itoa2

         !end graph varibables

	  ! call external C function used in inlined code
          !integer iaddr
          !external iaddr

           ! call external Fortran function used in inlined code
          external makelines

C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"b:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

!function to make graphs
          if (our_rev_mode%tape) then
            Call makelinks('box_timestep', prev)
          endif
!end function to make graphs
       
          if (our_rev_mode%arg_store) then 
C            print*, " arg_store  ", our_rev_mode
C store arguments
          call cp_store_real_scalar(GAMMALOC,theArgFStack,theArgFStackof
     +fset,theArgFStackSize)
          call cp_store_real_scalar(UVELLOC%v,theArgFStack,theArgFStacko
     +ffset,theArgFStackSize)
          call cp_store_real_scalar(DELTA_T,theArgFStack,theArgFStackoff
     +set,theArgFStackSize)
          call cp_store_p_real_vector(FLDSTAR,size(FLDSTAR),theArgFStack
     +,theArgFStackoffset,theArgFStackSize)
          call cp_store_p_real_vector(EXTFORLOC,size(EXTFORLOC),theArgFS
     +tack,theArgFStackoffset,theArgFStackSize)
          call cp_store_real_vector(FLDNOW,size(FLDNOW),theArgFStack,the
     +ArgFStackoffset,theArgFStackSize)
          call cp_store_real_vector(FLDOLD,size(FLDOLD),theArgFStack,the
     +ArgFStackoffset,theArgFStackSize)
          call cp_store_real_vector(FLDNEW,size(FLDNEW),theArgFStack,the
     +ArgFStackoffset,theArgFStackSize)
          call cp_store_p_real_vector(VOL,size(VOL),theArgFStack,theArgF
     +Stackoffset,theArgFStackSize)
          end if 
          if (our_rev_mode%arg_restore) then
C            print*, " arg_restore", our_rev_mode
C restore arguments
          do cp_loop_variable_1 = ubound(VOL,1),lbound(VOL,1),-1
             VOL(cp_loop_variable_1) = theArgFStack(theArgFStackoffset)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+VOL(cp_loop_variable_1)
          end do
          do cp_loop_variable_1 = ubound(FLDNEW,1),lbound(FLDNEW,1),-1
             FLDNEW(cp_loop_variable_1)%v = theArgFStack(theArgFStackoff
     +set)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+FLDNEW(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(FLDOLD,1),lbound(FLDOLD,1),-1
             FLDOLD(cp_loop_variable_1)%v = theArgFStack(theArgFStackoff
     +set)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+FLDOLD(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(FLDNOW,1),lbound(FLDNOW,1),-1
             FLDNOW(cp_loop_variable_1)%v = theArgFStack(theArgFStackoff
     +set)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+FLDNOW(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(EXTFORLOC,1),lbound(EXTFORLOC,1
     +),-1
             EXTFORLOC(cp_loop_variable_1) = theArgFStack(theArgFStackof
     +fset)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+EXTFORLOC(cp_loop_variable_1)
          end do
          do cp_loop_variable_1 = ubound(FLDSTAR,1),lbound(FLDSTAR,1),-1
             FLDSTAR(cp_loop_variable_1) = theArgFStack(theArgFStackoffs
     +et)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+FLDSTAR(cp_loop_variable_1)
          end do
          DELTA_T = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",DELTA_T
          theArgFStackoffset = theArgFStackoffset-1
          UVELLOC%v = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",UVELLOC%v
          theArgFStackoffset = theArgFStackoffset-1
          GAMMALOC = theArgFStack(theArgFStackoffset)
C write(*,'(A,EN26.16E3)')"restore(s)  ",GAMMALOC
          theArgFStackoffset = theArgFStackoffset-1
          end if
          if (our_rev_mode%plain) then
C            print*, " plain      ", our_rev_mode
            our_orig_mode=our_rev_mode
            our_rev_mode%arg_store=.FALSE.
C original function
C$OPENAD XXX Template ad_template.f
      IF (UVELLOC%v .GE. 0.0D00) THEN
        DFLDDT(1)%v = ((EXTFORLOC(1)+VOL(1)*GAMMALOC*(FLDSTAR(1)-FLDNOW(
     +1)%v)+UVELLOC%v*(FLDNOW(3)%v-FLDNOW(1)%v))/VOL(1))
        DFLDDT(2)%v = ((EXTFORLOC(2)+VOL(2)*GAMMALOC*(FLDSTAR(2)-FLDNOW(
     +2)%v)+UVELLOC%v*(FLDNOW(1)%v-FLDNOW(2)%v))/VOL(2))
        DFLDDT(3)%v = ((UVELLOC%v*(FLDNOW(2)%v-FLDNOW(3)%v))/VOL(3))
      ELSE
        DFLDDT(1)%v = ((EXTFORLOC(1)+VOL(1)*GAMMALOC*(FLDSTAR(1)-FLDNOW(
     +1)%v)-UVELLOC%v*(FLDNOW(2)%v-FLDNOW(1)%v))/VOL(1))
        DFLDDT(2)%v = ((EXTFORLOC(2)+VOL(2)*GAMMALOC*(FLDSTAR(2)-FLDNOW(
     +2)%v)-UVELLOC%v*(FLDNOW(3)%v-FLDNOW(2)%v))/VOL(2))
        DFLDDT(3)%v = (-((UVELLOC%v*(FLDNOW(1)%v-FLDNOW(3)%v))/VOL(3)))
      ENDIF
      CALL box_update(FLDNEW,FLDOLD,DFLDDT)
      RETURN
            our_rev_mode=our_orig_mode
          end if 
          if (our_rev_mode%tape) then
C            print*, " tape       ", our_rev_mode
            our_rev_mode%arg_store=.TRUE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.TRUE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.FALSE.
C taping
C$OPENAD XXX Template ad_template.f
      IF (UVELLOC%v .GE. 0.0D00) THEN
        OpenAD_Symbol_31 = (FLDSTAR(1)-FLDNOW(1)%v)
        OpenAD_Symbol_28 = (GAMMALOC * OpenAD_Symbol_31)
        OpenAD_Symbol_36 = (FLDNOW(3)%v-FLDNOW(1)%v)
        OpenAD_Symbol_21 = (EXTFORLOC(1)+VOL(1)*OpenAD_Symbol_28+UVELLOC
     +%v*OpenAD_Symbol_36)
        OpenAD_Symbol_41 = (OpenAD_Symbol_21 / VOL(1))
        OpenAD_Symbol_35 = (-1_w2f__i8)
        OpenAD_Symbol_33 = GAMMALOC
        OpenAD_Symbol_30 = VOL(1)
        OpenAD_Symbol_27 = 1_w2f__i8
        OpenAD_Symbol_24 = 1_w2f__i8
        OpenAD_Symbol_37 = OpenAD_Symbol_36
        OpenAD_Symbol_39 = 1_w2f__i8
        OpenAD_Symbol_40 = (-1_w2f__i8)
        OpenAD_Symbol_38 = UVELLOC%v
        OpenAD_Symbol_25 = 1_w2f__i8
        OpenAD_Symbol_22 = (INT(1_w2f__i8) / VOL(1))
        DFLDDT(1)%v = OpenAD_Symbol_41
        OpenAD_Symbol_52 = (FLDSTAR(2)-FLDNOW(2)%v)
        OpenAD_Symbol_49 = (GAMMALOC * OpenAD_Symbol_52)
        OpenAD_Symbol_57 = (FLDNOW(1)%v-FLDNOW(2)%v)
        OpenAD_Symbol_42 = (EXTFORLOC(2)+VOL(2)*OpenAD_Symbol_49+UVELLOC
     +%v*OpenAD_Symbol_57)
        OpenAD_Symbol_62 = (OpenAD_Symbol_42 / VOL(2))
        OpenAD_Symbol_56 = (-1_w2f__i8)
        OpenAD_Symbol_54 = GAMMALOC
        OpenAD_Symbol_51 = VOL(2)
        OpenAD_Symbol_48 = 1_w2f__i8
        OpenAD_Symbol_45 = 1_w2f__i8
        OpenAD_Symbol_58 = OpenAD_Symbol_57
        OpenAD_Symbol_60 = 1_w2f__i8
        OpenAD_Symbol_61 = (-1_w2f__i8)
        OpenAD_Symbol_59 = UVELLOC%v
        OpenAD_Symbol_46 = 1_w2f__i8
        OpenAD_Symbol_43 = (INT(1_w2f__i8) / VOL(2))
        DFLDDT(2)%v = OpenAD_Symbol_62
        OpenAD_Symbol_66 = (FLDNOW(2)%v-FLDNOW(3)%v)
        OpenAD_Symbol_63 = (UVELLOC%v*OpenAD_Symbol_66)
        OpenAD_Symbol_71 = (OpenAD_Symbol_63 / VOL(3))
        OpenAD_Symbol_67 = OpenAD_Symbol_66
        OpenAD_Symbol_69 = 1_w2f__i8
        OpenAD_Symbol_70 = (-1_w2f__i8)
        OpenAD_Symbol_68 = UVELLOC%v
        OpenAD_Symbol_64 = (INT(1_w2f__i8) / VOL(3))
        DFLDDT(3)%v = OpenAD_Symbol_71
        OpenAD_Symbol_160 = (OpenAD_Symbol_45 * OpenAD_Symbol_43)
        OpenAD_Symbol_161 = (OpenAD_Symbol_46 * OpenAD_Symbol_43)
        OpenAD_Symbol_162 = (OpenAD_Symbol_24 * OpenAD_Symbol_22)
        OpenAD_Symbol_163 = (OpenAD_Symbol_25 * OpenAD_Symbol_22)
        OpenAD_Symbol_164 = (OpenAD_Symbol_67 * OpenAD_Symbol_64)
        OpenAD_Symbol_166 = (OpenAD_Symbol_68 * OpenAD_Symbol_64)
        OpenAD_Symbol_167 = (OpenAD_Symbol_58 * OpenAD_Symbol_161)
        OpenAD_Symbol_168 = (OpenAD_Symbol_59 * OpenAD_Symbol_161)
        OpenAD_Symbol_169 = (OpenAD_Symbol_37 * OpenAD_Symbol_163)
        OpenAD_Symbol_170 = (OpenAD_Symbol_38 * OpenAD_Symbol_163)
        OpenAD_Symbol_171 = (OpenAD_Symbol_69 * OpenAD_Symbol_166)
        OpenAD_Symbol_173 = (OpenAD_Symbol_70 * OpenAD_Symbol_166)
        OpenAD_Symbol_175 = (OpenAD_Symbol_60 * OpenAD_Symbol_168)
        OpenAD_Symbol_177 = (OpenAD_Symbol_61 * OpenAD_Symbol_168)
        OpenAD_Symbol_179 = (OpenAD_Symbol_39 * OpenAD_Symbol_170)
        OpenAD_Symbol_181 = (OpenAD_Symbol_40 * OpenAD_Symbol_170)
        OpenAD_Symbol_183 = (OpenAD_Symbol_48 * OpenAD_Symbol_160)
        OpenAD_Symbol_184 = (OpenAD_Symbol_27 * OpenAD_Symbol_162)
        OpenAD_Symbol_185 = (OpenAD_Symbol_51 * OpenAD_Symbol_183)
        OpenAD_Symbol_186 = (OpenAD_Symbol_30 * OpenAD_Symbol_184)
        OpenAD_Symbol_187 = (OpenAD_Symbol_54 * OpenAD_Symbol_185)
        OpenAD_Symbol_188 = (OpenAD_Symbol_33 * OpenAD_Symbol_186)
        OpenAD_Symbol_189 = (OpenAD_Symbol_56 * OpenAD_Symbol_187)
        OpenAD_Symbol_191 = (OpenAD_Symbol_35 * OpenAD_Symbol_188)
          double_tape(double_tape_pointer) = OpenAD_Symbol_164
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_167
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_169
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_171
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_173
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_175
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_177
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_179
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_181
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_189
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_191
          double_tape_pointer = double_tape_pointer+1
        OpenAD_Symbol_280 = 1_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_280
          integer_tape_pointer = integer_tape_pointer+1
      ELSE
        OpenAD_Symbol_82 = (FLDSTAR(1)-FLDNOW(1)%v)
        OpenAD_Symbol_79 = (GAMMALOC * OpenAD_Symbol_82)
        OpenAD_Symbol_87 = (FLDNOW(2)%v-FLDNOW(1)%v)
        OpenAD_Symbol_72 = (EXTFORLOC(1)+VOL(1)*OpenAD_Symbol_79-UVELLOC
     +%v*OpenAD_Symbol_87)
        OpenAD_Symbol_92 = (OpenAD_Symbol_72 / VOL(1))
        OpenAD_Symbol_86 = (-1_w2f__i8)
        OpenAD_Symbol_84 = GAMMALOC
        OpenAD_Symbol_81 = VOL(1)
        OpenAD_Symbol_78 = 1_w2f__i8
        OpenAD_Symbol_75 = 1_w2f__i8
        OpenAD_Symbol_88 = OpenAD_Symbol_87
        OpenAD_Symbol_90 = 1_w2f__i8
        OpenAD_Symbol_91 = (-1_w2f__i8)
        OpenAD_Symbol_89 = UVELLOC%v
        OpenAD_Symbol_76 = (-1_w2f__i8)
        OpenAD_Symbol_73 = (INT(1_w2f__i8) / VOL(1))
        DFLDDT(1)%v = OpenAD_Symbol_92
        OpenAD_Symbol_103 = (FLDSTAR(2)-FLDNOW(2)%v)
        OpenAD_Symbol_100 = (GAMMALOC * OpenAD_Symbol_103)
        OpenAD_Symbol_108 = (FLDNOW(3)%v-FLDNOW(2)%v)
        OpenAD_Symbol_93 = (EXTFORLOC(2)+VOL(2)*OpenAD_Symbol_100-UVELLO
     +C%v*OpenAD_Symbol_108)
        OpenAD_Symbol_113 = (OpenAD_Symbol_93 / VOL(2))
        OpenAD_Symbol_107 = (-1_w2f__i8)
        OpenAD_Symbol_105 = GAMMALOC
        OpenAD_Symbol_102 = VOL(2)
        OpenAD_Symbol_99 = 1_w2f__i8
        OpenAD_Symbol_96 = 1_w2f__i8
        OpenAD_Symbol_109 = OpenAD_Symbol_108
        OpenAD_Symbol_111 = 1_w2f__i8
        OpenAD_Symbol_112 = (-1_w2f__i8)
        OpenAD_Symbol_110 = UVELLOC%v
        OpenAD_Symbol_97 = (-1_w2f__i8)
        OpenAD_Symbol_94 = (INT(1_w2f__i8) / VOL(2))
        DFLDDT(2)%v = OpenAD_Symbol_113
        OpenAD_Symbol_118 = (FLDNOW(1)%v-FLDNOW(3)%v)
        OpenAD_Symbol_115 = (UVELLOC%v*OpenAD_Symbol_118)
        OpenAD_Symbol_123 = (-(OpenAD_Symbol_115 / VOL(3)))
        OpenAD_Symbol_119 = OpenAD_Symbol_118
        OpenAD_Symbol_121 = 1_w2f__i8
        OpenAD_Symbol_122 = (-1_w2f__i8)
        OpenAD_Symbol_120 = UVELLOC%v
        OpenAD_Symbol_116 = (INT(1_w2f__i8) / VOL(3))
        OpenAD_Symbol_114 = (-1_w2f__i8)
        DFLDDT(3)%v = OpenAD_Symbol_123
        OpenAD_Symbol_193 = (OpenAD_Symbol_96 * OpenAD_Symbol_94)
        OpenAD_Symbol_194 = (OpenAD_Symbol_97 * OpenAD_Symbol_94)
        OpenAD_Symbol_195 = (OpenAD_Symbol_75 * OpenAD_Symbol_73)
        OpenAD_Symbol_196 = (OpenAD_Symbol_76 * OpenAD_Symbol_73)
        OpenAD_Symbol_197 = (OpenAD_Symbol_109 * OpenAD_Symbol_194)
        OpenAD_Symbol_199 = (OpenAD_Symbol_110 * OpenAD_Symbol_194)
        OpenAD_Symbol_200 = (OpenAD_Symbol_88 * OpenAD_Symbol_196)
        OpenAD_Symbol_201 = (OpenAD_Symbol_89 * OpenAD_Symbol_196)
        OpenAD_Symbol_202 = (OpenAD_Symbol_111 * OpenAD_Symbol_199)
        OpenAD_Symbol_204 = (OpenAD_Symbol_112 * OpenAD_Symbol_199)
        OpenAD_Symbol_206 = (OpenAD_Symbol_90 * OpenAD_Symbol_201)
        OpenAD_Symbol_208 = (OpenAD_Symbol_91 * OpenAD_Symbol_201)
        OpenAD_Symbol_210 = (OpenAD_Symbol_99 * OpenAD_Symbol_193)
        OpenAD_Symbol_211 = (OpenAD_Symbol_78 * OpenAD_Symbol_195)
        OpenAD_Symbol_212 = (OpenAD_Symbol_116 * OpenAD_Symbol_114)
        OpenAD_Symbol_213 = (OpenAD_Symbol_119 * OpenAD_Symbol_212)
        OpenAD_Symbol_214 = (OpenAD_Symbol_120 * OpenAD_Symbol_212)
        OpenAD_Symbol_215 = (OpenAD_Symbol_121 * OpenAD_Symbol_214)
        OpenAD_Symbol_217 = (OpenAD_Symbol_122 * OpenAD_Symbol_214)
        OpenAD_Symbol_219 = (OpenAD_Symbol_102 * OpenAD_Symbol_210)
        OpenAD_Symbol_220 = (OpenAD_Symbol_81 * OpenAD_Symbol_211)
        OpenAD_Symbol_221 = (OpenAD_Symbol_105 * OpenAD_Symbol_219)
        OpenAD_Symbol_222 = (OpenAD_Symbol_84 * OpenAD_Symbol_220)
        OpenAD_Symbol_223 = (OpenAD_Symbol_107 * OpenAD_Symbol_221)
        OpenAD_Symbol_225 = (OpenAD_Symbol_86 * OpenAD_Symbol_222)
          double_tape(double_tape_pointer) = OpenAD_Symbol_197
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_200
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_202
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_204
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_206
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_208
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_213
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_215
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_217
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_223
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_225
          double_tape_pointer = double_tape_pointer+1
        OpenAD_Symbol_281 = 0_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_281
          integer_tape_pointer = integer_tape_pointer+1
      ENDIF
      CALL box_update(FLDNEW,FLDOLD,DFLDDT)
      RETURN
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.TRUE.

            !Part of making graphs
              if (.not. associated(prev)) then
                tree%doubles = double_tape_pointer - prevdouble-1
                tree%integers = integer_tape_pointer - prevint-1
                tree%argInts = -1*(theArgIStackOffset - prevIStack)
                tree%argFloats = -1*(theArgFStackOffset - prevFStack)
                tree%argBools =  -1*(theArgBStackOffset - prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset                
              else
                prev%called%doubles = double_tape_pointer - prevdouble
                prev%called%integers = integer_tape_pointer- prevint
                prev%called%argInts =-1*(theArgIStackOffset-prevIStack)
                prev%called%argFloats=-1*(theArgFStackOffset-prevFStack)
                prev%called%argBools= -1*(theArgBStackOffset-prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset
              endif
             !end Graph code
C                call diff tape storage only once flag
          end if 
          if (our_rev_mode%adjoint) then
C            print*, " adjoint    ", our_rev_mode
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
C adjoint
      CALL box_update(FLDNEW,FLDOLD,DFLDDT)
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_279 = integer_tape(integer_tape_pointer)
      IF(OpenAD_Symbol_279 .ne. 0) THEN
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_282 = double_tape(double_tape_pointer)
          OpenAD_Symbol_192%d = OpenAD_Symbol_192%d+DFLDDT(1)%d*OpenAD_S
     +ymbol_282
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_283 = double_tape(double_tape_pointer)
          OpenAD_Symbol_190%d = OpenAD_Symbol_190%d+DFLDDT(2)%d*OpenAD_S
     +ymbol_283
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_284 = double_tape(double_tape_pointer)
          OpenAD_Symbol_182%d = OpenAD_Symbol_182%d+DFLDDT(1)%d*OpenAD_S
     +ymbol_284
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_285 = double_tape(double_tape_pointer)
          OpenAD_Symbol_180%d = OpenAD_Symbol_180%d+DFLDDT(1)%d*OpenAD_S
     +ymbol_285
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_286 = double_tape(double_tape_pointer)
          OpenAD_Symbol_178%d = OpenAD_Symbol_178%d+DFLDDT(2)%d*OpenAD_S
     +ymbol_286
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_287 = double_tape(double_tape_pointer)
          OpenAD_Symbol_176%d = OpenAD_Symbol_176%d+DFLDDT(2)%d*OpenAD_S
     +ymbol_287
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_288 = double_tape(double_tape_pointer)
          OpenAD_Symbol_174%d = OpenAD_Symbol_174%d+DFLDDT(3)%d*OpenAD_S
     +ymbol_288
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_289 = double_tape(double_tape_pointer)
          OpenAD_Symbol_172%d = OpenAD_Symbol_172%d+DFLDDT(3)%d*OpenAD_S
     +ymbol_289
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_290 = double_tape(double_tape_pointer)
          OpenAD_Symbol_165%d = OpenAD_Symbol_165%d+DFLDDT(1)%d*OpenAD_S
     +ymbol_290
          DFLDDT(1)%d = 0.0d0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_291 = double_tape(double_tape_pointer)
          OpenAD_Symbol_165%d = OpenAD_Symbol_165%d+DFLDDT(2)%d*OpenAD_S
     +ymbol_291
          DFLDDT(2)%d = 0.0d0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_292 = double_tape(double_tape_pointer)
          OpenAD_Symbol_165%d = OpenAD_Symbol_165%d+DFLDDT(3)%d*OpenAD_S
     +ymbol_292
          DFLDDT(3)%d = 0.0d0
          UVELLOC%d = UVELLOC%d+OpenAD_Symbol_165%d
          OpenAD_Symbol_165%d = 0.0d0
          FLDNOW(2)%d = FLDNOW(2)%d+OpenAD_Symbol_172%d
          OpenAD_Symbol_172%d = 0.0d0
          FLDNOW(3)%d = FLDNOW(3)%d+OpenAD_Symbol_174%d
          OpenAD_Symbol_174%d = 0.0d0
          FLDNOW(1)%d = FLDNOW(1)%d+OpenAD_Symbol_176%d
          OpenAD_Symbol_176%d = 0.0d0
          FLDNOW(2)%d = FLDNOW(2)%d+OpenAD_Symbol_178%d
          OpenAD_Symbol_178%d = 0.0d0
          FLDNOW(3)%d = FLDNOW(3)%d+OpenAD_Symbol_180%d
          OpenAD_Symbol_180%d = 0.0d0
          FLDNOW(1)%d = FLDNOW(1)%d+OpenAD_Symbol_182%d
          OpenAD_Symbol_182%d = 0.0d0
          FLDNOW(2)%d = FLDNOW(2)%d+OpenAD_Symbol_190%d
          OpenAD_Symbol_190%d = 0.0d0
          FLDNOW(1)%d = FLDNOW(1)%d+OpenAD_Symbol_192%d
          OpenAD_Symbol_192%d = 0.0d0
      ELSE
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_293 = double_tape(double_tape_pointer)
          OpenAD_Symbol_226%d = OpenAD_Symbol_226%d+DFLDDT(1)%d*OpenAD_S
     +ymbol_293
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_294 = double_tape(double_tape_pointer)
          OpenAD_Symbol_224%d = OpenAD_Symbol_224%d+DFLDDT(2)%d*OpenAD_S
     +ymbol_294
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_295 = double_tape(double_tape_pointer)
          OpenAD_Symbol_218%d = OpenAD_Symbol_218%d+DFLDDT(3)%d*OpenAD_S
     +ymbol_295
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_296 = double_tape(double_tape_pointer)
          OpenAD_Symbol_216%d = OpenAD_Symbol_216%d+DFLDDT(3)%d*OpenAD_S
     +ymbol_296
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_297 = double_tape(double_tape_pointer)
          OpenAD_Symbol_198%d = OpenAD_Symbol_198%d+DFLDDT(3)%d*OpenAD_S
     +ymbol_297
          DFLDDT(3)%d = 0.0d0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_298 = double_tape(double_tape_pointer)
          OpenAD_Symbol_209%d = OpenAD_Symbol_209%d+DFLDDT(1)%d*OpenAD_S
     +ymbol_298
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_299 = double_tape(double_tape_pointer)
          OpenAD_Symbol_207%d = OpenAD_Symbol_207%d+DFLDDT(1)%d*OpenAD_S
     +ymbol_299
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_300 = double_tape(double_tape_pointer)
          OpenAD_Symbol_205%d = OpenAD_Symbol_205%d+DFLDDT(2)%d*OpenAD_S
     +ymbol_300
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_301 = double_tape(double_tape_pointer)
          OpenAD_Symbol_203%d = OpenAD_Symbol_203%d+DFLDDT(2)%d*OpenAD_S
     +ymbol_301
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_302 = double_tape(double_tape_pointer)
          OpenAD_Symbol_198%d = OpenAD_Symbol_198%d+DFLDDT(1)%d*OpenAD_S
     +ymbol_302
          DFLDDT(1)%d = 0.0d0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_303 = double_tape(double_tape_pointer)
          OpenAD_Symbol_198%d = OpenAD_Symbol_198%d+DFLDDT(2)%d*OpenAD_S
     +ymbol_303
          DFLDDT(2)%d = 0.0d0
          UVELLOC%d = UVELLOC%d+OpenAD_Symbol_198%d
          OpenAD_Symbol_198%d = 0.0d0
          FLDNOW(3)%d = FLDNOW(3)%d+OpenAD_Symbol_203%d
          OpenAD_Symbol_203%d = 0.0d0
          FLDNOW(2)%d = FLDNOW(2)%d+OpenAD_Symbol_205%d
          OpenAD_Symbol_205%d = 0.0d0
          FLDNOW(2)%d = FLDNOW(2)%d+OpenAD_Symbol_207%d
          OpenAD_Symbol_207%d = 0.0d0
          FLDNOW(1)%d = FLDNOW(1)%d+OpenAD_Symbol_209%d
          OpenAD_Symbol_209%d = 0.0d0
          FLDNOW(1)%d = FLDNOW(1)%d+OpenAD_Symbol_216%d
          OpenAD_Symbol_216%d = 0.0d0
          FLDNOW(3)%d = FLDNOW(3)%d+OpenAD_Symbol_218%d
          OpenAD_Symbol_218%d = 0.0d0
          FLDNOW(2)%d = FLDNOW(2)%d+OpenAD_Symbol_224%d
          OpenAD_Symbol_224%d = 0.0d0
          FLDNOW(1)%d = FLDNOW(1)%d+OpenAD_Symbol_226%d
          OpenAD_Symbol_226%d = 0.0d0
      ENDIF
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
          end if 
C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"a:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

         !graph code
         prevint = integer_tape_pointer
         prevdouble = double_tape_pointer
         prevBStack = theArgBStackOffset
         prevIStack = theArgIStackOffset
         prevFStack = theArgFStackOffset
         if (our_rev_mode%tape) then
          if( associated(prev)) then
             cur => prev
           else  
             !if(tree%first%called%value .eq. cur%called%value) then
           Open (Unit=10, File='/tmp/calltree.out', status='replace', 
     + action='write', iostat=ierror)
           write(10, *) 'digraph G {'
           write(10, *) 'nodesep=.05;'
           write(10, *) 'ranksep=.05;'
           graph%value = tree%value
           graph%doubles = tree%doubles
           graph%integers = tree%integers
           write(itoa, '(I)') tree%doubles
           itoa = adjustl(itoa)
           write(itoa2, '(I)') tree%integers
           itoa2 = adjustl(itoa2)
           write(10, '(I, A, A, A, A, A, A, A)'), iaddr(tree),
     + '[shape="box" height=.25 label="', trim(tree%value), ' ', 
     + trim(itoa), ':', trim(itoa2), '"];'
            Call graphprint(tree)
            write(10, *) '1[ height=.25 label="SubroutineName',
     + ' double:integer"];'
            write(10, '(A,A)') '2[height=.25 label="Edge checkpoint',
     + ' double:integer:boolean"];'
            write(10, *) '}'
            close(10)
            Open (Unit=11, File='/tmp/callgraph.out', status='replace',
     + action='write', iostat=ierror)
            write(11, *) 'digraph G {'
            write(11, *) 'nodesep=.05;'
            write(11, *) 'ranksep=.05;'
            call graph2print()
            write(11, '(A,A)') '1[ height=.25 label="SubroutineName',
     + ' tape double:integer checkpoint double:integer:boolean"];'
            write(11, *) '}'
            close(11)
             !read *, five
             !endif
             endif
           endif    
         !end graph code

        end subroutine box_timestep
