
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
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 1)
      TYPE (OpenADTy_active) Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      LOGICAL(w2f__i4) L
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      L = .TRUE.
      IF(L) THEN
        __value__(Y(1)) = (__value__(X(1)) * 4.0D00)
        OpenAD_Symbol_0 = 4.0D00
        CALL sax(4.0D00, __deriv__(X(1)), __deriv__(Y(1)))
      ELSE
        __value__(Y(1)) = (__value__(X(1)) * 2.0D00)
        OpenAD_Symbol_2 = 2.0D00
        CALL sax(2.0D00, __deriv__(X(1)), __deriv__(Y(1)))
      ENDIF
      END SUBROUTINE
