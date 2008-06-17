
      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(X1, X2, Y1, Y2)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X1
      TYPE (OpenADTy_active) X2
      TYPE (OpenADTy_active) Y1
      TYPE (OpenADTy_active) Y2
C
C     **** Local Variables and Functions ****
C
      TYPE (OpenADTy_active) T1
      TYPE (OpenADTy_active) T2
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_22
      REAL(w2f__8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_24
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X1)
C$OPENAD INDEPENDENT(X2)
C$OPENAD DEPENDENT(Y1)
C$OPENAD DEPENDENT(Y2)
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      __value__(T1) = (__value__(X1) * __value__(X2))
      __value__(T2) = (__value__(X1) * SIN(__value__(T1)))
      __value__(Y1) = COS(__value__(T2))
      __value__(Y2) = (__value__(X2) * __value__(T2))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      __value__(T1) = (__value__(X1) * __value__(X2))
      OpenAD_Symbol_0 = __value__(X2)
      OpenAD_Symbol_1 = __value__(X1)
      OpenAD_Symbol_2 = SIN(__value__(T1))
      __value__(T2) = (__value__(X1) * OpenAD_Symbol_2)
      OpenAD_Symbol_3 = OpenAD_Symbol_2
      OpenAD_Symbol_5 = COS(__value__(T1))
      OpenAD_Symbol_4 = __value__(X1)
      __value__(Y1) = COS(__value__(T2))
      OpenAD_Symbol_6 = (- SIN(__value__(T2)))
      __value__(Y2) = (__value__(X2) * __value__(T2))
      OpenAD_Symbol_7 = __value__(T2)
      OpenAD_Symbol_8 = __value__(X2)
      OpenAD_Symbol_9 = (OpenAD_Symbol_5 * OpenAD_Symbol_4)
      OpenAD_Symbol_10 = (OpenAD_Symbol_0 * OpenAD_Symbol_9)
      OpenAD_Symbol_11 = (OpenAD_Symbol_1 * OpenAD_Symbol_9)
      OpenAD_Symbol_12 = (OpenAD_Symbol_3 * OpenAD_Symbol_6)
      OpenAD_Symbol_13 = (OpenAD_Symbol_3 * OpenAD_Symbol_8)
      OpenAD_Symbol_14 = (OpenAD_Symbol_10 * OpenAD_Symbol_6)
      OpenAD_Symbol_15 = (OpenAD_Symbol_10 * OpenAD_Symbol_8)
      OpenAD_Symbol_16 = (OpenAD_Symbol_11 * OpenAD_Symbol_6)
      OpenAD_Symbol_17 = (OpenAD_Symbol_11 * OpenAD_Symbol_8)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_12)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_14)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_16)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_13)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_15)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_17)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_7)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_18)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_18, __deriv__(Y2), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_19)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_19, __deriv__(Y2), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_20)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_20, __deriv__(Y2), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_21)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_21, __deriv__(Y2), __deriv__(X1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_22)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_22, __deriv__(Y1), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_23)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_23, __deriv__(Y1), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_24)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_24, __deriv__(Y1), __deriv__(X1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y1))
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
      __value__(T1) = (__value__(X1) * __value__(X2))
      OpenAD_Symbol_0 = __value__(X2)
      OpenAD_Symbol_1 = __value__(X1)
      OpenAD_Symbol_2 = SIN(__value__(T1))
      __value__(T2) = (__value__(X1) * OpenAD_Symbol_2)
      OpenAD_Symbol_3 = OpenAD_Symbol_2
      OpenAD_Symbol_5 = COS(__value__(T1))
      OpenAD_Symbol_4 = __value__(X1)
      __value__(Y1) = COS(__value__(T2))
      OpenAD_Symbol_6 = (- SIN(__value__(T2)))
      __value__(Y2) = (__value__(X2) * __value__(T2))
      OpenAD_Symbol_7 = __value__(T2)
      OpenAD_Symbol_8 = __value__(X2)
      OpenAD_Symbol_9 = (OpenAD_Symbol_5 * OpenAD_Symbol_4)
      OpenAD_Symbol_10 = (OpenAD_Symbol_0 * OpenAD_Symbol_9)
      OpenAD_Symbol_11 = (OpenAD_Symbol_1 * OpenAD_Symbol_9)
      OpenAD_Symbol_12 = (OpenAD_Symbol_3 * OpenAD_Symbol_6)
      OpenAD_Symbol_13 = (OpenAD_Symbol_3 * OpenAD_Symbol_8)
      OpenAD_Symbol_14 = (OpenAD_Symbol_10 * OpenAD_Symbol_6)
      OpenAD_Symbol_15 = (OpenAD_Symbol_10 * OpenAD_Symbol_8)
      OpenAD_Symbol_16 = (OpenAD_Symbol_11 * OpenAD_Symbol_6)
      OpenAD_Symbol_17 = (OpenAD_Symbol_11 * OpenAD_Symbol_8)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_12)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_14)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_16)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_13)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_15)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_17)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_7)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_18)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_18, __deriv__(Y2), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_19)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_19, __deriv__(Y2), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_20)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_20, __deriv__(Y2), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_21)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_21, __deriv__(Y2), __deriv__(X1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_22)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_22, __deriv__(Y1), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_23)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_23, __deriv__(Y1), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_24)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_24, __deriv__(Y1), __deriv__(X1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y1))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
