
      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      MODULE aglobalmodule
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Global Variables & Derived Type Definitions ****
C
      CHARACTER(3) GLOBALSTRING
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE foo(X, Y)
      use w2f__types
      use aglobalmodule
      use aglobalmodule
      use aglobalmodule
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
      TYPE (OpenADTy_active) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      TYPE (OpenADTy_active) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      INTEGER(w2f__i8) OpenAD_Symbol_20
      INTEGER(w2f__i8) OpenAD_Symbol_21
      INTEGER(w2f__i8) OpenAD_Symbol_22
      INTEGER(w2f__i8) OpenAD_Symbol_23
      INTEGER(w2f__i8) OpenAD_Symbol_24
      INTEGER(w2f__i8) OpenAD_Symbol_25
      INTEGER(w2f__i8) OpenAD_Symbol_26
      INTEGER(w2f__i8) OpenAD_Symbol_27
      INTEGER(w2f__i8) OpenAD_Symbol_28
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y(1 : 2)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      CHARACTER(3) LOCALSTRING
      INTEGER(w2f__i8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_30
      INTEGER(w2f__i8) OpenAD_Symbol_31
      INTEGER(w2f__i8) OpenAD_Symbol_32
      REAL(w2f__8) OpenAD_Symbol_33
      INTEGER(w2f__i8) OpenAD_Symbol_34
      INTEGER(w2f__i8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_36
      INTEGER(w2f__i8) OpenAD_Symbol_37
      INTEGER(w2f__i8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_39
      INTEGER(w2f__i8) OpenAD_Symbol_40
      INTEGER(w2f__i8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_42
      INTEGER(w2f__i8) OpenAD_Symbol_43
      INTEGER(w2f__i8) OpenAD_Symbol_44
      REAL(w2f__8) OpenAD_Symbol_45
      INTEGER(w2f__i8) OpenAD_Symbol_46
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        IF(GLOBALSTRING .EQ. 'yes') THEN
          __value__(Y(INT(I))) = (__value__(Y(I)) + __value__(X(I)) *
     >  __value__(X(I)))
        ENDIF
        IF(GLOBALSTRING .EQ. 'no') THEN
          __value__(Y(INT(I))) = (__value__(Y(I)) + __value__(X(I)) *
     >  __value__(X(I)) * 2.0D00)
        ENDIF
      END DO
      GLOBALSTRING = 'either'
      LOCALSTRING = GLOBALSTRING
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        IF(GLOBALSTRING .EQ. 'yes') THEN
          __value__(Y(INT(I))) = (__value__(Y(I)) + __value__(X(I)) *
     >  __value__(X(I)))
          OpenAD_Symbol_0 = 1_w2f__i8
          OpenAD_Symbol_2 = __value__(X(I))
          OpenAD_Symbol_3 = __value__(X(I))
          OpenAD_Symbol_1 = 1_w2f__i8
          OpenAD_Symbol_11 = (OpenAD_Symbol_2 * OpenAD_Symbol_1)
          OpenAD_Symbol_12 = (OpenAD_Symbol_3 * OpenAD_Symbol_1)
          OpenAD_Symbol_13 = OpenAD_Symbol_0
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_11)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_12)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_13)
        ENDIF
        IF(GLOBALSTRING .EQ. 'no') THEN
          OpenAD_Symbol_6 = (__value__(X(I)) * __value__(X(I)))
          __value__(Y(INT(I))) = (__value__(Y(I)) + OpenAD_Symbol_6 *
     >  2.0D00)
          OpenAD_Symbol_4 = 1_w2f__i8
          OpenAD_Symbol_9 = __value__(X(I))
          OpenAD_Symbol_10 = __value__(X(I))
          OpenAD_Symbol_7 = 2.0D00
          OpenAD_Symbol_5 = 1_w2f__i8
          OpenAD_Symbol_15 = (OpenAD_Symbol_7 * OpenAD_Symbol_5)
          OpenAD_Symbol_16 = (OpenAD_Symbol_9 * OpenAD_Symbol_15)
          OpenAD_Symbol_17 = (OpenAD_Symbol_10 * OpenAD_Symbol_15)
          OpenAD_Symbol_18 = OpenAD_Symbol_4
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_16)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_17)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_18)
        ENDIF
      END DO
C     $OpenAD$ INLINE push_s(subst)
      CALL push_s(GLOBALSTRING)
      GLOBALSTRING = 'either'
      LOCALSTRING = GLOBALSTRING
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_s(subst)
      CALL pop_s(GLOBALSTRING)
      I = 1 + 1 *((2 - 1) / 1)
      DO WHILE(I .GE. 1)
        IF(GLOBALSTRING .EQ. 'no') THEN
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_39)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_39, __deriv__(Y(I)), __deriv__(
     > OpenAD_Symbol_19))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_42)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_42, __deriv__(Y(I)), __deriv__(X(I))
     > )
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_45)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_45, __deriv__(Y(I)), __deriv__(X(I))
     > )
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(I)))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_19), __deriv__(Y(I)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_19))
        ENDIF
        IF(GLOBALSTRING .EQ. 'yes') THEN
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_30)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_30, __deriv__(Y(I)), __deriv__(
     > OpenAD_Symbol_14))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_33)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_33, __deriv__(Y(I)), __deriv__(X(I))
     > )
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_36)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_36, __deriv__(Y(I)), __deriv__(X(I))
     > )
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(I)))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_14), __deriv__(Y(I)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_14))
        ENDIF
        I = I - 1
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_string_scalar(subst)
      CALL cp_arg_store_string_scalar(GLOBALSTRING)
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
C     $OpenAD$ INLINE cp_arg_restore_string_scalar(subst)
      CALL cp_arg_restore_string_scalar(GLOBALSTRING)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_string_scalar(subst)
      CALL cp_arg_store_string_scalar(GLOBALSTRING)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(Y))
C     $OpenAD$ INLINE cp_arg_store_string_scalar(subst)
      CALL cp_arg_store_string_scalar(GLOBALSTRING)
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
C     $OpenAD$ INLINE cp_arg_restore_string_scalar(subst)
      CALL cp_arg_restore_string_scalar(GLOBALSTRING)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(Y))
C     $OpenAD$ INLINE cp_arg_restore_string_scalar(subst)
      CALL cp_arg_restore_string_scalar(GLOBALSTRING)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
C$OPENAD XXX Simple loop
      OpenAD_Symbol_24 = 0_w2f__i8
      DO I = 1, 2, 1
        IF(GLOBALSTRING .EQ. 'yes') THEN
          __value__(Y(INT(I))) = (__value__(Y(I)) + __value__(X(I)) *
     >  __value__(X(I)))
          OpenAD_Symbol_0 = 1_w2f__i8
          OpenAD_Symbol_2 = __value__(X(I))
          OpenAD_Symbol_3 = __value__(X(I))
          OpenAD_Symbol_1 = 1_w2f__i8
          OpenAD_Symbol_11 = (OpenAD_Symbol_2 * OpenAD_Symbol_1)
          OpenAD_Symbol_12 = (OpenAD_Symbol_3 * OpenAD_Symbol_1)
          OpenAD_Symbol_13 = OpenAD_Symbol_0
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_11)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_12)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_13)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
          OpenAD_Symbol_25 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_25)
        ELSE
          OpenAD_Symbol_26 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_26)
        ENDIF
        IF(GLOBALSTRING .EQ. 'no') THEN
          OpenAD_Symbol_6 = (__value__(X(I)) * __value__(X(I)))
          __value__(Y(INT(I))) = (__value__(Y(I)) + OpenAD_Symbol_6 *
     >  2.0D00)
          OpenAD_Symbol_4 = 1_w2f__i8
          OpenAD_Symbol_9 = __value__(X(I))
          OpenAD_Symbol_10 = __value__(X(I))
          OpenAD_Symbol_7 = 2.0D00
          OpenAD_Symbol_5 = 1_w2f__i8
          OpenAD_Symbol_15 = (OpenAD_Symbol_7 * OpenAD_Symbol_5)
          OpenAD_Symbol_16 = (OpenAD_Symbol_9 * OpenAD_Symbol_15)
          OpenAD_Symbol_17 = (OpenAD_Symbol_10 * OpenAD_Symbol_15)
          OpenAD_Symbol_18 = OpenAD_Symbol_4
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_16)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_17)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_18)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
          OpenAD_Symbol_27 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_27)
        ELSE
          OpenAD_Symbol_28 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_28)
        ENDIF
        OpenAD_Symbol_24 = (INT(OpenAD_Symbol_24) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_24)
      GLOBALSTRING = 'either'
      LOCALSTRING = GLOBALSTRING
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_20)
      OpenAD_Symbol_21 = 1
      DO WHILE(INT(OpenAD_Symbol_21) .LE. INT(OpenAD_Symbol_20))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_22)
        IF(OpenAD_Symbol_22 .ne. 0) THEN
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_38)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_39)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_39, __deriv__(Y(INT(OpenAD_Symbol_38
     > ))), __deriv__(OpenAD_Symbol_19))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_40)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_41)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_42)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_42, __deriv__(Y(INT(OpenAD_Symbol_40
     > ))), __deriv__(X(INT(OpenAD_Symbol_41))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_43)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_44)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_45)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_45, __deriv__(Y(INT(OpenAD_Symbol_43
     > ))), __deriv__(X(INT(OpenAD_Symbol_44))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_43))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_46)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_19), __deriv__(Y(INT(
     > OpenAD_Symbol_46))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_19))
        ENDIF
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_23)
        IF(OpenAD_Symbol_23 .ne. 0) THEN
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_29)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_30)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_30, __deriv__(Y(INT(OpenAD_Symbol_29
     > ))), __deriv__(OpenAD_Symbol_14))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_31)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_32)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_33)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_33, __deriv__(Y(INT(OpenAD_Symbol_31
     > ))), __deriv__(X(INT(OpenAD_Symbol_32))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_34)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_35)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_36)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_36, __deriv__(Y(INT(OpenAD_Symbol_34
     > ))), __deriv__(X(INT(OpenAD_Symbol_35))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_34))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_37)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_14), __deriv__(Y(INT(
     > OpenAD_Symbol_37))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_14))
        ENDIF
        OpenAD_Symbol_21 = INT(OpenAD_Symbol_21) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use aglobalmodule
      use aglobalmodule
      use aglobalmodule
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
      GLOBALSTRING = 'yes'
      CALL foo(__deriv__(X), __deriv__(Y))
      GLOBALSTRING = 'both'
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      __value__(Y(1)) = 1.0D00
      __value__(Y(2)) = 1.0D00
      GLOBALSTRING = 'yes'
      CALL foo(__deriv__(X), __deriv__(Y))
      GLOBALSTRING = 'both'
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
      CALL foo(__deriv__(X), __deriv__(Y))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(1)))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_string_scalar(subst)
      CALL cp_arg_store_string_scalar(GLOBALSTRING)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_string_scalar(subst)
      CALL cp_arg_restore_string_scalar(GLOBALSTRING)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_string_scalar(subst)
      CALL cp_arg_store_string_scalar(GLOBALSTRING)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_string_scalar(subst)
      CALL cp_arg_restore_string_scalar(GLOBALSTRING)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      __value__(Y(1)) = 1.0D00
      __value__(Y(2)) = 1.0D00
      GLOBALSTRING = 'yes'
      CALL foo(__deriv__(X), __deriv__(Y))
      GLOBALSTRING = 'both'
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
      CALL foo(__deriv__(X), __deriv__(Y))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(1)))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
