C ***********************************************************
C Fortran file translated from WHIRL Mon Jan 15 14:37:34 2007
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

      SUBROUTINE head(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_22
      TYPE (OpenADTy_active) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 1)
      TYPE (OpenADTy_active) Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      TYPE (OpenADTy_active) T1
      TYPE (OpenADTy_active) T2
      TYPE (OpenADTy_active) T3
      TYPE (OpenADTy_active) T4
      TYPE (OpenADTy_active) T5
      TYPE (OpenADTy_active) T6
      TYPE (OpenADTy_active) T7
      TYPE (OpenADTy_active) Y1
      REAL(w2f__8) OpenAD_Symbol_24
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
      __value__(T1) = __value__(X(1))
      __value__(T2) = (__value__(T1) + 2.0D00)
      __value__(T3) = (__value__(T2) * 5.0D-01)
      __value__(T4) = (__value__(T3) * 2.0D00)
      __value__(T5) = (__value__(T4) + 4.0D00)
      __value__(T6) = (__value__(T5) + 3.0D00)
      __value__(T7) = (__value__(T6) +(-9.0D00))
      __value__(Y1) = EXP(__value__(T7))
      __value__(Y(1)) = __value__(Y1)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      __value__(T1) = __value__(X(1))
      __value__(T2) = (__value__(T1) + 2.0D00)
      OpenAD_Symbol_0 = 1_w2f__i8
      OpenAD_Symbol_4 = (__value__(T2) * 5.0D-01)
      OpenAD_Symbol_2 = 5.0D-01
      __value__(T3) = OpenAD_Symbol_4
      OpenAD_Symbol_7 = (__value__(T3) * 2.0D00)
      OpenAD_Symbol_5 = 2.0D00
      __value__(T4) = OpenAD_Symbol_7
      __value__(T5) = (__value__(T4) + 4.0D00)
      OpenAD_Symbol_8 = 1_w2f__i8
      __value__(T6) = (__value__(T5) + 3.0D00)
      OpenAD_Symbol_10 = 1_w2f__i8
      __value__(T7) = (__value__(T6) +(-9.0D00))
      OpenAD_Symbol_12 = 1_w2f__i8
      OpenAD_Symbol_15 = EXP(__value__(T7))
      OpenAD_Symbol_14 = EXP(__value__(T7))
      __value__(Y1) = OpenAD_Symbol_15
      __value__(Y(1)) = __value__(Y1)
      OpenAD_Symbol_16 = (OpenAD_Symbol_0 * OpenAD_Symbol_2)
      OpenAD_Symbol_17 = (OpenAD_Symbol_16 * OpenAD_Symbol_5)
      OpenAD_Symbol_18 = (OpenAD_Symbol_17 * OpenAD_Symbol_8)
      OpenAD_Symbol_19 = (OpenAD_Symbol_18 * OpenAD_Symbol_10)
      OpenAD_Symbol_20 = (OpenAD_Symbol_19 * OpenAD_Symbol_12)
      OpenAD_Symbol_21 = (OpenAD_Symbol_20 * OpenAD_Symbol_14)
      OpenAD_Symbol_22 = (OpenAD_Symbol_21 * INT(1_w2f__i8))
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_22)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_24)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_24, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_23))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(1)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_23), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_23))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(X))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(X))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(Y))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(X))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(Y))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      __value__(T1) = __value__(X(1))
      __value__(T2) = (__value__(T1) + 2.0D00)
      OpenAD_Symbol_0 = 1_w2f__i8
      OpenAD_Symbol_4 = (__value__(T2) * 5.0D-01)
      OpenAD_Symbol_2 = 5.0D-01
      __value__(T3) = OpenAD_Symbol_4
      OpenAD_Symbol_7 = (__value__(T3) * 2.0D00)
      OpenAD_Symbol_5 = 2.0D00
      __value__(T4) = OpenAD_Symbol_7
      __value__(T5) = (__value__(T4) + 4.0D00)
      OpenAD_Symbol_8 = 1_w2f__i8
      __value__(T6) = (__value__(T5) + 3.0D00)
      OpenAD_Symbol_10 = 1_w2f__i8
      __value__(T7) = (__value__(T6) +(-9.0D00))
      OpenAD_Symbol_12 = 1_w2f__i8
      OpenAD_Symbol_15 = EXP(__value__(T7))
      OpenAD_Symbol_14 = EXP(__value__(T7))
      __value__(Y1) = OpenAD_Symbol_15
      __value__(Y(1)) = __value__(Y1)
      OpenAD_Symbol_16 = (OpenAD_Symbol_0 * OpenAD_Symbol_2)
      OpenAD_Symbol_17 = (OpenAD_Symbol_16 * OpenAD_Symbol_5)
      OpenAD_Symbol_18 = (OpenAD_Symbol_17 * OpenAD_Symbol_8)
      OpenAD_Symbol_19 = (OpenAD_Symbol_18 * OpenAD_Symbol_10)
      OpenAD_Symbol_20 = (OpenAD_Symbol_19 * OpenAD_Symbol_12)
      OpenAD_Symbol_21 = (OpenAD_Symbol_20 * OpenAD_Symbol_14)
      OpenAD_Symbol_22 = (OpenAD_Symbol_21 * INT(1_w2f__i8))
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_22)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_24)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_24, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_23))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(1)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_23), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_23))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
