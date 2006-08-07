C ***********************************************************
C Fortran file translated from WHIRL Thu Jul 20 15:10:51 2006
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

      MODULE globals
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Global Variables & Derived Type Definitions ****
C
      TYPE (OpenADTy_active) AGLOBAL
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
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      TYPE (OpenADTy_active) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      TYPE (OpenADTy_active) OpenAD_Symbol_8
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_4 = (__value__(X(1)) * __value__(X(2)))
      OpenAD_Symbol_2 = __value__(X(2))
      OpenAD_Symbol_3 = __value__(X(1))
      __value__(Y) = OpenAD_Symbol_4
      OpenAD_Symbol_5 = OpenAD_Symbol_2
      OpenAD_Symbol_7 = OpenAD_Symbol_3
      CALL setderiv(__deriv__(OpenAD_Symbol_8), __deriv__(X(2)))
      CALL setderiv(__deriv__(OpenAD_Symbol_6), __deriv__(X(1)))
      CALL sax(OpenAD_Symbol_5, __deriv__(OpenAD_Symbol_6), __deriv__(Y
     > ))
      CALL saxpy(OpenAD_Symbol_7, __deriv__(OpenAD_Symbol_8), __deriv__
     > (Y))
      RETURN
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use globals
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      TYPE (OpenADTy_active) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y(1 : 1)
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
      CALL foo(__deriv__(X), __deriv__(AGLOBAL))
      __value__(Y(1)) = __value__(AGLOBAL)
      CALL setderiv(__deriv__(OpenAD_Symbol_9), __deriv__(AGLOBAL))
      CALL setderiv(__deriv__(Y(1)), __deriv__(OpenAD_Symbol_9))
      RETURN
      END SUBROUTINE

      SUBROUTINE bar(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      TYPE (OpenADTy_active) OpenAD_Symbol_0(1 : 2)
      TYPE (OpenADTy_active) OpenAD_Symbol_1
C
C     **** Parameters and Result ****
C
      REAL(w2f__8) X(1 : 2)
      REAL(w2f__8) Y
C
C     **** Local Variables and Functions ****
C
      EXTERNAL foo
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
C     $OpenAD$ INLINE convert_p2a_vector(subst,subst)
      CALL convert_p2a_vector(__deriv__(OpenAD_Symbol_0), X)
C     $OpenAD$ INLINE convert_p2a_scalar(subst,subst)
      CALL convert_p2a_scalar(__deriv__(OpenAD_Symbol_1), Y)
      CALL foo(__deriv__(OpenAD_Symbol_0), __deriv__(OpenAD_Symbol_1))
C     $OpenAD$ INLINE convert_a2p_vector(subst,subst)
      CALL convert_a2p_vector(X, __deriv__(OpenAD_Symbol_0))
C     $OpenAD$ INLINE convert_a2p_scalar(subst,subst)
      CALL convert_a2p_scalar(Y, __deriv__(OpenAD_Symbol_1))
      RETURN
      END SUBROUTINE