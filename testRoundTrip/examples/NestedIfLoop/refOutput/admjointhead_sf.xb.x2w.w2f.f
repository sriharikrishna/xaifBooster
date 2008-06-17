
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
      REAL(w2f__8) OpenAD_Symbol_3
      INTEGER(w2f__i8) OpenAD_Symbol_4
      INTEGER(w2f__i8) OpenAD_Symbol_5
      INTEGER(w2f__i8) OpenAD_Symbol_6
      INTEGER(w2f__i8) OpenAD_Symbol_7
      INTEGER(w2f__i8) OpenAD_Symbol_8
      INTEGER(w2f__i8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y(1 : 2)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      INTEGER(w2f__i8) OpenAD_Symbol_22
      INTEGER(w2f__i8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_24
      INTEGER(w2f__i8) OpenAD_Symbol_25
      INTEGER(w2f__i8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_27
      INTEGER(w2f__i8) OpenAD_Symbol_28
      INTEGER(w2f__i8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_30
      INTEGER(w2f__i8) OpenAD_Symbol_31
      INTEGER(w2f__i8) OpenAD_Symbol_32
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
      IF(__value__(X(1)) .LT. __value__(X(2))) THEN
        DO I = 1, 2, 1
          __value__(Y(INT(I))) = (__value__(X(I)) * __value__(X(I)))
        END DO
      ELSE
        DO I = 1, 2, 1
          __value__(Y(INT(I))) = (__value__(X(I)) * __value__(X(I)))
        END DO
      ENDIF
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      IF(__value__(X(1)) .LT. __value__(X(2))) THEN
        OpenAD_Symbol_9 = 0_w2f__i8
        DO I = 1, 2, 1
          __value__(Y(INT(I))) = (__value__(X(I)) * __value__(X(I)))
          OpenAD_Symbol_0 = __value__(X(I))
          OpenAD_Symbol_1 = __value__(X(I))
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_0)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_1)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
          OpenAD_Symbol_9 = (INT(OpenAD_Symbol_9) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_9)
        OpenAD_Symbol_11 = 1_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_11)
      ELSE
        OpenAD_Symbol_10 = 0_w2f__i8
        DO I = 1, 2, 1
          __value__(Y(INT(I))) = (__value__(X(I)) * __value__(X(I)))
          OpenAD_Symbol_2 = __value__(X(I))
          OpenAD_Symbol_3 = __value__(X(I))
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_2)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_3)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
          OpenAD_Symbol_10 = (INT(OpenAD_Symbol_10) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_10)
        OpenAD_Symbol_12 = 0_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_12)
      ENDIF
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_4)
      IF(OpenAD_Symbol_4 .ne. 0) THEN
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_7)
        OpenAD_Symbol_8 = 1
        DO WHILE(INT(OpenAD_Symbol_8) .LE. INT(OpenAD_Symbol_7))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_22)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_23)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_24)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_24, __deriv__(Y(INT(OpenAD_Symbol_22
     > ))), __deriv__(X(INT(OpenAD_Symbol_23))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_25)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_26)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_27)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_27, __deriv__(Y(INT(OpenAD_Symbol_25
     > ))), __deriv__(X(INT(OpenAD_Symbol_26))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_25))))
          OpenAD_Symbol_8 = INT(OpenAD_Symbol_8) + 1
        END DO
      ELSE
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_5)
        OpenAD_Symbol_6 = 1
        DO WHILE(INT(OpenAD_Symbol_6) .LE. INT(OpenAD_Symbol_5))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_28)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_29)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_30)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_30, __deriv__(Y(INT(OpenAD_Symbol_28
     > ))), __deriv__(X(INT(OpenAD_Symbol_29))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_31)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_32)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_33)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_33, __deriv__(Y(INT(OpenAD_Symbol_31
     > ))), __deriv__(X(INT(OpenAD_Symbol_32))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_31))))
          OpenAD_Symbol_6 = INT(OpenAD_Symbol_6) + 1
        END DO
      ENDIF
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
      IF(__value__(X(1)) .LT. __value__(X(2))) THEN
        OpenAD_Symbol_18 = 0_w2f__i8
        DO I = 1, 2, 1
          __value__(Y(INT(I))) = (__value__(X(I)) * __value__(X(I)))
          OpenAD_Symbol_0 = __value__(X(I))
          OpenAD_Symbol_1 = __value__(X(I))
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_0)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_1)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
          OpenAD_Symbol_18 = (INT(OpenAD_Symbol_18) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_18)
        OpenAD_Symbol_20 = 1_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_20)
      ELSE
        OpenAD_Symbol_19 = 0_w2f__i8
        DO I = 1, 2, 1
          __value__(Y(INT(I))) = (__value__(X(I)) * __value__(X(I)))
          OpenAD_Symbol_2 = __value__(X(I))
          OpenAD_Symbol_3 = __value__(X(I))
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_2)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_3)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
          OpenAD_Symbol_19 = (INT(OpenAD_Symbol_19) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_19)
        OpenAD_Symbol_21 = 0_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_21)
      ENDIF
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_13)
      IF(OpenAD_Symbol_13 .ne. 0) THEN
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_16)
        OpenAD_Symbol_17 = 1
        DO WHILE(INT(OpenAD_Symbol_17) .LE. INT(OpenAD_Symbol_16))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_22)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_23)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_24)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_24, __deriv__(Y(INT(OpenAD_Symbol_22
     > ))), __deriv__(X(INT(OpenAD_Symbol_23))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_25)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_26)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_27)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_27, __deriv__(Y(INT(OpenAD_Symbol_25
     > ))), __deriv__(X(INT(OpenAD_Symbol_26))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_25))))
          OpenAD_Symbol_17 = INT(OpenAD_Symbol_17) + 1
        END DO
      ELSE
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_14)
        OpenAD_Symbol_15 = 1
        DO WHILE(INT(OpenAD_Symbol_15) .LE. INT(OpenAD_Symbol_14))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_28)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_29)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_30)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_30, __deriv__(Y(INT(OpenAD_Symbol_28
     > ))), __deriv__(X(INT(OpenAD_Symbol_29))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_31)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_32)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_33)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_33, __deriv__(Y(INT(OpenAD_Symbol_31
     > ))), __deriv__(X(INT(OpenAD_Symbol_32))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_31))))
          OpenAD_Symbol_15 = INT(OpenAD_Symbol_15) + 1
        END DO
      ENDIF
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
