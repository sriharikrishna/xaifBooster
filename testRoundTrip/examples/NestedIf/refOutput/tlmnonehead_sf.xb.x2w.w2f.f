
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
      TYPE (OpenADTy_active) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      TYPE (OpenADTy_active) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_14
      TYPE (OpenADTy_active) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      TYPE (OpenADTy_active) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      TYPE (OpenADTy_active) OpenAD_Symbol_19
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
      INTENT(IN)  X
      TYPE (OpenADTy_active) Y(1 : 2)
      INTENT(OUT)  Y
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      IF(__value__(X(1)) .LE. __value__(X(2))) THEN
        IF(__value__(X(1)) .eq. __value__(X(2))) THEN
          OpenAD_Symbol_2 = (__value__(X(1)) * __value__(X(1)))
          OpenAD_Symbol_0 = __value__(X(1))
          OpenAD_Symbol_1 = __value__(X(1))
          __value__(Y(1)) = OpenAD_Symbol_2
          OpenAD_Symbol_7 = OpenAD_Symbol_0
          OpenAD_Symbol_9 = OpenAD_Symbol_1
          CALL setderiv(__deriv__(OpenAD_Symbol_10), __deriv__(X(1)))
          CALL setderiv(__deriv__(OpenAD_Symbol_8), __deriv__(X(1)))
          CALL sax(OpenAD_Symbol_7, __deriv__(OpenAD_Symbol_8),
     >  __deriv__(Y(1)))
          CALL saxpy(OpenAD_Symbol_9, __deriv__(OpenAD_Symbol_10),
     >  __deriv__(Y(1)))
        ELSE
          __value__(Y(1)) = (__value__(X(2)) - __value__(X(1)))
          OpenAD_Symbol_3 = 1_w2f__i8
          OpenAD_Symbol_4 = (-1_w2f__i8)
          OpenAD_Symbol_12 = OpenAD_Symbol_3
          OpenAD_Symbol_14 = OpenAD_Symbol_4
          CALL setderiv(__deriv__(OpenAD_Symbol_15), __deriv__(X(1)))
          CALL setderiv(__deriv__(OpenAD_Symbol_13), __deriv__(X(2)))
          CALL sax(OpenAD_Symbol_12, __deriv__(OpenAD_Symbol_13),
     >  __deriv__(Y(1)))
          CALL saxpy(OpenAD_Symbol_14, __deriv__(OpenAD_Symbol_15),
     >  __deriv__(Y(1)))
        ENDIF
      ELSE
        __value__(Y(1)) = (__value__(X(1)) - __value__(X(2)))
        OpenAD_Symbol_5 = 1_w2f__i8
        OpenAD_Symbol_6 = (-1_w2f__i8)
        OpenAD_Symbol_16 = OpenAD_Symbol_5
        OpenAD_Symbol_18 = OpenAD_Symbol_6
        CALL setderiv(__deriv__(OpenAD_Symbol_19), __deriv__(X(2)))
        CALL setderiv(__deriv__(OpenAD_Symbol_17), __deriv__(X(1)))
        CALL sax(OpenAD_Symbol_16, __deriv__(OpenAD_Symbol_17),
     >  __deriv__(Y(1)))
        CALL saxpy(OpenAD_Symbol_18, __deriv__(OpenAD_Symbol_19),
     >  __deriv__(Y(1)))
      ENDIF
      __value__(Y(2)) = __value__(Y(1))
      CALL setderiv(__deriv__(OpenAD_Symbol_11), __deriv__(Y(1)))
      CALL setderiv(__deriv__(Y(2)), __deriv__(OpenAD_Symbol_11))
      END SUBROUTINE
