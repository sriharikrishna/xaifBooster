C ***********************************************************
C Fortran file translated from WHIRL Thu Jul 20 16:15:24 2006
C ***********************************************************
C ***********************************************************


      MODULE globals
      use w2f__types
      use active_module
      IMPLICIT NONE
      SAVE
C
C     **** Global Variables & Derived Type Definitions ****
C
      type(active) :: AGLOBAL
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE foo(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_6
      type(active) :: OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      type(active) :: OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 1)
      type(active) :: Y
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_2 = (X(1)%v*X(1)%v)
      OpenAD_Symbol_0 = X(1)%v
      OpenAD_Symbol_1 = X(1)%v
      Y%v = OpenAD_Symbol_2
      OpenAD_Symbol_6 = OpenAD_Symbol_0
      OpenAD_Symbol_8 = OpenAD_Symbol_1
      CALL setderiv(OpenAD_Symbol_9,X(1))
      CALL setderiv(OpenAD_Symbol_7,X(1))
      CALL sax(OpenAD_Symbol_6,OpenAD_Symbol_7,Y)
      CALL saxpy(OpenAD_Symbol_8,OpenAD_Symbol_9,Y)
      RETURN
      END SUBROUTINE

      SUBROUTINE bar(X)
      use w2f__types
      use active_module
      use globals
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_10
      type(active) :: OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      type(active) :: OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
C
C     **** Parameters and Result ****
C
      type(active) :: X
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_5 = (X%v*AGLOBAL%v)
      OpenAD_Symbol_3 = AGLOBAL%v
      OpenAD_Symbol_4 = X%v
      X%v = OpenAD_Symbol_5
      OpenAD_Symbol_10 = OpenAD_Symbol_3
      OpenAD_Symbol_12 = OpenAD_Symbol_4
      CALL setderiv(OpenAD_Symbol_13,AGLOBAL)
      CALL setderiv(OpenAD_Symbol_11,X)
      CALL sax(OpenAD_Symbol_10,OpenAD_Symbol_11,X)
      CALL saxpy(OpenAD_Symbol_12,OpenAD_Symbol_13,X)
      RETURN
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      use globals
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      type(active) :: OpenAD_Symbol_14
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 1)
      type(active) :: Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      EXTERNAL bar
      EXTERNAL foo
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      AGLOBAL%v = 2.0D00
      CALL zero_deriv(AGLOBAL)
      CALL bar(X(1))
      CALL foo(X,AGLOBAL)
      Y(1)%v = AGLOBAL%v
      CALL setderiv(OpenAD_Symbol_14,AGLOBAL)
      CALL setderiv(Y(1),OpenAD_Symbol_14)
      RETURN
      END SUBROUTINE
