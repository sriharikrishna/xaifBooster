
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
      REAL(w2f__8) OpenAD_Symbol_3
      TYPE (OpenADTy_active) OpenAD_Symbol_4
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
      __value__(Y(1)) = 0.0
      __value__(Y(2)) = 0.0
      CALL zero_deriv(__deriv__(Y(1)))
      CALL zero_deriv(__deriv__(Y(2)))
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        J = 1
        DO WHILE(J .LT. 3)
          __value__(Y(INT(I))) = (__value__(Y(I)) + __value__(X(I)) *
     >  __value__(X(J)))
          OpenAD_Symbol_0 = 1_w2f__i8
          OpenAD_Symbol_2 = __value__(X(J))
          OpenAD_Symbol_3 = __value__(X(I))
          OpenAD_Symbol_1 = 1_w2f__i8
          CALL setderiv(__deriv__(OpenAD_Symbol_4), __deriv__(Y(I)))
          CALL sax(OpenAD_Symbol_2, __deriv__(X(I)), __deriv__(Y(I)))
          CALL saxpy(OpenAD_Symbol_3, __deriv__(X(J)), __deriv__(Y(I)))
          CALL saxpy(1_w2f__i8, __deriv__(OpenAD_Symbol_4), __deriv__(Y
     > (I)))
          J = J + 1
        END DO
      END DO
      END SUBROUTINE
