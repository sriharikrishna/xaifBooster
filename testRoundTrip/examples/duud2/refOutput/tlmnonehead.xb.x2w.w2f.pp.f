

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
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 1)
      type(active) :: Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      type(active) :: LOCALX(1 : 1)
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      LOCALX(1)%v = (X(1)%v*2.0D00)
      OpenAD_Symbol_0 = 2.0D00
      CALL sax(2.0D00,X(1),LOCALX(1))
      Y(1)%v = (LOCALX(1)%v*LOCALX(1)%v)
      OpenAD_Symbol_2 = LOCALX(1)%v
      OpenAD_Symbol_3 = LOCALX(1)%v
      CALL sax(OpenAD_Symbol_2,LOCALX(1),Y(1))
      CALL saxpy(OpenAD_Symbol_3,LOCALX(1),Y(1))
      END SUBROUTINE
