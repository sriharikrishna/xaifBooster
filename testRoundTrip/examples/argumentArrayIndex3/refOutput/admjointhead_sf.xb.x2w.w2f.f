
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
      REAL(w2f__8) OpenAD_Symbol_1
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X
      TYPE (OpenADTy_active) Y
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      __value__(Y) = (__value__(X) * 2.0D00)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      __value__(Y) = (__value__(X) * 2.0D00)
      OpenAD_Symbol_1 = 2.0D00
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(2.0D00, __deriv__(Y), __deriv__(X))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(X))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(X))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(Y))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(X))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(Y))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      __value__(Y) = (__value__(X) * 2.0D00)
      OpenAD_Symbol_1 = 2.0D00
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(2.0D00, __deriv__(Y), __deriv__(X))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      TYPE (OpenADTy_active) OpenAD_Symbol_0
      TYPE (OpenADTy_active) OpenAD_Symbol_3
      TYPE (OpenADTy_active) OpenAD_Symbol_4
      TYPE (OpenADTy_active) OpenAD_Symbol_5
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y
C
C     **** Local Variables and Functions ****
C
      EXTERNAL foo
      INTEGER(w2f__i4) K
      INTEGER(w2f__i4) L
      REAL(w2f__8) P(1 : 2)
      TYPE (OpenADTy_active) Q(1 : 2)
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      K = 1
      CALL foo(__deriv__(X(K)), __deriv__(Y))
      __value__(Q(1)) = __value__(Y)
      __value__(Y) = __value__(Q(1))
      P(1) = 1.0
      L = 1
C     $OpenAD$ INLINE convert_p2a_scalar(subst,subst)
      CALL convert_p2a_scalar(__deriv__(OpenAD_Symbol_0), P(K))
      CALL foo(__deriv__(OpenAD_Symbol_0), __deriv__(Q(L)))
C     $OpenAD$ INLINE convert_a2p_scalar(subst,subst)
      CALL convert_a2p_scalar(P(K), __deriv__(OpenAD_Symbol_0))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      K = 1
      CALL foo(__deriv__(X(K)), __deriv__(Y))
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(K)
      __value__(Q(1)) = __value__(Y)
      __value__(Y) = __value__(Q(1))
      P(1) = 1.0
      L = 1
C     $OpenAD$ INLINE convert_p2a_scalar(subst,subst)
      CALL convert_p2a_scalar(__deriv__(OpenAD_Symbol_0), P(K))
      CALL foo(__deriv__(OpenAD_Symbol_0), __deriv__(Q(L)))
C     $OpenAD$ INLINE convert_a2p_scalar(subst,subst)
      CALL convert_a2p_scalar(P(K), __deriv__(OpenAD_Symbol_0))
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(K)
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(L)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(L)
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(K)
      CALL foo(__deriv__(OpenAD_Symbol_5), __deriv__(Q(L)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(Y), __deriv__(OpenAD_Symbol_4))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_4), __deriv__(Q(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_4))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(Q(1)), __deriv__(OpenAD_Symbol_3))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Q(1)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_3), __deriv__(Y))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_3))
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(K)
      CALL foo(__deriv__(X(K)), __deriv__(Y))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      K = 1
      CALL foo(__deriv__(X(K)), __deriv__(Y))
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(K)
      __value__(Q(1)) = __value__(Y)
      __value__(Y) = __value__(Q(1))
      P(1) = 1.0
      L = 1
C     $OpenAD$ INLINE convert_p2a_scalar(subst,subst)
      CALL convert_p2a_scalar(__deriv__(OpenAD_Symbol_0), P(K))
      CALL foo(__deriv__(OpenAD_Symbol_0), __deriv__(Q(L)))
C     $OpenAD$ INLINE convert_a2p_scalar(subst,subst)
      CALL convert_a2p_scalar(P(K), __deriv__(OpenAD_Symbol_0))
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(K)
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(L)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(L)
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(K)
      CALL foo(__deriv__(OpenAD_Symbol_5), __deriv__(Q(L)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(Y), __deriv__(OpenAD_Symbol_4))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_4), __deriv__(Q(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_4))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(Q(1)), __deriv__(OpenAD_Symbol_3))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Q(1)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_3), __deriv__(Y))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_3))
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(K)
      CALL foo(__deriv__(X(K)), __deriv__(Y))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
