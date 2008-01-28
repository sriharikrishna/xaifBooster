
      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE foo()
      use w2f__types
      IMPLICIT NONE
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
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
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE head(X, Y)
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
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_8
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y
C
C     **** Local Variables and Functions ****
C
      EXTERNAL foo
      TYPE (OpenADTy_active) T
      TYPE (OpenADTy_active) T2
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_21
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
      __value__(T) = (__value__(X(1)) + __value__(X(2)))
      __value__(T2) = (__value__(T) * 2.0D00)
      CALL foo()
      __value__(Y) = (__value__(T2) * 3.0D00 + __value__(T) * 2.0D00)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      __value__(T) = (__value__(X(1)) + __value__(X(2)))
      OpenAD_Symbol_0 = 1_w2f__i8
      OpenAD_Symbol_1 = 1_w2f__i8
      __value__(T2) = (__value__(T) * 2.0D00)
      OpenAD_Symbol_2 = 2.0D00
      OpenAD_Symbol_10 = (OpenAD_Symbol_0 * OpenAD_Symbol_2)
      OpenAD_Symbol_11 = (OpenAD_Symbol_1 * OpenAD_Symbol_2)
      OpenAD_Symbol_12 = OpenAD_Symbol_0
      OpenAD_Symbol_13 = OpenAD_Symbol_1
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_10)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_11)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_12)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_13)
      CALL foo()
      __value__(Y) = (__value__(T2) * 3.0D00 + __value__(T) * 2.0D00)
      OpenAD_Symbol_6 = 3.0D00
      OpenAD_Symbol_4 = 1_w2f__i8
      OpenAD_Symbol_8 = 2.0D00
      OpenAD_Symbol_5 = 1_w2f__i8
      OpenAD_Symbol_14 = (OpenAD_Symbol_6 * OpenAD_Symbol_4)
      OpenAD_Symbol_15 = (OpenAD_Symbol_8 * OpenAD_Symbol_5)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_14)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_15)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_16)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_16, __deriv__(Y), __deriv__(T))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_17)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_17, __deriv__(Y), __deriv__(T2))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y))
      CALL foo()
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_18)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_18, __deriv__(T), __deriv__(X(2)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_19)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_19, __deriv__(T), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(T))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_20)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_20, __deriv__(T2), __deriv__(X(2)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_21)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_21, __deriv__(T2), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(T2))
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
      __value__(T) = (__value__(X(1)) + __value__(X(2)))
      OpenAD_Symbol_0 = 1_w2f__i8
      OpenAD_Symbol_1 = 1_w2f__i8
      __value__(T2) = (__value__(T) * 2.0D00)
      OpenAD_Symbol_2 = 2.0D00
      OpenAD_Symbol_10 = (OpenAD_Symbol_0 * OpenAD_Symbol_2)
      OpenAD_Symbol_11 = (OpenAD_Symbol_1 * OpenAD_Symbol_2)
      OpenAD_Symbol_12 = OpenAD_Symbol_0
      OpenAD_Symbol_13 = OpenAD_Symbol_1
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_10)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_11)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_12)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_13)
      CALL foo()
      __value__(Y) = (__value__(T2) * 3.0D00 + __value__(T) * 2.0D00)
      OpenAD_Symbol_6 = 3.0D00
      OpenAD_Symbol_4 = 1_w2f__i8
      OpenAD_Symbol_8 = 2.0D00
      OpenAD_Symbol_5 = 1_w2f__i8
      OpenAD_Symbol_14 = (OpenAD_Symbol_6 * OpenAD_Symbol_4)
      OpenAD_Symbol_15 = (OpenAD_Symbol_8 * OpenAD_Symbol_5)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_14)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_15)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_16)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_16, __deriv__(Y), __deriv__(T))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_17)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_17, __deriv__(Y), __deriv__(T2))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y))
      CALL foo()
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_18)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_18, __deriv__(T), __deriv__(X(2)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_19)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_19, __deriv__(T), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(T))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_20)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_20, __deriv__(T2), __deriv__(X(2)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_21)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_21, __deriv__(T2), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(T2))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
