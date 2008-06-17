
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
      REAL(w2f__8) OpenAD_Symbol_2
      TYPE (OpenADTy_active) OpenAD_Symbol_3
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 10)
      TYPE (OpenADTy_active) Y(1 : 1)
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
      DO I = 1, 10, 1
        IF(I .eq. 1) THEN
          __value__(Y(1)) = __value__(X(1))
          CALL setderiv(__deriv__(Y(1)), __deriv__(X(1)))
        ELSE
          OpenAD_Symbol_2 = (__value__(X(I)) * __value__(Y(1)))
          OpenAD_Symbol_0 = __value__(Y(1))
          OpenAD_Symbol_1 = __value__(X(I))
          __value__(Y(1)) = OpenAD_Symbol_2
          CALL setderiv(__deriv__(OpenAD_Symbol_3), __deriv__(Y(1)))
          CALL sax(OpenAD_Symbol_0, __deriv__(X(I)), __deriv__(Y(1)))
          CALL saxpy(OpenAD_Symbol_1, __deriv__(OpenAD_Symbol_3),
     >  __deriv__(Y(1)))
        ENDIF
      END DO
      END SUBROUTINE
