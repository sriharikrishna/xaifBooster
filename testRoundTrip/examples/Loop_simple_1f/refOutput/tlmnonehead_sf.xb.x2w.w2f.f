C ***********************************************************
C Fortran file translated from WHIRL Mon Apr  2 13:25:27 2007
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
      TYPE (OpenADTy_active) X(1 : 4)
      INTENT(IN)  X
      TYPE (OpenADTy_active) Y(1 : 4)
      INTENT(OUT)  Y
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
C$OPENAD XXX Simple loop
      DO I = 0, 3, 1
        __value__(Y(INT(I + 1))) = __value__(X(I + 1))
        CALL setderiv(__deriv__(OpenAD_Symbol_0), __deriv__(X(I + 1)))
        CALL setderiv(__deriv__(Y(I + 1)), __deriv__(OpenAD_Symbol_0))
      END DO
      RETURN
      END SUBROUTINE