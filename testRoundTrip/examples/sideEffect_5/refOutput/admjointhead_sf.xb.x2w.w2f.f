
      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Global Variables & Derived Type Definitions ****
C
      INTEGER(w2f__i4) G
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE foo(A, N)
      use w2f__types
      use all_globals_mod
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      INTEGER(w2f__i8) OpenAD_Symbol_10
      INTEGER(w2f__i8) OpenAD_Symbol_11
      INTEGER(w2f__i8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_2
      TYPE (OpenADTy_active) OpenAD_Symbol_5
      INTEGER(w2f__i8) OpenAD_Symbol_7
      INTEGER(w2f__i8) OpenAD_Symbol_8
      INTEGER(w2f__i8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      INTEGER(w2f__i4) N
      TYPE (OpenADTy_active) A(1 : INT((N + G)))
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      INTEGER(w2f__i8) OpenAD_Symbol_19
      INTEGER(w2f__i8) OpenAD_Symbol_20
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      DO I = 1, (N + 1), 1
        __value__(A(INT(I))) = (__value__(A(I)) * 2.0D00)
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_9 = 0_w2f__i8
      DO I = 1, (N + 1), 1
        OpenAD_Symbol_2 = (__value__(A(I)) * 2.0D00)
        OpenAD_Symbol_0 = 2.0D00
        __value__(A(INT(I))) = OpenAD_Symbol_2
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        OpenAD_Symbol_9 = (INT(OpenAD_Symbol_9) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_9)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_7)
      OpenAD_Symbol_8 = 1
      DO WHILE(INT(OpenAD_Symbol_8) .LE. INT(OpenAD_Symbol_7))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_19)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(2.0D00, __deriv__(A(INT(OpenAD_Symbol_19))),
     >  __deriv__(OpenAD_Symbol_5))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(A(INT(OpenAD_Symbol_19))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_20)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_5), __deriv__(A(INT(
     > OpenAD_Symbol_20))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_5))
        OpenAD_Symbol_8 = INT(OpenAD_Symbol_8) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(G)
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(N)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(A))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(A))
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(N)
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(G)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(A))
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(G)
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(N)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(A))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(A))
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(N)
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(G)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(A))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_12 = 0_w2f__i8
      DO I = 1, (N + 1), 1
        OpenAD_Symbol_2 = (__value__(A(I)) * 2.0D00)
        OpenAD_Symbol_0 = 2.0D00
        __value__(A(INT(I))) = OpenAD_Symbol_2
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        OpenAD_Symbol_12 = (INT(OpenAD_Symbol_12) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_12)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_10)
      OpenAD_Symbol_11 = 1
      DO WHILE(INT(OpenAD_Symbol_11) .LE. INT(OpenAD_Symbol_10))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_19)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(2.0D00, __deriv__(A(INT(OpenAD_Symbol_19))),
     >  __deriv__(OpenAD_Symbol_5))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(A(INT(OpenAD_Symbol_19))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_20)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_5), __deriv__(A(INT(
     > OpenAD_Symbol_20))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_5))
        OpenAD_Symbol_11 = INT(OpenAD_Symbol_11) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use all_globals_mod
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      INTEGER(w2f__i8) OpenAD_Symbol_13
      INTEGER(w2f__i8) OpenAD_Symbol_14
      INTEGER(w2f__i8) OpenAD_Symbol_15
      INTEGER(w2f__i8) OpenAD_Symbol_16
      INTEGER(w2f__i8) OpenAD_Symbol_17
      INTEGER(w2f__i8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      TYPE (OpenADTy_active) OpenAD_Symbol_6
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 3)
      TYPE (OpenADTy_active) Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      EXTERNAL foo
      INTEGER(w2f__i4) I
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
      G = 1
      I = 2
      CALL foo(__deriv__(X), 2)
      CALL foo(__deriv__(X), I)
      __value__(Y(1)) = 0
      DO I = 1, 3, 1
        __value__(Y(1)) = (__value__(X(I)) + __value__(Y(1)))
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      G = 1
      I = 2
      CALL foo(__deriv__(X), 2)
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(G)
      CALL foo(__deriv__(X), I)
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(G)
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(I)
      __value__(Y(1)) = 0
      OpenAD_Symbol_15 = 0_w2f__i8
      DO I = 1, 3, 1
        __value__(Y(1)) = (__value__(X(I)) + __value__(Y(1)))
        OpenAD_Symbol_3 = 1_w2f__i8
        OpenAD_Symbol_4 = 1_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        OpenAD_Symbol_15 = (INT(OpenAD_Symbol_15) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_15)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_13)
      OpenAD_Symbol_14 = 1
      DO WHILE(INT(OpenAD_Symbol_14) .LE. INT(OpenAD_Symbol_13))
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(1_w2f__i8, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_6))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_21)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(1_w2f__i8, __deriv__(Y(1)), __deriv__(X(INT(
     > OpenAD_Symbol_21))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(Y(1)))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_6), __deriv__(Y(1)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_6))
        OpenAD_Symbol_14 = INT(OpenAD_Symbol_14) + 1
      END DO
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(1)))
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(I)
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(G)
      CALL foo(__deriv__(X), I)
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(G)
      CALL foo(__deriv__(X), 2)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(G)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(G)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(G)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(G)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      G = 1
      I = 2
      CALL foo(__deriv__(X), 2)
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(G)
      CALL foo(__deriv__(X), I)
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(G)
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(I)
      __value__(Y(1)) = 0
      OpenAD_Symbol_18 = 0_w2f__i8
      DO I = 1, 3, 1
        __value__(Y(1)) = (__value__(X(I)) + __value__(Y(1)))
        OpenAD_Symbol_3 = 1_w2f__i8
        OpenAD_Symbol_4 = 1_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        OpenAD_Symbol_18 = (INT(OpenAD_Symbol_18) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_18)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_16)
      OpenAD_Symbol_17 = 1
      DO WHILE(INT(OpenAD_Symbol_17) .LE. INT(OpenAD_Symbol_16))
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(1_w2f__i8, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_6))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_21)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(1_w2f__i8, __deriv__(Y(1)), __deriv__(X(INT(
     > OpenAD_Symbol_21))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(Y(1)))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_6), __deriv__(Y(1)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_6))
        OpenAD_Symbol_17 = INT(OpenAD_Symbol_17) + 1
      END DO
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(1)))
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(I)
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(G)
      CALL foo(__deriv__(X), I)
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(G)
      CALL foo(__deriv__(X), 2)
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
