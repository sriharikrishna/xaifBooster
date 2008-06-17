
      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE foo(A, X)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_5
      TYPE (OpenADTy_active) OpenAD_Symbol_6
      TYPE (OpenADTy_active) OpenAD_Symbol_7
C
C     **** Parameters and Result ****
C
      CHARACTER(*) A
      TYPE (OpenADTy_active) X
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      IF(A .EQ. 'two') THEN
        OpenAD_Symbol_2 = (__value__(X) * 2.0D00)
        OpenAD_Symbol_0 = 2.0D00
        __value__(X) = OpenAD_Symbol_2
        CALL setderiv(__deriv__(OpenAD_Symbol_6), __deriv__(X))
        CALL sax(2.0D00, __deriv__(OpenAD_Symbol_6), __deriv__(X))
      ENDIF
      IF(A .EQ. 'three') THEN
        OpenAD_Symbol_5 = (__value__(X) * 3.0D00)
        OpenAD_Symbol_3 = 3.0D00
        __value__(X) = OpenAD_Symbol_5
        CALL setderiv(__deriv__(OpenAD_Symbol_7), __deriv__(X))
        CALL sax(3.0D00, __deriv__(OpenAD_Symbol_7), __deriv__(X))
      ENDIF
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 1)
      TYPE (OpenADTy_active) Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      CHARACTER(10) A
      EXTERNAL foo
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      A = 'two'
      CALL foo(A, __deriv__(X))
      A = 'three'
      CALL foo(A, __deriv__(X))
      A = 'four'
      __value__(Y(1)) = __value__(X(1))
      CALL setderiv(__deriv__(Y(1)), __deriv__(X(1)))
      END SUBROUTINE
