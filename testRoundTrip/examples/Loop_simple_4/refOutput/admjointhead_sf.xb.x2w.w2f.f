C ***********************************************************
C Fortran file translated from WHIRL Tue Jul 24 13:22:59 2007
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

      SUBROUTINE foo(X, Y, K)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      TYPE (OpenADTy_active) OpenAD_Symbol_10
      INTEGER(w2f__i8) OpenAD_Symbol_11
      INTEGER(w2f__i8) OpenAD_Symbol_12
      INTEGER(w2f__i8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      TYPE (OpenADTy_active) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      TYPE (OpenADTy_active) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y(1 : 2)
      INTEGER(w2f__i4) K
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) J
      INTEGER(w2f__i8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      INTEGER(w2f__i8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_17
      INTEGER(w2f__i8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      INTEGER(w2f__i8) OpenAD_Symbol_20
      INTEGER(w2f__i8) OpenAD_Symbol_21
      INTEGER(w2f__i8) OpenAD_Symbol_22
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      J = K
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        __value__(Y(INT(J))) = (__value__(Y(J)) + __value__(X(I)) *
     >  __value__(X(I)))
      END DO
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      J = K
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        OpenAD_Symbol_4 = (__value__(Y(J)) + __value__(X(I)) *
     >  __value__(X(I)))
        OpenAD_Symbol_0 = 1_w2f__i8
        OpenAD_Symbol_2 = __value__(X(I))
        OpenAD_Symbol_3 = __value__(X(I))
        OpenAD_Symbol_1 = 1_w2f__i8
        __value__(Y(INT(J))) = OpenAD_Symbol_4
        OpenAD_Symbol_5 = (OpenAD_Symbol_2 * OpenAD_Symbol_1)
        OpenAD_Symbol_7 = (OpenAD_Symbol_3 * OpenAD_Symbol_1)
        OpenAD_Symbol_9 = OpenAD_Symbol_0
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_5)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_7)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_9)
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(J)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(J)
      I = 1 + 1 *((2 - 1) / 1)
      DO WHILE(I .GE. 1)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_15)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_15, __deriv__(Y(J)), __deriv__(
     > OpenAD_Symbol_10))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_17)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_17, __deriv__(Y(J)), __deriv__(
     > OpenAD_Symbol_8))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_19)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_19, __deriv__(Y(J)), __deriv__(
     > OpenAD_Symbol_6))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(Y(J)))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_6), __deriv__(X(I)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_6))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_8), __deriv__(X(I)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_8))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_10), __deriv__(Y(J)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_10))
        I = I - 1
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(Y))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(Y))
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
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(Y))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(Y))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(Y))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      J = K
C$OPENAD XXX Simple loop
      OpenAD_Symbol_13 = 0_w2f__i8
      DO I = 1, 2, 1
        OpenAD_Symbol_4 = (__value__(Y(J)) + __value__(X(I)) *
     >  __value__(X(I)))
        OpenAD_Symbol_0 = 1_w2f__i8
        OpenAD_Symbol_2 = __value__(X(I))
        OpenAD_Symbol_3 = __value__(X(I))
        OpenAD_Symbol_1 = 1_w2f__i8
        __value__(Y(INT(J))) = OpenAD_Symbol_4
        OpenAD_Symbol_5 = (OpenAD_Symbol_2 * OpenAD_Symbol_1)
        OpenAD_Symbol_7 = (OpenAD_Symbol_3 * OpenAD_Symbol_1)
        OpenAD_Symbol_9 = OpenAD_Symbol_0
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(J)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_5)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(J)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_7)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(J)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_9)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(J)
        OpenAD_Symbol_13 = (INT(OpenAD_Symbol_13) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_13)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_11)
      OpenAD_Symbol_12 = 1
      DO WHILE(INT(OpenAD_Symbol_12) .LE. INT(OpenAD_Symbol_11))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_14)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_15)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_15, __deriv__(Y(INT(OpenAD_Symbol_14))
     > ), __deriv__(OpenAD_Symbol_10))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_16)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_17)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_17, __deriv__(Y(INT(OpenAD_Symbol_16))
     > ), __deriv__(OpenAD_Symbol_8))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_18)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_19)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_19, __deriv__(Y(INT(OpenAD_Symbol_18))
     > ), __deriv__(OpenAD_Symbol_6))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_18))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_20)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_6), __deriv__(X(INT(
     > OpenAD_Symbol_20))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_6))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_21)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_8), __deriv__(X(INT(
     > OpenAD_Symbol_21))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_8))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_22)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_10), __deriv__(Y(INT(
     > OpenAD_Symbol_22))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_10))
        OpenAD_Symbol_12 = INT(OpenAD_Symbol_12) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y(1 : 2)
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
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      __value__(Y(1)) = 1.0D00
      __value__(Y(2)) = 1.0D00
      CALL foo(__deriv__(X), __deriv__(Y), 1_w2f__i8)
      CALL foo(__deriv__(X), __deriv__(Y), 2_w2f__i8)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      __value__(Y(1)) = 1.0D00
      __value__(Y(2)) = 1.0D00
      CALL foo(__deriv__(X), __deriv__(Y), 1_w2f__i8)
      CALL foo(__deriv__(X), __deriv__(Y), 2_w2f__i8)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
      CALL foo(__deriv__(X), __deriv__(Y), 2_w2f__i8)
      CALL foo(__deriv__(X), __deriv__(Y), 1_w2f__i8)
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(1)))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(Y))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(Y))
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
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(Y))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(Y))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(Y))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      __value__(Y(1)) = 1.0D00
      __value__(Y(2)) = 1.0D00
      CALL foo(__deriv__(X), __deriv__(Y), 1_w2f__i8)
      CALL foo(__deriv__(X), __deriv__(Y), 2_w2f__i8)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
      CALL foo(__deriv__(X), __deriv__(Y), 2_w2f__i8)
      CALL foo(__deriv__(X), __deriv__(Y), 1_w2f__i8)
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(1)))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
