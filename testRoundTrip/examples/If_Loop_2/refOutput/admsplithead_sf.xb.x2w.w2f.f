
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
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) J
      INTEGER(w2f__i4) K
      REAL(w2f__8) OpenAD_Symbol_42
      REAL(w2f__8) OpenAD_Symbol_43
      REAL(w2f__8) OpenAD_Symbol_44
      REAL(w2f__8) OpenAD_Symbol_45
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
          DO J = 1, 3, 1
            DO K = 1, 3, 1
              IF(__value__(X(1)) .GT. 0.0D00) THEN
                __value__(Y(1)) = (__value__(X(1)) * __value__(Y(1)))
              ENDIF
            END DO
          END DO
        ELSE
          __value__(Y(1)) = (__value__(Y(1)) / __value__(X(1)))
        ENDIF
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_20 = 0_w2f__i8
      DO I = 1, 1, 1
        __value__(Y(1)) = __value__(X(1))
        IF(__value__(Y(1)) .GT. 0.0D00) THEN
          OpenAD_Symbol_21 = 0_w2f__i8
          DO J = 1, 3, 1
            OpenAD_Symbol_22 = 0_w2f__i8
            DO K = 1, 3, 1
              IF(__value__(X(1)) .GT. 0.0D00) THEN
                OpenAD_Symbol_2 = (__value__(X(1)) * __value__(Y(1)))
                OpenAD_Symbol_0 = __value__(Y(1))
                OpenAD_Symbol_1 = __value__(X(1))
                __value__(Y(1)) = OpenAD_Symbol_2
                OpenAD_Symbol_6 = OpenAD_Symbol_0
                OpenAD_Symbol_7 = OpenAD_Symbol_1
C               $OpenAD$ INLINE push(subst)
                CALL push(OpenAD_Symbol_6)
C               $OpenAD$ INLINE push(subst)
                CALL push(OpenAD_Symbol_7)
                OpenAD_Symbol_23 = 1_w2f__i8
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(OpenAD_Symbol_23)
              ELSE
                OpenAD_Symbol_24 = 0_w2f__i8
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(OpenAD_Symbol_24)
              ENDIF
              OpenAD_Symbol_22 = (INT(OpenAD_Symbol_22) + INT(1_w2f__i8
     > ))
            END DO
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_22)
            OpenAD_Symbol_21 = (INT(OpenAD_Symbol_21) + INT(1_w2f__i8))
          END DO
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_21)
          OpenAD_Symbol_26 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_26)
        ELSE
          OpenAD_Symbol_5 = (__value__(Y(1)) / __value__(X(1)))
          OpenAD_Symbol_3 = (INT(1_w2f__i8) / __value__(X(1)))
          OpenAD_Symbol_4 = (-(__value__(Y(1)) /(__value__(X(1)) *
     >  __value__(X(1)))))
          __value__(Y(1)) = OpenAD_Symbol_5
          OpenAD_Symbol_9 = OpenAD_Symbol_3
          OpenAD_Symbol_11 = OpenAD_Symbol_4
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_9)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_11)
          OpenAD_Symbol_25 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_25)
        ENDIF
        OpenAD_Symbol_20 = (INT(OpenAD_Symbol_20) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_20)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_12)
      OpenAD_Symbol_13 = 1
      DO WHILE(INT(OpenAD_Symbol_13) .LE. INT(OpenAD_Symbol_12))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_14)
        IF(OpenAD_Symbol_14 .ne. 0) THEN
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_15)
          OpenAD_Symbol_16 = 1
          DO WHILE(INT(OpenAD_Symbol_16) .LE. INT(OpenAD_Symbol_15))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_17)
            OpenAD_Symbol_18 = 1
            DO WHILE(INT(OpenAD_Symbol_18) .LE. INT(OpenAD_Symbol_17))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_19)
              IF(OpenAD_Symbol_19 .ne. 0) THEN
C               $OpenAD$ INLINE Pop(subst)
                CALL Pop(OpenAD_Symbol_42)
C               $OpenAD$ INLINE Saxpy(subst,subst,subst)
                CALL Saxpy(OpenAD_Symbol_42, __deriv__(Y(1)), __deriv__
     > (OpenAD_Symbol_8))
C               $OpenAD$ INLINE Pop(subst)
                CALL Pop(OpenAD_Symbol_43)
C               $OpenAD$ INLINE Saxpy(subst,subst,subst)
                CALL Saxpy(OpenAD_Symbol_43, __deriv__(Y(1)), __deriv__
     > (X(1)))
C               $OpenAD$ INLINE ZeroDeriv(subst)
                CALL ZeroDeriv(__deriv__(Y(1)))
C               $OpenAD$ INLINE IncDeriv(subst,subst)
                CALL IncDeriv(__deriv__(OpenAD_Symbol_8), __deriv__(Y(1
     > )))
C               $OpenAD$ INLINE ZeroDeriv(subst)
                CALL ZeroDeriv(__deriv__(OpenAD_Symbol_8))
              ENDIF
              OpenAD_Symbol_18 = INT(OpenAD_Symbol_18) + 1
            END DO
            OpenAD_Symbol_16 = INT(OpenAD_Symbol_16) + 1
          END DO
        ELSE
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_44)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_44, __deriv__(Y(1)), __deriv__(X(1))
     > )
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_45)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_45, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_10))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(1)))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_10), __deriv__(Y(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_10))
        ENDIF
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(Y(1)), __deriv__(X(1)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(Y(1)))
        OpenAD_Symbol_13 = INT(OpenAD_Symbol_13) + 1
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
      OpenAD_Symbol_35 = 0_w2f__i8
      DO I = 1, 1, 1
        __value__(Y(1)) = __value__(X(1))
        IF(__value__(Y(1)) .GT. 0.0D00) THEN
          OpenAD_Symbol_36 = 0_w2f__i8
          DO J = 1, 3, 1
            OpenAD_Symbol_37 = 0_w2f__i8
            DO K = 1, 3, 1
              IF(__value__(X(1)) .GT. 0.0D00) THEN
                OpenAD_Symbol_2 = (__value__(X(1)) * __value__(Y(1)))
                OpenAD_Symbol_0 = __value__(Y(1))
                OpenAD_Symbol_1 = __value__(X(1))
                __value__(Y(1)) = OpenAD_Symbol_2
                OpenAD_Symbol_6 = OpenAD_Symbol_0
                OpenAD_Symbol_7 = OpenAD_Symbol_1
C               $OpenAD$ INLINE push(subst)
                CALL push(OpenAD_Symbol_6)
C               $OpenAD$ INLINE push(subst)
                CALL push(OpenAD_Symbol_7)
                OpenAD_Symbol_38 = 1_w2f__i8
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(OpenAD_Symbol_38)
              ELSE
                OpenAD_Symbol_39 = 0_w2f__i8
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(OpenAD_Symbol_39)
              ENDIF
              OpenAD_Symbol_37 = (INT(OpenAD_Symbol_37) + INT(1_w2f__i8
     > ))
            END DO
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_37)
            OpenAD_Symbol_36 = (INT(OpenAD_Symbol_36) + INT(1_w2f__i8))
          END DO
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_36)
          OpenAD_Symbol_41 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_41)
        ELSE
          OpenAD_Symbol_5 = (__value__(Y(1)) / __value__(X(1)))
          OpenAD_Symbol_3 = (INT(1_w2f__i8) / __value__(X(1)))
          OpenAD_Symbol_4 = (-(__value__(Y(1)) /(__value__(X(1)) *
     >  __value__(X(1)))))
          __value__(Y(1)) = OpenAD_Symbol_5
          OpenAD_Symbol_9 = OpenAD_Symbol_3
          OpenAD_Symbol_11 = OpenAD_Symbol_4
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_9)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_11)
          OpenAD_Symbol_40 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_40)
        ENDIF
        OpenAD_Symbol_35 = (INT(OpenAD_Symbol_35) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_35)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_27)
      OpenAD_Symbol_28 = 1
      DO WHILE(INT(OpenAD_Symbol_28) .LE. INT(OpenAD_Symbol_27))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_29)
        IF(OpenAD_Symbol_29 .ne. 0) THEN
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_30)
          OpenAD_Symbol_31 = 1
          DO WHILE(INT(OpenAD_Symbol_31) .LE. INT(OpenAD_Symbol_30))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_32)
            OpenAD_Symbol_33 = 1
            DO WHILE(INT(OpenAD_Symbol_33) .LE. INT(OpenAD_Symbol_32))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_34)
              IF(OpenAD_Symbol_34 .ne. 0) THEN
C               $OpenAD$ INLINE Pop(subst)
                CALL Pop(OpenAD_Symbol_42)
C               $OpenAD$ INLINE Saxpy(subst,subst,subst)
                CALL Saxpy(OpenAD_Symbol_42, __deriv__(Y(1)), __deriv__
     > (OpenAD_Symbol_8))
C               $OpenAD$ INLINE Pop(subst)
                CALL Pop(OpenAD_Symbol_43)
C               $OpenAD$ INLINE Saxpy(subst,subst,subst)
                CALL Saxpy(OpenAD_Symbol_43, __deriv__(Y(1)), __deriv__
     > (X(1)))
C               $OpenAD$ INLINE ZeroDeriv(subst)
                CALL ZeroDeriv(__deriv__(Y(1)))
C               $OpenAD$ INLINE IncDeriv(subst,subst)
                CALL IncDeriv(__deriv__(OpenAD_Symbol_8), __deriv__(Y(1
     > )))
C               $OpenAD$ INLINE ZeroDeriv(subst)
                CALL ZeroDeriv(__deriv__(OpenAD_Symbol_8))
              ENDIF
              OpenAD_Symbol_33 = INT(OpenAD_Symbol_33) + 1
            END DO
            OpenAD_Symbol_31 = INT(OpenAD_Symbol_31) + 1
          END DO
        ELSE
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_44)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_44, __deriv__(Y(1)), __deriv__(X(1))
     > )
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_45)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_45, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_10))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(1)))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_10), __deriv__(Y(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_10))
        ENDIF
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(Y(1)), __deriv__(X(1)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(Y(1)))
        OpenAD_Symbol_28 = INT(OpenAD_Symbol_28) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
