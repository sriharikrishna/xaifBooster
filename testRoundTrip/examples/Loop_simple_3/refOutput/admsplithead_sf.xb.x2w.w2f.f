
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
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      TYPE (OpenADTy_active) OpenAD_Symbol_5
      TYPE (OpenADTy_active) OpenAD_Symbol_6
      TYPE (OpenADTy_active) OpenAD_Symbol_7
      INTEGER(w2f__i8) OpenAD_Symbol_8
      INTEGER(w2f__i8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 1)
      TYPE (OpenADTy_active) Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      CHARACTER(10) ASTRING
      INTEGER(w2f__i4) I
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
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
      __value__(Y(1)) = __value__(X(1))
      ASTRING = 'blah'
C$OPENAD XXX Simple loop
      DO I = 1, 3, 1
        IF(ASTRING .EQ. 'blah') THEN
          __value__(Y(1)) = (__value__(X(1)) * __value__(Y(1)))
        ENDIF
        IF(ASTRING .EQ. 'bloh') THEN
          __value__(Y(1)) = (__value__(Y(1)) - __value__(X(1)))
        ENDIF
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      __value__(Y(1)) = __value__(X(1))
      ASTRING = 'blah'
C$OPENAD XXX Simple loop
      DO I = 1, 3, 1
        IF(ASTRING .EQ. 'blah') THEN
          OpenAD_Symbol_2 = (__value__(X(1)) * __value__(Y(1)))
          OpenAD_Symbol_0 = __value__(Y(1))
          OpenAD_Symbol_1 = __value__(X(1))
          __value__(Y(1)) = OpenAD_Symbol_2
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_0)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_1)
        ENDIF
        IF(ASTRING .EQ. 'bloh') THEN
          __value__(Y(1)) = (__value__(Y(1)) - __value__(X(1)))
          OpenAD_Symbol_3 = 1_w2f__i8
          OpenAD_Symbol_4 = (-1_w2f__i8)
        ENDIF
      END DO
C     $OpenAD$ INLINE push_s(subst)
      CALL push_s(ASTRING)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(Y(1)), __deriv__(OpenAD_Symbol_7))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(1)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_7), __deriv__(Y(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_7))
C     $OpenAD$ INLINE pop_s(subst)
      CALL pop_s(ASTRING)
      I = 1 + 1 *((3 - 1) / 1)
      DO WHILE(I .GE. 1)
        IF(ASTRING .EQ. 'bloh') THEN
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(-1_w2f__i8, __deriv__(Y(1)), __deriv__(X(1)))
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(1_w2f__i8, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_6))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(1)))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_6), __deriv__(Y(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_6))
        ENDIF
        IF(ASTRING .EQ. 'blah') THEN
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_17)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_17, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_5))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_18)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_18, __deriv__(Y(1)), __deriv__(X(1))
     > )
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(1)))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_5), __deriv__(Y(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_5))
        ENDIF
        I = I - 1
      END DO
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(Y(1)), __deriv__(X(1)))
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
      __value__(Y(1)) = __value__(X(1))
      ASTRING = 'blah'
C$OPENAD XXX Simple loop
      OpenAD_Symbol_12 = 0_w2f__i8
      DO I = 1, 3, 1
        IF(ASTRING .EQ. 'blah') THEN
          OpenAD_Symbol_2 = (__value__(X(1)) * __value__(Y(1)))
          OpenAD_Symbol_0 = __value__(Y(1))
          OpenAD_Symbol_1 = __value__(X(1))
          __value__(Y(1)) = OpenAD_Symbol_2
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_0)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_1)
          OpenAD_Symbol_13 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_13)
        ELSE
          OpenAD_Symbol_14 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_14)
        ENDIF
        IF(ASTRING .EQ. 'bloh') THEN
          __value__(Y(1)) = (__value__(Y(1)) - __value__(X(1)))
          OpenAD_Symbol_3 = 1_w2f__i8
          OpenAD_Symbol_4 = (-1_w2f__i8)
          OpenAD_Symbol_15 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_15)
        ELSE
          OpenAD_Symbol_16 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_16)
        ENDIF
        OpenAD_Symbol_12 = (INT(OpenAD_Symbol_12) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_12)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(Y(1)), __deriv__(OpenAD_Symbol_7))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(1)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_7), __deriv__(Y(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_7))
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_8)
      OpenAD_Symbol_9 = 1
      DO WHILE(INT(OpenAD_Symbol_9) .LE. INT(OpenAD_Symbol_8))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_10)
        IF(OpenAD_Symbol_10 .ne. 0) THEN
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(-1_w2f__i8, __deriv__(Y(1)), __deriv__(X(1)))
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(1_w2f__i8, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_6))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(1)))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_6), __deriv__(Y(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_6))
        ENDIF
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_11)
        IF(OpenAD_Symbol_11 .ne. 0) THEN
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_17)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_17, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_5))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_18)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_18, __deriv__(Y(1)), __deriv__(X(1))
     > )
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(1)))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_5), __deriv__(Y(1)))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_5))
        ENDIF
        OpenAD_Symbol_9 = INT(OpenAD_Symbol_9) + 1
      END DO
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(Y(1)), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(1)))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
