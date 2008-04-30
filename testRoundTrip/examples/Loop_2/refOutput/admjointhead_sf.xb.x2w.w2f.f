
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
      INTEGER(w2f__i8) OpenAD_Symbol_14
      INTEGER(w2f__i8) OpenAD_Symbol_15
      INTEGER(w2f__i8) OpenAD_Symbol_16
      INTEGER(w2f__i8) OpenAD_Symbol_17
      INTEGER(w2f__i8) OpenAD_Symbol_18
      INTEGER(w2f__i8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      INTEGER(w2f__i8) OpenAD_Symbol_20
      INTEGER(w2f__i8) OpenAD_Symbol_21
      INTEGER(w2f__i8) OpenAD_Symbol_22
      INTEGER(w2f__i8) OpenAD_Symbol_23
      INTEGER(w2f__i8) OpenAD_Symbol_24
      INTEGER(w2f__i8) OpenAD_Symbol_25
      INTEGER(w2f__i8) OpenAD_Symbol_26
      INTEGER(w2f__i8) OpenAD_Symbol_27
      TYPE (OpenADTy_active) OpenAD_Symbol_3
      INTEGER(w2f__i8) OpenAD_Symbol_4
      INTEGER(w2f__i8) OpenAD_Symbol_5
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
      INTEGER(w2f__i4) J
      INTEGER(w2f__i4) K
      INTEGER(w2f__i8) OpenAD_Symbol_28
      INTEGER(w2f__i8) OpenAD_Symbol_29
      INTEGER(w2f__i8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_31
      INTEGER(w2f__i8) OpenAD_Symbol_32
      INTEGER(w2f__i8) OpenAD_Symbol_33
      REAL(w2f__8) OpenAD_Symbol_34
      INTEGER(w2f__i8) OpenAD_Symbol_35
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
      DO I = 1, 3, 1
        __value__(Y(INT(I))) = __value__(X(I))
      END DO
      DO I = 1, 3, 1
        DO J = 1, 3, 1
          DO K = 1, 3, 1
            __value__(Y(INT(I))) = (__value__(X(J)) * __value__(Y(I)))
          END DO
        END DO
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_12 = 0_w2f__i8
      DO I = 1, 3, 1
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
      DO I = 1, 3, 1
        OpenAD_Symbol_14 = 0_w2f__i8
        DO J = 1, 3, 1
          OpenAD_Symbol_15 = 0_w2f__i8
          DO K = 1, 3, 1
            OpenAD_Symbol_2 = (__value__(X(J)) * __value__(Y(I)))
            OpenAD_Symbol_0 = __value__(Y(I))
            OpenAD_Symbol_1 = __value__(X(J))
            __value__(Y(INT(I))) = OpenAD_Symbol_2
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(I)
C           $OpenAD$ INLINE push(subst)
            CALL push(OpenAD_Symbol_0)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(J)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(I)
C           $OpenAD$ INLINE push(subst)
            CALL push(OpenAD_Symbol_1)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(I)
            OpenAD_Symbol_15 = (INT(OpenAD_Symbol_15) + INT(1_w2f__i8))
          END DO
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_15)
          OpenAD_Symbol_14 = (INT(OpenAD_Symbol_14) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_14)
        OpenAD_Symbol_13 = (INT(OpenAD_Symbol_13) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_13)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_4)
      OpenAD_Symbol_5 = 1
      DO WHILE(INT(OpenAD_Symbol_5) .LE. INT(OpenAD_Symbol_4))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_6)
        OpenAD_Symbol_7 = 1
        DO WHILE(INT(OpenAD_Symbol_7) .LE. INT(OpenAD_Symbol_6))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_8)
          OpenAD_Symbol_9 = 1
          DO WHILE(INT(OpenAD_Symbol_9) .LE. INT(OpenAD_Symbol_8))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_30)
C           $OpenAD$ INLINE Pop(subst)
            CALL Pop(OpenAD_Symbol_31)
C           $OpenAD$ INLINE Saxpy(subst,subst,subst)
            CALL Saxpy(OpenAD_Symbol_31, __deriv__(Y(INT(
     > OpenAD_Symbol_30))), __deriv__(OpenAD_Symbol_3))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_32)
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_33)
C           $OpenAD$ INLINE Pop(subst)
            CALL Pop(OpenAD_Symbol_34)
C           $OpenAD$ INLINE Saxpy(subst,subst,subst)
            CALL Saxpy(OpenAD_Symbol_34, __deriv__(Y(INT(
     > OpenAD_Symbol_32))), __deriv__(X(INT(OpenAD_Symbol_33))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_32))))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_35)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_3), __deriv__(Y(INT(
     > OpenAD_Symbol_35))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_3))
            OpenAD_Symbol_9 = INT(OpenAD_Symbol_9) + 1
          END DO
          OpenAD_Symbol_7 = INT(OpenAD_Symbol_7) + 1
        END DO
        OpenAD_Symbol_5 = INT(OpenAD_Symbol_5) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_10)
      OpenAD_Symbol_11 = 1
      DO WHILE(INT(OpenAD_Symbol_11) .LE. INT(OpenAD_Symbol_10))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_28)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_29)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(Y(INT(OpenAD_Symbol_28))), __deriv__(X(
     > INT(OpenAD_Symbol_29))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_28))))
        OpenAD_Symbol_11 = INT(OpenAD_Symbol_11) + 1
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
      OpenAD_Symbol_24 = 0_w2f__i8
      DO I = 1, 3, 1
        __value__(Y(INT(I))) = __value__(X(I))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        OpenAD_Symbol_24 = (INT(OpenAD_Symbol_24) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_24)
      OpenAD_Symbol_25 = 0_w2f__i8
      DO I = 1, 3, 1
        OpenAD_Symbol_26 = 0_w2f__i8
        DO J = 1, 3, 1
          OpenAD_Symbol_27 = 0_w2f__i8
          DO K = 1, 3, 1
            OpenAD_Symbol_2 = (__value__(X(J)) * __value__(Y(I)))
            OpenAD_Symbol_0 = __value__(Y(I))
            OpenAD_Symbol_1 = __value__(X(J))
            __value__(Y(INT(I))) = OpenAD_Symbol_2
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(I)
C           $OpenAD$ INLINE push(subst)
            CALL push(OpenAD_Symbol_0)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(J)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(I)
C           $OpenAD$ INLINE push(subst)
            CALL push(OpenAD_Symbol_1)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(I)
            OpenAD_Symbol_27 = (INT(OpenAD_Symbol_27) + INT(1_w2f__i8))
          END DO
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_27)
          OpenAD_Symbol_26 = (INT(OpenAD_Symbol_26) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_26)
        OpenAD_Symbol_25 = (INT(OpenAD_Symbol_25) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_25)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_16)
      OpenAD_Symbol_17 = 1
      DO WHILE(INT(OpenAD_Symbol_17) .LE. INT(OpenAD_Symbol_16))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_18)
        OpenAD_Symbol_19 = 1
        DO WHILE(INT(OpenAD_Symbol_19) .LE. INT(OpenAD_Symbol_18))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_20)
          OpenAD_Symbol_21 = 1
          DO WHILE(INT(OpenAD_Symbol_21) .LE. INT(OpenAD_Symbol_20))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_30)
C           $OpenAD$ INLINE Pop(subst)
            CALL Pop(OpenAD_Symbol_31)
C           $OpenAD$ INLINE Saxpy(subst,subst,subst)
            CALL Saxpy(OpenAD_Symbol_31, __deriv__(Y(INT(
     > OpenAD_Symbol_30))), __deriv__(OpenAD_Symbol_3))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_32)
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_33)
C           $OpenAD$ INLINE Pop(subst)
            CALL Pop(OpenAD_Symbol_34)
C           $OpenAD$ INLINE Saxpy(subst,subst,subst)
            CALL Saxpy(OpenAD_Symbol_34, __deriv__(Y(INT(
     > OpenAD_Symbol_32))), __deriv__(X(INT(OpenAD_Symbol_33))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_32))))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_35)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_3), __deriv__(Y(INT(
     > OpenAD_Symbol_35))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_3))
            OpenAD_Symbol_21 = INT(OpenAD_Symbol_21) + 1
          END DO
          OpenAD_Symbol_19 = INT(OpenAD_Symbol_19) + 1
        END DO
        OpenAD_Symbol_17 = INT(OpenAD_Symbol_17) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_22)
      OpenAD_Symbol_23 = 1
      DO WHILE(INT(OpenAD_Symbol_23) .LE. INT(OpenAD_Symbol_22))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_28)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_29)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(Y(INT(OpenAD_Symbol_28))), __deriv__(X(
     > INT(OpenAD_Symbol_29))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_28))))
        OpenAD_Symbol_23 = INT(OpenAD_Symbol_23) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
