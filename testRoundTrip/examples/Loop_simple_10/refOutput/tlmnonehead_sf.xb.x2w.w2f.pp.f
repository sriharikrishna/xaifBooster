C ***********************************************************
C Fortran file translated from WHIRL Mon Jan 15 10:46:06 2007
C ***********************************************************
C ***********************************************************

      MODULE all_globals_mod
      use w2f__types
      use active_module
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE foo(X, Y, A, J)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      type(active) :: OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      type(active) :: OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      type(active) :: OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      type(active) :: OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      type(active) :: OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 1)
      INTENT(IN)  X
      type(active) :: Y(1 : 1)
      INTENT(OUT)  Y
      INTEGER(w2f__i4) A(1 : 2, 1 : 2)
      INTEGER(w2f__i4) J
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
C
C     **** Top Level Pragmas ****
C
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      Y(1)%v = X(1)%v
      CALL setderiv(OpenAD_Symbol_8,X(1))
      CALL setderiv(Y(1),OpenAD_Symbol_8)
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        IF(A(I, J) .ne. INT(0_w2f__i8)) THEN
          OpenAD_Symbol_0 = (X(1)%v*Y(1)%v)
          OpenAD_Symbol_5 = (A(I, J) * OpenAD_Symbol_0)
          OpenAD_Symbol_3 = Y(1)%v
          OpenAD_Symbol_4 = X(1)%v
          OpenAD_Symbol_2 = A(I, J)
          Y(1)%v = OpenAD_Symbol_5
          OpenAD_Symbol_9 = (OpenAD_Symbol_3 * OpenAD_Symbol_2)
          OpenAD_Symbol_11 = (OpenAD_Symbol_4 * OpenAD_Symbol_2)
          CALL setderiv(OpenAD_Symbol_12,Y(1))
          CALL setderiv(OpenAD_Symbol_10,X(1))
          CALL sax(OpenAD_Symbol_9,OpenAD_Symbol_10,Y(1))
          CALL saxpy(OpenAD_Symbol_11,OpenAD_Symbol_12,Y(1))
        ELSE
          Y(1)%v = (Y(1)%v-X(1)%v)
          OpenAD_Symbol_6 = 1_w2f__i8
          OpenAD_Symbol_7 = (-1_w2f__i8)
          OpenAD_Symbol_13 = OpenAD_Symbol_6
          OpenAD_Symbol_15 = OpenAD_Symbol_7
          CALL setderiv(OpenAD_Symbol_16,X(1))
          CALL setderiv(OpenAD_Symbol_14,Y(1))
          CALL sax(OpenAD_Symbol_13,OpenAD_Symbol_14,Y(1))
          CALL saxpy(OpenAD_Symbol_15,OpenAD_Symbol_16,Y(1))
        ENDIF
      END DO
      RETURN
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
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
      INTEGER(w2f__i4) A(1 : 2, 1 : 2)
      EXTERNAL foo
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) J
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      DO I = 1, 2, 1
        DO J = 1, 2, 1
          A(I, J) = (I + J)
        END DO
      END DO
      CALL foo(X,Y,A,2 _w2f__i8)
      DO I = 1, 2, 1
        DO J = 1, 2, 1
          A(I, J) = 0
        END DO
      END DO
      RETURN
      END SUBROUTINE
