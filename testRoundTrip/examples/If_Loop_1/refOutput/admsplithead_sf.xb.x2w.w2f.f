C ***********************************************************
C Fortran file translated from WHIRL Fri Nov 10 15:57:08 2006
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
      TYPE (OpenADTy_active) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      TYPE (OpenADTy_active) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      TYPE (OpenADTy_active) OpenAD_Symbol_14
      INTEGER(w2f__i8) OpenAD_Symbol_15
      INTEGER(w2f__i8) OpenAD_Symbol_16
      INTEGER(w2f__i8) OpenAD_Symbol_17
      INTEGER(w2f__i8) OpenAD_Symbol_18
      INTEGER(w2f__i8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      INTEGER(w2f__i8) OpenAD_Symbol_20
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
      TYPE (OpenADTy_active) X(1 : 1)
      TYPE (OpenADTy_active) Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_22
      REAL(w2f__8) OpenAD_Symbol_23
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
      __value__(Y(1)) = __value__(X(1))
      IF(__value__(Y(1)) .GT. 0.0D00) THEN
        DO I = 1, 3, 1
          __value__(Y(1)) = (__value__(X(1)) * __value__(Y(1)))
        END DO
      ELSE
        __value__(Y(1)) = (__value__(Y(1)) / __value__(X(1)))
      ENDIF
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      __value__(Y(1)) = __value__(X(1))
      IF(__value__(Y(1)) .GT. 0.0D00) THEN
        OpenAD_Symbol_18 = 0_w2f__i8
        DO I = 1, 3, 1
          OpenAD_Symbol_2 = (__value__(X(1)) * __value__(Y(1)))
          OpenAD_Symbol_0 = __value__(Y(1))
          OpenAD_Symbol_1 = __value__(X(1))
          __value__(Y(1)) = OpenAD_Symbol_2
          OpenAD_Symbol_7 = OpenAD_Symbol_0
          OpenAD_Symbol_9 = OpenAD_Symbol_1
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_7)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_9)
          OpenAD_Symbol_18 = (INT(OpenAD_Symbol_18) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_18)
        OpenAD_Symbol_20 = 1_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_20)
      ELSE
        OpenAD_Symbol_5 = (__value__(Y(1)) / __value__(X(1)))
        OpenAD_Symbol_3 = (INT(1_w2f__i8) / __value__(X(1)))
        OpenAD_Symbol_4 = (-(__value__(Y(1)) /(__value__(X(1)) *
     >  __value__(X(1)))))
        __value__(Y(1)) = OpenAD_Symbol_5
        OpenAD_Symbol_11 = OpenAD_Symbol_3
        OpenAD_Symbol_13 = OpenAD_Symbol_4
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_11)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_13)
        OpenAD_Symbol_19 = 0_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_19)
      ENDIF
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_15)
      IF(OpenAD_Symbol_15 .ne. 0) THEN
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_16)
        OpenAD_Symbol_17 = 1
        DO WHILE(INT(OpenAD_Symbol_17) .LE. INT(OpenAD_Symbol_16))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_21)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_21, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_10))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_22)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_22, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_8))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(1)))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_8), __deriv__(X(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_8))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_10), __deriv__(Y(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_10))
          OpenAD_Symbol_17 = INT(OpenAD_Symbol_17) + 1
        END DO
      ELSE
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_23)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_23, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_14))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_24)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_24, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_12))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(Y(1)))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_12), __deriv__(Y(1)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_12))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_14), __deriv__(X(1)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_14))
      ENDIF
C     $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
      CALL CondIncZeroDeriv(__deriv__(Y(1)), __deriv__(OpenAD_Symbol_6)
     > )
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_6), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_6))
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
      END SUBROUTINE
