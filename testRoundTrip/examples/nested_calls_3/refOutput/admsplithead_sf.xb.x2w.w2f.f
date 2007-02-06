C ***********************************************************
C Fortran file translated from WHIRL Mon Jan 15 13:31:01 2007
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
      REAL(w2f__8) OpenAD_Symbol_14
      TYPE (OpenADTy_active) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      TYPE (OpenADTy_active) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 4)
      TYPE (OpenADTy_active) Y(1 : 4)
C
C     **** Local Variables and Functions ****
C
      TYPE (OpenADTy_active) C
      TYPE (OpenADTy_active) D
      EXTERNAL foo
      REAL(w2f__8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_27
      REAL(w2f__8) OpenAD_Symbol_28
      REAL(w2f__8) OpenAD_Symbol_29
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
      CALL foo(__deriv__(X(1)), __deriv__(X(2)), __deriv__(C),
     >  __deriv__(D))
      __value__(Y(3)) = (__value__(C) * __value__(D))
      __value__(Y(4)) = (__value__(C) + __value__(D))
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      CALL foo(__deriv__(X(1)), __deriv__(X(2)), __deriv__(C),
     >  __deriv__(D))
      OpenAD_Symbol_2 = (__value__(C) * __value__(D))
      OpenAD_Symbol_0 = __value__(D)
      OpenAD_Symbol_1 = __value__(C)
      __value__(Y(3)) = OpenAD_Symbol_2
      __value__(Y(4)) = (__value__(C) + __value__(D))
      OpenAD_Symbol_3 = 1_w2f__i8
      OpenAD_Symbol_4 = 1_w2f__i8
      OpenAD_Symbol_14 = OpenAD_Symbol_0
      OpenAD_Symbol_16 = OpenAD_Symbol_1
      OpenAD_Symbol_18 = OpenAD_Symbol_3
      OpenAD_Symbol_19 = OpenAD_Symbol_4
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_14)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_16)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_18)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_19)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_26)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_26, __deriv__(Y(4)), __deriv__(
     > OpenAD_Symbol_17))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_27)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_27, __deriv__(Y(4)), __deriv__(
     > OpenAD_Symbol_15))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(4)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_28)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_28, __deriv__(Y(3)), __deriv__(
     > OpenAD_Symbol_17))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_29)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_29, __deriv__(Y(3)), __deriv__(
     > OpenAD_Symbol_15))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(3)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_15), __deriv__(C))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_15))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_17), __deriv__(D))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_17))
      CALL foo(__deriv__(X(1)), __deriv__(X(2)), __deriv__(C),
     >  __deriv__(D))
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
      CALL foo(__deriv__(X(1)), __deriv__(X(2)), __deriv__(C),
     >  __deriv__(D))
      OpenAD_Symbol_2 = (__value__(C) * __value__(D))
      OpenAD_Symbol_0 = __value__(D)
      OpenAD_Symbol_1 = __value__(C)
      __value__(Y(3)) = OpenAD_Symbol_2
      __value__(Y(4)) = (__value__(C) + __value__(D))
      OpenAD_Symbol_3 = 1_w2f__i8
      OpenAD_Symbol_4 = 1_w2f__i8
      OpenAD_Symbol_14 = OpenAD_Symbol_0
      OpenAD_Symbol_16 = OpenAD_Symbol_1
      OpenAD_Symbol_18 = OpenAD_Symbol_3
      OpenAD_Symbol_19 = OpenAD_Symbol_4
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_14)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_16)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_18)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_19)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_26)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_26, __deriv__(Y(4)), __deriv__(
     > OpenAD_Symbol_17))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_27)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_27, __deriv__(Y(4)), __deriv__(
     > OpenAD_Symbol_15))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(4)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_28)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_28, __deriv__(Y(3)), __deriv__(
     > OpenAD_Symbol_17))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_29)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_29, __deriv__(Y(3)), __deriv__(
     > OpenAD_Symbol_15))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(3)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_15), __deriv__(C))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_15))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_17), __deriv__(D))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_17))
      CALL foo(__deriv__(X(1)), __deriv__(X(2)), __deriv__(C),
     >  __deriv__(D))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE foo(A, B, C, D)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_20
      TYPE (OpenADTy_active) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_22
      TYPE (OpenADTy_active) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) A
      TYPE (OpenADTy_active) B
      TYPE (OpenADTy_active) C
      TYPE (OpenADTy_active) D
C
C     **** Local Variables and Functions ****
C
      REAL(w2f__8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_31
      REAL(w2f__8) OpenAD_Symbol_32
      REAL(w2f__8) OpenAD_Symbol_33
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      __value__(C) = SIN(__value__(A) * __value__(B))
      __value__(D) = COS(__value__(A) + __value__(B))
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_5 = (__value__(A) * __value__(B))
      OpenAD_Symbol_9 = SIN(OpenAD_Symbol_5)
      OpenAD_Symbol_7 = __value__(B)
      OpenAD_Symbol_8 = __value__(A)
      OpenAD_Symbol_6 = COS(OpenAD_Symbol_5)
      __value__(C) = OpenAD_Symbol_9
      OpenAD_Symbol_10 = (__value__(A) + __value__(B))
      __value__(D) = COS(OpenAD_Symbol_10)
      OpenAD_Symbol_12 = 1_w2f__i8
      OpenAD_Symbol_13 = 1_w2f__i8
      OpenAD_Symbol_11 = (- SIN(OpenAD_Symbol_10))
      OpenAD_Symbol_20 = (OpenAD_Symbol_7 * OpenAD_Symbol_6)
      OpenAD_Symbol_22 = (OpenAD_Symbol_8 * OpenAD_Symbol_6)
      OpenAD_Symbol_24 = (OpenAD_Symbol_12 * OpenAD_Symbol_11)
      OpenAD_Symbol_25 = (OpenAD_Symbol_13 * OpenAD_Symbol_11)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_20)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_22)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_24)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_25)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_30)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_30, __deriv__(D), __deriv__(
     > OpenAD_Symbol_23))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_31)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_31, __deriv__(D), __deriv__(
     > OpenAD_Symbol_21))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(D))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_32)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_32, __deriv__(C), __deriv__(
     > OpenAD_Symbol_23))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_33)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_33, __deriv__(C), __deriv__(
     > OpenAD_Symbol_21))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(C))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_21), __deriv__(A))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_21))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_23), __deriv__(B))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_23))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(A))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(B))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(B))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(A))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(C))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(D))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(A))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(B))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(B))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(A))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(D))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(C))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_5 = (__value__(A) * __value__(B))
      OpenAD_Symbol_9 = SIN(OpenAD_Symbol_5)
      OpenAD_Symbol_7 = __value__(B)
      OpenAD_Symbol_8 = __value__(A)
      OpenAD_Symbol_6 = COS(OpenAD_Symbol_5)
      __value__(C) = OpenAD_Symbol_9
      OpenAD_Symbol_10 = (__value__(A) + __value__(B))
      __value__(D) = COS(OpenAD_Symbol_10)
      OpenAD_Symbol_12 = 1_w2f__i8
      OpenAD_Symbol_13 = 1_w2f__i8
      OpenAD_Symbol_11 = (- SIN(OpenAD_Symbol_10))
      OpenAD_Symbol_20 = (OpenAD_Symbol_7 * OpenAD_Symbol_6)
      OpenAD_Symbol_22 = (OpenAD_Symbol_8 * OpenAD_Symbol_6)
      OpenAD_Symbol_24 = (OpenAD_Symbol_12 * OpenAD_Symbol_11)
      OpenAD_Symbol_25 = (OpenAD_Symbol_13 * OpenAD_Symbol_11)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_20)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_22)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_24)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_25)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_30)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_30, __deriv__(D), __deriv__(
     > OpenAD_Symbol_23))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_31)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_31, __deriv__(D), __deriv__(
     > OpenAD_Symbol_21))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(D))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_32)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_32, __deriv__(C), __deriv__(
     > OpenAD_Symbol_23))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_33)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_33, __deriv__(C), __deriv__(
     > OpenAD_Symbol_21))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(C))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_21), __deriv__(A))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_21))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_23), __deriv__(B))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_23))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
