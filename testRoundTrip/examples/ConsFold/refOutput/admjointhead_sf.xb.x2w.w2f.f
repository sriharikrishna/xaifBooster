
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
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_8
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 1)
      TYPE (OpenADTy_active) Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      TYPE (OpenADTy_active) T1
      TYPE (OpenADTy_active) T2
      TYPE (OpenADTy_active) T3
      TYPE (OpenADTy_active) T4
      TYPE (OpenADTy_active) T5
      TYPE (OpenADTy_active) T6
      TYPE (OpenADTy_active) T7
      TYPE (OpenADTy_active) Y1
      REAL(w2f__8) OpenAD_Symbol_14
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
      __value__(T1) = __value__(X(1))
      __value__(T2) = (__value__(T1) + 2.0D00)
      __value__(T3) = (__value__(T2) * 5.0D-01)
      __value__(T4) = (__value__(T3) * 2.0D00)
      __value__(T5) = (__value__(T4) + 4.0D00)
      __value__(T6) = (__value__(T5) + 3.0D00)
      __value__(T7) = (__value__(T6) +(-9.0D00))
      __value__(Y1) = EXP(__value__(T7))
      __value__(Y(1)) = __value__(Y1)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      __value__(T1) = __value__(X(1))
      __value__(T2) = (__value__(T1) + 2.0D00)
      OpenAD_Symbol_0 = 1_w2f__i8
      __value__(T3) = (__value__(T2) * 5.0D-01)
      OpenAD_Symbol_2 = 5.0D-01
      __value__(T4) = (__value__(T3) * 2.0D00)
      OpenAD_Symbol_4 = 2.0D00
      __value__(T5) = (__value__(T4) + 4.0D00)
      OpenAD_Symbol_6 = 1_w2f__i8
      __value__(T6) = (__value__(T5) + 3.0D00)
      OpenAD_Symbol_8 = 1_w2f__i8
      __value__(T7) = (__value__(T6) +(-9.0D00))
      OpenAD_Symbol_10 = 1_w2f__i8
      __value__(Y1) = EXP(__value__(T7))
      OpenAD_Symbol_12 = EXP(__value__(T7))
      __value__(Y(1)) = __value__(Y1)
      OpenAD_Symbol_13 = (1.0D00 * OpenAD_Symbol_12)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_13)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_14)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_14, __deriv__(Y(1)), __deriv__(X(1)))
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
      __value__(T1) = __value__(X(1))
      __value__(T2) = (__value__(T1) + 2.0D00)
      OpenAD_Symbol_0 = 1_w2f__i8
      __value__(T3) = (__value__(T2) * 5.0D-01)
      OpenAD_Symbol_2 = 5.0D-01
      __value__(T4) = (__value__(T3) * 2.0D00)
      OpenAD_Symbol_4 = 2.0D00
      __value__(T5) = (__value__(T4) + 4.0D00)
      OpenAD_Symbol_6 = 1_w2f__i8
      __value__(T6) = (__value__(T5) + 3.0D00)
      OpenAD_Symbol_8 = 1_w2f__i8
      __value__(T7) = (__value__(T6) +(-9.0D00))
      OpenAD_Symbol_10 = 1_w2f__i8
      __value__(Y1) = EXP(__value__(T7))
      OpenAD_Symbol_12 = EXP(__value__(T7))
      __value__(Y(1)) = __value__(Y1)
      OpenAD_Symbol_13 = (1.0D00 * OpenAD_Symbol_12)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_13)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_14)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_14, __deriv__(Y(1)), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(1)))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
