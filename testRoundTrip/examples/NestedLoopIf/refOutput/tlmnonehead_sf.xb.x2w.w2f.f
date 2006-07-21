C ***********************************************************
C Fortran file translated from WHIRL Thu Jul 20 16:02:04 2006
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
        IF(I .eq. INT(1_w2f__i8)) THEN
          OpenAD_Symbol_2 = (__value__(X(I)) * __value__(X(I)))
          OpenAD_Symbol_0 = __value__(X(I))
          OpenAD_Symbol_1 = __value__(X(I))
          __value__(Y(INT(I))) = OpenAD_Symbol_2
          OpenAD_Symbol_5 = OpenAD_Symbol_0
          OpenAD_Symbol_7 = OpenAD_Symbol_1
          CALL setderiv(__deriv__(OpenAD_Symbol_8), __deriv__(X(I)))
          CALL setderiv(__deriv__(OpenAD_Symbol_6), __deriv__(X(I)))
          CALL sax(OpenAD_Symbol_5, __deriv__(OpenAD_Symbol_6),
     >  __deriv__(Y(I)))
          CALL saxpy(OpenAD_Symbol_7, __deriv__(OpenAD_Symbol_8),
     >  __deriv__(Y(I)))
        ELSE
          __value__(Y(INT(I))) = (__value__(X(I)) + __value__(X(I)))
          OpenAD_Symbol_3 = 1_w2f__i8
          OpenAD_Symbol_4 = 1_w2f__i8
          OpenAD_Symbol_9 = OpenAD_Symbol_3
          OpenAD_Symbol_11 = OpenAD_Symbol_4
          CALL setderiv(__deriv__(OpenAD_Symbol_12), __deriv__(X(I)))
          CALL setderiv(__deriv__(OpenAD_Symbol_10), __deriv__(X(I)))
          CALL sax(OpenAD_Symbol_9, __deriv__(OpenAD_Symbol_10),
     >  __deriv__(Y(I)))
          CALL saxpy(OpenAD_Symbol_11, __deriv__(OpenAD_Symbol_12),
     >  __deriv__(Y(I)))
        ENDIF
        __value__(X(INT(I))) = 0.0D00
        CALL zero_deriv(__deriv__(X(INT(I))))
      END DO
      RETURN
      END SUBROUTINE
