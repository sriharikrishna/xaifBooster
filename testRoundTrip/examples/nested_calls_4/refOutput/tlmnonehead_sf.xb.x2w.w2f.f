
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
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 4)
      TYPE (OpenADTy_active) Y(1 : 4)
C
C     **** Local Variables and Functions ****
C
      TYPE (OpenADTy_active) C
      TYPE (OpenADTy_active) D
      EXTERNAL foo
      REAL(w2f__8) P
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      P = 2.0D00
      CALL foo(__deriv__(X(1)), __deriv__(X(2)), __deriv__(C),
     >  __deriv__(D))
C     $OpenAD$ INLINE convert_p2a_scalar(subst,subst)
      CALL convert_p2a_scalar(__deriv__(OpenAD_Symbol_0), P)
      CALL foo(__deriv__(X(1)), __deriv__(OpenAD_Symbol_0), __deriv__(C
     > ), __deriv__(D))
C     $OpenAD$ INLINE convert_a2p_scalar(subst,subst)
      CALL convert_a2p_scalar(P, __deriv__(OpenAD_Symbol_0))
      __value__(Y(3)) = (__value__(C) * __value__(D))
      OpenAD_Symbol_1 = __value__(D)
      OpenAD_Symbol_2 = __value__(C)
      CALL sax(OpenAD_Symbol_1, __deriv__(C), __deriv__(Y(3)))
      CALL saxpy(OpenAD_Symbol_2, __deriv__(D), __deriv__(Y(3)))
      __value__(Y(4)) = (__value__(C) + __value__(D))
      OpenAD_Symbol_3 = 1_w2f__i8
      OpenAD_Symbol_4 = 1_w2f__i8
      CALL sax(1_w2f__i8, __deriv__(C), __deriv__(Y(4)))
      CALL saxpy(1_w2f__i8, __deriv__(D), __deriv__(Y(4)))
      END SUBROUTINE

      SUBROUTINE foo(A, B, C, D)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) A
      TYPE (OpenADTy_active) B
      TYPE (OpenADTy_active) C
      TYPE (OpenADTy_active) D
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_5 = (__value__(A) * __value__(B))
      __value__(C) = SIN(OpenAD_Symbol_5)
      OpenAD_Symbol_7 = __value__(B)
      OpenAD_Symbol_8 = __value__(A)
      OpenAD_Symbol_6 = COS(OpenAD_Symbol_5)
      OpenAD_Symbol_9 = (__value__(A) + __value__(B))
      __value__(D) = COS(OpenAD_Symbol_9)
      OpenAD_Symbol_11 = 1_w2f__i8
      OpenAD_Symbol_12 = 1_w2f__i8
      OpenAD_Symbol_10 = (- SIN(OpenAD_Symbol_9))
      OpenAD_Symbol_13 = (OpenAD_Symbol_7 * OpenAD_Symbol_6)
      OpenAD_Symbol_14 = (OpenAD_Symbol_8 * OpenAD_Symbol_6)
      CALL sax(OpenAD_Symbol_13, __deriv__(A), __deriv__(C))
      CALL saxpy(OpenAD_Symbol_14, __deriv__(B), __deriv__(C))
      CALL sax(OpenAD_Symbol_10, __deriv__(A), __deriv__(D))
      CALL saxpy(OpenAD_Symbol_10, __deriv__(B), __deriv__(D))
      END SUBROUTINE
