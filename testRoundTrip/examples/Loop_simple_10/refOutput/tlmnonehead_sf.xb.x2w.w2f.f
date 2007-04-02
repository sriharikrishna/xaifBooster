C ***********************************************************
C Fortran file translated from WHIRL Mon Jan 15 10:46:06 2007
C ***********************************************************
C ***********************************************************

      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE foo(X, Y, A, J)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      TYPE (OpenADTy_active) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      TYPE (OpenADTy_active) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      TYPE (OpenADTy_active) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      TYPE (OpenADTy_active) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      TYPE (OpenADTy_active) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 1)
      INTENT(IN)  X
      TYPE (OpenADTy_active) Y(1 : 1)
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
      __value__(Y(1)) = __value__(X(1))
      CALL setderiv(__deriv__(OpenAD_Symbol_8), __deriv__(X(1)))
      CALL setderiv(__deriv__(Y(1)), __deriv__(OpenAD_Symbol_8))
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        IF(A(I, J) .ne. INT(0_w2f__i8)) THEN
          OpenAD_Symbol_0 = (__value__(X(1)) * __value__(Y(1)))
          OpenAD_Symbol_5 = (A(I, J) * OpenAD_Symbol_0)
          OpenAD_Symbol_3 = __value__(Y(1))
          OpenAD_Symbol_4 = __value__(X(1))
          OpenAD_Symbol_2 = A(I, J)
          __value__(Y(1)) = OpenAD_Symbol_5
          OpenAD_Symbol_9 = (OpenAD_Symbol_3 * OpenAD_Symbol_2)
          OpenAD_Symbol_11 = (OpenAD_Symbol_4 * OpenAD_Symbol_2)
          CALL setderiv(__deriv__(OpenAD_Symbol_12), __deriv__(Y(1)))
          CALL setderiv(__deriv__(OpenAD_Symbol_10), __deriv__(X(1)))
          CALL sax(OpenAD_Symbol_9, __deriv__(OpenAD_Symbol_10),
     >  __deriv__(Y(1)))
          CALL saxpy(OpenAD_Symbol_11, __deriv__(OpenAD_Symbol_12),
     >  __deriv__(Y(1)))
        ELSE
          __value__(Y(1)) = (__value__(Y(1)) - __value__(X(1)))
          OpenAD_Symbol_6 = 1_w2f__i8
          OpenAD_Symbol_7 = (-1_w2f__i8)
          OpenAD_Symbol_13 = OpenAD_Symbol_6
          OpenAD_Symbol_15 = OpenAD_Symbol_7
          CALL setderiv(__deriv__(OpenAD_Symbol_16), __deriv__(X(1)))
          CALL setderiv(__deriv__(OpenAD_Symbol_14), __deriv__(Y(1)))
          CALL sax(OpenAD_Symbol_13, __deriv__(OpenAD_Symbol_14),
     >  __deriv__(Y(1)))
          CALL saxpy(OpenAD_Symbol_15, __deriv__(OpenAD_Symbol_16),
     >  __deriv__(Y(1)))
        ENDIF
      END DO
      RETURN
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 1)
      INTENT(IN)  X
      TYPE (OpenADTy_active) Y(1 : 1)
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
      CALL foo(__deriv__(X), __deriv__(Y), A, 2_w2f__i8)
      DO I = 1, 2, 1
        DO J = 1, 2, 1
          A(I, J) = 0
        END DO
      END DO
      RETURN
      END SUBROUTINE