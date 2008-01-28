
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
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_6
      TYPE (OpenADTy_active) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      TYPE (OpenADTy_active) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 3)
      INTENT(IN)  X
      TYPE (OpenADTy_active) Y(1 : 3)
      INTENT(OUT)  Y
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) select_expr_temp_0
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      DO I = 1, 3, 1
        select_expr_temp_0 = I
        IF ( I  .EQ.  1)  GO TO  19
        IF ( I  .EQ.  2)  GO TO  23
        GO TO 24
24      CONTINUE
        __value__(Y(INT(I))) = (__value__(X(I)) * 2.0D00)
        OpenAD_Symbol_4 = 2.0D00
        OpenAD_Symbol_10 = OpenAD_Symbol_4
        CALL sax(OpenAD_Symbol_10, __deriv__(X(I)), __deriv__(Y(I)))
        GO TO 21
19      CONTINUE
        OpenAD_Symbol_1 = SIN(__value__(X(I)))
        OpenAD_Symbol_0 = COS(__value__(X(I)))
        __value__(Y(INT(I))) = OpenAD_Symbol_1
        OpenAD_Symbol_6 = OpenAD_Symbol_0
        CALL setderiv(__deriv__(OpenAD_Symbol_7), __deriv__(X(I)))
        CALL sax(OpenAD_Symbol_6, __deriv__(OpenAD_Symbol_7), __deriv__
     > (Y(I)))
        GO TO 21
23      CONTINUE
        OpenAD_Symbol_3 = COS(__value__(X(I)))
        OpenAD_Symbol_2 = (- SIN(__value__(X(I))))
        __value__(Y(INT(I))) = OpenAD_Symbol_3
        OpenAD_Symbol_8 = OpenAD_Symbol_2
        CALL setderiv(__deriv__(OpenAD_Symbol_9), __deriv__(X(I)))
        CALL sax(OpenAD_Symbol_8, __deriv__(OpenAD_Symbol_9), __deriv__
     > (Y(I)))
        GO TO 21
21      CONTINUE
      END DO
      END SUBROUTINE
