C ***********************************************************
C Fortran file translated from WHIRL Fri Nov 10 15:51:23 2006
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
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_13
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
      REAL(w2f__8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_27
      REAL(w2f__8) OpenAD_Symbol_28
      TYPE (OpenADTy_active) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_31
      REAL(w2f__8) OpenAD_Symbol_32
      REAL(w2f__8) OpenAD_Symbol_33
      TYPE (OpenADTy_active) OpenAD_Symbol_34
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_36
      REAL(w2f__8) OpenAD_Symbol_37
      REAL(w2f__8) OpenAD_Symbol_38
      TYPE (OpenADTy_active) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_42
      REAL(w2f__8) OpenAD_Symbol_43
      TYPE (OpenADTy_active) OpenAD_Symbol_44
      REAL(w2f__8) OpenAD_Symbol_45
      REAL(w2f__8) OpenAD_Symbol_46
      REAL(w2f__8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 4)
      TYPE (OpenADTy_active) Y(1 : 4)
C
C     **** Local Variables and Functions ****
C
      TYPE (OpenADTy_active) T1
      TYPE (OpenADTy_active) T2
      TYPE (OpenADTy_active) T3
      REAL(w2f__8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_50
      REAL(w2f__8) OpenAD_Symbol_51
      REAL(w2f__8) OpenAD_Symbol_52
      REAL(w2f__8) OpenAD_Symbol_53
      REAL(w2f__8) OpenAD_Symbol_54
      REAL(w2f__8) OpenAD_Symbol_55
      REAL(w2f__8) OpenAD_Symbol_56
      REAL(w2f__8) OpenAD_Symbol_57
      REAL(w2f__8) OpenAD_Symbol_58
      REAL(w2f__8) OpenAD_Symbol_59
      REAL(w2f__8) OpenAD_Symbol_60
      REAL(w2f__8) OpenAD_Symbol_61
      REAL(w2f__8) OpenAD_Symbol_62
      REAL(w2f__8) OpenAD_Symbol_63
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
      __value__(T1) = (__value__(X(1)) / __value__(X(2)))
      __value__(T2) = (__value__(X(3)) * __value__(X(4)))
      __value__(T3) = (__value__(T1) * __value__(T2))
      __value__(Y(1)) = (__value__(T1) * __value__(T3))
      __value__(Y(2)) = (1.0D00 / __value__(T3))
      __value__(Y(3)) = SIN(__value__(T3))
      __value__(Y(4)) = (__value__(T2) * __value__(T3))
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_2 = (__value__(X(1)) / __value__(X(2)))
      OpenAD_Symbol_0 = (INT(1_w2f__i8) / __value__(X(2)))
      OpenAD_Symbol_1 = (-(__value__(X(1)) /(__value__(X(2)) *
     >  __value__(X(2)))))
      __value__(T1) = OpenAD_Symbol_2
      OpenAD_Symbol_5 = (__value__(X(3)) * __value__(X(4)))
      OpenAD_Symbol_3 = __value__(X(4))
      OpenAD_Symbol_4 = __value__(X(3))
      __value__(T2) = OpenAD_Symbol_5
      OpenAD_Symbol_8 = (__value__(T1) * __value__(T2))
      OpenAD_Symbol_6 = __value__(T2)
      OpenAD_Symbol_7 = __value__(T1)
      __value__(T3) = OpenAD_Symbol_8
      OpenAD_Symbol_11 = (__value__(T1) * __value__(T3))
      OpenAD_Symbol_9 = __value__(T3)
      OpenAD_Symbol_10 = __value__(T1)
      __value__(Y(1)) = OpenAD_Symbol_11
      OpenAD_Symbol_14 = (1.0D00 / __value__(T3))
      OpenAD_Symbol_13 = (-(1.0D00 /(__value__(T3) * __value__(T3))))
      __value__(Y(2)) = OpenAD_Symbol_14
      OpenAD_Symbol_16 = SIN(__value__(T3))
      OpenAD_Symbol_15 = COS(__value__(T3))
      __value__(Y(3)) = OpenAD_Symbol_16
      OpenAD_Symbol_19 = (__value__(T2) * __value__(T3))
      OpenAD_Symbol_17 = __value__(T3)
      OpenAD_Symbol_18 = __value__(T2)
      __value__(Y(4)) = OpenAD_Symbol_19
      OpenAD_Symbol_20 = (OpenAD_Symbol_0 * OpenAD_Symbol_6)
      OpenAD_Symbol_21 = (OpenAD_Symbol_0 * OpenAD_Symbol_9)
      OpenAD_Symbol_22 = (OpenAD_Symbol_1 * OpenAD_Symbol_6)
      OpenAD_Symbol_23 = (OpenAD_Symbol_1 * OpenAD_Symbol_9)
      OpenAD_Symbol_24 = (OpenAD_Symbol_3 * OpenAD_Symbol_7)
      OpenAD_Symbol_25 = (OpenAD_Symbol_3 * OpenAD_Symbol_17)
      OpenAD_Symbol_26 = (OpenAD_Symbol_4 * OpenAD_Symbol_7)
      OpenAD_Symbol_27 = (OpenAD_Symbol_4 * OpenAD_Symbol_17)
      OpenAD_Symbol_28 = (OpenAD_Symbol_21 + OpenAD_Symbol_20 *
     >  OpenAD_Symbol_10)
      OpenAD_Symbol_30 = (OpenAD_Symbol_20 * OpenAD_Symbol_13)
      OpenAD_Symbol_31 = (OpenAD_Symbol_20 * OpenAD_Symbol_15)
      OpenAD_Symbol_32 = (OpenAD_Symbol_20 * OpenAD_Symbol_18)
      OpenAD_Symbol_33 = (OpenAD_Symbol_23 + OpenAD_Symbol_22 *
     >  OpenAD_Symbol_10)
      OpenAD_Symbol_35 = (OpenAD_Symbol_22 * OpenAD_Symbol_13)
      OpenAD_Symbol_36 = (OpenAD_Symbol_22 * OpenAD_Symbol_15)
      OpenAD_Symbol_37 = (OpenAD_Symbol_22 * OpenAD_Symbol_18)
      OpenAD_Symbol_38 = (OpenAD_Symbol_24 * OpenAD_Symbol_10)
      OpenAD_Symbol_40 = (OpenAD_Symbol_24 * OpenAD_Symbol_13)
      OpenAD_Symbol_41 = (OpenAD_Symbol_24 * OpenAD_Symbol_15)
      OpenAD_Symbol_42 = (OpenAD_Symbol_25 + OpenAD_Symbol_24 *
     >  OpenAD_Symbol_18)
      OpenAD_Symbol_43 = (OpenAD_Symbol_26 * OpenAD_Symbol_10)
      OpenAD_Symbol_45 = (OpenAD_Symbol_26 * OpenAD_Symbol_13)
      OpenAD_Symbol_46 = (OpenAD_Symbol_26 * OpenAD_Symbol_15)
      OpenAD_Symbol_47 = (OpenAD_Symbol_27 + OpenAD_Symbol_26 *
     >  OpenAD_Symbol_18)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_28)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_30)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_31)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_32)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_33)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_35)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_36)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_37)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_38)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_40)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_41)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_42)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_43)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_45)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_46)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_47)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_48)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_48, __deriv__(Y(4)), __deriv__(
     > OpenAD_Symbol_44))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_49)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_49, __deriv__(Y(3)), __deriv__(
     > OpenAD_Symbol_44))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_50)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_50, __deriv__(Y(2)), __deriv__(
     > OpenAD_Symbol_44))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_51)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_51, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_44))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_52)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_52, __deriv__(Y(4)), __deriv__(
     > OpenAD_Symbol_39))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_53)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_53, __deriv__(Y(3)), __deriv__(
     > OpenAD_Symbol_39))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_54)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_54, __deriv__(Y(2)), __deriv__(
     > OpenAD_Symbol_39))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_55)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_55, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_39))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_56)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_56, __deriv__(Y(4)), __deriv__(
     > OpenAD_Symbol_34))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_57)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_57, __deriv__(Y(3)), __deriv__(
     > OpenAD_Symbol_34))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_58)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_58, __deriv__(Y(2)), __deriv__(
     > OpenAD_Symbol_34))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_59)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_59, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_34))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_60)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_60, __deriv__(Y(4)), __deriv__(
     > OpenAD_Symbol_29))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(4)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_61)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_61, __deriv__(Y(3)), __deriv__(
     > OpenAD_Symbol_29))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(3)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_62)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_62, __deriv__(Y(2)), __deriv__(
     > OpenAD_Symbol_29))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(2)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_63)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_63, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_29))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(1)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_29), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_29))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_34), __deriv__(X(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_34))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_39), __deriv__(X(3)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_39))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_44), __deriv__(X(4)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_44))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(X))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ INLINE cp_res_store_real_vector_a(subst)
      CALL cp_res_store_real_vector_a(__deriv__(Y))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(X))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ INLINE cp_res_restore_real_vector_a(subst)
      CALL cp_res_restore_real_vector_a(__deriv__(Y))
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
      END SUBROUTINE
