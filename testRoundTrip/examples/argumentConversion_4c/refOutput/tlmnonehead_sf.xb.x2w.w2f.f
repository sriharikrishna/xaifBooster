C ***********************************************************
C Fortran file translated from WHIRL Tue Jul 10 10:59:20 2007
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

      SUBROUTINE foo(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      TYPE (OpenADTy_active) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X
      TYPE (OpenADTy_active) Y
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_6 = (__value__(X) * __value__(X))
      OpenAD_Symbol_4 = __value__(X)
      OpenAD_Symbol_5 = __value__(X)
      __value__(Y) = OpenAD_Symbol_6
      OpenAD_Symbol_7 = OpenAD_Symbol_4
      OpenAD_Symbol_9 = OpenAD_Symbol_5
      CALL setderiv(__deriv__(OpenAD_Symbol_8), __deriv__(X))
      CALL sax(OpenAD_Symbol_7, __deriv__(OpenAD_Symbol_8), __deriv__(Y
     > ))
      CALL saxpy(OpenAD_Symbol_9, __deriv__(OpenAD_Symbol_8), __deriv__
     > (Y))
      RETURN
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      TYPE (OpenADTy_active) OpenAD_Symbol_0
      TYPE (OpenADTy_active) OpenAD_Symbol_10
      TYPE (OpenADTy_active) OpenAD_Symbol_3
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y
C
C     **** Local Variables and Functions ****
C
      REAL(w2f__8) APX(1 : 2, 1 : 2)
      TYPE (OpenADTy_active) AX(1 : 2, 1 : 2)
      EXTERNAL foo
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) J
      REAL(w2f__8) PY
      INTEGER(w2f__i8) OpenAD_Symbol_1
      INTEGER(w2f__i8) OpenAD_Symbol_2
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        DO J = 1, 2, 1
          __value__(AX(INT(I), INT(J))) = __value__(X(I))
          APX(INT(I), INT(J)) = (I * 4.0D00)
          CALL setderiv(__deriv__(OpenAD_Symbol_10), __deriv__(X(I)))
          CALL setderiv(__deriv__(AX(I, J)), __deriv__(OpenAD_Symbol_10
     > ))
        END DO
      END DO
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        DO J = 1, 2, 1
          CALL foo(__deriv__(AX(I, J)), __deriv__(Y))
          OpenAD_Symbol_1 = I
          OpenAD_Symbol_2 = J
C         $OpenAD$ INLINE convert_p2a_scalar(subst,subst)
          CALL convert_p2a_scalar(__deriv__(OpenAD_Symbol_0), APX(I, J)
     > )
C         $OpenAD$ INLINE convert_p2a_scalar(subst,subst)
          CALL convert_p2a_scalar(__deriv__(OpenAD_Symbol_3), PY)
          CALL foo(__deriv__(OpenAD_Symbol_0), __deriv__(
     > OpenAD_Symbol_3))
C         $OpenAD$ INLINE convert_a2p_scalar(subst,subst)
          CALL convert_a2p_scalar(APX(INT(OpenAD_Symbol_1), INT(
     > OpenAD_Symbol_2)), __deriv__(OpenAD_Symbol_0))
C         $OpenAD$ INLINE convert_a2p_scalar(subst,subst)
          CALL convert_a2p_scalar(PY, __deriv__(OpenAD_Symbol_3))
        END DO
      END DO
      RETURN
      END SUBROUTINE
