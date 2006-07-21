C ***********************************************************
C Fortran file translated from WHIRL Thu Jul 20 15:10:56 2006
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
      TYPE (OpenADTy_active) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      TYPE (OpenADTy_active) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 1)
      TYPE (OpenADTy_active) Y(1 : 1)
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
      __value__(Y(1)) = __value__(X(1))
      CALL setderiv(__deriv__(OpenAD_Symbol_6), __deriv__(X(1)))
      CALL setderiv(__deriv__(Y(1)), __deriv__(OpenAD_Symbol_6))
      IF(__value__(Y(1)) .GT. 0.0D00) THEN
        DO I = 1, 3, 1
          OpenAD_Symbol_2 = (__value__(X(1)) * __value__(Y(1)))
          OpenAD_Symbol_0 = __value__(Y(1))
          OpenAD_Symbol_1 = __value__(X(1))
          __value__(Y(1)) = OpenAD_Symbol_2
          OpenAD_Symbol_7 = OpenAD_Symbol_0
          OpenAD_Symbol_9 = OpenAD_Symbol_1
          CALL setderiv(__deriv__(OpenAD_Symbol_10), __deriv__(Y(1)))
          CALL setderiv(__deriv__(OpenAD_Symbol_8), __deriv__(X(1)))
          CALL sax(OpenAD_Symbol_7, __deriv__(OpenAD_Symbol_8),
     >  __deriv__(Y(1)))
          CALL saxpy(OpenAD_Symbol_9, __deriv__(OpenAD_Symbol_10),
     >  __deriv__(Y(1)))
        END DO
      ELSE
        OpenAD_Symbol_5 = (__value__(Y(1)) / __value__(X(1)))
        OpenAD_Symbol_3 = (INT(1_w2f__i8) / __value__(X(1)))
        OpenAD_Symbol_4 = (-(__value__(Y(1)) /(__value__(X(1)) *
     >  __value__(X(1)))))
        __value__(Y(1)) = OpenAD_Symbol_5
        OpenAD_Symbol_11 = OpenAD_Symbol_3
        OpenAD_Symbol_13 = OpenAD_Symbol_4
        CALL setderiv(__deriv__(OpenAD_Symbol_14), __deriv__(X(1)))
        CALL setderiv(__deriv__(OpenAD_Symbol_12), __deriv__(Y(1)))
        CALL sax(OpenAD_Symbol_11, __deriv__(OpenAD_Symbol_12),
     >  __deriv__(Y(1)))
        CALL saxpy(OpenAD_Symbol_13, __deriv__(OpenAD_Symbol_14),
     >  __deriv__(Y(1)))
      ENDIF
      RETURN
      END SUBROUTINE
