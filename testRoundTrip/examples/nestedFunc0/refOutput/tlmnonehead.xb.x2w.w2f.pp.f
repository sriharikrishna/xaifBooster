

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      type(active) :: Y(1 : 1)
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      CALL FOO()
      CONTAINS

        SUBROUTINE FOO()
        use w2f__types
      use active_module
        IMPLICIT NONE
C
C       **** Global Variables & Derived Type Definitions ****
C
        REAL(w2f__8) OpenAD_Symbol_0
        REAL(w2f__8) OpenAD_Symbol_1
C
C       **** Statements ****
C
        Y(1)%v = (X(1)%v*X(2)%v)
        OpenAD_Symbol_0 = X(2)%v
        OpenAD_Symbol_1 = X(1)%v
        CALL sax(OpenAD_Symbol_0,X(1),Y(1))
        CALL saxpy(OpenAD_Symbol_1,X(2),Y(1))
        END SUBROUTINE
      END
