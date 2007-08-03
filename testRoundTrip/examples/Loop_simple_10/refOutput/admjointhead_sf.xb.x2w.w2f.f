C ***********************************************************
C Fortran file translated from WHIRL Tue Jul 17 09:44:34 2007
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

      SUBROUTINE foo(X, Y, A, J)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      TYPE (OpenADTy_active) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      TYPE (OpenADTy_active) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      TYPE (OpenADTy_active) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      TYPE (OpenADTy_active) OpenAD_Symbol_16
      INTEGER(w2f__i8) OpenAD_Symbol_17
      INTEGER(w2f__i8) OpenAD_Symbol_18
      INTEGER(w2f__i8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      INTEGER(w2f__i8) OpenAD_Symbol_20
      INTEGER(w2f__i8) OpenAD_Symbol_21
      INTEGER(w2f__i8) OpenAD_Symbol_22
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      TYPE (OpenADTy_active) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 1)
      TYPE (OpenADTy_active) Y(1 : 1)
      INTEGER(w2f__i4) A(1 : 2, 1 : 2)
      INTEGER(w2f__i4) J
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      REAL(w2f__8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_50
C
C     **** Top Level Pragmas ****
C
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      __value__(Y(1)) = __value__(X(1))
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        IF(A(I, J) .ne. INT(0_w2f__i8)) THEN
          __value__(Y(1)) = (A(I, J) * __value__(X(1)) * __value__(Y(1)
     > ))
        ELSE
          __value__(Y(1)) = (__value__(Y(1)) - __value__(X(1)))
        ENDIF
      END DO
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      __value__(Y(1)) = __value__(X(1))
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        IF(A(I, J) .ne. INT(0_w2f__i8)) THEN
          OpenAD_Symbol_0 = (__value__(X(1)) * __value__(Y(1)))
          OpenAD_Symbol_5 = (A(I, J) * OpenAD_Symbol_0)
          OpenAD_Symbol_3 = __value__(Y(1))
          OpenAD_Symbol_4 = __value__(X(1))
          OpenAD_Symbol_2 = A(I, J)
          __value__(Y(1)) = OpenAD_Symbol_5
          OpenAD_Symbol_9 = (OpenAD_Symbol_3 * OpenAD_Symbol_2)
          OpenAD_Symbol_11 = (OpenAD_Symbol_4 * OpenAD_Symbol_2)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_9)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_11)
        ELSE
          __value__(Y(1)) = (__value__(Y(1)) - __value__(X(1)))
          OpenAD_Symbol_6 = 1_w2f__i8
          OpenAD_Symbol_7 = (-1_w2f__i8)
          OpenAD_Symbol_13 = OpenAD_Symbol_6
          OpenAD_Symbol_15 = OpenAD_Symbol_7
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_13)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_15)
        ENDIF
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(A(I, J))
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
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(A(I, J))
        IF(A(I, J) .ne. INT(0_w2f__i8)) THEN
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_47)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_47, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_12))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_48)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_48, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_10))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(1)))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_10), __deriv__(X(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_10))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_12), __deriv__(Y(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_12))
        ELSE
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_49)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_49, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_16))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_50)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_50, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_14))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(1)))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_14), __deriv__(Y(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_14))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_16), __deriv__(X(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_16))
        ENDIF
        I = I - 1
      END DO
C     $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
      CALL CondIncZeroDeriv(__deriv__(Y(1)), __deriv__(OpenAD_Symbol_8)
     > )
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_8), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_8))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(J)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(Y))
C     $OpenAD$ INLINE cp_arg_store_integer_matrix(subst)
      CALL cp_arg_store_integer_matrix(A)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_integer_matrix(subst)
      CALL cp_arg_restore_integer_matrix(A)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(Y))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(J)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(Y))
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(J)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(Y))
C     $OpenAD$ INLINE cp_arg_store_integer_matrix(subst)
      CALL cp_arg_store_integer_matrix(A)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_integer_matrix(subst)
      CALL cp_arg_restore_integer_matrix(A)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(Y))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(J)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(Y))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      __value__(Y(1)) = __value__(X(1))
C$OPENAD XXX Simple loop
      OpenAD_Symbol_20 = 0_w2f__i8
      DO I = 1, 2, 1
        IF(A(I, J) .ne. INT(0_w2f__i8)) THEN
          OpenAD_Symbol_0 = (__value__(X(1)) * __value__(Y(1)))
          OpenAD_Symbol_5 = (A(I, J) * OpenAD_Symbol_0)
          OpenAD_Symbol_3 = __value__(Y(1))
          OpenAD_Symbol_4 = __value__(X(1))
          OpenAD_Symbol_2 = A(I, J)
          __value__(Y(1)) = OpenAD_Symbol_5
          OpenAD_Symbol_9 = (OpenAD_Symbol_3 * OpenAD_Symbol_2)
          OpenAD_Symbol_11 = (OpenAD_Symbol_4 * OpenAD_Symbol_2)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_9)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_11)
          OpenAD_Symbol_21 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_21)
        ELSE
          __value__(Y(1)) = (__value__(Y(1)) - __value__(X(1)))
          OpenAD_Symbol_6 = 1_w2f__i8
          OpenAD_Symbol_7 = (-1_w2f__i8)
          OpenAD_Symbol_13 = OpenAD_Symbol_6
          OpenAD_Symbol_15 = OpenAD_Symbol_7
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_13)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_15)
          OpenAD_Symbol_22 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_22)
        ENDIF
        OpenAD_Symbol_20 = (INT(OpenAD_Symbol_20) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_20)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_17)
      OpenAD_Symbol_18 = 1
      DO WHILE(INT(OpenAD_Symbol_18) .LE. INT(OpenAD_Symbol_17))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_19)
        IF(OpenAD_Symbol_19 .ne. 0) THEN
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_47)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_47, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_12))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_48)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_48, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_10))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(1)))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_10), __deriv__(X(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_10))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_12), __deriv__(Y(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_12))
        ELSE
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_49)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_49, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_16))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_50)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_50, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_14))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(1)))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_14), __deriv__(Y(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_14))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_16), __deriv__(X(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_16))
        ENDIF
        OpenAD_Symbol_18 = INT(OpenAD_Symbol_18) + 1
      END DO
C     $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
      CALL CondIncZeroDeriv(__deriv__(Y(1)), __deriv__(OpenAD_Symbol_8)
     > )
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_8), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_8))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      INTEGER(w2f__i8) OpenAD_Symbol_23
      INTEGER(w2f__i8) OpenAD_Symbol_24
      INTEGER(w2f__i8) OpenAD_Symbol_25
      INTEGER(w2f__i8) OpenAD_Symbol_26
      INTEGER(w2f__i8) OpenAD_Symbol_27
      INTEGER(w2f__i8) OpenAD_Symbol_28
      INTEGER(w2f__i8) OpenAD_Symbol_29
      INTEGER(w2f__i8) OpenAD_Symbol_30
      INTEGER(w2f__i8) OpenAD_Symbol_31
      INTEGER(w2f__i8) OpenAD_Symbol_32
      INTEGER(w2f__i8) OpenAD_Symbol_33
      INTEGER(w2f__i8) OpenAD_Symbol_34
      INTEGER(w2f__i8) OpenAD_Symbol_35
      INTEGER(w2f__i8) OpenAD_Symbol_36
      INTEGER(w2f__i8) OpenAD_Symbol_37
      INTEGER(w2f__i8) OpenAD_Symbol_38
      INTEGER(w2f__i8) OpenAD_Symbol_39
      INTEGER(w2f__i8) OpenAD_Symbol_40
      INTEGER(w2f__i8) OpenAD_Symbol_41
      INTEGER(w2f__i8) OpenAD_Symbol_42
      INTEGER(w2f__i8) OpenAD_Symbol_43
      INTEGER(w2f__i8) OpenAD_Symbol_44
      INTEGER(w2f__i8) OpenAD_Symbol_45
      INTEGER(w2f__i8) OpenAD_Symbol_46
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 1)
      TYPE (OpenADTy_active) Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) A(1 : 2, 1 : 2)
      EXTERNAL foo
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) J
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
        DO J = 1, 2, 1
          A(I, J) = (I + J)
        END DO
      END DO
      CALL foo(__deriv__(X), __deriv__(Y), A, 2_w2f__i8)
      DO I = 1, 2, 1
        DO J = 1, 2, 1
          A(I, J) = 0
        END DO
      END DO
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_31 = 0_w2f__i8
      DO I = 1, 2, 1
        OpenAD_Symbol_32 = 0_w2f__i8
        DO J = 1, 2, 1
          A(I, J) = (I + J)
          OpenAD_Symbol_32 = (INT(OpenAD_Symbol_32) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_32)
        OpenAD_Symbol_31 = (INT(OpenAD_Symbol_31) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_31)
      CALL foo(__deriv__(X), __deriv__(Y), A, 2_w2f__i8)
      OpenAD_Symbol_33 = 0_w2f__i8
      DO I = 1, 2, 1
        OpenAD_Symbol_34 = 0_w2f__i8
        DO J = 1, 2, 1
          A(I, J) = 0
          OpenAD_Symbol_34 = (INT(OpenAD_Symbol_34) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_34)
        OpenAD_Symbol_33 = (INT(OpenAD_Symbol_33) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_33)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_23)
      OpenAD_Symbol_24 = 1
      DO WHILE(INT(OpenAD_Symbol_24) .LE. INT(OpenAD_Symbol_23))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_25)
        OpenAD_Symbol_26 = 1
        DO WHILE(INT(OpenAD_Symbol_26) .LE. INT(OpenAD_Symbol_25))
          OpenAD_Symbol_26 = INT(OpenAD_Symbol_26) + 1
        END DO
        OpenAD_Symbol_24 = INT(OpenAD_Symbol_24) + 1
      END DO
      CALL foo(__deriv__(X), __deriv__(Y), A, 2_w2f__i8)
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_27)
      OpenAD_Symbol_28 = 1
      DO WHILE(INT(OpenAD_Symbol_28) .LE. INT(OpenAD_Symbol_27))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_29)
        OpenAD_Symbol_30 = 1
        DO WHILE(INT(OpenAD_Symbol_30) .LE. INT(OpenAD_Symbol_29))
          OpenAD_Symbol_30 = INT(OpenAD_Symbol_30) + 1
        END DO
        OpenAD_Symbol_28 = INT(OpenAD_Symbol_28) + 1
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
      OpenAD_Symbol_43 = 0_w2f__i8
      DO I = 1, 2, 1
        OpenAD_Symbol_44 = 0_w2f__i8
        DO J = 1, 2, 1
          A(I, J) = (I + J)
          OpenAD_Symbol_44 = (INT(OpenAD_Symbol_44) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_44)
        OpenAD_Symbol_43 = (INT(OpenAD_Symbol_43) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_43)
      CALL foo(__deriv__(X), __deriv__(Y), A, 2_w2f__i8)
      OpenAD_Symbol_45 = 0_w2f__i8
      DO I = 1, 2, 1
        OpenAD_Symbol_46 = 0_w2f__i8
        DO J = 1, 2, 1
          A(I, J) = 0
          OpenAD_Symbol_46 = (INT(OpenAD_Symbol_46) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_46)
        OpenAD_Symbol_45 = (INT(OpenAD_Symbol_45) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_45)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_35)
      OpenAD_Symbol_36 = 1
      DO WHILE(INT(OpenAD_Symbol_36) .LE. INT(OpenAD_Symbol_35))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_37)
        OpenAD_Symbol_38 = 1
        DO WHILE(INT(OpenAD_Symbol_38) .LE. INT(OpenAD_Symbol_37))
          OpenAD_Symbol_38 = INT(OpenAD_Symbol_38) + 1
        END DO
        OpenAD_Symbol_36 = INT(OpenAD_Symbol_36) + 1
      END DO
      CALL foo(__deriv__(X), __deriv__(Y), A, 2_w2f__i8)
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_39)
      OpenAD_Symbol_40 = 1
      DO WHILE(INT(OpenAD_Symbol_40) .LE. INT(OpenAD_Symbol_39))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_41)
        OpenAD_Symbol_42 = 1
        DO WHILE(INT(OpenAD_Symbol_42) .LE. INT(OpenAD_Symbol_41))
          OpenAD_Symbol_42 = INT(OpenAD_Symbol_42) + 1
        END DO
        OpenAD_Symbol_40 = INT(OpenAD_Symbol_40) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
