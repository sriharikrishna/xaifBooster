
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
      INTEGER(w2f__i8) OpenAD_Symbol_12
      INTEGER(w2f__i8) OpenAD_Symbol_13
      INTEGER(w2f__i8) OpenAD_Symbol_14
      INTEGER(w2f__i8) OpenAD_Symbol_15
      INTEGER(w2f__i8) OpenAD_Symbol_16
      INTEGER(w2f__i8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      TYPE (OpenADTy_active) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
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
      TYPE (OpenADTy_active) S
      INTEGER(w2f__i8) OpenAD_Symbol_18
      INTEGER(w2f__i8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_20
      INTEGER(w2f__i8) OpenAD_Symbol_21
      INTEGER(w2f__i8) OpenAD_Symbol_22
      REAL(w2f__8) OpenAD_Symbol_23
      INTEGER(w2f__i8) OpenAD_Symbol_24
      INTEGER(w2f__i8) OpenAD_Symbol_25
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
      __value__(Y(1)) = 0.0D00
      __value__(Y(2)) = 0.0D00
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        __value__(S) = __value__(X(I))
        IF(__value__(S) .LT. 0.0D00) THEN
          __value__(X(INT(I))) = (__value__(X(I)) * 2.0D00)
        ELSE
          __value__(S) = 0.0D00
        ENDIF
        __value__(Y(INT(I))) = (__value__(X(I)) + __value__(S))
      END DO
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      I = 1
      __value__(Y(1)) = 0.0D00
      __value__(Y(2)) = 0.0D00
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        __value__(S) = __value__(X(I))
        IF(__value__(S) .LT. 0.0D00) THEN
          OpenAD_Symbol_2 = (__value__(X(I)) * 2.0D00)
          OpenAD_Symbol_0 = 2.0D00
          __value__(X(INT(I))) = OpenAD_Symbol_2
          OpenAD_Symbol_5 = OpenAD_Symbol_0
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_5)
          OpenAD_Symbol_10 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_10)
        ELSE
          __value__(S) = 0.0D00
          OpenAD_Symbol_11 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_11)
        ENDIF
        __value__(Y(INT(I))) = (__value__(X(I)) + __value__(S))
        OpenAD_Symbol_3 = 1_w2f__i8
        OpenAD_Symbol_4 = 1_w2f__i8
        OpenAD_Symbol_7 = OpenAD_Symbol_3
        OpenAD_Symbol_8 = OpenAD_Symbol_4
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_7)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_8)
      END DO
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
      I = 1 + 1 *((2 - 1) / 1)
      DO WHILE(I .GE. 1)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_23)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_23, __deriv__(Y(I)), __deriv__(S))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_26)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_26, __deriv__(Y(I)), __deriv__(X(I)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(Y(I)))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_9)
        IF(OpenAD_Symbol_9 .ne. 0) THEN
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_20)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_20, __deriv__(X(I)), __deriv__(
     > OpenAD_Symbol_6))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(X(I)))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_6), __deriv__(X(I)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_6))
        ELSE
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(S))
        ENDIF
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(S), __deriv__(X(I)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(S))
        I = I - 1
      END DO
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(1)))
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
      __value__(Y(1)) = 0.0D00
      __value__(Y(2)) = 0.0D00
C$OPENAD XXX Simple loop
      OpenAD_Symbol_15 = 0_w2f__i8
      DO I = 1, 2, 1
        __value__(S) = __value__(X(I))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        IF(__value__(S) .LT. 0.0D00) THEN
          OpenAD_Symbol_2 = (__value__(X(I)) * 2.0D00)
          OpenAD_Symbol_0 = 2.0D00
          __value__(X(INT(I))) = OpenAD_Symbol_2
          OpenAD_Symbol_5 = OpenAD_Symbol_0
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_5)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
          OpenAD_Symbol_16 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_16)
        ELSE
          __value__(S) = 0.0D00
          OpenAD_Symbol_17 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_17)
        ENDIF
        __value__(Y(INT(I))) = (__value__(X(I)) + __value__(S))
        OpenAD_Symbol_3 = 1_w2f__i8
        OpenAD_Symbol_4 = 1_w2f__i8
        OpenAD_Symbol_7 = OpenAD_Symbol_3
        OpenAD_Symbol_8 = OpenAD_Symbol_4
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_7)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_8)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        OpenAD_Symbol_15 = (INT(OpenAD_Symbol_15) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_15)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_12)
      OpenAD_Symbol_13 = 1
      DO WHILE(INT(OpenAD_Symbol_13) .LE. INT(OpenAD_Symbol_12))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_22)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_23)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_23, __deriv__(Y(INT(OpenAD_Symbol_22))
     > ), __deriv__(S))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_24)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_25)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_26)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_26, __deriv__(Y(INT(OpenAD_Symbol_24))
     > ), __deriv__(X(INT(OpenAD_Symbol_25))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_24))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_14)
        IF(OpenAD_Symbol_14 .ne. 0) THEN
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_19)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_20)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_20, __deriv__(X(INT(OpenAD_Symbol_19
     > ))), __deriv__(OpenAD_Symbol_6))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(X(INT(OpenAD_Symbol_19))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_21)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_6), __deriv__(X(INT(
     > OpenAD_Symbol_21))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_6))
        ELSE
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(S))
        ENDIF
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_18)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(S), __deriv__(X(INT(OpenAD_Symbol_18)))
     > )
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(S))
        OpenAD_Symbol_13 = INT(OpenAD_Symbol_13) + 1
      END DO
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(1)))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
