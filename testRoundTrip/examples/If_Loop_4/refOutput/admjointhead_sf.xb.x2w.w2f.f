C ***********************************************************
C Fortran file translated from WHIRL Fri Nov 10 16:35:07 2006
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
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      TYPE (OpenADTy_active) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_14
      TYPE (OpenADTy_active) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      TYPE (OpenADTy_active) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      TYPE (OpenADTy_active) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      INTEGER(w2f__i8) OpenAD_Symbol_20
      INTEGER(w2f__i8) OpenAD_Symbol_21
      INTEGER(w2f__i8) OpenAD_Symbol_22
      INTEGER(w2f__i8) OpenAD_Symbol_23
      INTEGER(w2f__i8) OpenAD_Symbol_24
      INTEGER(w2f__i8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 10)
      TYPE (OpenADTy_active) Y(1 : 10)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      REAL(w2f__8) PI
      INTEGER(w2f__i8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_27
      INTEGER(w2f__i8) OpenAD_Symbol_28
      INTEGER(w2f__i8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_30
      INTEGER(w2f__i8) OpenAD_Symbol_31
      REAL(w2f__8) OpenAD_Symbol_32
      REAL(w2f__8) OpenAD_Symbol_33
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
      PI = 3.14149999618530273438D00
      DO I = 1, 9, 1
        IF(I .GT. INT(5_w2f__i8)) THEN
          __value__(Y(INT(I))) = (PI * SIN(__value__(X(I))))
        ELSE
          __value__(Y(INT(I))) = (PI + COS(__value__(X(I))))
        ENDIF
      END DO
      __value__(Y(10)) = (__value__(Y(1)) * __value__(Y(9)))
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      PI = 3.14149999618530273438D00
      OpenAD_Symbol_23 = 0_w2f__i8
      DO I = 1, 9, 1
        IF(I .GT. INT(5_w2f__i8)) THEN
          OpenAD_Symbol_0 = SIN(__value__(X(I)))
          OpenAD_Symbol_4 = (PI * OpenAD_Symbol_0)
          OpenAD_Symbol_3 = COS(__value__(X(I)))
          OpenAD_Symbol_2 = PI
          __value__(Y(INT(I))) = OpenAD_Symbol_4
          OpenAD_Symbol_12 = (OpenAD_Symbol_3 * OpenAD_Symbol_2)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_12)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
          OpenAD_Symbol_24 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_24)
        ELSE
          OpenAD_Symbol_8 = (PI + COS(__value__(X(I))))
          OpenAD_Symbol_7 = (- SIN(__value__(X(I))))
          OpenAD_Symbol_6 = 1_w2f__i8
          __value__(Y(INT(I))) = OpenAD_Symbol_8
          OpenAD_Symbol_14 = (OpenAD_Symbol_7 * OpenAD_Symbol_6)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_14)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
          OpenAD_Symbol_25 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_25)
        ENDIF
        OpenAD_Symbol_23 = (INT(OpenAD_Symbol_23) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_23)
      OpenAD_Symbol_11 = (__value__(Y(1)) * __value__(Y(9)))
      OpenAD_Symbol_9 = __value__(Y(9))
      OpenAD_Symbol_10 = __value__(Y(1))
      __value__(Y(10)) = OpenAD_Symbol_11
      OpenAD_Symbol_16 = OpenAD_Symbol_9
      OpenAD_Symbol_18 = OpenAD_Symbol_10
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_16)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_18)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_32)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_32, __deriv__(Y(10)), __deriv__(
     > OpenAD_Symbol_19))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_33)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_33, __deriv__(Y(10)), __deriv__(
     > OpenAD_Symbol_17))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(10)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_17), __deriv__(Y(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_17))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_19), __deriv__(Y(9)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_19))
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_20)
      OpenAD_Symbol_21 = 1
      DO WHILE(INT(OpenAD_Symbol_21) .LE. INT(OpenAD_Symbol_20))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_22)
        IF(OpenAD_Symbol_22 .ne. 0) THEN
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_26)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_27)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_27, __deriv__(Y(INT(OpenAD_Symbol_26
     > ))), __deriv__(OpenAD_Symbol_13))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_26))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_28)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_13), __deriv__(X(INT(
     > OpenAD_Symbol_28))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_13))
        ELSE
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_29)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_30)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_30, __deriv__(Y(INT(OpenAD_Symbol_29
     > ))), __deriv__(OpenAD_Symbol_15))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_29))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_31)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_15), __deriv__(X(INT(
     > OpenAD_Symbol_31))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_15))
        ENDIF
        OpenAD_Symbol_21 = INT(OpenAD_Symbol_21) + 1
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
