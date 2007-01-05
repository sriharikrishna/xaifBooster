C ***********************************************************
<<<<<<< /sandbox/ikarlin/bin2/OpenAD/xaifBooster_karlin_new/xaifBooster/testRoundTrip/examples/lion/refOutput/admjointhead_sf.xb.x2w.w2f.f
C Fortran file translated from WHIRL Thu Nov  2 17:12:21 2006
=======
C Fortran file translated from WHIRL Fri Nov 10 16:35:17 2006
>>>>>>> /tmp/admjointhead_sf.xb.x2w.w2f.f~other.zc5pHp
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
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_34
      TYPE (OpenADTy_active) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_36
      TYPE (OpenADTy_active) OpenAD_Symbol_37
      REAL(w2f__8) OpenAD_Symbol_38
      TYPE (OpenADTy_active) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_40
      TYPE (OpenADTy_active) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_42
      TYPE (OpenADTy_active) OpenAD_Symbol_43
      REAL(w2f__8) OpenAD_Symbol_44
      TYPE (OpenADTy_active) OpenAD_Symbol_45
      REAL(w2f__8) OpenAD_Symbol_46
      TYPE (OpenADTy_active) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_48
      TYPE (OpenADTy_active) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_5
      TYPE (OpenADTy_active) OpenAD_Symbol_50
      TYPE (OpenADTy_active) OpenAD_Symbol_51
      TYPE (OpenADTy_active) OpenAD_Symbol_52
      TYPE (OpenADTy_active) OpenAD_Symbol_53
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
      REAL(w2f__8) OpenAD_Symbol_54
      REAL(w2f__8) OpenAD_Symbol_55
      REAL(w2f__8) OpenAD_Symbol_56
      REAL(w2f__8) OpenAD_Symbol_57
      REAL(w2f__8) OpenAD_Symbol_58
      REAL(w2f__8) OpenAD_Symbol_59
      REAL(w2f__8) OpenAD_Symbol_60
      REAL(w2f__8) OpenAD_Symbol_61
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
C     $OpenAD$ INLINE countmult(subst)
      CALL countmult(17_w2f__i8)
C     $OpenAD$ INLINE countadd(subst)
      CALL countadd(1_w2f__i8)
C     $OpenAD$ INLINE countmult(subst)
      CALL countmult(0_w2f__i8)
C     $OpenAD$ INLINE countadd(subst)
      CALL countadd(0_w2f__i8)
C     $OpenAD$ INLINE countmult(subst)
      CALL countmult(0_w2f__i8)
C     $OpenAD$ INLINE countadd(subst)
      CALL countadd(0_w2f__i8)
C     $OpenAD$ INLINE countmult(subst)
      CALL countmult(0_w2f__i8)
C     $OpenAD$ INLINE countadd(subst)
      CALL countadd(0_w2f__i8)
C     $OpenAD$ INLINE countmult(subst)
      CALL countmult(0_w2f__i8)
C     $OpenAD$ INLINE countadd(subst)
      CALL countadd(0_w2f__i8)
C     $OpenAD$ INLINE countmult(subst)
      CALL countmult(0_w2f__i8)
C     $OpenAD$ INLINE countadd(subst)
      CALL countadd(0_w2f__i8)
C     $OpenAD$ INLINE countmult(subst)
      CALL countmult(0_w2f__i8)
C     $OpenAD$ INLINE countadd(subst)
      CALL countadd(0_w2f__i8)
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_2 = (__value__(X(1)) / __value__(X(2)))
      OpenAD_Symbol_0 = (INT(1_w2f__i8) / __value__(X(2)))
      OpenAD_Symbol_1 = (-(__value__(X(1)) /(__value__(X(2)) *
     >  __value__(X(2)))))
      __value__(T1) = OpenAD_Symbol_2
      OpenAD_Symbol_34 = OpenAD_Symbol_0
      OpenAD_Symbol_36 = OpenAD_Symbol_1
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_34)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_36)
      OpenAD_Symbol_4 = COS(__value__(T1))
      OpenAD_Symbol_3 = (- SIN(__value__(T1)))
      __value__(T2) = OpenAD_Symbol_4
      OpenAD_Symbol_38 = OpenAD_Symbol_3
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_38)
      OpenAD_Symbol_6 = EXP(__value__(T2))
      OpenAD_Symbol_5 = EXP(__value__(T2))
      __value__(Y1) = OpenAD_Symbol_6
      OpenAD_Symbol_40 = OpenAD_Symbol_5
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_40)
      OpenAD_Symbol_9 = (__value__(T2) * 3.14000010490417480469D00)
      OpenAD_Symbol_7 = 3.14000010490417480469D00
      __value__(Y2) = OpenAD_Symbol_9
      OpenAD_Symbol_42 = OpenAD_Symbol_7
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_42)
      OpenAD_Symbol_11 = SIN(__value__(T2))
      OpenAD_Symbol_10 = COS(__value__(T2))
      __value__(Y3) = OpenAD_Symbol_11
      OpenAD_Symbol_44 = OpenAD_Symbol_10
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_44)
      OpenAD_Symbol_14 = (__value__(T1) * __value__(T2))
      OpenAD_Symbol_12 = __value__(T2)
      OpenAD_Symbol_13 = __value__(T1)
      __value__(Y4) = OpenAD_Symbol_14
      OpenAD_Symbol_46 = OpenAD_Symbol_12
      OpenAD_Symbol_48 = OpenAD_Symbol_13
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_46)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_48)
      __value__(Y(1)) = __value__(Y1)
      __value__(Y(2)) = __value__(Y2)
      __value__(Y(3)) = __value__(Y3)
      __value__(Y(4)) = __value__(Y4)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
      CALL CondIncZeroDeriv(__deriv__(Y(4)), __deriv__(OpenAD_Symbol_53
     > ))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_53), __deriv__(Y4))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_53))
C     $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
      CALL CondIncZeroDeriv(__deriv__(Y(3)), __deriv__(OpenAD_Symbol_52
     > ))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_52), __deriv__(Y3))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_52))
C     $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
      CALL CondIncZeroDeriv(__deriv__(Y(2)), __deriv__(OpenAD_Symbol_51
     > ))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_51), __deriv__(Y2))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_51))
C     $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
      CALL CondIncZeroDeriv(__deriv__(Y(1)), __deriv__(OpenAD_Symbol_50
     > ))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_50), __deriv__(Y1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_50))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_54)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_54, __deriv__(Y4), __deriv__(
     > OpenAD_Symbol_49))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_55)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_55, __deriv__(Y4), __deriv__(
     > OpenAD_Symbol_47))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y4))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_47), __deriv__(T1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_47))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_49), __deriv__(T2))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_49))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_56)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_56, __deriv__(Y3), __deriv__(
     > OpenAD_Symbol_45))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y3))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_45), __deriv__(T2))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_45))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_57)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_57, __deriv__(Y2), __deriv__(
     > OpenAD_Symbol_43))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y2))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_43), __deriv__(T2))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_43))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_58)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_58, __deriv__(Y1), __deriv__(
     > OpenAD_Symbol_41))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y1))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_41), __deriv__(T2))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_41))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_59)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_59, __deriv__(T2), __deriv__(
     > OpenAD_Symbol_39))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(T2))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_39), __deriv__(T1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_39))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_60)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_60, __deriv__(T1), __deriv__(
     > OpenAD_Symbol_37))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_61)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_61, __deriv__(T1), __deriv__(
     > OpenAD_Symbol_35))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(T1))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_35), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_35))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_37), __deriv__(X(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_37))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE countcheckpoint()
      CALL countcheckpoint()
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
