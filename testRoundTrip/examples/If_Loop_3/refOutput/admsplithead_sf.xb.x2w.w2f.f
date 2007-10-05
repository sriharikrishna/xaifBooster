C ***********************************************************
C Fortran file translated from WHIRL Mon Oct  1 11:38:24 2007
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
      REAL(w2f__8) OpenAD_Symbol_10
      TYPE (OpenADTy_active) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      TYPE (OpenADTy_active) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_14
      TYPE (OpenADTy_active) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      TYPE (OpenADTy_active) OpenAD_Symbol_17
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
      INTEGER(w2f__i8) OpenAD_Symbol_28
      INTEGER(w2f__i8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_3
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
      REAL(w2f__8) OpenAD_Symbol_4
      INTEGER(w2f__i8) OpenAD_Symbol_40
      INTEGER(w2f__i8) OpenAD_Symbol_41
      INTEGER(w2f__i8) OpenAD_Symbol_42
      INTEGER(w2f__i8) OpenAD_Symbol_43
      INTEGER(w2f__i8) OpenAD_Symbol_44
      INTEGER(w2f__i8) OpenAD_Symbol_45
      INTEGER(w2f__i8) OpenAD_Symbol_46
      INTEGER(w2f__i8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_5
      TYPE (OpenADTy_active) OpenAD_Symbol_6
      TYPE (OpenADTy_active) OpenAD_Symbol_7
      TYPE (OpenADTy_active) OpenAD_Symbol_8
      TYPE (OpenADTy_active) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 1)
      TYPE (OpenADTy_active) Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) J
      INTEGER(w2f__i4) K
      REAL(w2f__8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_50
      REAL(w2f__8) OpenAD_Symbol_51
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
      DO I = 1, 1, 1
        __value__(Y(1)) = __value__(X(1))
        IF(__value__(Y(1)) .GT. 0.0D00) THEN
          __value__(Y(1)) = __value__(X(1))
          DO J = 1, 3, 1
            __value__(Y(1)) = __value__(X(1))
            DO K = 1, 3, 1
              __value__(Y(1)) = __value__(X(1))
              IF(__value__(X(1)) .GT. 0.0D00) THEN
                __value__(Y(1)) = (__value__(X(1)) * __value__(Y(1)))
              ENDIF
            END DO
          END DO
        ELSE
          __value__(Y(1)) = (__value__(Y(1)) / __value__(X(1)))
        ENDIF
      END DO
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_26 = 0_w2f__i8
      DO I = 1, 1, 1
        __value__(Y(1)) = __value__(X(1))
        IF(__value__(Y(1)) .GT. 0.0D00) THEN
          __value__(Y(1)) = __value__(X(1))
          OpenAD_Symbol_27 = 0_w2f__i8
          DO J = 1, 3, 1
            __value__(Y(1)) = __value__(X(1))
            OpenAD_Symbol_28 = 0_w2f__i8
            DO K = 1, 3, 1
              __value__(Y(1)) = __value__(X(1))
              IF(__value__(X(1)) .GT. 0.0D00) THEN
                OpenAD_Symbol_2 = (__value__(X(1)) * __value__(Y(1)))
                OpenAD_Symbol_0 = __value__(Y(1))
                OpenAD_Symbol_1 = __value__(X(1))
                __value__(Y(1)) = OpenAD_Symbol_2
                OpenAD_Symbol_10 = OpenAD_Symbol_0
                OpenAD_Symbol_12 = OpenAD_Symbol_1
C               $OpenAD$ INLINE push(subst)
                CALL push(OpenAD_Symbol_10)
C               $OpenAD$ INLINE push(subst)
                CALL push(OpenAD_Symbol_12)
                OpenAD_Symbol_29 = 1_w2f__i8
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(OpenAD_Symbol_29)
              ELSE
                OpenAD_Symbol_30 = 0_w2f__i8
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(OpenAD_Symbol_30)
              ENDIF
              OpenAD_Symbol_28 = (INT(OpenAD_Symbol_28) + INT(1_w2f__i8
     > ))
            END DO
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_28)
            OpenAD_Symbol_27 = (INT(OpenAD_Symbol_27) + INT(1_w2f__i8))
          END DO
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_27)
          OpenAD_Symbol_32 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_32)
        ELSE
          OpenAD_Symbol_5 = (__value__(Y(1)) / __value__(X(1)))
          OpenAD_Symbol_3 = (INT(1_w2f__i8) / __value__(X(1)))
          OpenAD_Symbol_4 = (-(__value__(Y(1)) /(__value__(X(1)) *
     >  __value__(X(1)))))
          __value__(Y(1)) = OpenAD_Symbol_5
          OpenAD_Symbol_14 = OpenAD_Symbol_3
          OpenAD_Symbol_16 = OpenAD_Symbol_4
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_14)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_16)
          OpenAD_Symbol_31 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_31)
        ENDIF
        OpenAD_Symbol_26 = (INT(OpenAD_Symbol_26) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_26)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_18)
      OpenAD_Symbol_19 = 1
      DO WHILE(INT(OpenAD_Symbol_19) .LE. INT(OpenAD_Symbol_18))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_20)
        IF(OpenAD_Symbol_20 .ne. 0) THEN
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_21)
          OpenAD_Symbol_22 = 1
          DO WHILE(INT(OpenAD_Symbol_22) .LE. INT(OpenAD_Symbol_21))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_23)
            OpenAD_Symbol_24 = 1
            DO WHILE(INT(OpenAD_Symbol_24) .LE. INT(OpenAD_Symbol_23))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_25)
              IF(OpenAD_Symbol_25 .ne. 0) THEN
C               $OpenAD$ INLINE Pop(subst)
                CALL Pop(OpenAD_Symbol_48)
C               $OpenAD$ INLINE Saxpy(subst,subst,subst)
                CALL Saxpy(OpenAD_Symbol_48, __deriv__(Y(1)), __deriv__
     > (OpenAD_Symbol_13))
C               $OpenAD$ INLINE Pop(subst)
                CALL Pop(OpenAD_Symbol_49)
C               $OpenAD$ INLINE Saxpy(subst,subst,subst)
                CALL Saxpy(OpenAD_Symbol_49, __deriv__(Y(1)), __deriv__
     > (OpenAD_Symbol_11))
C               $OpenAD$ INLINE ZeroDeriv(subst)
                CALL ZeroDeriv(__deriv__(Y(1)))
C               $OpenAD$ INLINE IncDeriv(subst,subst)
                CALL IncDeriv(__deriv__(OpenAD_Symbol_11), __deriv__(X(
     > 1)))
C               $OpenAD$ INLINE ZeroDeriv(subst)
                CALL ZeroDeriv(__deriv__(OpenAD_Symbol_11))
C               $OpenAD$ INLINE IncDeriv(subst,subst)
                CALL IncDeriv(__deriv__(OpenAD_Symbol_13), __deriv__(Y(
     > 1)))
C               $OpenAD$ INLINE ZeroDeriv(subst)
                CALL ZeroDeriv(__deriv__(OpenAD_Symbol_13))
              ENDIF
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_9))
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_9), __deriv__(X(1))
     > )
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_9))
              OpenAD_Symbol_24 = INT(OpenAD_Symbol_24) + 1
            END DO
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_8))
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_8), __deriv__(X(1)))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_8))
            OpenAD_Symbol_22 = INT(OpenAD_Symbol_22) + 1
          END DO
C         $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
          CALL CondIncZeroDeriv(__deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_7))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_7), __deriv__(X(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_7))
        ELSE
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_50)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_50, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_17))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_51)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_51, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_15))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(1)))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_15), __deriv__(Y(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_15))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_17), __deriv__(X(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_17))
        ENDIF
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_6))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_6), __deriv__(X(1)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_6))
        OpenAD_Symbol_19 = INT(OpenAD_Symbol_19) + 1
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
      OpenAD_Symbol_41 = 0_w2f__i8
      DO I = 1, 1, 1
        __value__(Y(1)) = __value__(X(1))
        IF(__value__(Y(1)) .GT. 0.0D00) THEN
          __value__(Y(1)) = __value__(X(1))
          OpenAD_Symbol_42 = 0_w2f__i8
          DO J = 1, 3, 1
            __value__(Y(1)) = __value__(X(1))
            OpenAD_Symbol_43 = 0_w2f__i8
            DO K = 1, 3, 1
              __value__(Y(1)) = __value__(X(1))
              IF(__value__(X(1)) .GT. 0.0D00) THEN
                OpenAD_Symbol_2 = (__value__(X(1)) * __value__(Y(1)))
                OpenAD_Symbol_0 = __value__(Y(1))
                OpenAD_Symbol_1 = __value__(X(1))
                __value__(Y(1)) = OpenAD_Symbol_2
                OpenAD_Symbol_10 = OpenAD_Symbol_0
                OpenAD_Symbol_12 = OpenAD_Symbol_1
C               $OpenAD$ INLINE push(subst)
                CALL push(OpenAD_Symbol_10)
C               $OpenAD$ INLINE push(subst)
                CALL push(OpenAD_Symbol_12)
                OpenAD_Symbol_44 = 1_w2f__i8
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(OpenAD_Symbol_44)
              ELSE
                OpenAD_Symbol_45 = 0_w2f__i8
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(OpenAD_Symbol_45)
              ENDIF
              OpenAD_Symbol_43 = (INT(OpenAD_Symbol_43) + INT(1_w2f__i8
     > ))
            END DO
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_43)
            OpenAD_Symbol_42 = (INT(OpenAD_Symbol_42) + INT(1_w2f__i8))
          END DO
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_42)
          OpenAD_Symbol_47 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_47)
        ELSE
          OpenAD_Symbol_5 = (__value__(Y(1)) / __value__(X(1)))
          OpenAD_Symbol_3 = (INT(1_w2f__i8) / __value__(X(1)))
          OpenAD_Symbol_4 = (-(__value__(Y(1)) /(__value__(X(1)) *
     >  __value__(X(1)))))
          __value__(Y(1)) = OpenAD_Symbol_5
          OpenAD_Symbol_14 = OpenAD_Symbol_3
          OpenAD_Symbol_16 = OpenAD_Symbol_4
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_14)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_16)
          OpenAD_Symbol_46 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_46)
        ENDIF
        OpenAD_Symbol_41 = (INT(OpenAD_Symbol_41) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_41)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_33)
      OpenAD_Symbol_34 = 1
      DO WHILE(INT(OpenAD_Symbol_34) .LE. INT(OpenAD_Symbol_33))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_35)
        IF(OpenAD_Symbol_35 .ne. 0) THEN
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_36)
          OpenAD_Symbol_37 = 1
          DO WHILE(INT(OpenAD_Symbol_37) .LE. INT(OpenAD_Symbol_36))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_38)
            OpenAD_Symbol_39 = 1
            DO WHILE(INT(OpenAD_Symbol_39) .LE. INT(OpenAD_Symbol_38))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_40)
              IF(OpenAD_Symbol_40 .ne. 0) THEN
C               $OpenAD$ INLINE Pop(subst)
                CALL Pop(OpenAD_Symbol_48)
C               $OpenAD$ INLINE Saxpy(subst,subst,subst)
                CALL Saxpy(OpenAD_Symbol_48, __deriv__(Y(1)), __deriv__
     > (OpenAD_Symbol_13))
C               $OpenAD$ INLINE Pop(subst)
                CALL Pop(OpenAD_Symbol_49)
C               $OpenAD$ INLINE Saxpy(subst,subst,subst)
                CALL Saxpy(OpenAD_Symbol_49, __deriv__(Y(1)), __deriv__
     > (OpenAD_Symbol_11))
C               $OpenAD$ INLINE ZeroDeriv(subst)
                CALL ZeroDeriv(__deriv__(Y(1)))
C               $OpenAD$ INLINE IncDeriv(subst,subst)
                CALL IncDeriv(__deriv__(OpenAD_Symbol_11), __deriv__(X(
     > 1)))
C               $OpenAD$ INLINE ZeroDeriv(subst)
                CALL ZeroDeriv(__deriv__(OpenAD_Symbol_11))
C               $OpenAD$ INLINE IncDeriv(subst,subst)
                CALL IncDeriv(__deriv__(OpenAD_Symbol_13), __deriv__(Y(
     > 1)))
C               $OpenAD$ INLINE ZeroDeriv(subst)
                CALL ZeroDeriv(__deriv__(OpenAD_Symbol_13))
              ENDIF
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_9))
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_9), __deriv__(X(1))
     > )
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_9))
              OpenAD_Symbol_39 = INT(OpenAD_Symbol_39) + 1
            END DO
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_8))
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_8), __deriv__(X(1)))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_8))
            OpenAD_Symbol_37 = INT(OpenAD_Symbol_37) + 1
          END DO
C         $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
          CALL CondIncZeroDeriv(__deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_7))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_7), __deriv__(X(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_7))
        ELSE
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_50)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_50, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_17))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_51)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_51, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_15))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(1)))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_15), __deriv__(Y(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_15))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_17), __deriv__(X(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_17))
        ENDIF
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_6))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_6), __deriv__(X(1)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_6))
        OpenAD_Symbol_34 = INT(OpenAD_Symbol_34) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
