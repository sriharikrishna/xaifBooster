C ***********************************************************
C Fortran file translated from WHIRL Tue Nov 28 15:44:06 2006
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
      TYPE (OpenADTy_active) OpenAD_Symbol_0
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 1)
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
      WRITE(3, '(EN26.16E3)') __value__(X(1))
C     close(3)
      CLOSE(UNIT = 3)
C     open(3,file='data.tmp')
      OPEN(UNIT = 3, FILE = 'data.tmp')
      READ(3, '(EN26.16E3)') X(1)
C     close(3)
      CLOSE(UNIT = 3)
      __value__(Y(1)) = __value__(X(1))
      CALL setderiv(__deriv__(OpenAD_Symbol_0), __deriv__(X(1)))
      CALL setderiv(__deriv__(Y(1)), __deriv__(OpenAD_Symbol_0))
      RETURN
      END SUBROUTINE
