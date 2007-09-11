C ***********************************************************
C Fortran file translated from WHIRL Thu Sep  6 23:54:41 2007
C ***********************************************************
C ***********************************************************

      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_5
      TYPE (OpenADTy_active) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      TYPE (OpenADTy_active) OpenAD_Symbol_8
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y(1 : 2)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      REAL(w2f__8) S
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
      __value__(Y(1)) = 0.0D00
      __value__(Y(2)) = 0.0D00
      S = 1.0D00
      CALL zero_deriv(__deriv__(Y(1)))
      CALL zero_deriv(__deriv__(Y(2)))
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        IF(S .LT. 0.0D00) THEN
          OpenAD_Symbol_2 = (__value__(X(I)) * 2.0D00)
          OpenAD_Symbol_0 = 2.0D00
          __value__(X(INT(I))) = OpenAD_Symbol_2
          OpenAD_Symbol_5 = OpenAD_Symbol_0
          CALL setderiv(__deriv__(OpenAD_Symbol_6), __deriv__(X(I)))
          CALL sax(OpenAD_Symbol_5, __deriv__(OpenAD_Symbol_6),
     >  __deriv__(X(I)))
        ELSE
          S = 0.0D00
        ENDIF
        __value__(Y(INT(I))) = (__value__(X(I)) + S)
        OpenAD_Symbol_3 = 1_w2f__i8
        OpenAD_Symbol_7 = OpenAD_Symbol_3
        CALL setderiv(__deriv__(OpenAD_Symbol_8), __deriv__(X(I)))
        CALL sax(OpenAD_Symbol_7, __deriv__(OpenAD_Symbol_8), __deriv__
     > (Y(I)))
      END DO
      RETURN
      END SUBROUTINE
