
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
      IF(__value__(X(1)) .eq. 0.0D00) THEN
        K = 1
      ELSE
        K = 2
      ENDIF
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        __value__(Y(INT(I))) = __value__(X(K))
        CALL setderiv(__deriv__(Y(I)), __deriv__(X(K)))
      END DO
      END SUBROUTINE
