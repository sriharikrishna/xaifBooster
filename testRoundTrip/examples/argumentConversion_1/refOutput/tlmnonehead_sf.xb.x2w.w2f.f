C ***********************************************************
C Fortran file translated from WHIRL Tue Nov 28 14:49:38 2006
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
      TYPE (OpenADTy_active) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      TYPE (OpenADTy_active) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_6 = (__value__(X(1)) * __value__(X(2)))
      OpenAD_Symbol_4 = __value__(X(2))
      OpenAD_Symbol_5 = __value__(X(1))
      __value__(Y) = OpenAD_Symbol_6
      OpenAD_Symbol_7 = OpenAD_Symbol_4
      OpenAD_Symbol_9 = OpenAD_Symbol_5
      CALL setderiv(__deriv__(OpenAD_Symbol_10), __deriv__(X(2)))
      CALL setderiv(__deriv__(OpenAD_Symbol_8), __deriv__(X(1)))
      CALL sax(OpenAD_Symbol_7, __deriv__(OpenAD_Symbol_8), __deriv__(Y
     > ))
      CALL saxpy(OpenAD_Symbol_9, __deriv__(OpenAD_Symbol_10),
     >  __deriv__(Y))
      RETURN
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      TYPE (OpenADTy_active) OpenAD_Symbol_0(1 : 2)
      TYPE (OpenADTy_active) OpenAD_Symbol_1
      TYPE (OpenADTy_active) OpenAD_Symbol_2(1 : 2)
      TYPE (OpenADTy_active) OpenAD_Symbol_3
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y
C
C     **** Local Variables and Functions ****
C
      EXTERNAL foo
      REAL(w2f__8) PX(1 : 2)
      REAL(w2f__8) PY
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      PX(1) = 1.0D00
      PX(2) = 2.0D00
      CALL foo(__deriv__(X), __deriv__(Y))
C     $OpenAD$ INLINE convert_p2a_vector(subst,subst)
      CALL convert_p2a_vector(__deriv__(OpenAD_Symbol_0), PX)
C     $OpenAD$ INLINE convert_p2a_scalar(subst,subst)
      CALL convert_p2a_scalar(__deriv__(OpenAD_Symbol_1), PY)
      CALL foo(__deriv__(OpenAD_Symbol_0), __deriv__(OpenAD_Symbol_1))
C     $OpenAD$ INLINE convert_a2p_vector(subst,subst)
      CALL convert_a2p_vector(PX, __deriv__(OpenAD_Symbol_0))
C     $OpenAD$ INLINE convert_a2p_scalar(subst,subst)
      CALL convert_a2p_scalar(PY, __deriv__(OpenAD_Symbol_1))
C     $OpenAD$ INLINE convert_p2a_vector(subst,subst)
      CALL convert_p2a_vector(__deriv__(OpenAD_Symbol_2), PX)
C     $OpenAD$ INLINE convert_p2a_scalar(subst,subst)
      CALL convert_p2a_scalar(__deriv__(OpenAD_Symbol_3), PY)
      CALL foo(__deriv__(OpenAD_Symbol_2), __deriv__(OpenAD_Symbol_3))
C     $OpenAD$ INLINE convert_a2p_vector(subst,subst)
      CALL convert_a2p_vector(PX, __deriv__(OpenAD_Symbol_2))
C     $OpenAD$ INLINE convert_a2p_scalar(subst,subst)
      CALL convert_a2p_scalar(PY, __deriv__(OpenAD_Symbol_3))
      RETURN
      END SUBROUTINE
