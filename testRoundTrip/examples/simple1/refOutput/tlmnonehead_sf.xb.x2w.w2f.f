C ***********************************************************
C Fortran file translated from WHIRL Thu Jul 20 16:17:18 2006
C ***********************************************************
C ***********************************************************

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
      REAL(w2f__8) OpenAD_Symbol_10
      TYPE (OpenADTy_active) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      TYPE (OpenADTy_active) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y(1 : 2)
C
C     **** Local Variables and Functions ****
C
      TYPE (OpenADTy_active) T
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_2 = (__value__(X(1)) * __value__(X(2)))
      OpenAD_Symbol_0 = __value__(X(2))
      OpenAD_Symbol_1 = __value__(X(1))
      __value__(T) = OpenAD_Symbol_2
      OpenAD_Symbol_4 = SIN(__value__(T))
      OpenAD_Symbol_3 = COS(__value__(T))
      __value__(Y(1)) = OpenAD_Symbol_4
      OpenAD_Symbol_6 = COS(__value__(T))
      OpenAD_Symbol_5 = (- SIN(__value__(T)))
      __value__(Y(2)) = OpenAD_Symbol_6
      OpenAD_Symbol_7 = (OpenAD_Symbol_0 * OpenAD_Symbol_3)
      OpenAD_Symbol_9 = (OpenAD_Symbol_0 * OpenAD_Symbol_5)
      OpenAD_Symbol_10 = (OpenAD_Symbol_1 * OpenAD_Symbol_3)
      OpenAD_Symbol_12 = (OpenAD_Symbol_1 * OpenAD_Symbol_5)
      CALL setderiv(__deriv__(OpenAD_Symbol_11), __deriv__(X(2)))
      CALL setderiv(__deriv__(OpenAD_Symbol_8), __deriv__(X(1)))
      CALL sax(OpenAD_Symbol_7, __deriv__(OpenAD_Symbol_8), __deriv__(Y
     > (1)))
      CALL sax(OpenAD_Symbol_9, __deriv__(OpenAD_Symbol_8), __deriv__(Y
     > (2)))
      CALL saxpy(OpenAD_Symbol_10, __deriv__(OpenAD_Symbol_11),
     >  __deriv__(Y(1)))
      CALL saxpy(OpenAD_Symbol_12, __deriv__(OpenAD_Symbol_11),
     >  __deriv__(Y(2)))
      RETURN
      END SUBROUTINE
