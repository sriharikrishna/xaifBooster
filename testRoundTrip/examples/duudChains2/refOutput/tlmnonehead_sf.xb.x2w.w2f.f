C ***********************************************************
C Fortran file translated from WHIRL Fri Oct  5 00:01:14 2007
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
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      TYPE (OpenADTy_active) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      TYPE (OpenADTy_active) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 1)
      TYPE (OpenADTy_active) Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      LOGICAL(w2f__i4) L
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      L = .TRUE.
      IF(L) THEN
        OpenAD_Symbol_2 = (__value__(X(1)) * 4.0D00)
        OpenAD_Symbol_0 = 4.0D00
        __value__(Y(1)) = OpenAD_Symbol_2
        OpenAD_Symbol_6 = OpenAD_Symbol_0
        CALL setderiv(__deriv__(OpenAD_Symbol_7), __deriv__(X(1)))
        CALL sax(OpenAD_Symbol_6, __deriv__(OpenAD_Symbol_7), __deriv__
     > (Y(1)))
      ELSE
        OpenAD_Symbol_5 = (__value__(X(1)) * 2.0D00)
        OpenAD_Symbol_3 = 2.0D00
        __value__(Y(1)) = OpenAD_Symbol_5
        OpenAD_Symbol_8 = OpenAD_Symbol_3
        CALL setderiv(__deriv__(OpenAD_Symbol_9), __deriv__(X(1)))
        CALL sax(OpenAD_Symbol_8, __deriv__(OpenAD_Symbol_9), __deriv__
     > (Y(1)))
      ENDIF
      END SUBROUTINE
