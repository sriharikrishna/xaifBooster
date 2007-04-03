C ***********************************************************
C Fortran file translated from WHIRL Mon Apr  2 13:27:26 2007
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
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      TYPE (OpenADTy_active) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y(1 : 1)
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
C     open(3,file='data.tmp')
      OPEN(UNIT = 3, FILE = 'data.tmp')
      WRITE(3, '(EN26.16E3,EN26.16E3)') __value__(X)
C     close(3)
      CLOSE(UNIT = 3)
C     open(3,file='data.tmp')
      OPEN(UNIT = 3, FILE = 'data.tmp')
      READ(3, '(EN26.16E3,EN26.16E3)') X
C     close(3)
      CLOSE(UNIT = 3)
      OpenAD_Symbol_6 = (__value__(X(1)) * 2.0D00 + __value__(X(2)) *
     >  3.0D00)
      OpenAD_Symbol_2 = 2.0D00
      OpenAD_Symbol_0 = 1_w2f__i8
      OpenAD_Symbol_4 = 3.0D00
      OpenAD_Symbol_1 = 1_w2f__i8
      __value__(Y(1)) = OpenAD_Symbol_6
      OpenAD_Symbol_7 = (OpenAD_Symbol_2 * OpenAD_Symbol_0)
      OpenAD_Symbol_9 = (OpenAD_Symbol_4 * OpenAD_Symbol_1)
      CALL setderiv(__deriv__(OpenAD_Symbol_10), __deriv__(X(2)))
      CALL setderiv(__deriv__(OpenAD_Symbol_8), __deriv__(X(1)))
      CALL sax(OpenAD_Symbol_7, __deriv__(OpenAD_Symbol_8), __deriv__(Y
     > (1)))
      CALL saxpy(OpenAD_Symbol_9, __deriv__(OpenAD_Symbol_10),
     >  __deriv__(Y(1)))
      RETURN
      END SUBROUTINE
