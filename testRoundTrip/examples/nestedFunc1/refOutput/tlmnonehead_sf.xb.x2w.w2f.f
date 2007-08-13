C ***********************************************************
C Fortran file translated from WHIRL Mon Aug 13 10:59:52 2007
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

      SUBROUTINE head(J, X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Parameters and Result ****
C
      INTEGER(w2f__i4) J
      TYPE (OpenADTy_active) X(1 : J)
      INTENT(IN)  X
      TYPE (OpenADTy_active) Y(1 : 1)
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
      __value__(Y(1)) = 1.0D00
      CALL zero_deriv(__deriv__(Y(1)))
      CALL FOO()
      RETURN
      CONTAINS

        SUBROUTINE FOO()
        use w2f__types
        IMPLICIT NONE
C
C       **** Global Variables & Derived Type Definitions ****
C
        REAL(w2f__8) OpenAD_Symbol_0
        REAL(w2f__8) OpenAD_Symbol_1
        REAL(w2f__8) OpenAD_Symbol_2
        REAL(w2f__8) OpenAD_Symbol_3
        TYPE (OpenADTy_active) OpenAD_Symbol_4
        REAL(w2f__8) OpenAD_Symbol_5
        TYPE (OpenADTy_active) OpenAD_Symbol_6
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
          OpenAD_Symbol_2 = (__value__(X(J)) * __value__(Y(1)))
          OpenAD_Symbol_0 = __value__(Y(1))
          OpenAD_Symbol_1 = __value__(X(J))
          __value__(Y(1)) = OpenAD_Symbol_2
          OpenAD_Symbol_3 = OpenAD_Symbol_0
          OpenAD_Symbol_5 = OpenAD_Symbol_1
          CALL setderiv(__deriv__(OpenAD_Symbol_6), __deriv__(Y(1)))
          CALL setderiv(__deriv__(OpenAD_Symbol_4), __deriv__(X(J)))
          CALL sax(OpenAD_Symbol_3, __deriv__(OpenAD_Symbol_4),
     >  __deriv__(Y(1)))
          CALL saxpy(OpenAD_Symbol_5, __deriv__(OpenAD_Symbol_6),
     >  __deriv__(Y(1)))
        END DO
        RETURN
        END SUBROUTINE
      END
