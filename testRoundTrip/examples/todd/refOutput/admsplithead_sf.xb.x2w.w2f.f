
      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(X, OBJ)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_22
      REAL(w2f__8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_27
      REAL(w2f__8) OpenAD_Symbol_28
      REAL(w2f__8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_31
      REAL(w2f__8) OpenAD_Symbol_32
      REAL(w2f__8) OpenAD_Symbol_33
      REAL(w2f__8) OpenAD_Symbol_34
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_36
      REAL(w2f__8) OpenAD_Symbol_37
      REAL(w2f__8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_42
      REAL(w2f__8) OpenAD_Symbol_44
      REAL(w2f__8) OpenAD_Symbol_46
      REAL(w2f__8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_50
      REAL(w2f__8) OpenAD_Symbol_51
      REAL(w2f__8) OpenAD_Symbol_52
      REAL(w2f__8) OpenAD_Symbol_53
      REAL(w2f__8) OpenAD_Symbol_54
      REAL(w2f__8) OpenAD_Symbol_55
      REAL(w2f__8) OpenAD_Symbol_56
      REAL(w2f__8) OpenAD_Symbol_57
      REAL(w2f__8) OpenAD_Symbol_58
      REAL(w2f__8) OpenAD_Symbol_59
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_60
      REAL(w2f__8) OpenAD_Symbol_61
      REAL(w2f__8) OpenAD_Symbol_62
      REAL(w2f__8) OpenAD_Symbol_63
      REAL(w2f__8) OpenAD_Symbol_64
      REAL(w2f__8) OpenAD_Symbol_65
      REAL(w2f__8) OpenAD_Symbol_66
      REAL(w2f__8) OpenAD_Symbol_67
      REAL(w2f__8) OpenAD_Symbol_68
      REAL(w2f__8) OpenAD_Symbol_69
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_70
      REAL(w2f__8) OpenAD_Symbol_71
      REAL(w2f__8) OpenAD_Symbol_72
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 6)
      TYPE (OpenADTy_active) OBJ(1 : 1)
C
C     **** Local Variables and Functions ****
C
      REAL(w2f__8) A
      REAL(w2f__8) D00
      TYPE (OpenADTy_active) D03
      REAL(w2f__8) D11
      TYPE (OpenADTy_active) D12
      TYPE (OpenADTy_active) F
      TYPE (OpenADTy_active) G
      TYPE (OpenADTy_active) LOC1
      TYPE (OpenADTy_active) M00
      TYPE (OpenADTy_active) M03
      TYPE (OpenADTy_active) M11
      TYPE (OpenADTy_active) M12
      TYPE (OpenADTy_active) M22
      TYPE (OpenADTy_active) M33
      TYPE (OpenADTy_active) MATR(0 : 3)
      REAL(w2f__8) SQRT3
      REAL(w2f__8) OpenAD_Symbol_73
      REAL(w2f__8) OpenAD_Symbol_74
      REAL(w2f__8) OpenAD_Symbol_75
      REAL(w2f__8) OpenAD_Symbol_76
      REAL(w2f__8) OpenAD_Symbol_77
      REAL(w2f__8) OpenAD_Symbol_78
      REAL(w2f__8) OpenAD_Symbol_79
      REAL(w2f__8) OpenAD_Symbol_80
      REAL(w2f__8) OpenAD_Symbol_81
      REAL(w2f__8) OpenAD_Symbol_82
      REAL(w2f__8) OpenAD_Symbol_83
      REAL(w2f__8) OpenAD_Symbol_84
      REAL(w2f__8) OpenAD_Symbol_85
      REAL(w2f__8) OpenAD_Symbol_86
      REAL(w2f__8) OpenAD_Symbol_87
      REAL(w2f__8) OpenAD_Symbol_88
      REAL(w2f__8) OpenAD_Symbol_89
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_91
      REAL(w2f__8) OpenAD_Symbol_92
      REAL(w2f__8) OpenAD_Symbol_93
      REAL(w2f__8) OpenAD_Symbol_94
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(OBJ)
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      A = 5.0D-01
      SQRT3 = 5.77350258827209472656D-01
      __value__(MATR(0)) = (__value__(X(2)) - __value__(X(1)))
      __value__(MATR(1)) = (SQRT3 *(__value__(X(3)) * 2.0D00 -
     >  __value__(X(2)) - __value__(X(1))))
      __value__(MATR(2)) = (__value__(X(5)) - __value__(X(4)))
      __value__(MATR(3)) = (SQRT3 *(__value__(X(6)) * 2.0D00 -
     >  __value__(X(5)) - __value__(X(4))))
      __value__(M03) = (__value__(MATR(0)) * __value__(MATR(3)))
      __value__(M12) = (__value__(MATR(1)) * __value__(MATR(2)))
      __value__(G) = (__value__(M03) - __value__(M12))
      D00 = (__value__(M03) * 2.0D00)
      D11 = (__value__(M12) * 2.0D00)
      __value__(M00) = (__value__(MATR(0)) * __value__(MATR(0)))
      __value__(M11) = (__value__(MATR(1)) * __value__(MATR(1)))
      __value__(M22) = (__value__(MATR(2)) * __value__(MATR(2)))
      __value__(M33) = (__value__(MATR(3)) * __value__(MATR(3)))
      __value__(D12) = (__value__(M00) * __value__(M33))
      __value__(D03) = (__value__(M11) * __value__(M22))
      __value__(F) = (__value__(D03) + __value__(D12))
      __value__(LOC1) = (A *(1.0D00 / __value__(G)))
      __value__(OBJ(1)) = (__value__(F) * __value__(LOC1))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      A = 5.0D-01
      SQRT3 = 5.77350258827209472656D-01
      __value__(MATR(0)) = (__value__(X(2)) - __value__(X(1)))
      OpenAD_Symbol_0 = 1_w2f__i8
      OpenAD_Symbol_1 = (-1_w2f__i8)
      OpenAD_Symbol_2 = (__value__(X(3)) * 2.0D00 - __value__(X(2)) -
     >  __value__(X(1)))
      __value__(MATR(1)) = (SQRT3 * OpenAD_Symbol_2)
      OpenAD_Symbol_9 = 2.0D00
      OpenAD_Symbol_7 = 1_w2f__i8
      OpenAD_Symbol_8 = (-1_w2f__i8)
      OpenAD_Symbol_5 = 1_w2f__i8
      OpenAD_Symbol_6 = (-1_w2f__i8)
      OpenAD_Symbol_4 = SQRT3
      OpenAD_Symbol_49 = (INT((-1_w2f__i8)) * OpenAD_Symbol_4)
      OpenAD_Symbol_50 = (INT((-1_w2f__i8)) * OpenAD_Symbol_4)
      OpenAD_Symbol_51 = (2.0D00 * OpenAD_Symbol_4)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_49)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_50)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_51)
      __value__(MATR(2)) = (__value__(X(5)) - __value__(X(4)))
      OpenAD_Symbol_11 = 1_w2f__i8
      OpenAD_Symbol_12 = (-1_w2f__i8)
      OpenAD_Symbol_13 = (__value__(X(6)) * 2.0D00 - __value__(X(5)) -
     >  __value__(X(4)))
      __value__(MATR(3)) = (SQRT3 * OpenAD_Symbol_13)
      OpenAD_Symbol_20 = 2.0D00
      OpenAD_Symbol_18 = 1_w2f__i8
      OpenAD_Symbol_19 = (-1_w2f__i8)
      OpenAD_Symbol_16 = 1_w2f__i8
      OpenAD_Symbol_17 = (-1_w2f__i8)
      OpenAD_Symbol_15 = SQRT3
      OpenAD_Symbol_52 = (INT((-1_w2f__i8)) * OpenAD_Symbol_15)
      OpenAD_Symbol_53 = (INT((-1_w2f__i8)) * OpenAD_Symbol_15)
      OpenAD_Symbol_54 = (2.0D00 * OpenAD_Symbol_15)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_52)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_53)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_54)
      __value__(M03) = (__value__(MATR(0)) * __value__(MATR(3)))
      OpenAD_Symbol_22 = __value__(MATR(3))
      OpenAD_Symbol_23 = __value__(MATR(0))
      __value__(M12) = (__value__(MATR(1)) * __value__(MATR(2)))
      OpenAD_Symbol_24 = __value__(MATR(2))
      OpenAD_Symbol_25 = __value__(MATR(1))
      __value__(G) = (__value__(M03) - __value__(M12))
      OpenAD_Symbol_26 = 1_w2f__i8
      OpenAD_Symbol_27 = (-1_w2f__i8)
      D00 = (__value__(M03) * 2.0D00)
      D11 = (__value__(M12) * 2.0D00)
      __value__(M00) = (__value__(MATR(0)) * __value__(MATR(0)))
      OpenAD_Symbol_28 = __value__(MATR(0))
      OpenAD_Symbol_29 = __value__(MATR(0))
      __value__(M11) = (__value__(MATR(1)) * __value__(MATR(1)))
      OpenAD_Symbol_30 = __value__(MATR(1))
      OpenAD_Symbol_31 = __value__(MATR(1))
      __value__(M22) = (__value__(MATR(2)) * __value__(MATR(2)))
      OpenAD_Symbol_32 = __value__(MATR(2))
      OpenAD_Symbol_33 = __value__(MATR(2))
      __value__(M33) = (__value__(MATR(3)) * __value__(MATR(3)))
      OpenAD_Symbol_34 = __value__(MATR(3))
      OpenAD_Symbol_35 = __value__(MATR(3))
      __value__(D12) = (__value__(M00) * __value__(M33))
      OpenAD_Symbol_36 = __value__(M33)
      OpenAD_Symbol_37 = __value__(M00)
      __value__(D03) = (__value__(M11) * __value__(M22))
      OpenAD_Symbol_38 = __value__(M22)
      OpenAD_Symbol_39 = __value__(M11)
      __value__(F) = (__value__(D03) + __value__(D12))
      OpenAD_Symbol_40 = 1_w2f__i8
      OpenAD_Symbol_41 = 1_w2f__i8
      OpenAD_Symbol_42 = (1.0D00 / __value__(G))
      __value__(LOC1) = (A * OpenAD_Symbol_42)
      OpenAD_Symbol_46 = (-(1.0D00 /(__value__(G) * __value__(G))))
      OpenAD_Symbol_44 = A
      __value__(OBJ(1)) = (__value__(F) * __value__(LOC1))
      OpenAD_Symbol_47 = __value__(LOC1)
      OpenAD_Symbol_48 = __value__(F)
      OpenAD_Symbol_55 = (OpenAD_Symbol_38 * OpenAD_Symbol_47)
      OpenAD_Symbol_56 = (OpenAD_Symbol_30 * OpenAD_Symbol_55)
      OpenAD_Symbol_57 = (OpenAD_Symbol_46 * OpenAD_Symbol_44 *
     >  OpenAD_Symbol_48)
      OpenAD_Symbol_58 = (OpenAD_Symbol_22 * OpenAD_Symbol_57)
      OpenAD_Symbol_59 = (OpenAD_Symbol_23 * OpenAD_Symbol_57)
      OpenAD_Symbol_60 = (OpenAD_Symbol_36 * OpenAD_Symbol_47)
      OpenAD_Symbol_61 = (OpenAD_Symbol_28 * OpenAD_Symbol_60)
      OpenAD_Symbol_62 = (OpenAD_Symbol_39 * OpenAD_Symbol_47)
      OpenAD_Symbol_63 = (OpenAD_Symbol_32 * OpenAD_Symbol_62)
      OpenAD_Symbol_64 = (OpenAD_Symbol_37 * OpenAD_Symbol_47)
      OpenAD_Symbol_65 = (OpenAD_Symbol_34 * OpenAD_Symbol_64)
      OpenAD_Symbol_66 = (OpenAD_Symbol_35 * OpenAD_Symbol_64)
      OpenAD_Symbol_67 = (OpenAD_Symbol_33 * OpenAD_Symbol_62)
      OpenAD_Symbol_68 = (OpenAD_Symbol_31 * OpenAD_Symbol_55)
      OpenAD_Symbol_69 = (OpenAD_Symbol_29 * OpenAD_Symbol_60)
      OpenAD_Symbol_70 = (INT((-1_w2f__i8)) * OpenAD_Symbol_57)
      OpenAD_Symbol_71 = (OpenAD_Symbol_24 * OpenAD_Symbol_70)
      OpenAD_Symbol_72 = (OpenAD_Symbol_25 * OpenAD_Symbol_70)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_22)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_23)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_24)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_25)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_56)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_58)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_59)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_61)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_63)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_65)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_66)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_67)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_68)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_69)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_71)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_72)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_73)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_73, __deriv__(OBJ(1)), __deriv__(MATR(2)
     > ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_74)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_74, __deriv__(OBJ(1)), __deriv__(MATR(1)
     > ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_75)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_75, __deriv__(OBJ(1)), __deriv__(MATR(0)
     > ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_76)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_76, __deriv__(OBJ(1)), __deriv__(MATR(1)
     > ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_77)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_77, __deriv__(OBJ(1)), __deriv__(MATR(2)
     > ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_78)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_78, __deriv__(OBJ(1)), __deriv__(MATR(3)
     > ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_79)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_79, __deriv__(OBJ(1)), __deriv__(MATR(3)
     > ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_80)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_80, __deriv__(OBJ(1)), __deriv__(MATR(2)
     > ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_81)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_81, __deriv__(OBJ(1)), __deriv__(MATR(0)
     > ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_82)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_82, __deriv__(OBJ(1)), __deriv__(MATR(3)
     > ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_83)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_83, __deriv__(OBJ(1)), __deriv__(MATR(0)
     > ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_84)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_84, __deriv__(OBJ(1)), __deriv__(MATR(1)
     > ))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OBJ(1)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_85)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_85, __deriv__(M12), __deriv__(MATR(2)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_86)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_86, __deriv__(M12), __deriv__(MATR(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M12))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_87)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_87, __deriv__(M03), __deriv__(MATR(3)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_88)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_88, __deriv__(M03), __deriv__(MATR(0)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M03))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_89)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_89, __deriv__(MATR(3)), __deriv__(X(6)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_90)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_90, __deriv__(MATR(3)), __deriv__(X(5)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_91)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_91, __deriv__(MATR(3)), __deriv__(X(4)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR(3)))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(-1_w2f__i8, __deriv__(MATR(2)), __deriv__(X(4)))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(MATR(2)), __deriv__(X(5)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR(2)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_92)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_92, __deriv__(MATR(1)), __deriv__(X(3)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_93)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_93, __deriv__(MATR(1)), __deriv__(X(2)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_94)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_94, __deriv__(MATR(1)), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR(1)))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(-1_w2f__i8, __deriv__(MATR(0)), __deriv__(X(1)))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(MATR(0)), __deriv__(X(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR(0)))
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
      A = 5.0D-01
      SQRT3 = 5.77350258827209472656D-01
      __value__(MATR(0)) = (__value__(X(2)) - __value__(X(1)))
      OpenAD_Symbol_0 = 1_w2f__i8
      OpenAD_Symbol_1 = (-1_w2f__i8)
      OpenAD_Symbol_2 = (__value__(X(3)) * 2.0D00 - __value__(X(2)) -
     >  __value__(X(1)))
      __value__(MATR(1)) = (SQRT3 * OpenAD_Symbol_2)
      OpenAD_Symbol_9 = 2.0D00
      OpenAD_Symbol_7 = 1_w2f__i8
      OpenAD_Symbol_8 = (-1_w2f__i8)
      OpenAD_Symbol_5 = 1_w2f__i8
      OpenAD_Symbol_6 = (-1_w2f__i8)
      OpenAD_Symbol_4 = SQRT3
      OpenAD_Symbol_49 = (INT((-1_w2f__i8)) * OpenAD_Symbol_4)
      OpenAD_Symbol_50 = (INT((-1_w2f__i8)) * OpenAD_Symbol_4)
      OpenAD_Symbol_51 = (2.0D00 * OpenAD_Symbol_4)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_49)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_50)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_51)
      __value__(MATR(2)) = (__value__(X(5)) - __value__(X(4)))
      OpenAD_Symbol_11 = 1_w2f__i8
      OpenAD_Symbol_12 = (-1_w2f__i8)
      OpenAD_Symbol_13 = (__value__(X(6)) * 2.0D00 - __value__(X(5)) -
     >  __value__(X(4)))
      __value__(MATR(3)) = (SQRT3 * OpenAD_Symbol_13)
      OpenAD_Symbol_20 = 2.0D00
      OpenAD_Symbol_18 = 1_w2f__i8
      OpenAD_Symbol_19 = (-1_w2f__i8)
      OpenAD_Symbol_16 = 1_w2f__i8
      OpenAD_Symbol_17 = (-1_w2f__i8)
      OpenAD_Symbol_15 = SQRT3
      OpenAD_Symbol_52 = (INT((-1_w2f__i8)) * OpenAD_Symbol_15)
      OpenAD_Symbol_53 = (INT((-1_w2f__i8)) * OpenAD_Symbol_15)
      OpenAD_Symbol_54 = (2.0D00 * OpenAD_Symbol_15)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_52)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_53)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_54)
      __value__(M03) = (__value__(MATR(0)) * __value__(MATR(3)))
      OpenAD_Symbol_22 = __value__(MATR(3))
      OpenAD_Symbol_23 = __value__(MATR(0))
      __value__(M12) = (__value__(MATR(1)) * __value__(MATR(2)))
      OpenAD_Symbol_24 = __value__(MATR(2))
      OpenAD_Symbol_25 = __value__(MATR(1))
      __value__(G) = (__value__(M03) - __value__(M12))
      OpenAD_Symbol_26 = 1_w2f__i8
      OpenAD_Symbol_27 = (-1_w2f__i8)
      D00 = (__value__(M03) * 2.0D00)
      D11 = (__value__(M12) * 2.0D00)
      __value__(M00) = (__value__(MATR(0)) * __value__(MATR(0)))
      OpenAD_Symbol_28 = __value__(MATR(0))
      OpenAD_Symbol_29 = __value__(MATR(0))
      __value__(M11) = (__value__(MATR(1)) * __value__(MATR(1)))
      OpenAD_Symbol_30 = __value__(MATR(1))
      OpenAD_Symbol_31 = __value__(MATR(1))
      __value__(M22) = (__value__(MATR(2)) * __value__(MATR(2)))
      OpenAD_Symbol_32 = __value__(MATR(2))
      OpenAD_Symbol_33 = __value__(MATR(2))
      __value__(M33) = (__value__(MATR(3)) * __value__(MATR(3)))
      OpenAD_Symbol_34 = __value__(MATR(3))
      OpenAD_Symbol_35 = __value__(MATR(3))
      __value__(D12) = (__value__(M00) * __value__(M33))
      OpenAD_Symbol_36 = __value__(M33)
      OpenAD_Symbol_37 = __value__(M00)
      __value__(D03) = (__value__(M11) * __value__(M22))
      OpenAD_Symbol_38 = __value__(M22)
      OpenAD_Symbol_39 = __value__(M11)
      __value__(F) = (__value__(D03) + __value__(D12))
      OpenAD_Symbol_40 = 1_w2f__i8
      OpenAD_Symbol_41 = 1_w2f__i8
      OpenAD_Symbol_42 = (1.0D00 / __value__(G))
      __value__(LOC1) = (A * OpenAD_Symbol_42)
      OpenAD_Symbol_46 = (-(1.0D00 /(__value__(G) * __value__(G))))
      OpenAD_Symbol_44 = A
      __value__(OBJ(1)) = (__value__(F) * __value__(LOC1))
      OpenAD_Symbol_47 = __value__(LOC1)
      OpenAD_Symbol_48 = __value__(F)
      OpenAD_Symbol_55 = (OpenAD_Symbol_38 * OpenAD_Symbol_47)
      OpenAD_Symbol_56 = (OpenAD_Symbol_30 * OpenAD_Symbol_55)
      OpenAD_Symbol_57 = (OpenAD_Symbol_46 * OpenAD_Symbol_44 *
     >  OpenAD_Symbol_48)
      OpenAD_Symbol_58 = (OpenAD_Symbol_22 * OpenAD_Symbol_57)
      OpenAD_Symbol_59 = (OpenAD_Symbol_23 * OpenAD_Symbol_57)
      OpenAD_Symbol_60 = (OpenAD_Symbol_36 * OpenAD_Symbol_47)
      OpenAD_Symbol_61 = (OpenAD_Symbol_28 * OpenAD_Symbol_60)
      OpenAD_Symbol_62 = (OpenAD_Symbol_39 * OpenAD_Symbol_47)
      OpenAD_Symbol_63 = (OpenAD_Symbol_32 * OpenAD_Symbol_62)
      OpenAD_Symbol_64 = (OpenAD_Symbol_37 * OpenAD_Symbol_47)
      OpenAD_Symbol_65 = (OpenAD_Symbol_34 * OpenAD_Symbol_64)
      OpenAD_Symbol_66 = (OpenAD_Symbol_35 * OpenAD_Symbol_64)
      OpenAD_Symbol_67 = (OpenAD_Symbol_33 * OpenAD_Symbol_62)
      OpenAD_Symbol_68 = (OpenAD_Symbol_31 * OpenAD_Symbol_55)
      OpenAD_Symbol_69 = (OpenAD_Symbol_29 * OpenAD_Symbol_60)
      OpenAD_Symbol_70 = (INT((-1_w2f__i8)) * OpenAD_Symbol_57)
      OpenAD_Symbol_71 = (OpenAD_Symbol_24 * OpenAD_Symbol_70)
      OpenAD_Symbol_72 = (OpenAD_Symbol_25 * OpenAD_Symbol_70)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_22)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_23)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_24)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_25)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_56)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_58)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_59)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_61)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_63)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_65)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_66)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_67)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_68)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_69)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_71)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_72)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_73)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_73, __deriv__(OBJ(1)), __deriv__(MATR(2)
     > ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_74)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_74, __deriv__(OBJ(1)), __deriv__(MATR(1)
     > ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_75)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_75, __deriv__(OBJ(1)), __deriv__(MATR(0)
     > ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_76)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_76, __deriv__(OBJ(1)), __deriv__(MATR(1)
     > ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_77)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_77, __deriv__(OBJ(1)), __deriv__(MATR(2)
     > ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_78)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_78, __deriv__(OBJ(1)), __deriv__(MATR(3)
     > ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_79)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_79, __deriv__(OBJ(1)), __deriv__(MATR(3)
     > ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_80)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_80, __deriv__(OBJ(1)), __deriv__(MATR(2)
     > ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_81)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_81, __deriv__(OBJ(1)), __deriv__(MATR(0)
     > ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_82)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_82, __deriv__(OBJ(1)), __deriv__(MATR(3)
     > ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_83)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_83, __deriv__(OBJ(1)), __deriv__(MATR(0)
     > ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_84)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_84, __deriv__(OBJ(1)), __deriv__(MATR(1)
     > ))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OBJ(1)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_85)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_85, __deriv__(M12), __deriv__(MATR(2)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_86)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_86, __deriv__(M12), __deriv__(MATR(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M12))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_87)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_87, __deriv__(M03), __deriv__(MATR(3)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_88)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_88, __deriv__(M03), __deriv__(MATR(0)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M03))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_89)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_89, __deriv__(MATR(3)), __deriv__(X(6)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_90)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_90, __deriv__(MATR(3)), __deriv__(X(5)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_91)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_91, __deriv__(MATR(3)), __deriv__(X(4)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR(3)))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(-1_w2f__i8, __deriv__(MATR(2)), __deriv__(X(4)))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(MATR(2)), __deriv__(X(5)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR(2)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_92)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_92, __deriv__(MATR(1)), __deriv__(X(3)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_93)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_93, __deriv__(MATR(1)), __deriv__(X(2)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_94)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_94, __deriv__(MATR(1)), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR(1)))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(-1_w2f__i8, __deriv__(MATR(0)), __deriv__(X(1)))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(MATR(0)), __deriv__(X(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR(0)))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
