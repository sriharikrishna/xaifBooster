C ***********************************************************
C Fortran file translated from WHIRL Mon Apr  2 13:28:30 2007
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
      TYPE (OpenADTy_active) OpenAD_Symbol_0
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 1)
      INTENT(IN)  X
      TYPE (OpenADTy_active) Y(1 : 1)
      INTENT(OUT)  Y
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) select_expr_temp_0
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
      select_expr_temp_0 = I
      IF(I .ne. 0) THEN
        __value__(Y(1)) = __value__(X(1))
        CALL setderiv(__deriv__(OpenAD_Symbol_0), __deriv__(X(1)))
        CALL setderiv(__deriv__(Y(1)), __deriv__(OpenAD_Symbol_0))
      ENDIF
      RETURN
      END SUBROUTINE
