C ***********************************************************
C Fortran file translated from WHIRL Thu Jul 20 14:39:22 2006
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
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
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
      REAL(w2f__8) OpenAD_Symbol_33
      TYPE (OpenADTy_active) OpenAD_Symbol_34
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_36
      REAL(w2f__8) OpenAD_Symbol_37
      REAL(w2f__8) OpenAD_Symbol_38
      TYPE (OpenADTy_active) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_42
      REAL(w2f__8) OpenAD_Symbol_43
      TYPE (OpenADTy_active) OpenAD_Symbol_44
      REAL(w2f__8) OpenAD_Symbol_45
      REAL(w2f__8) OpenAD_Symbol_46
      REAL(w2f__8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 4)
      TYPE (OpenADTy_active) Y(1 : 4)
C
C     **** Local Variables and Functions ****
C
      TYPE (OpenADTy_active) T1
      TYPE (OpenADTy_active) T2
      TYPE (OpenADTy_active) T3
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_2 = (__value__(X(1)) / __value__(X(2)))
      OpenAD_Symbol_0 = (INT(1_w2f__i8) / __value__(X(2)))
      OpenAD_Symbol_1 = (-(__value__(X(1)) /(__value__(X(2)) *
     >  __value__(X(2)))))
      __value__(T1) = OpenAD_Symbol_2
      OpenAD_Symbol_5 = (__value__(X(3)) * __value__(X(4)))
      OpenAD_Symbol_3 = __value__(X(4))
      OpenAD_Symbol_4 = __value__(X(3))
      __value__(T2) = OpenAD_Symbol_5
      OpenAD_Symbol_8 = (__value__(T1) * __value__(T2))
      OpenAD_Symbol_6 = __value__(T2)
      OpenAD_Symbol_7 = __value__(T1)
      __value__(T3) = OpenAD_Symbol_8
      OpenAD_Symbol_11 = (__value__(T1) * __value__(T3))
      OpenAD_Symbol_9 = __value__(T3)
      OpenAD_Symbol_10 = __value__(T1)
      __value__(Y(1)) = OpenAD_Symbol_11
      OpenAD_Symbol_14 = (1.0D00 / __value__(T3))
      OpenAD_Symbol_13 = (-(1.0D00 /(__value__(T3) * __value__(T3))))
      __value__(Y(2)) = OpenAD_Symbol_14
      OpenAD_Symbol_16 = SIN(__value__(T3))
      OpenAD_Symbol_15 = COS(__value__(T3))
      __value__(Y(3)) = OpenAD_Symbol_16
      OpenAD_Symbol_19 = (__value__(T2) * __value__(T3))
      OpenAD_Symbol_17 = __value__(T3)
      OpenAD_Symbol_18 = __value__(T2)
      __value__(Y(4)) = OpenAD_Symbol_19
      OpenAD_Symbol_20 = (OpenAD_Symbol_0 * OpenAD_Symbol_6)
      OpenAD_Symbol_21 = (OpenAD_Symbol_0 * OpenAD_Symbol_9)
      OpenAD_Symbol_22 = (OpenAD_Symbol_1 * OpenAD_Symbol_6)
      OpenAD_Symbol_23 = (OpenAD_Symbol_1 * OpenAD_Symbol_9)
      OpenAD_Symbol_24 = (OpenAD_Symbol_3 * OpenAD_Symbol_7)
      OpenAD_Symbol_25 = (OpenAD_Symbol_3 * OpenAD_Symbol_17)
      OpenAD_Symbol_26 = (OpenAD_Symbol_4 * OpenAD_Symbol_7)
      OpenAD_Symbol_27 = (OpenAD_Symbol_4 * OpenAD_Symbol_17)
      OpenAD_Symbol_28 = (OpenAD_Symbol_21 + OpenAD_Symbol_20 *
     >  OpenAD_Symbol_10)
      OpenAD_Symbol_30 = (OpenAD_Symbol_20 * OpenAD_Symbol_13)
      OpenAD_Symbol_31 = (OpenAD_Symbol_20 * OpenAD_Symbol_15)
      OpenAD_Symbol_32 = (OpenAD_Symbol_20 * OpenAD_Symbol_18)
      OpenAD_Symbol_33 = (OpenAD_Symbol_23 + OpenAD_Symbol_22 *
     >  OpenAD_Symbol_10)
      OpenAD_Symbol_35 = (OpenAD_Symbol_22 * OpenAD_Symbol_13)
      OpenAD_Symbol_36 = (OpenAD_Symbol_22 * OpenAD_Symbol_15)
      OpenAD_Symbol_37 = (OpenAD_Symbol_22 * OpenAD_Symbol_18)
      OpenAD_Symbol_38 = (OpenAD_Symbol_24 * OpenAD_Symbol_10)
      OpenAD_Symbol_40 = (OpenAD_Symbol_24 * OpenAD_Symbol_13)
      OpenAD_Symbol_41 = (OpenAD_Symbol_24 * OpenAD_Symbol_15)
      OpenAD_Symbol_42 = (OpenAD_Symbol_25 + OpenAD_Symbol_24 *
     >  OpenAD_Symbol_18)
      OpenAD_Symbol_43 = (OpenAD_Symbol_26 * OpenAD_Symbol_10)
      OpenAD_Symbol_45 = (OpenAD_Symbol_26 * OpenAD_Symbol_13)
      OpenAD_Symbol_46 = (OpenAD_Symbol_26 * OpenAD_Symbol_15)
      OpenAD_Symbol_47 = (OpenAD_Symbol_27 + OpenAD_Symbol_26 *
     >  OpenAD_Symbol_18)
      CALL setderiv(__deriv__(OpenAD_Symbol_44), __deriv__(X(4)))
      CALL setderiv(__deriv__(OpenAD_Symbol_39), __deriv__(X(3)))
      CALL setderiv(__deriv__(OpenAD_Symbol_34), __deriv__(X(2)))
      CALL setderiv(__deriv__(OpenAD_Symbol_29), __deriv__(X(1)))
      CALL sax(OpenAD_Symbol_28, __deriv__(OpenAD_Symbol_29), __deriv__
     > (Y(1)))
      CALL sax(OpenAD_Symbol_30, __deriv__(OpenAD_Symbol_29), __deriv__
     > (Y(2)))
      CALL sax(OpenAD_Symbol_31, __deriv__(OpenAD_Symbol_29), __deriv__
     > (Y(3)))
      CALL sax(OpenAD_Symbol_32, __deriv__(OpenAD_Symbol_29), __deriv__
     > (Y(4)))
      CALL saxpy(OpenAD_Symbol_33, __deriv__(OpenAD_Symbol_34),
     >  __deriv__(Y(1)))
      CALL saxpy(OpenAD_Symbol_35, __deriv__(OpenAD_Symbol_34),
     >  __deriv__(Y(2)))
      CALL saxpy(OpenAD_Symbol_36, __deriv__(OpenAD_Symbol_34),
     >  __deriv__(Y(3)))
      CALL saxpy(OpenAD_Symbol_37, __deriv__(OpenAD_Symbol_34),
     >  __deriv__(Y(4)))
      CALL saxpy(OpenAD_Symbol_38, __deriv__(OpenAD_Symbol_39),
     >  __deriv__(Y(1)))
      CALL saxpy(OpenAD_Symbol_40, __deriv__(OpenAD_Symbol_39),
     >  __deriv__(Y(2)))
      CALL saxpy(OpenAD_Symbol_41, __deriv__(OpenAD_Symbol_39),
     >  __deriv__(Y(3)))
      CALL saxpy(OpenAD_Symbol_42, __deriv__(OpenAD_Symbol_39),
     >  __deriv__(Y(4)))
      CALL saxpy(OpenAD_Symbol_43, __deriv__(OpenAD_Symbol_44),
     >  __deriv__(Y(1)))
      CALL saxpy(OpenAD_Symbol_45, __deriv__(OpenAD_Symbol_44),
     >  __deriv__(Y(2)))
      CALL saxpy(OpenAD_Symbol_46, __deriv__(OpenAD_Symbol_44),
     >  __deriv__(Y(3)))
      CALL saxpy(OpenAD_Symbol_47, __deriv__(OpenAD_Symbol_44),
     >  __deriv__(Y(4)))
      RETURN
      END SUBROUTINE
