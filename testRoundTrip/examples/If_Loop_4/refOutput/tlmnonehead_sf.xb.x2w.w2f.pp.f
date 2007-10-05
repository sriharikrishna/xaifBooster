C ***********************************************************
C Fortran file translated from WHIRL Fri Oct  5 00:04:06 2007
C ***********************************************************
C ***********************************************************

      MODULE all_globals_mod
      use w2f__types
      use active_module
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      type(active) :: OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_14
      type(active) :: OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      type(active) :: OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      type(active) :: OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 10)
      INTENT(IN)  X
      type(active) :: Y(1 : 10)
      INTENT(OUT)  Y
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      REAL(w2f__8) PI
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      PI = 3.14149999618530273438D00
      DO I = 1, 9, 1
        IF(I .GT. INT(5_w2f__i8)) THEN
          OpenAD_Symbol_0 = SIN(X(I)%v)
          OpenAD_Symbol_4 = (PI * OpenAD_Symbol_0)
          OpenAD_Symbol_3 = COS(X(I)%v)
          OpenAD_Symbol_2 = PI
          Y(INT(I))%v = OpenAD_Symbol_4
          OpenAD_Symbol_12 = (OpenAD_Symbol_3 * OpenAD_Symbol_2)
          CALL setderiv(OpenAD_Symbol_13,X(I))
          CALL sax(OpenAD_Symbol_12,OpenAD_Symbol_13,Y(I))
        ELSE
          OpenAD_Symbol_8 = (PI+COS(X(I)%v))
          OpenAD_Symbol_7 = (-SIN(X(I)%v))
          OpenAD_Symbol_6 = 1_w2f__i8
          Y(INT(I))%v = OpenAD_Symbol_8
          OpenAD_Symbol_14 = (OpenAD_Symbol_7 * OpenAD_Symbol_6)
          CALL setderiv(OpenAD_Symbol_15,X(I))
          CALL sax(OpenAD_Symbol_14,OpenAD_Symbol_15,Y(I))
        ENDIF
      END DO
      OpenAD_Symbol_11 = (Y(1)%v*Y(9)%v)
      OpenAD_Symbol_9 = Y(9)%v
      OpenAD_Symbol_10 = Y(1)%v
      Y(10)%v = OpenAD_Symbol_11
      OpenAD_Symbol_16 = OpenAD_Symbol_9
      OpenAD_Symbol_18 = OpenAD_Symbol_10
      CALL setderiv(OpenAD_Symbol_19,Y(9))
      CALL setderiv(OpenAD_Symbol_17,Y(1))
      CALL sax(OpenAD_Symbol_16,OpenAD_Symbol_17,Y(10))
      CALL saxpy(OpenAD_Symbol_18,OpenAD_Symbol_19,Y(10))
      END SUBROUTINE
