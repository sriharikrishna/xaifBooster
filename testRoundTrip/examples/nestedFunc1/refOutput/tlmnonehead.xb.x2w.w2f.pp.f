

      SUBROUTINE head(J, X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Parameters and Result ****
C
      INTEGER(w2f__i4) J
      type(active) :: X(1 : J)
      INTENT(IN)  X
      type(active) :: Y(1 : 1)
      INTENT(OUT)  Y
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i8) t__1
      INTEGER(w2f__i8) t__2
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      Y(1)%v = 1.0
      CALL zero_deriv(Y(1))
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
        REAL(w2f__8) OpenAD_Symbol_2
        type(active) :: OpenAD_Symbol_3
C
C       **** Local Variables and Functions ****
C
        INTEGER(w2f__i4) I
C
C       **** Statements ****
C
        DO I = 1, J, 1
          OpenAD_Symbol_2 = (X(J)%v*Y(1)%v)
          OpenAD_Symbol_0 = Y(1)%v
          OpenAD_Symbol_1 = X(J)%v
          Y(1)%v = OpenAD_Symbol_2
          CALL setderiv(OpenAD_Symbol_3,Y(1))
          CALL sax(OpenAD_Symbol_0,X(J),Y(1))
          CALL saxpy(OpenAD_Symbol_1,OpenAD_Symbol_3,Y(1))
        END DO
        END SUBROUTINE
      END
