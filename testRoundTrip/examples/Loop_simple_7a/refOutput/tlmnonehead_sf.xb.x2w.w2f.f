C ***********************************************************
C Fortran file translated from WHIRL Fri Oct  5 00:07:55 2007
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

      SUBROUTINE bar(X, Y, K)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      TYPE (OpenADTy_active) OpenAD_Symbol_0
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 3)
      INTENT(IN)  X
      TYPE (OpenADTy_active) Y(1 : 3)
      INTENT(OUT)  Y
      INTEGER(w2f__i4) K
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) t__1
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
C$OPENAD XXX Simple loop\t
      t__1 = MIN(K, 3)
      DO I = 1, MIN(K, 3), 1
        __value__(Y(INT(I))) = __value__(X(I))
        CALL setderiv(__deriv__(OpenAD_Symbol_0), __deriv__(X(I)))
        CALL setderiv(__deriv__(Y(I)), __deriv__(OpenAD_Symbol_0))
      END DO
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 3)
      INTENT(IN)  X
      TYPE (OpenADTy_active) Y(1 : 3)
      INTENT(OUT)  Y
C
C     **** Local Variables and Functions ****
C
      EXTERNAL bar
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
      K = 3
      CALL bar(__deriv__(X), __deriv__(Y), K)
      END SUBROUTINE