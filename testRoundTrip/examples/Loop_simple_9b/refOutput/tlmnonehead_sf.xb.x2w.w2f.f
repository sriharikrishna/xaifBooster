C ***********************************************************
C Fortran file translated from WHIRL Mon Jan 15 10:49:37 2007
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
      TYPE (OpenADTy_active) OpenAD_Symbol_4
      TYPE (OpenADTy_active) OpenAD_Symbol_5
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      INTENT(IN)  X
      TYPE (OpenADTy_active) Y(1 : 2)
      INTENT(OUT)  Y
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) K
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        K = I
        IF(I .eq. INT(1_w2f__i8)) THEN
          OpenAD_Symbol_2 = (2.0D00 * __value__(X(I)))
          OpenAD_Symbol_1 = 2.0D00
          __value__(Y(INT(I))) = OpenAD_Symbol_2
          OpenAD_Symbol_3 = OpenAD_Symbol_1
          CALL setderiv(__deriv__(OpenAD_Symbol_4), __deriv__(X(I)))
          CALL sax(OpenAD_Symbol_3, __deriv__(OpenAD_Symbol_4),
     >  __deriv__(Y(I)))
        ENDIF
        __value__(Y(INT(I))) = __value__(X(K))
        CALL setderiv(__deriv__(OpenAD_Symbol_5), __deriv__(X(K)))
        CALL setderiv(__deriv__(Y(I)), __deriv__(OpenAD_Symbol_5))
      END DO
      RETURN
      END SUBROUTINE
