C ***********************************************************
C Fortran file translated from WHIRL Mon Apr  2 13:56:57 2007
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
      INTEGER(w2f__i8) OpenAD_Symbol_10
      INTEGER(w2f__i8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_2
      TYPE (OpenADTy_active) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      TYPE (OpenADTy_active) OpenAD_Symbol_5
      INTEGER(w2f__i8) OpenAD_Symbol_6
      INTEGER(w2f__i8) OpenAD_Symbol_7
      INTEGER(w2f__i8) OpenAD_Symbol_8
      INTEGER(w2f__i8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 3)
      TYPE (OpenADTy_active) Y(1 : 3)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      INTEGER(w2f__i8) OpenAD_Symbol_12
      INTEGER(w2f__i8) OpenAD_Symbol_13
      INTEGER(w2f__i8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      INTEGER(w2f__i8) OpenAD_Symbol_16
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
C$OPENAD XXX Simple loop\t
      DO I = 1, 3, 1
        IF(I .eq. INT(2_w2f__i8)) THEN
          __value__(Y(INT(I))) = __value__(X(I))
        ELSE
          __value__(Y(INT(I))) = (__value__(X(I)) * 2.0D00)
        ENDIF
      END DO
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
C$OPENAD XXX Simple loop\t
      DO I = 1, 3, 1
        IF(I .eq. INT(2_w2f__i8)) THEN
          __value__(Y(INT(I))) = __value__(X(I))
        ELSE
          OpenAD_Symbol_2 = (__value__(X(I)) * 2.0D00)
          OpenAD_Symbol_0 = 2.0D00
          __value__(Y(INT(I))) = OpenAD_Symbol_2
          OpenAD_Symbol_4 = OpenAD_Symbol_0
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_4)
        ENDIF
      END DO
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
      I = 1 + 1 *((3 - 1) / 1)
      DO WHILE(I .GE. 1)
        IF(I .eq. INT(2_w2f__i8)) THEN
C         $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
          CALL CondIncZeroDeriv(__deriv__(Y(I)), __deriv__(
     > OpenAD_Symbol_3))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_3), __deriv__(X(I)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_3))
        ELSE
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_15)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_15, __deriv__(Y(I)), __deriv__(
     > OpenAD_Symbol_5))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(I)))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_5), __deriv__(X(I)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_5))
        ENDIF
        I = I - 1
      END DO
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
C$OPENAD XXX Simple loop\t
      OpenAD_Symbol_9 = 0_w2f__i8
      DO I = 1, 3, 1
        IF(I .eq. INT(2_w2f__i8)) THEN
          __value__(Y(INT(I))) = __value__(X(I))
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
          OpenAD_Symbol_10 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_10)
        ELSE
          OpenAD_Symbol_2 = (__value__(X(I)) * 2.0D00)
          OpenAD_Symbol_0 = 2.0D00
          __value__(Y(INT(I))) = OpenAD_Symbol_2
          OpenAD_Symbol_4 = OpenAD_Symbol_0
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_4)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
          OpenAD_Symbol_11 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_11)
        ENDIF
        OpenAD_Symbol_9 = (INT(OpenAD_Symbol_9) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_9)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_6)
      OpenAD_Symbol_7 = 1
      DO WHILE(INT(OpenAD_Symbol_7) .LE. INT(OpenAD_Symbol_6))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_8)
        IF(OpenAD_Symbol_8 .ne. 0) THEN
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_12)
C         $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
          CALL CondIncZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_12))),
     >  __deriv__(OpenAD_Symbol_3))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_13)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_3), __deriv__(X(INT(
     > OpenAD_Symbol_13))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_3))
        ELSE
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_14)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_15)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_15, __deriv__(Y(INT(OpenAD_Symbol_14
     > ))), __deriv__(OpenAD_Symbol_5))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_14))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_16)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_5), __deriv__(X(INT(
     > OpenAD_Symbol_16))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_5))
        ENDIF
        OpenAD_Symbol_7 = INT(OpenAD_Symbol_7) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
