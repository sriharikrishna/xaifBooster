C ***********************************************************
C Fortran file translated from WHIRL Mon Jan 15 10:49:37 2007
C ***********************************************************
C ***********************************************************


      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      type(active) :: OpenAD_Symbol_4
      type(active) :: OpenAD_Symbol_5
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      INTENT(IN)  X
      type(active) :: Y(1 : 2)
      INTENT(OUT)  Y
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) K
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        K = I
        IF(I .eq. INT(1_w2f__i8)) THEN
          OpenAD_Symbol_2 = (2.0D00*X(I)%v)
          OpenAD_Symbol_1 = 2.0D00
          Y(INT(I))%v = OpenAD_Symbol_2
          OpenAD_Symbol_3 = OpenAD_Symbol_1
          CALL setderiv(OpenAD_Symbol_4,X(I))
          CALL sax(OpenAD_Symbol_3,OpenAD_Symbol_4,Y(I))
        ENDIF
        Y(INT(I))%v = X(K)%v
        CALL setderiv(OpenAD_Symbol_5,X(K))
        CALL setderiv(Y(I),OpenAD_Symbol_5)
      END DO
      RETURN
      END SUBROUTINE
