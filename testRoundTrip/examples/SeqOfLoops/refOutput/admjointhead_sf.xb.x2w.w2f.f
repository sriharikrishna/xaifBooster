C ***********************************************************
C Fortran file translated from WHIRL Fri Jul 21 11:38:40 2006
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
      INTEGER(w2f__i8) OpenAD_Symbol_10
      INTEGER(w2f__i8) OpenAD_Symbol_11
      INTEGER(w2f__i8) OpenAD_Symbol_12
      INTEGER(w2f__i8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_2
      TYPE (OpenADTy_active) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      TYPE (OpenADTy_active) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      TYPE (OpenADTy_active) OpenAD_Symbol_7
      INTEGER(w2f__i8) OpenAD_Symbol_8
      INTEGER(w2f__i8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y(1 : 2)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      INTEGER(w2f__i8) OpenAD_Symbol_14
      INTEGER(w2f__i8) OpenAD_Symbol_15
      INTEGER(w2f__i8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_17
      INTEGER(w2f__i8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      INTEGER(w2f__i8) OpenAD_Symbol_20
      INTEGER(w2f__i8) OpenAD_Symbol_21
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
      DO I = 1, 2, 1
        __value__(Y(INT(I))) = __value__(X(I))
      END DO
      DO I = 1, 2, 1
        __value__(Y(INT(I))) = (__value__(X(I)) * __value__(Y(I)))
      END DO
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_12 = 0_w2f__i8
      DO I = 1, 2, 1
        __value__(Y(INT(I))) = __value__(X(I))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        OpenAD_Symbol_12 = (INT(OpenAD_Symbol_12) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_12)
      OpenAD_Symbol_13 = 0_w2f__i8
      DO I = 1, 2, 1
        OpenAD_Symbol_2 = (__value__(X(I)) * __value__(Y(I)))
        OpenAD_Symbol_0 = __value__(Y(I))
        OpenAD_Symbol_1 = __value__(X(I))
        __value__(Y(INT(I))) = OpenAD_Symbol_2
        OpenAD_Symbol_4 = OpenAD_Symbol_0
        OpenAD_Symbol_6 = OpenAD_Symbol_1
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_4)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_6)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        OpenAD_Symbol_13 = (INT(OpenAD_Symbol_13) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_13)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_8)
      OpenAD_Symbol_9 = 1
      DO WHILE(INT(OpenAD_Symbol_9) .LE. INT(OpenAD_Symbol_8))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_16)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_17)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_17, __deriv__(Y(INT(OpenAD_Symbol_16))
     > ), __deriv__(OpenAD_Symbol_7))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_18)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_19)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_19, __deriv__(Y(INT(OpenAD_Symbol_18))
     > ), __deriv__(OpenAD_Symbol_5))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_18))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_20)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_5), __deriv__(X(INT(
     > OpenAD_Symbol_20))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_5))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_21)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_7), __deriv__(Y(INT(
     > OpenAD_Symbol_21))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_7))
        OpenAD_Symbol_9 = INT(OpenAD_Symbol_9) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_10)
      OpenAD_Symbol_11 = 1
      DO WHILE(INT(OpenAD_Symbol_11) .LE. INT(OpenAD_Symbol_10))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_14)
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_14))),
     >  __deriv__(OpenAD_Symbol_3))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_15)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_3), __deriv__(X(INT(
     > OpenAD_Symbol_15))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_3))
        OpenAD_Symbol_11 = INT(OpenAD_Symbol_11) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(Y))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ INLINE cp_res_store_real_vector_a(subst)
      CALL cp_res_store_real_vector_a(__deriv__(Y))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(Y))
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
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(Y))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_tsarg_restore_real_vector_a(subst)
      CALL cp_tsarg_restore_real_vector_a(__deriv__(Y))
C     $OpenAD$ INLINE cp_tsarg_restore_real_vector_a(subst)
      CALL cp_tsarg_restore_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(Y))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE