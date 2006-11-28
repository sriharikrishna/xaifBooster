C ***********************************************************
C Fortran file translated from WHIRL Tue Nov 28 15:41:13 2006
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
      REAL(w2f__8) OpenAD_Symbol_1
      type(active) :: OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      type(active) :: OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      type(active) :: OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
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
      DO WHILE(I .LT. INT(3_w2f__i8))
        IF(I .LT. INT(2_w2f__i8)) THEN
          OpenAD_Symbol_1 = SIN(X(1)%v)
          OpenAD_Symbol_0 = COS(X(1)%v)
          Y(2)%v = OpenAD_Symbol_1
          OpenAD_Symbol_7 = OpenAD_Symbol_0
          CALL setderiv(OpenAD_Symbol_8,X(1))
          CALL sax(OpenAD_Symbol_7,OpenAD_Symbol_8,Y(2))
        ELSE
          OpenAD_Symbol_3 = COS(X(2)%v)
          OpenAD_Symbol_2 = (-SIN(X(2)%v))
          Y(1)%v = OpenAD_Symbol_3
          OpenAD_Symbol_9 = OpenAD_Symbol_2
          CALL setderiv(OpenAD_Symbol_10,X(2))
          CALL sax(OpenAD_Symbol_9,OpenAD_Symbol_10,Y(1))
        ENDIF
        I = I + 1
      END DO
      OpenAD_Symbol_6 = (Y(1)%v*Y(2)%v)
      OpenAD_Symbol_4 = Y(2)%v
      OpenAD_Symbol_5 = Y(1)%v
      Y(2)%v = OpenAD_Symbol_6
      OpenAD_Symbol_11 = OpenAD_Symbol_4
      OpenAD_Symbol_13 = OpenAD_Symbol_5
      CALL setderiv(OpenAD_Symbol_14,Y(2))
      CALL setderiv(OpenAD_Symbol_12,Y(1))
      CALL sax(OpenAD_Symbol_11,OpenAD_Symbol_12,Y(2))
      CALL saxpy(OpenAD_Symbol_13,OpenAD_Symbol_14,Y(2))
      RETURN
      END SUBROUTINE
