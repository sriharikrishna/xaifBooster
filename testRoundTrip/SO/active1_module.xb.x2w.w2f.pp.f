C ***********************************************************
C Fortran file translated from WHIRL Wed Aug 17 10:41:19 2005
C ***********************************************************
C ***********************************************************

      MODULE active1_module
      use w2f__types
      use active_module
      IMPLICIT NONE
      SAVE
C
C     **** Global Variables & Derived Type Definitions ****
C
      TYPE  ACTIVE1
      SEQUENCE
        type(active) :: V
        type(active) :: D
      END TYPE
      
C
C     **** Statements ****
C
      interface  CONVERT_A2P_SCALAR
        module procedure  CONVERT_A2P_SCALAR_IMPL

      end interface 
      
      interface  CONVERT_A2P_VECTOR
        module procedure  CONVERT_A2P_VECTOR_IMPL

      end interface 
      
      interface  CONVERT_P2A_SCALAR
        module procedure  CONVERT_P2A_SCALAR_IMPL

      end interface 
      
      interface  CONVERT_P2A_VECTOR
        module procedure  CONVERT_P2A_VECTOR_IMPL

      end interface 
      
      interface  SAX
        module procedure  SAX_I_A_A
        module procedure  SAX_D_A_A

      end interface 
      
      interface  SAXPY
        module procedure  SAXPY_A_A

      end interface 
      
      interface  SETDERIV
        module procedure  SETDERIV_A_A

      end interface 
      
      interface  ZERO_DERIV
        module procedure  ZERO_DERIV_A

      end interface 
      
      CONTAINS

       subroutine SAXPY_A_A(A,X,Y)
          use OpenAD_tape
          use OpenAD_rev

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

        use w2f__types
      use active_module
        IMPLICIT NONE
C
C       **** Global Variables & Derived Type Definitions ****
C
        REAL(w2f__8) OpenAD2_Symbol_0
        REAL(w2f__8) OpenAD2_Symbol_1
        REAL(w2f__8) OpenAD2_Symbol_2
        REAL(w2f__8) OpenAD2_Symbol_24
        type(active) :: OpenAD2_Symbol_25
        REAL(w2f__8) OpenAD2_Symbol_26
        type(active) :: OpenAD2_Symbol_27
        REAL(w2f__8) OpenAD2_Symbol_28
        type(active) :: OpenAD2_Symbol_29
        REAL(w2f__8) OpenAD2_Symbol_3
        REAL(w2f__8) OpenAD2_Symbol_4
C
C       **** Parameters and Result ****
C
        type(active) :: A
        TYPE (ACTIVE1) X
        TYPE (ACTIVE1) Y
C
C       **** Local Variables and Functions ****
C
        REAL(w2f__8) OpenAD2_Symbol_51
        REAL(w2f__8) OpenAD2_Symbol_52
        REAL(w2f__8) OpenAD2_Symbol_53
C
C       **** Statements ****
C

          integer iaddr
          external iaddr

         if (our_rev_mode%plain) then
! original function
        Y%D%v = (Y%D%v+A%v*X%D%v)
        RETURN
          end if
          if (our_rev_mode%tape) then
! taping
        OpenAD2_Symbol_4 = (Y%D%v+A%v*X%D%v)
        OpenAD2_Symbol_0 = 1_w2f__i8
        OpenAD2_Symbol_2 = X%D%v
        OpenAD2_Symbol_3 = A%v
        OpenAD2_Symbol_1 = 1_w2f__i8
        Y%D%v = OpenAD2_Symbol_4
        OpenAD2_Symbol_24 = (OpenAD2_Symbol_2 * OpenAD2_Symbol_1)
        OpenAD2_Symbol_26 = (OpenAD2_Symbol_3 * OpenAD2_Symbol_1)
        OpenAD2_Symbol_28 = OpenAD2_Symbol_0
          double_tape(double_tape_pointer) = OpenAD2_Symbol_24
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD2_Symbol_26
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD2_Symbol_28
          double_tape_pointer = double_tape_pointer+1
        RETURN
          end if 
          if (our_rev_mode%adjoint) then
! adjoint
          double_tape_pointer = double_tape_pointer-1
          OpenAD2_Symbol_51 = double_tape(double_tape_pointer)
          OpenAD2_Symbol_29%d = OpenAD2_Symbol_29%d+Y%D%d*OpenAD2_Symbol
     +_51
          double_tape_pointer = double_tape_pointer-1
          OpenAD2_Symbol_52 = double_tape(double_tape_pointer)
          OpenAD2_Symbol_27%d = OpenAD2_Symbol_27%d+Y%D%d*OpenAD2_Symbol
     +_52
          double_tape_pointer = double_tape_pointer-1
          OpenAD2_Symbol_53 = double_tape(double_tape_pointer)
          OpenAD2_Symbol_25%d = OpenAD2_Symbol_25%d+Y%D%d*OpenAD2_Symbol
     +_53
          Y%D%d = 0.0d0
          A%d = A%d+OpenAD2_Symbol_25%d
          OpenAD2_Symbol_25%d = 0.0d0
          X%D%d = X%D%d+OpenAD2_Symbol_27%d
          OpenAD2_Symbol_27%d = 0.0d0
          Y%D%d = Y%D%d+OpenAD2_Symbol_29%d
          OpenAD2_Symbol_29%d = 0.0d0
          end if 
        end subroutine SAXPY_A_A
       subroutine SAX_D_A_A(A,X,Y)
          use OpenAD_tape
          use OpenAD_rev

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

        use w2f__types
      use active_module
        IMPLICIT NONE
C
C       **** Global Variables & Derived Type Definitions ****
C
        REAL(w2f__8) OpenAD2_Symbol_30
        type(active) :: OpenAD2_Symbol_31
        REAL(w2f__8) OpenAD2_Symbol_32
        type(active) :: OpenAD2_Symbol_33
        REAL(w2f__8) OpenAD2_Symbol_5
        REAL(w2f__8) OpenAD2_Symbol_6
        REAL(w2f__8) OpenAD2_Symbol_7
C
C       **** Parameters and Result ****
C
        type(active) :: A
        TYPE (ACTIVE1) X
        TYPE (ACTIVE1) Y
C
C       **** Local Variables and Functions ****
C
        REAL(w2f__8) OpenAD2_Symbol_54
        REAL(w2f__8) OpenAD2_Symbol_55
C
C       **** Statements ****
C

          integer iaddr
          external iaddr

         if (our_rev_mode%plain) then
! original function
        Y%D%v = (A%v*X%D%v)
        RETURN
          end if
          if (our_rev_mode%tape) then
! taping
        OpenAD2_Symbol_7 = (A%v*X%D%v)
        OpenAD2_Symbol_5 = X%D%v
        OpenAD2_Symbol_6 = A%v
        Y%D%v = OpenAD2_Symbol_7
        OpenAD2_Symbol_30 = OpenAD2_Symbol_5
        OpenAD2_Symbol_32 = OpenAD2_Symbol_6
          double_tape(double_tape_pointer) = OpenAD2_Symbol_30
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD2_Symbol_32
          double_tape_pointer = double_tape_pointer+1
        RETURN
          end if 
          if (our_rev_mode%adjoint) then
! adjoint
          double_tape_pointer = double_tape_pointer-1
          OpenAD2_Symbol_54 = double_tape(double_tape_pointer)
          OpenAD2_Symbol_33%d = OpenAD2_Symbol_33%d+Y%D%d*OpenAD2_Symbol
     +_54
          double_tape_pointer = double_tape_pointer-1
          OpenAD2_Symbol_55 = double_tape(double_tape_pointer)
          OpenAD2_Symbol_31%d = OpenAD2_Symbol_31%d+Y%D%d*OpenAD2_Symbol
     +_55
          Y%D%d = 0.0d0
          A%d = A%d+OpenAD2_Symbol_31%d
          OpenAD2_Symbol_31%d = 0.0d0
          X%D%d = X%D%d+OpenAD2_Symbol_33%d
          OpenAD2_Symbol_33%d = 0.0d0
          end if 
        end subroutine SAX_D_A_A
       subroutine SAX_I_A_A(A,X,Y)
          use OpenAD_tape
          use OpenAD_rev

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

        use w2f__types
      use active_module
        IMPLICIT NONE
C
C       **** Global Variables & Derived Type Definitions ****
C
        REAL(w2f__8) OpenAD2_Symbol_10
        REAL(w2f__8) OpenAD2_Symbol_34
        type(active) :: OpenAD2_Symbol_35
        REAL(w2f__8) OpenAD2_Symbol_9
C
C       **** Parameters and Result ****
C
        INTEGER(w2f__i8) A
        INTENT(IN)  A
        TYPE (ACTIVE1) X
        TYPE (ACTIVE1) Y
C
C       **** Local Variables and Functions ****
C
        REAL(w2f__8) OpenAD2_Symbol_56
C
C       **** Statements ****
C

          integer iaddr
          external iaddr

         if (our_rev_mode%plain) then
! original function
        Y%D%v = (INT(A)*X%D%v)
        RETURN
          end if
          if (our_rev_mode%tape) then
! taping
        OpenAD2_Symbol_10 = (INT(A)*X%D%v)
        OpenAD2_Symbol_9 = A
        Y%D%v = OpenAD2_Symbol_10
        OpenAD2_Symbol_34 = OpenAD2_Symbol_9
          double_tape(double_tape_pointer) = OpenAD2_Symbol_34
          double_tape_pointer = double_tape_pointer+1
        RETURN
          end if 
          if (our_rev_mode%adjoint) then
! adjoint
          double_tape_pointer = double_tape_pointer-1
          OpenAD2_Symbol_56 = double_tape(double_tape_pointer)
          OpenAD2_Symbol_35%d = OpenAD2_Symbol_35%d+Y%D%d*OpenAD2_Symbol
     +_56
          Y%D%d = 0.0d0
          X%D%d = X%D%d+OpenAD2_Symbol_35%d
          OpenAD2_Symbol_35%d = 0.0d0
          end if 
        end subroutine SAX_I_A_A
       subroutine SETDERIV_A_A(Y,X)
          use OpenAD_tape
          use OpenAD_rev

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

        use w2f__types
      use active_module
        IMPLICIT NONE
C
C       **** Global Variables & Derived Type Definitions ****
C
        type(active) :: OpenAD2_Symbol_36
C
C       **** Parameters and Result ****
C
        TYPE (ACTIVE1) Y
        TYPE (ACTIVE1) X
C
C       **** Statements ****
C

          integer iaddr
          external iaddr

         if (our_rev_mode%plain) then
! original function
        Y%D%v = X%D%v
        RETURN
          end if
          if (our_rev_mode%tape) then
! taping
        Y%D%v = X%D%v
        RETURN
          end if 
          if (our_rev_mode%adjoint) then
! adjoint
          if (iaddr(Y%D) .ne. iaddr(OpenAD2_Symbol_36)) then
            OpenAD2_Symbol_36%d = OpenAD2_Symbol_36%d+Y%D%d
            Y%D%d = 0
          end if
          X%D%d = X%D%d+OpenAD2_Symbol_36%d
          OpenAD2_Symbol_36%d = 0.0d0
          end if 
        end subroutine SETDERIV_A_A
       subroutine ZERO_DERIV_A(X)
          use OpenAD_tape
          use OpenAD_rev

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

        use w2f__types
      use active_module
        IMPLICIT NONE
C
C       **** Parameters and Result ****
C
        TYPE (ACTIVE1) X
C
C       **** Statements ****
C

          integer iaddr
          external iaddr

         if (our_rev_mode%plain) then
! original function
        X%D%v = 0.0D00
        RETURN
          end if
          if (our_rev_mode%tape) then
! taping
        X%D%v = 0.0D00
        RETURN
          end if 
          if (our_rev_mode%adjoint) then
! adjoint
          X%D%d = 0.0d0
          end if 
        end subroutine ZERO_DERIV_A
       subroutine CONVERT_A2P_SCALAR_IMPL(CONVERTTO,CONVERTFROM)
          use OpenAD_tape
          use OpenAD_rev

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

        use w2f__types
      use active_module
        IMPLICIT NONE
C
C       **** Parameters and Result ****
C
        REAL(w2f__8) CONVERTTO
        TYPE (ACTIVE1) CONVERTFROM
        INTENT(IN)  CONVERTFROM
C
C       **** Statements ****
C

          integer iaddr
          external iaddr

         if (our_rev_mode%plain) then
! original function
        CONVERTTO = CONVERTFROM%V%v
        RETURN
          end if
          if (our_rev_mode%tape) then
! taping
        CONVERTTO = CONVERTFROM%V%v
        RETURN
          end if 
          if (our_rev_mode%adjoint) then
! adjoint
          end if 
        end subroutine CONVERT_A2P_SCALAR_IMPL
       subroutine CONVERT_P2A_SCALAR_IMPL(CONVERTTO,CONVERTFROM)
          use OpenAD_tape
          use OpenAD_rev

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

        use w2f__types
      use active_module
        IMPLICIT NONE
C
C       **** Parameters and Result ****
C
        TYPE (ACTIVE1) CONVERTTO
        REAL(w2f__8) CONVERTFROM
        INTENT(IN)  CONVERTFROM
C
C       **** Statements ****
C

          integer iaddr
          external iaddr

         if (our_rev_mode%plain) then
! original function
        CONVERTTO%V%v = CONVERTFROM
        RETURN
          end if
          if (our_rev_mode%tape) then
! taping
        CONVERTTO%V%v = CONVERTFROM
        RETURN
          end if 
          if (our_rev_mode%adjoint) then
! adjoint
          CONVERTTO%V%d = 0.0d0
          end if 
        end subroutine CONVERT_P2A_SCALAR_IMPL
       subroutine CONVERT_A2P_VECTOR_IMPL(CONVERTTO,CONVERTFROM)
          use OpenAD_tape
          use OpenAD_rev

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

        use w2f__types
      use active_module
        IMPLICIT NONE
C
C       **** Global Variables & Derived Type Definitions ****
C
        INTEGER(w2f__i8) OpenAD2_Symbol_57
        INTEGER(w2f__i8) OpenAD2_Symbol_58
        INTEGER(w2f__i8) OpenAD2_Symbol_59
C
C       **** Parameters and Result ****
C
        REAL(w2f__8) CONVERTTO(:)
        TYPE (ACTIVE1) CONVERTFROM(:)
        INTENT(IN)  CONVERTFROM
C
C       **** Local Variables and Functions ****
C
        INTEGER(w2f__i4) I
C
C       **** Temporary Variables ****
C
        INTEGER(w2f__i4) doloop_ub
C
C       **** Statements ****
C

          integer iaddr
          external iaddr

         if (our_rev_mode%plain) then
! original function
        doloop_ub = UBOUND(CONVERTFROM, 1)
        DO I = LBOUND(CONVERTFROM, 1), doloop_ub, 1
          CONVERTTO(INT(I)) = CONVERTFROM(I)%V%v
        END DO
        RETURN
          end if
          if (our_rev_mode%tape) then
! taping
        doloop_ub = UBOUND(CONVERTFROM, 1)
        OpenAD2_Symbol_59 = 0_w2f__i8
        DO I = LBOUND(CONVERTFROM, 1), doloop_ub, 1
          CONVERTTO(INT(I)) = CONVERTFROM(I)%V%v
          OpenAD2_Symbol_59 = (INT(OpenAD2_Symbol_59) + INT(1_w2f__i8))
        END DO
          integer_tape(integer_tape_pointer) = OpenAD2_Symbol_59
          integer_tape_pointer = integer_tape_pointer+1
        RETURN
          end if 
          if (our_rev_mode%adjoint) then
! adjoint
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD2_Symbol_57 = integer_tape(integer_tape_pointer)
        OpenAD2_Symbol_58 = 1
        DO WHILE(INT(OpenAD2_Symbol_58) .LE. INT(OpenAD2_Symbol_57))
          OpenAD2_Symbol_58 = INT(OpenAD2_Symbol_58) + 1
        END DO
          end if 
        end subroutine CONVERT_A2P_VECTOR_IMPL
       subroutine CONVERT_P2A_VECTOR_IMPL(CONVERTTO,CONVERTFROM)
          use OpenAD_tape
          use OpenAD_rev

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

        use w2f__types
      use active_module
        IMPLICIT NONE
C
C       **** Global Variables & Derived Type Definitions ****
C
        INTEGER(w2f__i8) OpenAD2_Symbol_60
        INTEGER(w2f__i8) OpenAD2_Symbol_61
        INTEGER(w2f__i8) OpenAD2_Symbol_62
C
C       **** Parameters and Result ****
C
        TYPE (ACTIVE1) CONVERTTO(1 :)
        REAL(w2f__8) CONVERTFROM(1 :)
        INTENT(IN)  CONVERTFROM
C
C       **** Local Variables and Functions ****
C
        INTEGER(w2f__i4) I
C
C       **** Temporary Variables ****
C
        INTEGER(w2f__i4) doloop_ub
C
C       **** Statements ****
C

          integer iaddr
          external iaddr

         if (our_rev_mode%plain) then
! original function
        doloop_ub = UBOUND(CONVERTFROM, 1)
        DO I = LBOUND(CONVERTFROM, 1), doloop_ub, 1
          CONVERTTO(I)%V%v = CONVERTFROM(I)
        END DO
        RETURN
          end if
          if (our_rev_mode%tape) then
! taping
        doloop_ub = UBOUND(CONVERTFROM, 1)
        OpenAD2_Symbol_62 = 0_w2f__i8
        DO I = LBOUND(CONVERTFROM, 1), doloop_ub, 1
          CONVERTTO(I)%V%v = CONVERTFROM(I)
          OpenAD2_Symbol_62 = (INT(OpenAD2_Symbol_62) + INT(1_w2f__i8))
        END DO
          integer_tape(integer_tape_pointer) = OpenAD2_Symbol_62
          integer_tape_pointer = integer_tape_pointer+1
        RETURN
          end if 
          if (our_rev_mode%adjoint) then
! adjoint
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD2_Symbol_60 = integer_tape(integer_tape_pointer)
        OpenAD2_Symbol_61 = 1
        DO WHILE(INT(OpenAD2_Symbol_61) .LE. INT(OpenAD2_Symbol_60))
          CONVERTTO(I)%V%d = 0.0d0
          OpenAD2_Symbol_61 = INT(OpenAD2_Symbol_61) + 1
        END DO
          end if 
        end subroutine CONVERT_P2A_VECTOR_IMPL

        end module
