C ***********************************************************
C Fortran file translated from WHIRL Fri Oct  5 00:01:12 2007
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
      type(active) :: X(1 : 2)
      type(active) :: Y(1 : 2)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      type(active) :: T(1 : 2)
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
        OpenAD_Symbol_2 = (X(I)%v*2.0D00)
        OpenAD_Symbol_0 = 2.0D00
        T(INT(I))%v = OpenAD_Symbol_2
        OpenAD_Symbol_6 = OpenAD_Symbol_0
        CALL setderiv(OpenAD_Symbol_7,X(I))
        CALL sax(OpenAD_Symbol_6,OpenAD_Symbol_7,T(I))
        OpenAD_Symbol_5 = (T(I)%v*4.0D00)
        OpenAD_Symbol_3 = 4.0D00
        Y(INT(I))%v = OpenAD_Symbol_5
        OpenAD_Symbol_8 = OpenAD_Symbol_3
        CALL setderiv(OpenAD_Symbol_9,T(I))
        CALL sax(OpenAD_Symbol_8,OpenAD_Symbol_9,Y(I))
      END DO
      END SUBROUTINE
