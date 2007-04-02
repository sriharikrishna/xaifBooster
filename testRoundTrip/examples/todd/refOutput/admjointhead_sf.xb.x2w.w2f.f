C ***********************************************************
C Fortran file translated from WHIRL Mon Apr  2 14:02:52 2007
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

      SUBROUTINE head(X, OBJ)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      TYPE (OpenADTy_active) OpenAD_Symbol_100
      REAL(w2f__8) OpenAD_Symbol_101
      TYPE (OpenADTy_active) OpenAD_Symbol_102
      REAL(w2f__8) OpenAD_Symbol_103
      TYPE (OpenADTy_active) OpenAD_Symbol_104
      REAL(w2f__8) OpenAD_Symbol_105
      TYPE (OpenADTy_active) OpenAD_Symbol_106
      REAL(w2f__8) OpenAD_Symbol_107
      REAL(w2f__8) OpenAD_Symbol_108
      REAL(w2f__8) OpenAD_Symbol_109
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_110
      REAL(w2f__8) OpenAD_Symbol_111
      TYPE (OpenADTy_active) OpenAD_Symbol_112
      REAL(w2f__8) OpenAD_Symbol_113
      TYPE (OpenADTy_active) OpenAD_Symbol_114
      REAL(w2f__8) OpenAD_Symbol_115
      TYPE (OpenADTy_active) OpenAD_Symbol_116
      REAL(w2f__8) OpenAD_Symbol_117
      TYPE (OpenADTy_active) OpenAD_Symbol_118
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_21
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
      REAL(w2f__8) OpenAD_Symbol_43
      REAL(w2f__8) OpenAD_Symbol_44
      REAL(w2f__8) OpenAD_Symbol_45
      REAL(w2f__8) OpenAD_Symbol_46
      REAL(w2f__8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_50
      REAL(w2f__8) OpenAD_Symbol_51
      REAL(w2f__8) OpenAD_Symbol_52
      REAL(w2f__8) OpenAD_Symbol_54
      REAL(w2f__8) OpenAD_Symbol_56
      REAL(w2f__8) OpenAD_Symbol_57
      REAL(w2f__8) OpenAD_Symbol_58
      REAL(w2f__8) OpenAD_Symbol_59
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_60
      REAL(w2f__8) OpenAD_Symbol_61
      REAL(w2f__8) OpenAD_Symbol_62
      TYPE (OpenADTy_active) OpenAD_Symbol_63
      REAL(w2f__8) OpenAD_Symbol_64
      REAL(w2f__8) OpenAD_Symbol_65
      TYPE (OpenADTy_active) OpenAD_Symbol_66
      REAL(w2f__8) OpenAD_Symbol_67
      REAL(w2f__8) OpenAD_Symbol_68
      TYPE (OpenADTy_active) OpenAD_Symbol_69
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_70
      REAL(w2f__8) OpenAD_Symbol_71
      TYPE (OpenADTy_active) OpenAD_Symbol_72
      REAL(w2f__8) OpenAD_Symbol_73
      TYPE (OpenADTy_active) OpenAD_Symbol_74
      REAL(w2f__8) OpenAD_Symbol_75
      TYPE (OpenADTy_active) OpenAD_Symbol_76
      REAL(w2f__8) OpenAD_Symbol_77
      TYPE (OpenADTy_active) OpenAD_Symbol_78
      REAL(w2f__8) OpenAD_Symbol_79
      REAL(w2f__8) OpenAD_Symbol_8
      TYPE (OpenADTy_active) OpenAD_Symbol_80
      REAL(w2f__8) OpenAD_Symbol_81
      TYPE (OpenADTy_active) OpenAD_Symbol_82
      REAL(w2f__8) OpenAD_Symbol_83
      TYPE (OpenADTy_active) OpenAD_Symbol_84
      REAL(w2f__8) OpenAD_Symbol_85
      REAL(w2f__8) OpenAD_Symbol_86
      REAL(w2f__8) OpenAD_Symbol_87
      REAL(w2f__8) OpenAD_Symbol_88
      REAL(w2f__8) OpenAD_Symbol_89
      REAL(w2f__8) OpenAD_Symbol_9
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_91
      TYPE (OpenADTy_active) OpenAD_Symbol_92
      REAL(w2f__8) OpenAD_Symbol_93
      TYPE (OpenADTy_active) OpenAD_Symbol_94
      REAL(w2f__8) OpenAD_Symbol_95
      TYPE (OpenADTy_active) OpenAD_Symbol_96
      REAL(w2f__8) OpenAD_Symbol_97
      TYPE (OpenADTy_active) OpenAD_Symbol_98
      REAL(w2f__8) OpenAD_Symbol_99
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
      REAL(w2f__8) OpenAD_Symbol_119
      REAL(w2f__8) OpenAD_Symbol_120
      REAL(w2f__8) OpenAD_Symbol_121
      REAL(w2f__8) OpenAD_Symbol_122
      REAL(w2f__8) OpenAD_Symbol_123
      REAL(w2f__8) OpenAD_Symbol_124
      REAL(w2f__8) OpenAD_Symbol_125
      REAL(w2f__8) OpenAD_Symbol_126
      REAL(w2f__8) OpenAD_Symbol_127
      REAL(w2f__8) OpenAD_Symbol_128
      REAL(w2f__8) OpenAD_Symbol_129
      REAL(w2f__8) OpenAD_Symbol_130
      REAL(w2f__8) OpenAD_Symbol_131
      REAL(w2f__8) OpenAD_Symbol_132
      REAL(w2f__8) OpenAD_Symbol_133
      REAL(w2f__8) OpenAD_Symbol_134
      REAL(w2f__8) OpenAD_Symbol_135
      REAL(w2f__8) OpenAD_Symbol_136
      REAL(w2f__8) OpenAD_Symbol_137
      REAL(w2f__8) OpenAD_Symbol_138
      REAL(w2f__8) OpenAD_Symbol_139
      REAL(w2f__8) OpenAD_Symbol_140
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
      RETURN
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
      OpenAD_Symbol_11 = (SQRT3 * OpenAD_Symbol_2)
      OpenAD_Symbol_9 = 2.0D00
      OpenAD_Symbol_7 = 1_w2f__i8
      OpenAD_Symbol_8 = (-1_w2f__i8)
      OpenAD_Symbol_5 = 1_w2f__i8
      OpenAD_Symbol_6 = (-1_w2f__i8)
      OpenAD_Symbol_4 = SQRT3
      __value__(MATR(1)) = OpenAD_Symbol_11
      __value__(MATR(2)) = (__value__(X(5)) - __value__(X(4)))
      OpenAD_Symbol_12 = 1_w2f__i8
      OpenAD_Symbol_13 = (-1_w2f__i8)
      OpenAD_Symbol_14 = (__value__(X(6)) * 2.0D00 - __value__(X(5)) -
     >  __value__(X(4)))
      OpenAD_Symbol_23 = (SQRT3 * OpenAD_Symbol_14)
      OpenAD_Symbol_21 = 2.0D00
      OpenAD_Symbol_19 = 1_w2f__i8
      OpenAD_Symbol_20 = (-1_w2f__i8)
      OpenAD_Symbol_17 = 1_w2f__i8
      OpenAD_Symbol_18 = (-1_w2f__i8)
      OpenAD_Symbol_16 = SQRT3
      __value__(MATR(3)) = OpenAD_Symbol_23
      OpenAD_Symbol_61 = (OpenAD_Symbol_17 * OpenAD_Symbol_16)
      OpenAD_Symbol_62 = (OpenAD_Symbol_18 * OpenAD_Symbol_16)
      OpenAD_Symbol_64 = (OpenAD_Symbol_5 * OpenAD_Symbol_4)
      OpenAD_Symbol_65 = (OpenAD_Symbol_6 * OpenAD_Symbol_4)
      OpenAD_Symbol_67 = (OpenAD_Symbol_19 * OpenAD_Symbol_61)
      OpenAD_Symbol_68 = (OpenAD_Symbol_20 * OpenAD_Symbol_61)
      OpenAD_Symbol_70 = (OpenAD_Symbol_7 * OpenAD_Symbol_64)
      OpenAD_Symbol_71 = (OpenAD_Symbol_8 * OpenAD_Symbol_64)
      OpenAD_Symbol_73 = (OpenAD_Symbol_21 * OpenAD_Symbol_67)
      OpenAD_Symbol_75 = (OpenAD_Symbol_9 * OpenAD_Symbol_70)
      OpenAD_Symbol_77 = OpenAD_Symbol_0
      OpenAD_Symbol_79 = OpenAD_Symbol_1
      OpenAD_Symbol_81 = OpenAD_Symbol_12
      OpenAD_Symbol_83 = OpenAD_Symbol_13
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_62)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_65)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_68)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_71)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_73)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_75)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_77)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_79)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_81)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_83)
      OpenAD_Symbol_26 = (__value__(MATR(0)) * __value__(MATR(3)))
      OpenAD_Symbol_24 = __value__(MATR(3))
      OpenAD_Symbol_25 = __value__(MATR(0))
      __value__(M03) = OpenAD_Symbol_26
      OpenAD_Symbol_29 = (__value__(MATR(1)) * __value__(MATR(2)))
      OpenAD_Symbol_27 = __value__(MATR(2))
      OpenAD_Symbol_28 = __value__(MATR(1))
      __value__(M12) = OpenAD_Symbol_29
      __value__(G) = (__value__(M03) - __value__(M12))
      OpenAD_Symbol_30 = 1_w2f__i8
      OpenAD_Symbol_31 = (-1_w2f__i8)
      D00 = (__value__(M03) * 2.0D00)
      D11 = (__value__(M12) * 2.0D00)
      OpenAD_Symbol_34 = (__value__(MATR(0)) * __value__(MATR(0)))
      OpenAD_Symbol_32 = __value__(MATR(0))
      OpenAD_Symbol_33 = __value__(MATR(0))
      __value__(M00) = OpenAD_Symbol_34
      OpenAD_Symbol_37 = (__value__(MATR(1)) * __value__(MATR(1)))
      OpenAD_Symbol_35 = __value__(MATR(1))
      OpenAD_Symbol_36 = __value__(MATR(1))
      __value__(M11) = OpenAD_Symbol_37
      OpenAD_Symbol_40 = (__value__(MATR(2)) * __value__(MATR(2)))
      OpenAD_Symbol_38 = __value__(MATR(2))
      OpenAD_Symbol_39 = __value__(MATR(2))
      __value__(M22) = OpenAD_Symbol_40
      OpenAD_Symbol_43 = (__value__(MATR(3)) * __value__(MATR(3)))
      OpenAD_Symbol_41 = __value__(MATR(3))
      OpenAD_Symbol_42 = __value__(MATR(3))
      __value__(M33) = OpenAD_Symbol_43
      OpenAD_Symbol_46 = (__value__(M00) * __value__(M33))
      OpenAD_Symbol_44 = __value__(M33)
      OpenAD_Symbol_45 = __value__(M00)
      __value__(D12) = OpenAD_Symbol_46
      OpenAD_Symbol_49 = (__value__(M11) * __value__(M22))
      OpenAD_Symbol_47 = __value__(M22)
      OpenAD_Symbol_48 = __value__(M11)
      __value__(D03) = OpenAD_Symbol_49
      __value__(F) = (__value__(D03) + __value__(D12))
      OpenAD_Symbol_50 = 1_w2f__i8
      OpenAD_Symbol_51 = 1_w2f__i8
      OpenAD_Symbol_52 = (1.0D00 / __value__(G))
      OpenAD_Symbol_57 = (A * OpenAD_Symbol_52)
      OpenAD_Symbol_56 = (-(1.0D00 /(__value__(G) * __value__(G))))
      OpenAD_Symbol_54 = A
      __value__(LOC1) = OpenAD_Symbol_57
      OpenAD_Symbol_60 = (__value__(F) * __value__(LOC1))
      OpenAD_Symbol_58 = __value__(LOC1)
      OpenAD_Symbol_59 = __value__(F)
      __value__(OBJ(1)) = OpenAD_Symbol_60
      OpenAD_Symbol_85 = (OpenAD_Symbol_50 * OpenAD_Symbol_58)
      OpenAD_Symbol_86 = (OpenAD_Symbol_51 * OpenAD_Symbol_58)
      OpenAD_Symbol_87 = (OpenAD_Symbol_47 * OpenAD_Symbol_85)
      OpenAD_Symbol_88 = (OpenAD_Symbol_48 * OpenAD_Symbol_85)
      OpenAD_Symbol_89 = (OpenAD_Symbol_44 * OpenAD_Symbol_86)
      OpenAD_Symbol_90 = (OpenAD_Symbol_45 * OpenAD_Symbol_86)
      OpenAD_Symbol_91 = (OpenAD_Symbol_41 * OpenAD_Symbol_90)
      OpenAD_Symbol_93 = (OpenAD_Symbol_42 * OpenAD_Symbol_90)
      OpenAD_Symbol_95 = (OpenAD_Symbol_38 * OpenAD_Symbol_88)
      OpenAD_Symbol_97 = (OpenAD_Symbol_39 * OpenAD_Symbol_88)
      OpenAD_Symbol_99 = (OpenAD_Symbol_35 * OpenAD_Symbol_87)
      OpenAD_Symbol_101 = (OpenAD_Symbol_36 * OpenAD_Symbol_87)
      OpenAD_Symbol_103 = (OpenAD_Symbol_32 * OpenAD_Symbol_89)
      OpenAD_Symbol_105 = (OpenAD_Symbol_33 * OpenAD_Symbol_89)
      OpenAD_Symbol_107 = (OpenAD_Symbol_54 * OpenAD_Symbol_59)
      OpenAD_Symbol_108 = (OpenAD_Symbol_56 * OpenAD_Symbol_107)
      OpenAD_Symbol_109 = (OpenAD_Symbol_30 * OpenAD_Symbol_108)
      OpenAD_Symbol_110 = (OpenAD_Symbol_31 * OpenAD_Symbol_108)
      OpenAD_Symbol_111 = (OpenAD_Symbol_27 * OpenAD_Symbol_110)
      OpenAD_Symbol_113 = (OpenAD_Symbol_28 * OpenAD_Symbol_110)
      OpenAD_Symbol_115 = (OpenAD_Symbol_24 * OpenAD_Symbol_109)
      OpenAD_Symbol_117 = (OpenAD_Symbol_25 * OpenAD_Symbol_109)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_91)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_93)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_95)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_97)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_99)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_101)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_103)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_105)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_111)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_113)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_115)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_117)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_119)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_119, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_118))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_120)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_120, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_116))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_121)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_121, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_114))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_122)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_122, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_112))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_123)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_123, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_106))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_124)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_124, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_104))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_125)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_125, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_102))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_126)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_126, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_100))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_127)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_127, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_98))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_128)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_128, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_96))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_129)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_129, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_94))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_130)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_130, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_92))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OBJ(1)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_92), __deriv__(MATR(3)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_92))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_94), __deriv__(MATR(3)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_94))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_96), __deriv__(MATR(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_96))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_98), __deriv__(MATR(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_98))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_100), __deriv__(MATR(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_100))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_102), __deriv__(MATR(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_102))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_104), __deriv__(MATR(0)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_104))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_106), __deriv__(MATR(0)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_106))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_112), __deriv__(MATR(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_112))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_114), __deriv__(MATR(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_114))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_116), __deriv__(MATR(0)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_116))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_118), __deriv__(MATR(3)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_118))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_131)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_131, __deriv__(MATR(2)), __deriv__(
     > OpenAD_Symbol_84))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_132)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_132, __deriv__(MATR(2)), __deriv__(
     > OpenAD_Symbol_82))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR(2)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_133)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_133, __deriv__(MATR(0)), __deriv__(
     > OpenAD_Symbol_80))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_134)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_134, __deriv__(MATR(0)), __deriv__(
     > OpenAD_Symbol_78))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR(0)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_135)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_135, __deriv__(MATR(1)), __deriv__(
     > OpenAD_Symbol_76))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_136)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_136, __deriv__(MATR(3)), __deriv__(
     > OpenAD_Symbol_74))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_137)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_137, __deriv__(MATR(1)), __deriv__(
     > OpenAD_Symbol_72))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_138)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_138, __deriv__(MATR(3)), __deriv__(
     > OpenAD_Symbol_69))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_139)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_139, __deriv__(MATR(1)), __deriv__(
     > OpenAD_Symbol_66))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR(1)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_140)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_140, __deriv__(MATR(3)), __deriv__(
     > OpenAD_Symbol_63))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR(3)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_63), __deriv__(X(4)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_63))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_66), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_66))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_69), __deriv__(X(5)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_69))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_72), __deriv__(X(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_72))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_74), __deriv__(X(6)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_74))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_76), __deriv__(X(3)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_76))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_78), __deriv__(X(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_78))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_80), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_80))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_82), __deriv__(X(5)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_82))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_84), __deriv__(X(4)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_84))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(X))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(X))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(OBJ))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(X))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(OBJ))
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
      OpenAD_Symbol_11 = (SQRT3 * OpenAD_Symbol_2)
      OpenAD_Symbol_9 = 2.0D00
      OpenAD_Symbol_7 = 1_w2f__i8
      OpenAD_Symbol_8 = (-1_w2f__i8)
      OpenAD_Symbol_5 = 1_w2f__i8
      OpenAD_Symbol_6 = (-1_w2f__i8)
      OpenAD_Symbol_4 = SQRT3
      __value__(MATR(1)) = OpenAD_Symbol_11
      __value__(MATR(2)) = (__value__(X(5)) - __value__(X(4)))
      OpenAD_Symbol_12 = 1_w2f__i8
      OpenAD_Symbol_13 = (-1_w2f__i8)
      OpenAD_Symbol_14 = (__value__(X(6)) * 2.0D00 - __value__(X(5)) -
     >  __value__(X(4)))
      OpenAD_Symbol_23 = (SQRT3 * OpenAD_Symbol_14)
      OpenAD_Symbol_21 = 2.0D00
      OpenAD_Symbol_19 = 1_w2f__i8
      OpenAD_Symbol_20 = (-1_w2f__i8)
      OpenAD_Symbol_17 = 1_w2f__i8
      OpenAD_Symbol_18 = (-1_w2f__i8)
      OpenAD_Symbol_16 = SQRT3
      __value__(MATR(3)) = OpenAD_Symbol_23
      OpenAD_Symbol_61 = (OpenAD_Symbol_17 * OpenAD_Symbol_16)
      OpenAD_Symbol_62 = (OpenAD_Symbol_18 * OpenAD_Symbol_16)
      OpenAD_Symbol_64 = (OpenAD_Symbol_5 * OpenAD_Symbol_4)
      OpenAD_Symbol_65 = (OpenAD_Symbol_6 * OpenAD_Symbol_4)
      OpenAD_Symbol_67 = (OpenAD_Symbol_19 * OpenAD_Symbol_61)
      OpenAD_Symbol_68 = (OpenAD_Symbol_20 * OpenAD_Symbol_61)
      OpenAD_Symbol_70 = (OpenAD_Symbol_7 * OpenAD_Symbol_64)
      OpenAD_Symbol_71 = (OpenAD_Symbol_8 * OpenAD_Symbol_64)
      OpenAD_Symbol_73 = (OpenAD_Symbol_21 * OpenAD_Symbol_67)
      OpenAD_Symbol_75 = (OpenAD_Symbol_9 * OpenAD_Symbol_70)
      OpenAD_Symbol_77 = OpenAD_Symbol_0
      OpenAD_Symbol_79 = OpenAD_Symbol_1
      OpenAD_Symbol_81 = OpenAD_Symbol_12
      OpenAD_Symbol_83 = OpenAD_Symbol_13
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_62)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_65)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_68)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_71)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_73)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_75)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_77)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_79)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_81)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_83)
      OpenAD_Symbol_26 = (__value__(MATR(0)) * __value__(MATR(3)))
      OpenAD_Symbol_24 = __value__(MATR(3))
      OpenAD_Symbol_25 = __value__(MATR(0))
      __value__(M03) = OpenAD_Symbol_26
      OpenAD_Symbol_29 = (__value__(MATR(1)) * __value__(MATR(2)))
      OpenAD_Symbol_27 = __value__(MATR(2))
      OpenAD_Symbol_28 = __value__(MATR(1))
      __value__(M12) = OpenAD_Symbol_29
      __value__(G) = (__value__(M03) - __value__(M12))
      OpenAD_Symbol_30 = 1_w2f__i8
      OpenAD_Symbol_31 = (-1_w2f__i8)
      D00 = (__value__(M03) * 2.0D00)
      D11 = (__value__(M12) * 2.0D00)
      OpenAD_Symbol_34 = (__value__(MATR(0)) * __value__(MATR(0)))
      OpenAD_Symbol_32 = __value__(MATR(0))
      OpenAD_Symbol_33 = __value__(MATR(0))
      __value__(M00) = OpenAD_Symbol_34
      OpenAD_Symbol_37 = (__value__(MATR(1)) * __value__(MATR(1)))
      OpenAD_Symbol_35 = __value__(MATR(1))
      OpenAD_Symbol_36 = __value__(MATR(1))
      __value__(M11) = OpenAD_Symbol_37
      OpenAD_Symbol_40 = (__value__(MATR(2)) * __value__(MATR(2)))
      OpenAD_Symbol_38 = __value__(MATR(2))
      OpenAD_Symbol_39 = __value__(MATR(2))
      __value__(M22) = OpenAD_Symbol_40
      OpenAD_Symbol_43 = (__value__(MATR(3)) * __value__(MATR(3)))
      OpenAD_Symbol_41 = __value__(MATR(3))
      OpenAD_Symbol_42 = __value__(MATR(3))
      __value__(M33) = OpenAD_Symbol_43
      OpenAD_Symbol_46 = (__value__(M00) * __value__(M33))
      OpenAD_Symbol_44 = __value__(M33)
      OpenAD_Symbol_45 = __value__(M00)
      __value__(D12) = OpenAD_Symbol_46
      OpenAD_Symbol_49 = (__value__(M11) * __value__(M22))
      OpenAD_Symbol_47 = __value__(M22)
      OpenAD_Symbol_48 = __value__(M11)
      __value__(D03) = OpenAD_Symbol_49
      __value__(F) = (__value__(D03) + __value__(D12))
      OpenAD_Symbol_50 = 1_w2f__i8
      OpenAD_Symbol_51 = 1_w2f__i8
      OpenAD_Symbol_52 = (1.0D00 / __value__(G))
      OpenAD_Symbol_57 = (A * OpenAD_Symbol_52)
      OpenAD_Symbol_56 = (-(1.0D00 /(__value__(G) * __value__(G))))
      OpenAD_Symbol_54 = A
      __value__(LOC1) = OpenAD_Symbol_57
      OpenAD_Symbol_60 = (__value__(F) * __value__(LOC1))
      OpenAD_Symbol_58 = __value__(LOC1)
      OpenAD_Symbol_59 = __value__(F)
      __value__(OBJ(1)) = OpenAD_Symbol_60
      OpenAD_Symbol_85 = (OpenAD_Symbol_50 * OpenAD_Symbol_58)
      OpenAD_Symbol_86 = (OpenAD_Symbol_51 * OpenAD_Symbol_58)
      OpenAD_Symbol_87 = (OpenAD_Symbol_47 * OpenAD_Symbol_85)
      OpenAD_Symbol_88 = (OpenAD_Symbol_48 * OpenAD_Symbol_85)
      OpenAD_Symbol_89 = (OpenAD_Symbol_44 * OpenAD_Symbol_86)
      OpenAD_Symbol_90 = (OpenAD_Symbol_45 * OpenAD_Symbol_86)
      OpenAD_Symbol_91 = (OpenAD_Symbol_41 * OpenAD_Symbol_90)
      OpenAD_Symbol_93 = (OpenAD_Symbol_42 * OpenAD_Symbol_90)
      OpenAD_Symbol_95 = (OpenAD_Symbol_38 * OpenAD_Symbol_88)
      OpenAD_Symbol_97 = (OpenAD_Symbol_39 * OpenAD_Symbol_88)
      OpenAD_Symbol_99 = (OpenAD_Symbol_35 * OpenAD_Symbol_87)
      OpenAD_Symbol_101 = (OpenAD_Symbol_36 * OpenAD_Symbol_87)
      OpenAD_Symbol_103 = (OpenAD_Symbol_32 * OpenAD_Symbol_89)
      OpenAD_Symbol_105 = (OpenAD_Symbol_33 * OpenAD_Symbol_89)
      OpenAD_Symbol_107 = (OpenAD_Symbol_54 * OpenAD_Symbol_59)
      OpenAD_Symbol_108 = (OpenAD_Symbol_56 * OpenAD_Symbol_107)
      OpenAD_Symbol_109 = (OpenAD_Symbol_30 * OpenAD_Symbol_108)
      OpenAD_Symbol_110 = (OpenAD_Symbol_31 * OpenAD_Symbol_108)
      OpenAD_Symbol_111 = (OpenAD_Symbol_27 * OpenAD_Symbol_110)
      OpenAD_Symbol_113 = (OpenAD_Symbol_28 * OpenAD_Symbol_110)
      OpenAD_Symbol_115 = (OpenAD_Symbol_24 * OpenAD_Symbol_109)
      OpenAD_Symbol_117 = (OpenAD_Symbol_25 * OpenAD_Symbol_109)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_91)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_93)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_95)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_97)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_99)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_101)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_103)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_105)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_111)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_113)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_115)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_117)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_119)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_119, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_118))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_120)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_120, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_116))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_121)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_121, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_114))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_122)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_122, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_112))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_123)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_123, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_106))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_124)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_124, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_104))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_125)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_125, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_102))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_126)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_126, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_100))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_127)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_127, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_98))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_128)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_128, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_96))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_129)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_129, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_94))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_130)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_130, __deriv__(OBJ(1)), __deriv__(
     > OpenAD_Symbol_92))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OBJ(1)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_92), __deriv__(MATR(3)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_92))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_94), __deriv__(MATR(3)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_94))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_96), __deriv__(MATR(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_96))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_98), __deriv__(MATR(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_98))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_100), __deriv__(MATR(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_100))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_102), __deriv__(MATR(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_102))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_104), __deriv__(MATR(0)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_104))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_106), __deriv__(MATR(0)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_106))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_112), __deriv__(MATR(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_112))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_114), __deriv__(MATR(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_114))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_116), __deriv__(MATR(0)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_116))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_118), __deriv__(MATR(3)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_118))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_131)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_131, __deriv__(MATR(2)), __deriv__(
     > OpenAD_Symbol_84))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_132)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_132, __deriv__(MATR(2)), __deriv__(
     > OpenAD_Symbol_82))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR(2)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_133)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_133, __deriv__(MATR(0)), __deriv__(
     > OpenAD_Symbol_80))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_134)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_134, __deriv__(MATR(0)), __deriv__(
     > OpenAD_Symbol_78))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR(0)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_135)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_135, __deriv__(MATR(1)), __deriv__(
     > OpenAD_Symbol_76))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_136)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_136, __deriv__(MATR(3)), __deriv__(
     > OpenAD_Symbol_74))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_137)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_137, __deriv__(MATR(1)), __deriv__(
     > OpenAD_Symbol_72))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_138)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_138, __deriv__(MATR(3)), __deriv__(
     > OpenAD_Symbol_69))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_139)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_139, __deriv__(MATR(1)), __deriv__(
     > OpenAD_Symbol_66))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR(1)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_140)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_140, __deriv__(MATR(3)), __deriv__(
     > OpenAD_Symbol_63))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR(3)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_63), __deriv__(X(4)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_63))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_66), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_66))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_69), __deriv__(X(5)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_69))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_72), __deriv__(X(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_72))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_74), __deriv__(X(6)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_74))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_76), __deriv__(X(3)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_76))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_78), __deriv__(X(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_78))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_80), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_80))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_82), __deriv__(X(5)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_82))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_84), __deriv__(X(4)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_84))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
