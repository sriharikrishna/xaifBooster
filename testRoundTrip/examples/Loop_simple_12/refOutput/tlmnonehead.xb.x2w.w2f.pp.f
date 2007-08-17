C ***********************************************************
C Fortran file translated from WHIRL Fri Aug 17 08:33:18 2007
C ***********************************************************
C ***********************************************************


      SUBROUTINE head(X, Y)
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
      type(active) :: Y(1 : 2)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) J
      LOGICAL(w2f__i4) t__1
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      I = 1
      Y(1)%v = 0.0D00
      Y(2)%v = 0.0D00
      CALL zero_deriv(Y(1))
      CALL zero_deriv(Y(2))
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        J = 1
        t__1 = J .LT. 3
        DO WHILE(J .LT. INT(3_w2f__i8))
          OpenAD_Symbol_4 = (Y(I)%v+X(I)%v*X(J)%v)
          OpenAD_Symbol_0 = 1_w2f__i8
          OpenAD_Symbol_2 = X(J)%v
          OpenAD_Symbol_3 = X(I)%v
          OpenAD_Symbol_1 = 1_w2f__i8
          Y(INT(I))%v = OpenAD_Symbol_4
          OpenAD_Symbol_5 = (OpenAD_Symbol_2 * OpenAD_Symbol_1)
          OpenAD_Symbol_7 = (OpenAD_Symbol_3 * OpenAD_Symbol_1)
          OpenAD_Symbol_9 = OpenAD_Symbol_0
          CALL setderiv(OpenAD_Symbol_10,Y(I))
          CALL setderiv(OpenAD_Symbol_8,X(J))
          CALL setderiv(OpenAD_Symbol_6,X(I))
          CALL sax(OpenAD_Symbol_5,OpenAD_Symbol_6,Y(I))
          CALL saxpy(OpenAD_Symbol_7,OpenAD_Symbol_8,Y(I))
          CALL saxpy(OpenAD_Symbol_9,OpenAD_Symbol_10,Y(I))
          J = J + 1
          t__1 = J .LT. 3
        END DO
      END DO
      RETURN
      END SUBROUTINE
