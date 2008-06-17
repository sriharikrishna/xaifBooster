
      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Global Variables & Derived Type Definitions ****
C
      INTEGER(w2f__i4) G
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE foo(A, N)
      use w2f__types
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_2
      TYPE (OpenADTy_active) OpenAD_Symbol_5
C
C     **** Parameters and Result ****
C
      INTEGER(w2f__i4) N
      TYPE (OpenADTy_active) A(1 : INT((N + G)))
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      DO I = 1, (N + 1), 1
        OpenAD_Symbol_2 = (__value__(A(I)) * 2.0D00)
        OpenAD_Symbol_0 = 2.0D00
        __value__(A(INT(I))) = OpenAD_Symbol_2
        CALL setderiv(__deriv__(OpenAD_Symbol_5), __deriv__(A(I)))
        CALL sax(2.0D00, __deriv__(OpenAD_Symbol_5), __deriv__(A(I)))
      END DO
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      TYPE (OpenADTy_active) OpenAD_Symbol_6
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 3)
      TYPE (OpenADTy_active) Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      EXTERNAL foo
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
      G = 1
      I = 2
      CALL foo(__deriv__(X), 2)
      CALL foo(__deriv__(X), I)
      __value__(Y(1)) = 0
      CALL zero_deriv(__deriv__(Y(1)))
      DO I = 1, 3, 1
        __value__(Y(1)) = (__value__(X(I)) + __value__(Y(1)))
        OpenAD_Symbol_3 = 1_w2f__i8
        OpenAD_Symbol_4 = 1_w2f__i8
        CALL setderiv(__deriv__(OpenAD_Symbol_6), __deriv__(Y(1)))
        CALL sax(1_w2f__i8, __deriv__(X(I)), __deriv__(Y(1)))
        CALL saxpy(1_w2f__i8, __deriv__(OpenAD_Symbol_6), __deriv__(Y(1
     > )))
      END DO
      END SUBROUTINE
