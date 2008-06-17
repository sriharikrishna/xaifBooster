
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
C$OPENAD XXX Simple loop\t
      DO I = 1, 3, 1
        IF(I .eq. 2) THEN
          __value__(Y(INT(I))) = __value__(X(I))
          CALL setderiv(__deriv__(Y(I)), __deriv__(X(I)))
        ELSE
          __value__(Y(INT(I))) = (__value__(X(I)) * 2.0D00)
          OpenAD_Symbol_0 = 2.0D00
          CALL sax(2.0D00, __deriv__(X(I)), __deriv__(Y(I)))
        ENDIF
      END DO
      END SUBROUTINE
