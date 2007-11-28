
      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE foo()
      use w2f__types
      IMPLICIT NONE
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      TYPE (OpenADTy_active) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      TYPE (OpenADTy_active) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_14
      TYPE (OpenADTy_active) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y
C
C     **** Local Variables and Functions ****
C
      EXTERNAL foo
      TYPE (OpenADTy_active) T
      TYPE (OpenADTy_active) T2
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      __value__(T) = __value__(X(1))
      OpenAD_Symbol_2 = (__value__(T) * 2.0D00)
      OpenAD_Symbol_0 = 2.0D00
      __value__(T2) = OpenAD_Symbol_2
      OpenAD_Symbol_11 = OpenAD_Symbol_0
      CALL setderiv(__deriv__(OpenAD_Symbol_10), __deriv__(X(1)))
      CALL setderiv(__deriv__(T), __deriv__(OpenAD_Symbol_10))
      CALL sax(OpenAD_Symbol_11, __deriv__(OpenAD_Symbol_10), __deriv__
     > (T2))
      CALL foo()
      OpenAD_Symbol_9 = (__value__(T2) * 3.0D00 + __value__(T) * 2.0D00
     > )
      OpenAD_Symbol_5 = 3.0D00
      OpenAD_Symbol_3 = 1_w2f__i8
      OpenAD_Symbol_7 = 2.0D00
      OpenAD_Symbol_4 = 1_w2f__i8
      __value__(Y) = OpenAD_Symbol_9
      OpenAD_Symbol_12 = (OpenAD_Symbol_5 * OpenAD_Symbol_3)
      OpenAD_Symbol_14 = (OpenAD_Symbol_7 * OpenAD_Symbol_4)
      CALL setderiv(__deriv__(OpenAD_Symbol_15), __deriv__(T))
      CALL setderiv(__deriv__(OpenAD_Symbol_13), __deriv__(T2))
      CALL sax(OpenAD_Symbol_12, __deriv__(OpenAD_Symbol_13), __deriv__
     > (Y))
      CALL saxpy(OpenAD_Symbol_14, __deriv__(OpenAD_Symbol_15),
     >  __deriv__(Y))
      END SUBROUTINE
