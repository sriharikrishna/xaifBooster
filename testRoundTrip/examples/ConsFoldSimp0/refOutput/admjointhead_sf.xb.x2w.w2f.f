
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
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
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
      TYPE (OpenADTy_active) Y1
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
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
      __value__(T1) = (__value__(X(1)) + __value__(X(1)))
      __value__(T2) = (__value__(T1) * 2.0D00)
      __value__(Y1) = __value__(T2)
      __value__(Y(1)) = __value__(Y1)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      __value__(T1) = (__value__(X(1)) + __value__(X(1)))
      OpenAD_Symbol_0 = 1_w2f__i8
      OpenAD_Symbol_1 = 1_w2f__i8
      __value__(T2) = (__value__(T1) * 2.0D00)
      OpenAD_Symbol_2 = 2.0D00
      __value__(Y1) = __value__(T2)
      __value__(Y(1)) = __value__(Y1)
      OpenAD_Symbol_4 = (INT(1_w2f__i8) * INT(1_w2f__i8))
      OpenAD_Symbol_5 = (OpenAD_Symbol_2 * OpenAD_Symbol_4)
      OpenAD_Symbol_6 = (OpenAD_Symbol_0 * OpenAD_Symbol_5)
      OpenAD_Symbol_7 = (OpenAD_Symbol_1 * OpenAD_Symbol_5)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_6)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_7)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_8)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_8, __deriv__(Y(1)), __deriv__(X(1)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_9)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_9, __deriv__(Y(1)), __deriv__(X(1)))
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
      __value__(T1) = (__value__(X(1)) + __value__(X(1)))
      OpenAD_Symbol_0 = 1_w2f__i8
      OpenAD_Symbol_1 = 1_w2f__i8
      __value__(T2) = (__value__(T1) * 2.0D00)
      OpenAD_Symbol_2 = 2.0D00
      __value__(Y1) = __value__(T2)
      __value__(Y(1)) = __value__(Y1)
      OpenAD_Symbol_4 = (INT(1_w2f__i8) * INT(1_w2f__i8))
      OpenAD_Symbol_5 = (OpenAD_Symbol_2 * OpenAD_Symbol_4)
      OpenAD_Symbol_6 = (OpenAD_Symbol_0 * OpenAD_Symbol_5)
      OpenAD_Symbol_7 = (OpenAD_Symbol_1 * OpenAD_Symbol_5)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_6)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_7)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_8)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_8, __deriv__(Y(1)), __deriv__(X(1)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_9)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_9, __deriv__(Y(1)), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(1)))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
