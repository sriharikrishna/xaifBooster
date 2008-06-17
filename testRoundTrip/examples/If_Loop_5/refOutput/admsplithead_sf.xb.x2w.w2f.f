
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
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      TYPE (OpenADTy_active) OpenAD_Symbol_7
      TYPE (OpenADTy_active) OpenAD_Symbol_8
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
      REAL(w2f__8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_26
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
      I = 1
      DO WHILE(I .LT. 3)
        IF(I .LT. 2) THEN
          __value__(Y(2)) = SIN(__value__(X(1)))
        ELSE
          __value__(Y(1)) = COS(__value__(X(2)))
        ENDIF
        I = I + 1
      END DO
      __value__(Y(2)) = (__value__(Y(1)) * __value__(Y(2)))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      I = 1
      OpenAD_Symbol_14 = 0_w2f__i8
      DO WHILE(I .LT. 3)
        IF(I .LT. 2) THEN
          OpenAD_Symbol_1 = SIN(__value__(X(1)))
          OpenAD_Symbol_0 = COS(__value__(X(1)))
          __value__(Y(2)) = OpenAD_Symbol_1
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_0)
          OpenAD_Symbol_15 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_15)
        ELSE
          OpenAD_Symbol_3 = COS(__value__(X(2)))
          OpenAD_Symbol_2 = (- SIN(__value__(X(2))))
          __value__(Y(1)) = OpenAD_Symbol_3
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_2)
          OpenAD_Symbol_16 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_16)
        ENDIF
        I = I + 1
        OpenAD_Symbol_14 = (INT(OpenAD_Symbol_14) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_14)
      OpenAD_Symbol_6 = (__value__(Y(1)) * __value__(Y(2)))
      OpenAD_Symbol_4 = __value__(Y(2))
      OpenAD_Symbol_5 = __value__(Y(1))
      __value__(Y(2)) = OpenAD_Symbol_6
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_4)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_5)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_25)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_25, __deriv__(Y(2)), __deriv__(
     > OpenAD_Symbol_10))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_26)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_26, __deriv__(Y(2)), __deriv__(
     > OpenAD_Symbol_9))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(2)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_10), __deriv__(Y(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_10))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_9), __deriv__(Y(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_9))
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_11)
      OpenAD_Symbol_12 = 1
      DO WHILE(INT(OpenAD_Symbol_12) .LE. INT(OpenAD_Symbol_11))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_13)
        IF(OpenAD_Symbol_13 .ne. 0) THEN
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_23)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_23, __deriv__(Y(2)), __deriv__(
     > OpenAD_Symbol_7))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(2)))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_7), __deriv__(X(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_7))
        ELSE
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_24)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_24, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_8))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(1)))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_8), __deriv__(X(2)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_8))
        ENDIF
        OpenAD_Symbol_12 = INT(OpenAD_Symbol_12) + 1
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
      I = 1
      OpenAD_Symbol_20 = 0_w2f__i8
      DO WHILE(I .LT. 3)
        IF(I .LT. 2) THEN
          OpenAD_Symbol_1 = SIN(__value__(X(1)))
          OpenAD_Symbol_0 = COS(__value__(X(1)))
          __value__(Y(2)) = OpenAD_Symbol_1
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_0)
          OpenAD_Symbol_21 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_21)
        ELSE
          OpenAD_Symbol_3 = COS(__value__(X(2)))
          OpenAD_Symbol_2 = (- SIN(__value__(X(2))))
          __value__(Y(1)) = OpenAD_Symbol_3
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_2)
          OpenAD_Symbol_22 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_22)
        ENDIF
        I = I + 1
        OpenAD_Symbol_20 = (INT(OpenAD_Symbol_20) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_20)
      OpenAD_Symbol_6 = (__value__(Y(1)) * __value__(Y(2)))
      OpenAD_Symbol_4 = __value__(Y(2))
      OpenAD_Symbol_5 = __value__(Y(1))
      __value__(Y(2)) = OpenAD_Symbol_6
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_4)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_5)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_25)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_25, __deriv__(Y(2)), __deriv__(
     > OpenAD_Symbol_10))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_26)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_26, __deriv__(Y(2)), __deriv__(
     > OpenAD_Symbol_9))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(2)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_10), __deriv__(Y(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_10))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_9), __deriv__(Y(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_9))
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_17)
      OpenAD_Symbol_18 = 1
      DO WHILE(INT(OpenAD_Symbol_18) .LE. INT(OpenAD_Symbol_17))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_19)
        IF(OpenAD_Symbol_19 .ne. 0) THEN
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_23)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_23, __deriv__(Y(2)), __deriv__(
     > OpenAD_Symbol_7))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(2)))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_7), __deriv__(X(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_7))
        ELSE
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_24)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_24, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_8))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(1)))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_8), __deriv__(X(2)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_8))
        ENDIF
        OpenAD_Symbol_18 = INT(OpenAD_Symbol_18) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
