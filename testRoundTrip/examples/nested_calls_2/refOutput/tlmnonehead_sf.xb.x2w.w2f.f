
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
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      TYPE (OpenADTy_active) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      TYPE (OpenADTy_active) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 4)
      TYPE (OpenADTy_active) Y(1 : 4)
C
C     **** Local Variables and Functions ****
C
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
      CALL foo(__deriv__(X(1)), __deriv__(X(2)), __deriv__(Y(1)))
      CALL foo(__deriv__(X(1)), __deriv__(X(2)), __deriv__(Y(1)))
      OpenAD_Symbol_0 = (__value__(X(1)) * __value__(X(2)))
      __value__(Y(2)) = SIN(OpenAD_Symbol_0)
      OpenAD_Symbol_2 = __value__(X(2))
      OpenAD_Symbol_3 = __value__(X(1))
      OpenAD_Symbol_1 = COS(OpenAD_Symbol_0)
      OpenAD_Symbol_17 = (OpenAD_Symbol_2 * OpenAD_Symbol_1)
      OpenAD_Symbol_18 = (OpenAD_Symbol_3 * OpenAD_Symbol_1)
      CALL sax(OpenAD_Symbol_17, __deriv__(X(1)), __deriv__(Y(2)))
      CALL saxpy(OpenAD_Symbol_18, __deriv__(X(2)), __deriv__(Y(2)))
      OpenAD_Symbol_5 = SIN(__value__(X(3)))
      OpenAD_Symbol_4 = COS(__value__(X(3)))
      __value__(Y(3)) = OpenAD_Symbol_5
      CALL setderiv(__deriv__(OpenAD_Symbol_19), __deriv__(X(3)))
      CALL sax(OpenAD_Symbol_4, __deriv__(OpenAD_Symbol_19), __deriv__(
     > Y(3)))
      OpenAD_Symbol_7 = COS(__value__(X(4)))
      OpenAD_Symbol_6 = (- SIN(__value__(X(4))))
      __value__(Y(4)) = OpenAD_Symbol_7
      CALL setderiv(__deriv__(OpenAD_Symbol_20), __deriv__(X(4)))
      CALL sax(OpenAD_Symbol_6, __deriv__(OpenAD_Symbol_20), __deriv__(
     > Y(4)))
      END SUBROUTINE

      SUBROUTINE foo(A, B, C)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) A
      TYPE (OpenADTy_active) B
      TYPE (OpenADTy_active) C
C
C     **** Local Variables and Functions ****
C
      EXTERNAL bar
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      CALL bar(__deriv__(B))
      __value__(C) = (__value__(B) + __value__(A) * __value__(A))
      OpenAD_Symbol_8 = 1_w2f__i8
      OpenAD_Symbol_10 = __value__(A)
      OpenAD_Symbol_11 = __value__(A)
      OpenAD_Symbol_9 = 1_w2f__i8
      CALL sax(OpenAD_Symbol_10, __deriv__(A), __deriv__(C))
      CALL saxpy(OpenAD_Symbol_11, __deriv__(A), __deriv__(C))
      CALL saxpy(1_w2f__i8, __deriv__(B), __deriv__(C))
      END SUBROUTINE

      SUBROUTINE bar(A)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_22
      TYPE (OpenADTy_active) OpenAD_Symbol_23
      TYPE (OpenADTy_active) OpenAD_Symbol_24
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) A
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_12 = (__value__(A) * __value__(A))
      OpenAD_Symbol_16 = COS(OpenAD_Symbol_12)
      OpenAD_Symbol_14 = __value__(A)
      OpenAD_Symbol_15 = __value__(A)
      OpenAD_Symbol_13 = (- SIN(OpenAD_Symbol_12))
      __value__(A) = OpenAD_Symbol_16
      OpenAD_Symbol_21 = (OpenAD_Symbol_14 * OpenAD_Symbol_13)
      OpenAD_Symbol_22 = (OpenAD_Symbol_15 * OpenAD_Symbol_13)
      CALL setderiv(__deriv__(OpenAD_Symbol_23), __deriv__(A))
      CALL setderiv(__deriv__(OpenAD_Symbol_24), __deriv__(A))
      CALL sax(OpenAD_Symbol_21, __deriv__(OpenAD_Symbol_23), __deriv__
     > (A))
      CALL saxpy(OpenAD_Symbol_22, __deriv__(OpenAD_Symbol_24),
     >  __deriv__(A))
      END SUBROUTINE
