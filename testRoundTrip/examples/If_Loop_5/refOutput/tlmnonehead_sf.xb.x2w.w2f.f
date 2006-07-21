C ***********************************************************
C Fortran file translated from WHIRL Thu Jul 20 15:43:04 2006
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
      REAL(w2f__8) OpenAD_Symbol_11
      TYPE (OpenADTy_active) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      TYPE (OpenADTy_active) OpenAD_Symbol_14
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
      INTEGER(w2f__i4) I
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
      t__1 = I .LT. 3
      DO WHILE(t__1)
        IF(I .LT. INT(2_w2f__i8)) THEN
          OpenAD_Symbol_1 = SIN(__value__(X(1)))
          OpenAD_Symbol_0 = COS(__value__(X(1)))
          __value__(Y(2)) = OpenAD_Symbol_1
          OpenAD_Symbol_7 = OpenAD_Symbol_0
          CALL setderiv(__deriv__(OpenAD_Symbol_8), __deriv__(X(1)))
          CALL sax(OpenAD_Symbol_7, __deriv__(OpenAD_Symbol_8),
     >  __deriv__(Y(2)))
        ELSE
          OpenAD_Symbol_3 = COS(__value__(X(2)))
          OpenAD_Symbol_2 = (- SIN(__value__(X(2))))
          __value__(Y(1)) = OpenAD_Symbol_3
          OpenAD_Symbol_9 = OpenAD_Symbol_2
          CALL setderiv(__deriv__(OpenAD_Symbol_10), __deriv__(X(2)))
          CALL sax(OpenAD_Symbol_9, __deriv__(OpenAD_Symbol_10),
     >  __deriv__(Y(1)))
        ENDIF
        I = I + 1
        t__1 = I .LT. 3
      END DO
      OpenAD_Symbol_6 = (__value__(Y(1)) * __value__(Y(2)))
      OpenAD_Symbol_4 = __value__(Y(2))
      OpenAD_Symbol_5 = __value__(Y(1))
      __value__(Y(2)) = OpenAD_Symbol_6
      OpenAD_Symbol_11 = OpenAD_Symbol_4
      OpenAD_Symbol_13 = OpenAD_Symbol_5
      CALL setderiv(__deriv__(OpenAD_Symbol_14), __deriv__(Y(2)))
      CALL setderiv(__deriv__(OpenAD_Symbol_12), __deriv__(Y(1)))
      CALL sax(OpenAD_Symbol_11, __deriv__(OpenAD_Symbol_12), __deriv__
     > (Y(2)))
      CALL saxpy(OpenAD_Symbol_13, __deriv__(OpenAD_Symbol_14),
     >  __deriv__(Y(2)))
      RETURN
      END SUBROUTINE
