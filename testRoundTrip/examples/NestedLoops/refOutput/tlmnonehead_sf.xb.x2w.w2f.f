
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
      REAL(w2f__8) OpenAD_Symbol_1
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
      INTEGER(w2f__i4) J
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
        DO J = 1, 2, 1
          __value__(Y(INT(I))) = (__value__(X(I)) * __value__(X(J)))
          OpenAD_Symbol_0 = __value__(X(J))
          OpenAD_Symbol_1 = __value__(X(I))
          CALL sax(OpenAD_Symbol_0, __deriv__(X(I)), __deriv__(Y(I)))
          CALL saxpy(OpenAD_Symbol_1, __deriv__(X(J)), __deriv__(Y(I)))
        END DO
      END DO
      END SUBROUTINE
