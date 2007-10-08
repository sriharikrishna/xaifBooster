C ***********************************************************
C Fortran file translated from WHIRL Fri Oct  5 10:19:24 2007
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
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      TYPE (OpenADTy_active) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      TYPE (OpenADTy_active) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y(1 : 2)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      INTEGER(w2f__i8) OpenAD_Symbol_32
      REAL(w2f__8) OpenAD_Symbol_33
      INTEGER(w2f__i8) OpenAD_Symbol_34
      REAL(w2f__8) OpenAD_Symbol_35
      INTEGER(w2f__i8) OpenAD_Symbol_36
      INTEGER(w2f__i8) OpenAD_Symbol_37
      INTEGER(w2f__i8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_39
      INTEGER(w2f__i8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
      INTEGER(w2f__i8) OpenAD_Symbol_42
      INTEGER(w2f__i8) OpenAD_Symbol_43
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
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      IF(__value__(X(1)) .LT. __value__(X(2))) THEN
        OpenAD_Symbol_19 = 0_w2f__i8
        DO I = 1, 2, 1
          OpenAD_Symbol_2 = (__value__(X(I)) * __value__(X(I)))
          OpenAD_Symbol_0 = __value__(X(I))
          OpenAD_Symbol_1 = __value__(X(I))
          __value__(Y(INT(I))) = OpenAD_Symbol_2
          OpenAD_Symbol_6 = OpenAD_Symbol_0
          OpenAD_Symbol_8 = OpenAD_Symbol_1
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_6)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_8)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
          OpenAD_Symbol_19 = (INT(OpenAD_Symbol_19) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_19)
        OpenAD_Symbol_21 = 1_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_21)
      ELSE
        OpenAD_Symbol_20 = 0_w2f__i8
        DO I = 1, 2, 1
          OpenAD_Symbol_5 = (__value__(X(I)) * __value__(X(I)))
          OpenAD_Symbol_3 = __value__(X(I))
          OpenAD_Symbol_4 = __value__(X(I))
          __value__(Y(INT(I))) = OpenAD_Symbol_5
          OpenAD_Symbol_10 = OpenAD_Symbol_3
          OpenAD_Symbol_12 = OpenAD_Symbol_4
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_10)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_12)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
          OpenAD_Symbol_20 = (INT(OpenAD_Symbol_20) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_20)
        OpenAD_Symbol_22 = 0_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_22)
      ENDIF
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_14)
      IF(OpenAD_Symbol_14 .ne. 0) THEN
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_17)
        OpenAD_Symbol_18 = 1
        DO WHILE(INT(OpenAD_Symbol_18) .LE. INT(OpenAD_Symbol_17))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_32)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_33)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_33, __deriv__(Y(INT(OpenAD_Symbol_32
     > ))), __deriv__(OpenAD_Symbol_9))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_34)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_35)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_35, __deriv__(Y(INT(OpenAD_Symbol_34
     > ))), __deriv__(OpenAD_Symbol_7))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_34))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_36)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_7), __deriv__(X(INT(
     > OpenAD_Symbol_36))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_7))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_37)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_9), __deriv__(X(INT(
     > OpenAD_Symbol_37))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_9))
          OpenAD_Symbol_18 = INT(OpenAD_Symbol_18) + 1
        END DO
      ELSE
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_15)
        OpenAD_Symbol_16 = 1
        DO WHILE(INT(OpenAD_Symbol_16) .LE. INT(OpenAD_Symbol_15))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_38)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_39)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_39, __deriv__(Y(INT(OpenAD_Symbol_38
     > ))), __deriv__(OpenAD_Symbol_13))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_40)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_41)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_41, __deriv__(Y(INT(OpenAD_Symbol_40
     > ))), __deriv__(OpenAD_Symbol_11))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_40))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_42)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_11), __deriv__(X(INT(
     > OpenAD_Symbol_42))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_11))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_43)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_13), __deriv__(X(INT(
     > OpenAD_Symbol_43))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_13))
          OpenAD_Symbol_16 = INT(OpenAD_Symbol_16) + 1
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
        OpenAD_Symbol_28 = 0_w2f__i8
        DO I = 1, 2, 1
          OpenAD_Symbol_2 = (__value__(X(I)) * __value__(X(I)))
          OpenAD_Symbol_0 = __value__(X(I))
          OpenAD_Symbol_1 = __value__(X(I))
          __value__(Y(INT(I))) = OpenAD_Symbol_2
          OpenAD_Symbol_6 = OpenAD_Symbol_0
          OpenAD_Symbol_8 = OpenAD_Symbol_1
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_6)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_8)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
          OpenAD_Symbol_28 = (INT(OpenAD_Symbol_28) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_28)
        OpenAD_Symbol_30 = 1_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_30)
      ELSE
        OpenAD_Symbol_29 = 0_w2f__i8
        DO I = 1, 2, 1
          OpenAD_Symbol_5 = (__value__(X(I)) * __value__(X(I)))
          OpenAD_Symbol_3 = __value__(X(I))
          OpenAD_Symbol_4 = __value__(X(I))
          __value__(Y(INT(I))) = OpenAD_Symbol_5
          OpenAD_Symbol_10 = OpenAD_Symbol_3
          OpenAD_Symbol_12 = OpenAD_Symbol_4
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_10)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_12)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
          OpenAD_Symbol_29 = (INT(OpenAD_Symbol_29) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_29)
        OpenAD_Symbol_31 = 0_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_31)
      ENDIF
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_23)
      IF(OpenAD_Symbol_23 .ne. 0) THEN
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_26)
        OpenAD_Symbol_27 = 1
        DO WHILE(INT(OpenAD_Symbol_27) .LE. INT(OpenAD_Symbol_26))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_32)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_33)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_33, __deriv__(Y(INT(OpenAD_Symbol_32
     > ))), __deriv__(OpenAD_Symbol_9))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_34)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_35)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_35, __deriv__(Y(INT(OpenAD_Symbol_34
     > ))), __deriv__(OpenAD_Symbol_7))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_34))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_36)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_7), __deriv__(X(INT(
     > OpenAD_Symbol_36))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_7))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_37)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_9), __deriv__(X(INT(
     > OpenAD_Symbol_37))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_9))
          OpenAD_Symbol_27 = INT(OpenAD_Symbol_27) + 1
        END DO
      ELSE
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_24)
        OpenAD_Symbol_25 = 1
        DO WHILE(INT(OpenAD_Symbol_25) .LE. INT(OpenAD_Symbol_24))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_38)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_39)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_39, __deriv__(Y(INT(OpenAD_Symbol_38
     > ))), __deriv__(OpenAD_Symbol_13))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_40)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_41)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_41, __deriv__(Y(INT(OpenAD_Symbol_40
     > ))), __deriv__(OpenAD_Symbol_11))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_40))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_42)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_11), __deriv__(X(INT(
     > OpenAD_Symbol_42))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_11))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_43)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_13), __deriv__(X(INT(
     > OpenAD_Symbol_43))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_13))
          OpenAD_Symbol_25 = INT(OpenAD_Symbol_25) + 1
        END DO
      ENDIF
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
