
      MODULE all_globals_mod
      use w2f__types
      use active_module
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

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
      t__1 = J
      t__2 = MAX(J, 0_w2f__i8)
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
        REAL(w2f__8) OpenAD_Symbol_3
        type(active) :: OpenAD_Symbol_4
        REAL(w2f__8) OpenAD_Symbol_5
        type(active) :: OpenAD_Symbol_6
C
C       **** Local Variables and Functions ****
C
        INTEGER(w2f__i4) I
        INTEGER(w2f__i4) t__3
C
C       **** Statements ****
C
        t__3 = J
        DO I = 1, J, 1
          OpenAD_Symbol_2 = (X(J)%v*Y(1)%v)
          OpenAD_Symbol_0 = Y(1)%v
          OpenAD_Symbol_1 = X(J)%v
          Y(1)%v = OpenAD_Symbol_2
          OpenAD_Symbol_3 = OpenAD_Symbol_0
          OpenAD_Symbol_5 = OpenAD_Symbol_1
          CALL setderiv(OpenAD_Symbol_6,Y(1))
          CALL setderiv(OpenAD_Symbol_4,X(J))
          CALL sax(OpenAD_Symbol_3,OpenAD_Symbol_4,Y(1))
          CALL saxpy(OpenAD_Symbol_5,OpenAD_Symbol_6,Y(1))
        END DO
        END SUBROUTINE
      END
