C ***********************************************************
C Fortran file translated from WHIRL Fri Oct  5 00:14:56 2007
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
      REAL(w2f__8) OpenAD_Symbol_2
      type(active) :: OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      type(active) :: OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      type(active) :: OpenAD_Symbol_7
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 10)
      type(active) :: Y(1 : 1)
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
      DO I = 1, 10, 1
        IF(I .eq. INT(1_w2f__i8)) THEN
          Y(1)%v = X(1)%v
          CALL setderiv(OpenAD_Symbol_3,X(1))
          CALL setderiv(Y(1),OpenAD_Symbol_3)
        ELSE
          OpenAD_Symbol_2 = (X(I)%v*Y(1)%v)
          OpenAD_Symbol_0 = Y(1)%v
          OpenAD_Symbol_1 = X(I)%v
          Y(1)%v = OpenAD_Symbol_2
          OpenAD_Symbol_4 = OpenAD_Symbol_0
          OpenAD_Symbol_6 = OpenAD_Symbol_1
          CALL setderiv(OpenAD_Symbol_7,Y(1))
          CALL setderiv(OpenAD_Symbol_5,X(I))
          CALL sax(OpenAD_Symbol_4,OpenAD_Symbol_5,Y(1))
          CALL saxpy(OpenAD_Symbol_6,OpenAD_Symbol_7,Y(1))
        ENDIF
      END DO
      END SUBROUTINE
