
      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(X, FVEC)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_22
      REAL(w2f__8) OpenAD_Symbol_23
      INTEGER(w2f__i8) OpenAD_Symbol_24
      INTEGER(w2f__i8) OpenAD_Symbol_25
      INTEGER(w2f__i8) OpenAD_Symbol_26
      INTEGER(w2f__i8) OpenAD_Symbol_27
      INTEGER(w2f__i8) OpenAD_Symbol_28
      INTEGER(w2f__i8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 4)
      TYPE (OpenADTy_active) FVEC(1 : 11)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      TYPE (OpenADTy_active) TEMP1
      TYPE (OpenADTy_active) TEMP2
      REAL(w2f__8) V(1 : 11)
      REAL(w2f__8) Y(1 : 11)
      INTEGER(w2f__i8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_31
      INTEGER(w2f__i8) OpenAD_Symbol_32
      REAL(w2f__8) OpenAD_Symbol_33
      INTEGER(w2f__i8) OpenAD_Symbol_34
      REAL(w2f__8) OpenAD_Symbol_35
      INTEGER(w2f__i8) OpenAD_Symbol_36
      REAL(w2f__8) OpenAD_Symbol_37
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(FVEC)
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      V(1) = 4.0D00
      V(2) = 2.0D00
      V(3) = 1.0D00
      V(4) = 5.0D-01
      V(5) = 2.5D-01
      V(6) = 1.67000000000000009548D-01
      V(7) = 1.25D-01
      V(8) = 1.00000000000000005551D-01
      V(9) = 8.32999999999999990452D-02
      V(10) = 7.14000000000000051292D-02
      V(11) = 6.25D-02
      Y(1) = 1.95700000000000012834D-01
      Y(2) = 1.94700000000000011946D-01
      Y(3) = 1.73499999999999987566D-01
      Y(4) = 1.60000000000000003331D-01
      Y(5) = 8.44000000000000027978D-02
      Y(6) = 6.27000000000000057288D-02
      Y(7) = 4.56000000000000016431D-02
      Y(8) = 3.42000000000000012323D-02
      Y(9) = 3.23000000000000023204D-02
      Y(10) = 2.35000000000000000555D-02
      Y(11) = 2.46000000000000003386D-02
      DO I = 1, 11, 1
        __value__(TEMP1) = (V(I) *(__value__(X(2)) + V(I)))
        __value__(TEMP2) = (__value__(X(4)) + V(I) *(__value__(X(3)) +
     >  V(I)))
        __value__(FVEC(INT(I))) = (Y(I) -((__value__(X(1)) * __value__(
     > TEMP1)) / __value__(TEMP2)))
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      V(1) = 4.0D00
      V(2) = 2.0D00
      V(3) = 1.0D00
      V(4) = 5.0D-01
      V(5) = 2.5D-01
      V(6) = 1.67000000000000009548D-01
      V(7) = 1.25D-01
      V(8) = 1.00000000000000005551D-01
      V(9) = 8.32999999999999990452D-02
      V(10) = 7.14000000000000051292D-02
      V(11) = 6.25D-02
      Y(1) = 1.95700000000000012834D-01
      Y(2) = 1.94700000000000011946D-01
      Y(3) = 1.73499999999999987566D-01
      Y(4) = 1.60000000000000003331D-01
      Y(5) = 8.44000000000000027978D-02
      Y(6) = 6.27000000000000057288D-02
      Y(7) = 4.56000000000000016431D-02
      Y(8) = 3.42000000000000012323D-02
      Y(9) = 3.23000000000000023204D-02
      Y(10) = 2.35000000000000000555D-02
      Y(11) = 2.46000000000000003386D-02
      OpenAD_Symbol_26 = 0_w2f__i8
      DO I = 1, 11, 1
        OpenAD_Symbol_0 = (__value__(X(2)) + V(I))
        __value__(TEMP1) = (V(I) * OpenAD_Symbol_0)
        OpenAD_Symbol_3 = 1_w2f__i8
        OpenAD_Symbol_2 = V(I)
        OpenAD_Symbol_7 = (__value__(X(3)) + V(I))
        __value__(TEMP2) = (__value__(X(4)) + V(I) * OpenAD_Symbol_7)
        OpenAD_Symbol_5 = 1_w2f__i8
        OpenAD_Symbol_10 = 1_w2f__i8
        OpenAD_Symbol_9 = V(I)
        OpenAD_Symbol_6 = 1_w2f__i8
        OpenAD_Symbol_14 = (__value__(X(1)) * __value__(TEMP1))
        __value__(FVEC(INT(I))) = (Y(I) -(OpenAD_Symbol_14 / __value__(
     > TEMP2)))
        OpenAD_Symbol_17 = __value__(TEMP1)
        OpenAD_Symbol_18 = __value__(X(1))
        OpenAD_Symbol_15 = (INT(1_w2f__i8) / __value__(TEMP2))
        OpenAD_Symbol_16 = (-(OpenAD_Symbol_14 /(__value__(TEMP2) *
     >  __value__(TEMP2))))
        OpenAD_Symbol_13 = (-1_w2f__i8)
        OpenAD_Symbol_19 = (OpenAD_Symbol_15 * INT((-1_w2f__i8)))
        OpenAD_Symbol_20 = (OpenAD_Symbol_16 * INT((-1_w2f__i8)))
        OpenAD_Symbol_21 = (OpenAD_Symbol_17 * OpenAD_Symbol_19)
        OpenAD_Symbol_22 = (OpenAD_Symbol_9 * OpenAD_Symbol_20)
        OpenAD_Symbol_23 = (OpenAD_Symbol_2 * OpenAD_Symbol_18 *
     >  OpenAD_Symbol_19)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_20)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_21)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_22)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_23)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        OpenAD_Symbol_26 = (INT(OpenAD_Symbol_26) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_26)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_24)
      OpenAD_Symbol_25 = 1
      DO WHILE(INT(OpenAD_Symbol_25) .LE. INT(OpenAD_Symbol_24))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_30)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_31)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_31, __deriv__(FVEC(INT(
     > OpenAD_Symbol_30))), __deriv__(X(2)))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_32)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_33)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_33, __deriv__(FVEC(INT(
     > OpenAD_Symbol_32))), __deriv__(X(3)))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_34)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_35)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_35, __deriv__(FVEC(INT(
     > OpenAD_Symbol_34))), __deriv__(X(1)))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_36)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_37)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_37, __deriv__(FVEC(INT(
     > OpenAD_Symbol_36))), __deriv__(X(4)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(FVEC(INT(OpenAD_Symbol_36))))
        OpenAD_Symbol_25 = INT(OpenAD_Symbol_25) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      V(1) = 4.0D00
      V(2) = 2.0D00
      V(3) = 1.0D00
      V(4) = 5.0D-01
      V(5) = 2.5D-01
      V(6) = 1.67000000000000009548D-01
      V(7) = 1.25D-01
      V(8) = 1.00000000000000005551D-01
      V(9) = 8.32999999999999990452D-02
      V(10) = 7.14000000000000051292D-02
      V(11) = 6.25D-02
      Y(1) = 1.95700000000000012834D-01
      Y(2) = 1.94700000000000011946D-01
      Y(3) = 1.73499999999999987566D-01
      Y(4) = 1.60000000000000003331D-01
      Y(5) = 8.44000000000000027978D-02
      Y(6) = 6.27000000000000057288D-02
      Y(7) = 4.56000000000000016431D-02
      Y(8) = 3.42000000000000012323D-02
      Y(9) = 3.23000000000000023204D-02
      Y(10) = 2.35000000000000000555D-02
      Y(11) = 2.46000000000000003386D-02
      OpenAD_Symbol_29 = 0_w2f__i8
      DO I = 1, 11, 1
        OpenAD_Symbol_0 = (__value__(X(2)) + V(I))
        __value__(TEMP1) = (V(I) * OpenAD_Symbol_0)
        OpenAD_Symbol_3 = 1_w2f__i8
        OpenAD_Symbol_2 = V(I)
        OpenAD_Symbol_7 = (__value__(X(3)) + V(I))
        __value__(TEMP2) = (__value__(X(4)) + V(I) * OpenAD_Symbol_7)
        OpenAD_Symbol_5 = 1_w2f__i8
        OpenAD_Symbol_10 = 1_w2f__i8
        OpenAD_Symbol_9 = V(I)
        OpenAD_Symbol_6 = 1_w2f__i8
        OpenAD_Symbol_14 = (__value__(X(1)) * __value__(TEMP1))
        __value__(FVEC(INT(I))) = (Y(I) -(OpenAD_Symbol_14 / __value__(
     > TEMP2)))
        OpenAD_Symbol_17 = __value__(TEMP1)
        OpenAD_Symbol_18 = __value__(X(1))
        OpenAD_Symbol_15 = (INT(1_w2f__i8) / __value__(TEMP2))
        OpenAD_Symbol_16 = (-(OpenAD_Symbol_14 /(__value__(TEMP2) *
     >  __value__(TEMP2))))
        OpenAD_Symbol_13 = (-1_w2f__i8)
        OpenAD_Symbol_19 = (OpenAD_Symbol_15 * INT((-1_w2f__i8)))
        OpenAD_Symbol_20 = (OpenAD_Symbol_16 * INT((-1_w2f__i8)))
        OpenAD_Symbol_21 = (OpenAD_Symbol_17 * OpenAD_Symbol_19)
        OpenAD_Symbol_22 = (OpenAD_Symbol_9 * OpenAD_Symbol_20)
        OpenAD_Symbol_23 = (OpenAD_Symbol_2 * OpenAD_Symbol_18 *
     >  OpenAD_Symbol_19)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_20)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_21)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_22)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_23)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        OpenAD_Symbol_29 = (INT(OpenAD_Symbol_29) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_29)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_27)
      OpenAD_Symbol_28 = 1
      DO WHILE(INT(OpenAD_Symbol_28) .LE. INT(OpenAD_Symbol_27))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_30)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_31)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_31, __deriv__(FVEC(INT(
     > OpenAD_Symbol_30))), __deriv__(X(2)))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_32)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_33)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_33, __deriv__(FVEC(INT(
     > OpenAD_Symbol_32))), __deriv__(X(3)))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_34)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_35)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_35, __deriv__(FVEC(INT(
     > OpenAD_Symbol_34))), __deriv__(X(1)))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_36)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_37)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_37, __deriv__(FVEC(INT(
     > OpenAD_Symbol_36))), __deriv__(X(4)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(FVEC(INT(OpenAD_Symbol_36))))
        OpenAD_Symbol_28 = INT(OpenAD_Symbol_28) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
