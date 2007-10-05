C ***********************************************************
C Fortran file translated from WHIRL Fri Oct  5 00:06:49 2007
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
      REAL(w2f__8) OpenAD_Symbol_10
      TYPE (OpenADTy_active) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      TYPE (OpenADTy_active) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      TYPE (OpenADTy_active) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      TYPE (OpenADTy_active) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y(1 : 2)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      TYPE (OpenADTy_active) S
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
        __value__(S) = __value__(X(I))
        CALL setderiv(__deriv__(OpenAD_Symbol_5), __deriv__(X(I)))
        CALL setderiv(__deriv__(S), __deriv__(OpenAD_Symbol_5))
        IF(__value__(S) .LT. 0.0D00) THEN
          OpenAD_Symbol_2 = (__value__(X(I)) * 2.0D00)
          OpenAD_Symbol_0 = 2.0D00
          __value__(X(INT(I))) = OpenAD_Symbol_2
          OpenAD_Symbol_6 = OpenAD_Symbol_0
          CALL setderiv(__deriv__(OpenAD_Symbol_7), __deriv__(X(I)))
          CALL sax(OpenAD_Symbol_6, __deriv__(OpenAD_Symbol_7),
     >  __deriv__(X(I)))
        ELSE
          __value__(S) = 0.0D00
          CALL zero_deriv(__deriv__(S))
        ENDIF
        __value__(Y(INT(I))) = (__value__(X(I)) + __value__(S))
        OpenAD_Symbol_3 = 1_w2f__i8
        OpenAD_Symbol_4 = 1_w2f__i8
        OpenAD_Symbol_8 = OpenAD_Symbol_3
        OpenAD_Symbol_10 = OpenAD_Symbol_4
        CALL setderiv(__deriv__(OpenAD_Symbol_11), __deriv__(S))
        CALL setderiv(__deriv__(OpenAD_Symbol_9), __deriv__(X(I)))
        CALL sax(OpenAD_Symbol_8, __deriv__(OpenAD_Symbol_9), __deriv__
     > (Y(I)))
        CALL saxpy(OpenAD_Symbol_10, __deriv__(OpenAD_Symbol_11),
     >  __deriv__(Y(I)))
      END DO
      END SUBROUTINE