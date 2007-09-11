C ***********************************************************
C Fortran file translated from WHIRL Thu Sep  6 23:43:42 2007
C ***********************************************************
C ***********************************************************

      MODULE all_globals_mod
      use w2f__types
      use active_module
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      type(active) :: OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      type(active) :: OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 1)
      type(active) :: Y(1 : 1)
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
        OpenAD_Symbol_2 = (X(1)%v*4.0D00)
        OpenAD_Symbol_0 = 4.0D00
        Y(1)%v = OpenAD_Symbol_2
        OpenAD_Symbol_6 = OpenAD_Symbol_0
        CALL setderiv(OpenAD_Symbol_7,X(1))
        CALL sax(OpenAD_Symbol_6,OpenAD_Symbol_7,Y(1))
      ELSE
        OpenAD_Symbol_5 = (X(1)%v*2.0D00)
        OpenAD_Symbol_3 = 2.0D00
        Y(1)%v = OpenAD_Symbol_5
        OpenAD_Symbol_8 = OpenAD_Symbol_3
        CALL setderiv(OpenAD_Symbol_9,X(1))
        CALL sax(OpenAD_Symbol_8,OpenAD_Symbol_9,Y(1))
      ENDIF
      RETURN
      END SUBROUTINE
