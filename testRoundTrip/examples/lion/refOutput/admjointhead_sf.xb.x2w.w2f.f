C ***********************************************************
C Fortran file translated from WHIRL Fri Jul 21 11:34:37 2006
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
      REAL(w2f__8) OpenAD_Symbol_12
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
      TYPE (OpenADTy_active) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_27
      REAL(w2f__8) OpenAD_Symbol_28
      REAL(w2f__8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_3
      TYPE (OpenADTy_active) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_31
      REAL(w2f__8) OpenAD_Symbol_32
      REAL(w2f__8) OpenAD_Symbol_33
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y(1 : 4)
C
C     **** Local Variables and Functions ****
C
      TYPE (OpenADTy_active) T1
      TYPE (OpenADTy_active) T2
      TYPE (OpenADTy_active) Y1
      TYPE (OpenADTy_active) Y2
      TYPE (OpenADTy_active) Y3
      TYPE (OpenADTy_active) Y4
      REAL(w2f__8) OpenAD_Symbol_34
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_36
      REAL(w2f__8) OpenAD_Symbol_37
      REAL(w2f__8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
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
      __value__(T2) = COS(__value__(T1))
      __value__(Y1) = EXP(__value__(T2))
      __value__(Y2) = (__value__(T2) * 3.14000010490417480469D00)
      __value__(Y3) = SIN(__value__(T2))
      __value__(Y4) = (__value__(T1) * __value__(T2))
      __value__(Y(1)) = __value__(Y1)
      __value__(Y(2)) = __value__(Y2)
      __value__(Y(3)) = __value__(Y3)
      __value__(Y(4)) = __value__(Y4)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_2 = (__value__(X(1)) / __value__(X(2)))
      OpenAD_Symbol_0 = (INT(1_w2f__i8) / __value__(X(2)))
      OpenAD_Symbol_1 = (-(__value__(X(1)) /(__value__(X(2)) *
     >  __value__(X(2)))))
      __value__(T1) = OpenAD_Symbol_2
      OpenAD_Symbol_4 = COS(__value__(T1))
      OpenAD_Symbol_3 = (- SIN(__value__(T1)))
      __value__(T2) = OpenAD_Symbol_4
      OpenAD_Symbol_6 = EXP(__value__(T2))
      OpenAD_Symbol_5 = EXP(__value__(T2))
      __value__(Y1) = OpenAD_Symbol_6
      OpenAD_Symbol_9 = (__value__(T2) * 3.14000010490417480469D00)
      OpenAD_Symbol_7 = 3.14000010490417480469D00
      __value__(Y2) = OpenAD_Symbol_9
      OpenAD_Symbol_11 = SIN(__value__(T2))
      OpenAD_Symbol_10 = COS(__value__(T2))
      __value__(Y3) = OpenAD_Symbol_11
      OpenAD_Symbol_14 = (__value__(T1) * __value__(T2))
      OpenAD_Symbol_12 = __value__(T2)
      OpenAD_Symbol_13 = __value__(T1)
      __value__(Y4) = OpenAD_Symbol_14
      __value__(Y(1)) = __value__(Y1)
      __value__(Y(2)) = __value__(Y2)
      __value__(Y(3)) = __value__(Y3)
      __value__(Y(4)) = __value__(Y4)
      OpenAD_Symbol_15 = (OpenAD_Symbol_12 * INT(1_w2f__i8))
      OpenAD_Symbol_16 = (OpenAD_Symbol_13 * INT(1_w2f__i8))
      OpenAD_Symbol_17 = (OpenAD_Symbol_10 * INT(1_w2f__i8))
      OpenAD_Symbol_18 = (OpenAD_Symbol_7 * INT(1_w2f__i8))
      OpenAD_Symbol_19 = (OpenAD_Symbol_5 * INT(1_w2f__i8))
      OpenAD_Symbol_20 = (OpenAD_Symbol_15 + OpenAD_Symbol_3 *
     >  OpenAD_Symbol_16)
      OpenAD_Symbol_21 = (OpenAD_Symbol_3 * OpenAD_Symbol_17)
      OpenAD_Symbol_22 = (OpenAD_Symbol_3 * OpenAD_Symbol_18)
      OpenAD_Symbol_23 = (OpenAD_Symbol_3 * OpenAD_Symbol_19)
      OpenAD_Symbol_24 = (OpenAD_Symbol_0 * OpenAD_Symbol_20)
      OpenAD_Symbol_26 = (OpenAD_Symbol_0 * OpenAD_Symbol_21)
      OpenAD_Symbol_27 = (OpenAD_Symbol_0 * OpenAD_Symbol_22)
      OpenAD_Symbol_28 = (OpenAD_Symbol_0 * OpenAD_Symbol_23)
      OpenAD_Symbol_29 = (OpenAD_Symbol_1 * OpenAD_Symbol_20)
      OpenAD_Symbol_31 = (OpenAD_Symbol_1 * OpenAD_Symbol_21)
      OpenAD_Symbol_32 = (OpenAD_Symbol_1 * OpenAD_Symbol_22)
      OpenAD_Symbol_33 = (OpenAD_Symbol_1 * OpenAD_Symbol_23)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_24)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_26)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_27)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_28)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_29)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_31)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_32)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_33)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_34)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_34, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_30))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_35)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_35, __deriv__(Y(2)), __deriv__(
     > OpenAD_Symbol_30))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_36)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_36, __deriv__(Y(3)), __deriv__(
     > OpenAD_Symbol_30))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_37)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_37, __deriv__(Y(4)), __deriv__(
     > OpenAD_Symbol_30))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_38)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_38, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_25))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(1)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_39)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_39, __deriv__(Y(2)), __deriv__(
     > OpenAD_Symbol_25))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(2)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_40)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_40, __deriv__(Y(3)), __deriv__(
     > OpenAD_Symbol_25))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(3)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_41)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_41, __deriv__(Y(4)), __deriv__(
     > OpenAD_Symbol_25))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(4)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_25), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_25))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_30), __deriv__(X(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_30))
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
C     $OpenAD$ INLINE cp_tsarg_store_real_vector_a(subst)
      CALL cp_tsarg_store_real_vector_a(__deriv__(Y))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(X))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_tsarg_restore_real_vector_a(subst)
      CALL cp_tsarg_restore_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(Y))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
