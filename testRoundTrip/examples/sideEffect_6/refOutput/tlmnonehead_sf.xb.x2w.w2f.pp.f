
      MODULE all_globals_mod
      use w2f__types
      use active_module
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE foo(A, X)
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
      CHARACTER(*) A
      type(active) :: X
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      IF(A .EQ. 'two') THEN
        OpenAD_Symbol_2 = (X%v*2.0D00)
        OpenAD_Symbol_0 = 2.0D00
        X%v = OpenAD_Symbol_2
        OpenAD_Symbol_6 = OpenAD_Symbol_0
        CALL setderiv(OpenAD_Symbol_7,X)
        CALL sax(OpenAD_Symbol_6,OpenAD_Symbol_7,X)
      ENDIF
      IF(A .EQ. 'three') THEN
        OpenAD_Symbol_5 = (X%v*3.0D00)
        OpenAD_Symbol_3 = 3.0D00
        X%v = OpenAD_Symbol_5
        OpenAD_Symbol_8 = OpenAD_Symbol_3
        CALL setderiv(OpenAD_Symbol_9,X)
        CALL sax(OpenAD_Symbol_8,OpenAD_Symbol_9,X)
      ENDIF
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 1)
      type(active) :: Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      CHARACTER(10) A
      EXTERNAL foo
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      A = 'two'
      CALL foo(A,X)
      A = 'three'
      CALL foo(A,X)
      A = 'four'
      Y(1)%v = X(1)%v
      CALL setderiv(Y(1),X(1))
      END SUBROUTINE
