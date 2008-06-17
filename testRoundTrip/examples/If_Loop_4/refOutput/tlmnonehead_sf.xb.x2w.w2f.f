
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
      REAL(w2f__8) OpenAD_Symbol_10
      TYPE (OpenADTy_active) OpenAD_Symbol_11
      TYPE (OpenADTy_active) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 10)
      INTENT(IN)  X
      TYPE (OpenADTy_active) Y(1 : 10)
      INTENT(OUT)  Y
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      REAL(w2f__8) PI
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      PI = 3.14149999618530273438D00
      DO I = 1, 9, 1
        IF(I .GT. 5) THEN
          OpenAD_Symbol_0 = SIN(__value__(X(I)))
          __value__(Y(INT(I))) = (PI * OpenAD_Symbol_0)
          OpenAD_Symbol_3 = COS(__value__(X(I)))
          OpenAD_Symbol_2 = PI
          OpenAD_Symbol_10 = (OpenAD_Symbol_3 * OpenAD_Symbol_2)
          CALL sax(OpenAD_Symbol_10, __deriv__(X(I)), __deriv__(Y(I)))
        ELSE
          __value__(Y(INT(I))) = (PI + COS(__value__(X(I))))
          OpenAD_Symbol_6 = (- SIN(__value__(X(I))))
          OpenAD_Symbol_5 = 1_w2f__i8
          CALL sax(OpenAD_Symbol_6, __deriv__(X(I)), __deriv__(Y(I)))
        ENDIF
      END DO
      OpenAD_Symbol_9 = (__value__(Y(1)) * __value__(Y(9)))
      OpenAD_Symbol_7 = __value__(Y(9))
      OpenAD_Symbol_8 = __value__(Y(1))
      __value__(Y(10)) = OpenAD_Symbol_9
      CALL setderiv(__deriv__(OpenAD_Symbol_11), __deriv__(Y(1)))
      CALL setderiv(__deriv__(OpenAD_Symbol_12), __deriv__(Y(9)))
      CALL sax(OpenAD_Symbol_7, __deriv__(OpenAD_Symbol_11), __deriv__(
     > Y(10)))
      CALL saxpy(OpenAD_Symbol_8, __deriv__(OpenAD_Symbol_12),
     >  __deriv__(Y(10)))
      END SUBROUTINE
