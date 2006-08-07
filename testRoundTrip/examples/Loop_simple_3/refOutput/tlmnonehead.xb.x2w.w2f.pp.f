C ***********************************************************
C Fortran file translated from WHIRL Mon Aug  7 14:51:14 2006
C ***********************************************************
C ***********************************************************


      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_10
      type(active) :: OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      type(active) :: OpenAD_Symbol_13
      type(active) :: OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      type(active) :: OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      type(active) :: OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      type(active) :: OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 1)
      INTENT(IN)  X
      type(active) :: Y(1 : 1)
      INTENT(OUT)  Y
C
C     **** Local Variables and Functions ****
C
      CHARACTER(10) ASTRING
      INTEGER(w2f__i4) I
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      Y(1)%v = X(1)%v
      CALL setderiv(OpenAD_Symbol_5,X(1))
      CALL setderiv(Y(1),OpenAD_Symbol_5)
      ASTRING = 'blah'
C$OPENAD XXX Simple loop
      DO I = 1, 3, 1
        IF(ASTRING .EQ. 'blah') THEN
          OpenAD_Symbol_2 = (X(1)%v*Y(1)%v)
          OpenAD_Symbol_0 = Y(1)%v
          OpenAD_Symbol_1 = X(1)%v
          Y(1)%v = OpenAD_Symbol_2
          OpenAD_Symbol_6 = OpenAD_Symbol_0
          OpenAD_Symbol_8 = OpenAD_Symbol_1
          CALL setderiv(OpenAD_Symbol_9,Y(1))
          CALL setderiv(OpenAD_Symbol_7,X(1))
          CALL sax(OpenAD_Symbol_6,OpenAD_Symbol_7,Y(1))
          CALL saxpy(OpenAD_Symbol_8,OpenAD_Symbol_9,Y(1))
        ENDIF
        IF(ASTRING .EQ. 'bloh') THEN
          Y(1)%v = (Y(1)%v-X(1)%v)
          OpenAD_Symbol_3 = 1_w2f__i8
          OpenAD_Symbol_4 = (-1_w2f__i8)
          OpenAD_Symbol_10 = OpenAD_Symbol_3
          OpenAD_Symbol_12 = OpenAD_Symbol_4
          CALL setderiv(OpenAD_Symbol_13,X(1))
          CALL setderiv(OpenAD_Symbol_11,Y(1))
          CALL sax(OpenAD_Symbol_10,OpenAD_Symbol_11,Y(1))
          CALL saxpy(OpenAD_Symbol_12,OpenAD_Symbol_13,Y(1))
        ENDIF
      END DO
      CALL setderiv(OpenAD_Symbol_14,Y(1))
      CALL setderiv(Y(1),OpenAD_Symbol_14)
      RETURN
      END SUBROUTINE