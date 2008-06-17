
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
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y(1 : 2)
      INTENT(OUT)  Y
C
C     **** Local Variables and Functions ****
C
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
      DO I = 1, 2, 1
        IF(I .eq. 1) THEN
          __value__(Y(INT(I))) = (__value__(X(I)) * __value__(X(I)))
          OpenAD_Symbol_0 = __value__(X(I))
          OpenAD_Symbol_1 = __value__(X(I))
          CALL sax(OpenAD_Symbol_0, __deriv__(X(I)), __deriv__(Y(I)))
          CALL saxpy(OpenAD_Symbol_1, __deriv__(X(I)), __deriv__(Y(I)))
        ELSE
          __value__(Y(INT(I))) = (__value__(X(I)) + __value__(X(I)))
          OpenAD_Symbol_2 = 1_w2f__i8
          OpenAD_Symbol_3 = 1_w2f__i8
          CALL sax(1_w2f__i8, __deriv__(X(I)), __deriv__(Y(I)))
          CALL saxpy(1_w2f__i8, __deriv__(X(I)), __deriv__(Y(I)))
        ENDIF
        __value__(X(INT(I))) = 0.0
        CALL zero_deriv(__deriv__(X(INT(I))))
      END DO
      END SUBROUTINE
