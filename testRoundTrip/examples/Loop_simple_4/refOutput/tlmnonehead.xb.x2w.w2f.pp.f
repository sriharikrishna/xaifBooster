C ***********************************************************
C Fortran file translated from WHIRL Fri Oct  6 13:55:49 2006
C ***********************************************************
C ***********************************************************


      SUBROUTINE foo(X, Y, K)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      type(active) :: OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      type(active) :: OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      type(active) :: OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      INTENT(IN)  X
      type(active) :: Y(1 : 2)
      INTEGER(w2f__i4) K
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) J
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      J = K
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        OpenAD_Symbol_4 = (Y(J)%v+X(I)%v*X(I)%v)
        OpenAD_Symbol_0 = 1_w2f__i8
        OpenAD_Symbol_2 = X(I)%v
        OpenAD_Symbol_3 = X(I)%v
        OpenAD_Symbol_1 = 1_w2f__i8
        Y(INT(J))%v = OpenAD_Symbol_4
        OpenAD_Symbol_5 = (OpenAD_Symbol_2 * OpenAD_Symbol_1)
        OpenAD_Symbol_7 = (OpenAD_Symbol_3 * OpenAD_Symbol_1)
        OpenAD_Symbol_9 = OpenAD_Symbol_0
        CALL setderiv(OpenAD_Symbol_10,Y(J))
        CALL setderiv(OpenAD_Symbol_8,X(I))
        CALL setderiv(OpenAD_Symbol_6,X(I))
        CALL sax(OpenAD_Symbol_5,OpenAD_Symbol_6,Y(J))
        CALL saxpy(OpenAD_Symbol_7,OpenAD_Symbol_8,Y(J))
        CALL saxpy(OpenAD_Symbol_9,OpenAD_Symbol_10,Y(J))
      END DO
      RETURN
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      INTENT(IN)  X
      type(active) :: Y(1 : 2)
      INTENT(OUT)  Y
C
C     **** Local Variables and Functions ****
C
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
      Y(1)%v = 1.0D00
      Y(2)%v = 1.0D00
      CALL zero_deriv(Y(1))
      CALL zero_deriv(Y(2))
      CALL foo(X,Y,1 _w2f__i8)
      CALL foo(X,Y,2 _w2f__i8)
      RETURN
      END SUBROUTINE
