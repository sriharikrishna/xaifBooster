C ***********************************************************
C Fortran file translated from WHIRL Tue Nov 28 15:40:12 2006
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
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      TYPE (OpenADTy_active) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      TYPE (OpenADTy_active) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y(1 : 2)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      TYPE (OpenADTy_active) T(1 : 2)
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      DO I = 1, 2, 1
        OpenAD_Symbol_2 = (2.0D00 * __value__(X(I)))
        OpenAD_Symbol_1 = 2.0D00
        __value__(T(INT(I))) = OpenAD_Symbol_2
        OpenAD_Symbol_6 = OpenAD_Symbol_1
        CALL setderiv(__deriv__(OpenAD_Symbol_7), __deriv__(X(I)))
        CALL sax(OpenAD_Symbol_6, __deriv__(OpenAD_Symbol_7), __deriv__
     > (T(I)))
        OpenAD_Symbol_5 = (__value__(T(I)) * 4.0D00)
        OpenAD_Symbol_3 = 4.0D00
        __value__(Y(INT(I))) = OpenAD_Symbol_5
        OpenAD_Symbol_8 = OpenAD_Symbol_3
        CALL setderiv(__deriv__(OpenAD_Symbol_9), __deriv__(T(I)))
        CALL sax(OpenAD_Symbol_8, __deriv__(OpenAD_Symbol_9), __deriv__
     > (Y(I)))
      END DO
      RETURN
      END SUBROUTINE
