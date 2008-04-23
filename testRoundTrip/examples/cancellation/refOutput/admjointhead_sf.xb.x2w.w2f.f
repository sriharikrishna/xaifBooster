
      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(X1, X2, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_22
      REAL(w2f__8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_27
      REAL(w2f__8) OpenAD_Symbol_28
      TYPE (OpenADTy_active) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_31
      REAL(w2f__8) OpenAD_Symbol_32
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
      TYPE (OpenADTy_active) Y
C
C     **** Local Variables and Functions ****
C
      TYPE (OpenADTy_active) A
      TYPE (OpenADTy_active) B
      TYPE (OpenADTy_active) C
      TYPE (OpenADTy_active) D
      TYPE (OpenADTy_active) E
      TYPE (OpenADTy_active) F
      REAL(w2f__8) OpenAD_Symbol_33
      REAL(w2f__8) OpenAD_Symbol_34
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_36
      REAL(w2f__8) OpenAD_Symbol_37
      REAL(w2f__8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_42
      REAL(w2f__8) OpenAD_Symbol_43
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X1)
C$OPENAD INDEPENDENT(X2)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      __value__(A) = (1.0D00 /(__value__(X1) / __value__(X2)))
      __value__(B) = (__value__(X2) * __value__(A))
      __value__(C) = __value__(X2)
      __value__(C) = SIN(__value__(C))
      __value__(D) = __value__(A)
      __value__(F) = __value__(A)
      __value__(F) = ((__value__(F) - __value__(A)) * 5.0D-01)
      __value__(E) = ((__value__(D) - __value__(A)) * 5.0D-01)
      __value__(Y) = (__value__(B) * __value__(F) + __value__(C) *
     >  __value__(E))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_0 = (__value__(X1) / __value__(X2))
      __value__(A) = (1.0D00 / OpenAD_Symbol_0)
      OpenAD_Symbol_3 = (INT(1_w2f__i8) / __value__(X2))
      OpenAD_Symbol_4 = (-(__value__(X1) /(__value__(X2) * __value__(X2
     > ))))
      OpenAD_Symbol_2 = (-(1.0D00 /(OpenAD_Symbol_0 * OpenAD_Symbol_0))
     > )
      __value__(B) = (__value__(X2) * __value__(A))
      OpenAD_Symbol_5 = __value__(A)
      OpenAD_Symbol_6 = __value__(X2)
      __value__(C) = __value__(X2)
      OpenAD_Symbol_25 = (OpenAD_Symbol_3 * OpenAD_Symbol_2)
      OpenAD_Symbol_26 = (OpenAD_Symbol_4 * OpenAD_Symbol_2)
      OpenAD_Symbol_27 = (OpenAD_Symbol_25 * OpenAD_Symbol_6)
      OpenAD_Symbol_28 = (OpenAD_Symbol_26 * OpenAD_Symbol_6)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_25)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_26)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_27)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_28)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_5)
      OpenAD_Symbol_8 = SIN(__value__(C))
      OpenAD_Symbol_7 = COS(__value__(C))
      __value__(C) = OpenAD_Symbol_8
      __value__(D) = __value__(A)
      __value__(F) = __value__(A)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_7)
      OpenAD_Symbol_9 = (__value__(F) - __value__(A))
      __value__(F) = (OpenAD_Symbol_9 * 5.0D-01)
      OpenAD_Symbol_12 = 1_w2f__i8
      OpenAD_Symbol_13 = (-1_w2f__i8)
      OpenAD_Symbol_10 = 5.0D-01
      OpenAD_Symbol_14 = (__value__(D) - __value__(A))
      __value__(E) = (OpenAD_Symbol_14 * 5.0D-01)
      OpenAD_Symbol_17 = 1_w2f__i8
      OpenAD_Symbol_18 = (-1_w2f__i8)
      OpenAD_Symbol_15 = 5.0D-01
      __value__(Y) = (__value__(B) * __value__(F) + __value__(C) *
     >  __value__(E))
      OpenAD_Symbol_21 = __value__(F)
      OpenAD_Symbol_22 = __value__(B)
      OpenAD_Symbol_19 = 1_w2f__i8
      OpenAD_Symbol_23 = __value__(E)
      OpenAD_Symbol_24 = __value__(C)
      OpenAD_Symbol_20 = 1_w2f__i8
      OpenAD_Symbol_30 = (5.0D-01 * OpenAD_Symbol_24)
      OpenAD_Symbol_31 = (5.0D-01 * OpenAD_Symbol_22)
      OpenAD_Symbol_32 = (INT((-1_w2f__i8)) * OpenAD_Symbol_30 + INT((
     > -1_w2f__i8)) * OpenAD_Symbol_31)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_23)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_21)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_30)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_31)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_32)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_33)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_33, __deriv__(Y), __deriv__(A))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_34)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_34, __deriv__(Y), __deriv__(F))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_35)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_35, __deriv__(Y), __deriv__(D))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_36)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_36, __deriv__(Y), __deriv__(B))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_37)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_37, __deriv__(Y), __deriv__(C))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(F), __deriv__(A))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(F))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(D), __deriv__(A))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(D))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_38)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_38, __deriv__(C), __deriv__(
     > OpenAD_Symbol_29))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(C))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_29), __deriv__(C))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_29))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_39)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_39, __deriv__(B), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_40)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_40, __deriv__(B), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_41)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_41, __deriv__(B), __deriv__(X1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(B))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_42)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_42, __deriv__(A), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_43)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_43, __deriv__(A), __deriv__(X1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(A))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(C), __deriv__(X2))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(C))
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
      OpenAD_Symbol_0 = (__value__(X1) / __value__(X2))
      __value__(A) = (1.0D00 / OpenAD_Symbol_0)
      OpenAD_Symbol_3 = (INT(1_w2f__i8) / __value__(X2))
      OpenAD_Symbol_4 = (-(__value__(X1) /(__value__(X2) * __value__(X2
     > ))))
      OpenAD_Symbol_2 = (-(1.0D00 /(OpenAD_Symbol_0 * OpenAD_Symbol_0))
     > )
      __value__(B) = (__value__(X2) * __value__(A))
      OpenAD_Symbol_5 = __value__(A)
      OpenAD_Symbol_6 = __value__(X2)
      __value__(C) = __value__(X2)
      OpenAD_Symbol_25 = (OpenAD_Symbol_3 * OpenAD_Symbol_2)
      OpenAD_Symbol_26 = (OpenAD_Symbol_4 * OpenAD_Symbol_2)
      OpenAD_Symbol_27 = (OpenAD_Symbol_25 * OpenAD_Symbol_6)
      OpenAD_Symbol_28 = (OpenAD_Symbol_26 * OpenAD_Symbol_6)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_25)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_26)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_27)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_28)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_5)
      OpenAD_Symbol_8 = SIN(__value__(C))
      OpenAD_Symbol_7 = COS(__value__(C))
      __value__(C) = OpenAD_Symbol_8
      __value__(D) = __value__(A)
      __value__(F) = __value__(A)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_7)
      OpenAD_Symbol_9 = (__value__(F) - __value__(A))
      __value__(F) = (OpenAD_Symbol_9 * 5.0D-01)
      OpenAD_Symbol_12 = 1_w2f__i8
      OpenAD_Symbol_13 = (-1_w2f__i8)
      OpenAD_Symbol_10 = 5.0D-01
      OpenAD_Symbol_14 = (__value__(D) - __value__(A))
      __value__(E) = (OpenAD_Symbol_14 * 5.0D-01)
      OpenAD_Symbol_17 = 1_w2f__i8
      OpenAD_Symbol_18 = (-1_w2f__i8)
      OpenAD_Symbol_15 = 5.0D-01
      __value__(Y) = (__value__(B) * __value__(F) + __value__(C) *
     >  __value__(E))
      OpenAD_Symbol_21 = __value__(F)
      OpenAD_Symbol_22 = __value__(B)
      OpenAD_Symbol_19 = 1_w2f__i8
      OpenAD_Symbol_23 = __value__(E)
      OpenAD_Symbol_24 = __value__(C)
      OpenAD_Symbol_20 = 1_w2f__i8
      OpenAD_Symbol_30 = (5.0D-01 * OpenAD_Symbol_24)
      OpenAD_Symbol_31 = (5.0D-01 * OpenAD_Symbol_22)
      OpenAD_Symbol_32 = (INT((-1_w2f__i8)) * OpenAD_Symbol_30 + INT((
     > -1_w2f__i8)) * OpenAD_Symbol_31)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_23)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_21)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_30)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_31)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_32)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_33)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_33, __deriv__(Y), __deriv__(A))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_34)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_34, __deriv__(Y), __deriv__(F))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_35)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_35, __deriv__(Y), __deriv__(D))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_36)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_36, __deriv__(Y), __deriv__(B))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_37)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_37, __deriv__(Y), __deriv__(C))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(F), __deriv__(A))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(F))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(D), __deriv__(A))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(D))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_38)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_38, __deriv__(C), __deriv__(
     > OpenAD_Symbol_29))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(C))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_29), __deriv__(C))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_29))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_39)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_39, __deriv__(B), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_40)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_40, __deriv__(B), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_41)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_41, __deriv__(B), __deriv__(X1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(B))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_42)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_42, __deriv__(A), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_43)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_43, __deriv__(A), __deriv__(X1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(A))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(C), __deriv__(X2))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(C))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
