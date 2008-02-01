

      MODULE aglobalmodule
      use w2f__types
      use active_module
      IMPLICIT NONE
      SAVE
C
C     **** Global Variables & Derived Type Definitions ****
C
      CHARACTER(3) GLOBALSTRING
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE foo(X, Y)
      use w2f__types
      use active_module
      use aglobalmodule
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      type(active) :: OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      type(active) :: OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      INTENT(IN)  X
      type(active) :: Y(1 : 2)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      CHARACTER(3) LOCALSTRING
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        IF(GLOBALSTRING .EQ. 'yes') THEN
          Y(INT(I))%v = (Y(I)%v+X(I)%v*X(I)%v)
          OpenAD_Symbol_0 = 1_w2f__i8
          OpenAD_Symbol_2 = X(I)%v
          OpenAD_Symbol_3 = X(I)%v
          OpenAD_Symbol_1 = 1_w2f__i8
          OpenAD_Symbol_11 = (OpenAD_Symbol_2 * OpenAD_Symbol_1)
          OpenAD_Symbol_12 = (OpenAD_Symbol_3 * OpenAD_Symbol_1)
          OpenAD_Symbol_13 = OpenAD_Symbol_0
          CALL setderiv(OpenAD_Symbol_14,Y(I))
          CALL sax(OpenAD_Symbol_11,X(I),Y(I))
          CALL saxpy(OpenAD_Symbol_12,X(I),Y(I))
          CALL saxpy(OpenAD_Symbol_13,OpenAD_Symbol_14,Y(I))
        ENDIF
        IF(GLOBALSTRING .EQ. 'no') THEN
          OpenAD_Symbol_6 = (X(I)%v*X(I)%v)
          Y(INT(I))%v = (Y(I)%v+OpenAD_Symbol_6*2.0D00)
          OpenAD_Symbol_4 = 1_w2f__i8
          OpenAD_Symbol_9 = X(I)%v
          OpenAD_Symbol_10 = X(I)%v
          OpenAD_Symbol_7 = 2.0D00
          OpenAD_Symbol_5 = 1_w2f__i8
          OpenAD_Symbol_15 = (OpenAD_Symbol_7 * OpenAD_Symbol_5)
          OpenAD_Symbol_16 = (OpenAD_Symbol_9 * OpenAD_Symbol_15)
          OpenAD_Symbol_17 = (OpenAD_Symbol_10 * OpenAD_Symbol_15)
          OpenAD_Symbol_18 = OpenAD_Symbol_4
          CALL setderiv(OpenAD_Symbol_19,Y(I))
          CALL sax(OpenAD_Symbol_16,X(I),Y(I))
          CALL saxpy(OpenAD_Symbol_17,X(I),Y(I))
          CALL saxpy(OpenAD_Symbol_18,OpenAD_Symbol_19,Y(I))
        ENDIF
      END DO
      GLOBALSTRING = 'either'
      LOCALSTRING = GLOBALSTRING
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      use aglobalmodule
      IMPLICIT NONE
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
      Y(1)%v = 1.0
      Y(2)%v = 1.0
      CALL zero_deriv(Y(1))
      CALL zero_deriv(Y(2))
      GLOBALSTRING = 'yes'
      CALL foo(X,Y)
      GLOBALSTRING = 'both'
      END SUBROUTINE
