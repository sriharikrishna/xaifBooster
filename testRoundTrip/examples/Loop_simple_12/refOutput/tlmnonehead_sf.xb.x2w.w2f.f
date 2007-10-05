C ***********************************************************
C Fortran file translated from WHIRL Fri Oct  5 00:06:42 2007
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
      TYPE (OpenADTy_active) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      TYPE (OpenADTy_active) OpenAD_Symbol_6
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
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) J
      LOGICAL(w2f__i4) t__1
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      I = 1
      __value__(Y(1)) = 0.0D00
      __value__(Y(2)) = 0.0D00
      CALL zero_deriv(__deriv__(Y(1)))
      CALL zero_deriv(__deriv__(Y(2)))
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        J = 1
        t__1 = J .LT. 3
        DO WHILE(J .LT. INT(3_w2f__i8))
          OpenAD_Symbol_4 = (__value__(Y(I)) + __value__(X(I)) *
     >  __value__(X(J)))
          OpenAD_Symbol_0 = 1_w2f__i8
          OpenAD_Symbol_2 = __value__(X(J))
          OpenAD_Symbol_3 = __value__(X(I))
          OpenAD_Symbol_1 = 1_w2f__i8
          __value__(Y(INT(I))) = OpenAD_Symbol_4
          OpenAD_Symbol_5 = (OpenAD_Symbol_2 * OpenAD_Symbol_1)
          OpenAD_Symbol_7 = (OpenAD_Symbol_3 * OpenAD_Symbol_1)
          OpenAD_Symbol_9 = OpenAD_Symbol_0
          CALL setderiv(__deriv__(OpenAD_Symbol_10), __deriv__(Y(I)))
          CALL setderiv(__deriv__(OpenAD_Symbol_8), __deriv__(X(J)))
          CALL setderiv(__deriv__(OpenAD_Symbol_6), __deriv__(X(I)))
          CALL sax(OpenAD_Symbol_5, __deriv__(OpenAD_Symbol_6),
     >  __deriv__(Y(I)))
          CALL saxpy(OpenAD_Symbol_7, __deriv__(OpenAD_Symbol_8),
     >  __deriv__(Y(I)))
          CALL saxpy(OpenAD_Symbol_9, __deriv__(OpenAD_Symbol_10),
     >  __deriv__(Y(I)))
          J = J + 1
          t__1 = J .LT. 3
        END DO
      END DO
      END SUBROUTINE