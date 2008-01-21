
      MODULE all_globals_mod
      use w2f__types
      use active_module
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

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
      type(active) :: OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_17
      type(active) :: OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_20
      type(active) :: OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_22
      type(active) :: OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_24
      type(active) :: OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
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
          OpenAD_Symbol_4 = (Y(I)%v+X(I)%v*X(I)%v)
          OpenAD_Symbol_0 = 1_w2f__i8
          OpenAD_Symbol_2 = X(I)%v
          OpenAD_Symbol_3 = X(I)%v
          OpenAD_Symbol_1 = 1_w2f__i8
          Y(INT(I))%v = OpenAD_Symbol_4
          OpenAD_Symbol_13 = (OpenAD_Symbol_2 * OpenAD_Symbol_1)
          OpenAD_Symbol_15 = (OpenAD_Symbol_3 * OpenAD_Symbol_1)
          OpenAD_Symbol_17 = OpenAD_Symbol_0
          CALL setderiv(OpenAD_Symbol_18,Y(I))
          CALL setderiv(OpenAD_Symbol_16,X(I))
          CALL setderiv(OpenAD_Symbol_14,X(I))
          CALL sax(OpenAD_Symbol_13,OpenAD_Symbol_14,Y(I))
          CALL saxpy(OpenAD_Symbol_15,OpenAD_Symbol_16,Y(I))
          CALL saxpy(OpenAD_Symbol_17,OpenAD_Symbol_18,Y(I))
        ENDIF
        IF(GLOBALSTRING .EQ. 'no') THEN
          OpenAD_Symbol_7 = (X(I)%v*X(I)%v)
          OpenAD_Symbol_12 = (Y(I)%v+OpenAD_Symbol_7*2.0D00)
          OpenAD_Symbol_5 = 1_w2f__i8
          OpenAD_Symbol_10 = X(I)%v
          OpenAD_Symbol_11 = X(I)%v
          OpenAD_Symbol_8 = 2.0D00
          OpenAD_Symbol_6 = 1_w2f__i8
          Y(INT(I))%v = OpenAD_Symbol_12
          OpenAD_Symbol_19 = (OpenAD_Symbol_8 * OpenAD_Symbol_6)
          OpenAD_Symbol_20 = (OpenAD_Symbol_10 * OpenAD_Symbol_19)
          OpenAD_Symbol_22 = (OpenAD_Symbol_11 * OpenAD_Symbol_19)
          OpenAD_Symbol_24 = OpenAD_Symbol_5
          CALL setderiv(OpenAD_Symbol_25,Y(I))
          CALL setderiv(OpenAD_Symbol_23,X(I))
          CALL setderiv(OpenAD_Symbol_21,X(I))
          CALL sax(OpenAD_Symbol_20,OpenAD_Symbol_21,Y(I))
          CALL saxpy(OpenAD_Symbol_22,OpenAD_Symbol_23,Y(I))
          CALL saxpy(OpenAD_Symbol_24,OpenAD_Symbol_25,Y(I))
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
