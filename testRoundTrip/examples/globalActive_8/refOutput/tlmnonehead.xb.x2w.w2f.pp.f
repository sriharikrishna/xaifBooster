

      MODULE globals
      use w2f__types
      use active_module
      IMPLICIT NONE
      SAVE
C
C     **** Global Variables & Derived Type Definitions ****
C
      type(active) :: AGLOBAL
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE foo(X, Y)
      use w2f__types
      use active_module
      use globals
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      type(active) :: Y
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      AGLOBAL%v = (X(1)%v*X(2)%v)
      OpenAD_Symbol_0 = X(2)%v
      OpenAD_Symbol_1 = X(1)%v
      Y%v = AGLOBAL%v
      OpenAD_Symbol_4 = (OpenAD_Symbol_0 * INT(1_w2f__i8))
      OpenAD_Symbol_5 = (OpenAD_Symbol_1 * INT(1_w2f__i8))
      OpenAD_Symbol_6 = OpenAD_Symbol_0
      OpenAD_Symbol_7 = OpenAD_Symbol_1
      CALL sax(OpenAD_Symbol_4,X(1),Y)
      CALL saxpy(OpenAD_Symbol_5,X(2),Y)
      CALL sax(OpenAD_Symbol_6,X(1),AGLOBAL)
      CALL saxpy(OpenAD_Symbol_7,X(2),AGLOBAL)
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      use globals
      IMPLICIT NONE
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      type(active) :: Y(1 : 2)
C
C     **** Local Variables and Functions ****
C
      EXTERNAL bar
      EXTERNAL foo
      type(active) :: P
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      CALL foo(X,Y(1))
      CALL bar(P)
      Y(2)%v = P%v
      CALL setderiv(Y(2),P)
      END SUBROUTINE

      SUBROUTINE bar(AP)
      use w2f__types
      use active_module
      use globals
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_8
C
C     **** Parameters and Result ****
C
      type(active) :: AP
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      AP%v = (AGLOBAL%v**3)
      OpenAD_Symbol_2 = (3*(AGLOBAL%v**(3-INT(1 _w2f__i8))))
      OpenAD_Symbol_8 = OpenAD_Symbol_2
      CALL sax(OpenAD_Symbol_8,AGLOBAL,AP)
      END SUBROUTINE
