C ***********************************************************
C Fortran file translated from WHIRL Fri Oct  5 00:15:15 2007
C ***********************************************************
C ***********************************************************

      MODULE all_globals_mod
      use w2f__types
      use active_module
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(X, OBJ)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_100
      REAL(w2f__8) OpenAD_Symbol_101
      type(active) :: OpenAD_Symbol_102
      REAL(w2f__8) OpenAD_Symbol_103
      REAL(w2f__8) OpenAD_Symbol_104
      type(active) :: OpenAD_Symbol_105
      REAL(w2f__8) OpenAD_Symbol_106
      type(active) :: OpenAD_Symbol_107
      REAL(w2f__8) OpenAD_Symbol_108
      type(active) :: OpenAD_Symbol_109
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_110
      type(active) :: OpenAD_Symbol_111
      REAL(w2f__8) OpenAD_Symbol_112
      type(active) :: OpenAD_Symbol_113
      REAL(w2f__8) OpenAD_Symbol_114
      REAL(w2f__8) OpenAD_Symbol_115
      type(active) :: OpenAD_Symbol_116
      REAL(w2f__8) OpenAD_Symbol_117
      type(active) :: OpenAD_Symbol_118
      REAL(w2f__8) OpenAD_Symbol_119
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_120
      REAL(w2f__8) OpenAD_Symbol_121
      REAL(w2f__8) OpenAD_Symbol_122
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
      type(active) :: OpenAD_Symbol_63
      REAL(w2f__8) OpenAD_Symbol_64
      REAL(w2f__8) OpenAD_Symbol_65
      type(active) :: OpenAD_Symbol_66
      REAL(w2f__8) OpenAD_Symbol_67
      REAL(w2f__8) OpenAD_Symbol_68
      type(active) :: OpenAD_Symbol_69
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_70
      REAL(w2f__8) OpenAD_Symbol_71
      type(active) :: OpenAD_Symbol_72
      REAL(w2f__8) OpenAD_Symbol_73
      type(active) :: OpenAD_Symbol_74
      REAL(w2f__8) OpenAD_Symbol_75
      type(active) :: OpenAD_Symbol_76
      REAL(w2f__8) OpenAD_Symbol_77
      type(active) :: OpenAD_Symbol_78
      REAL(w2f__8) OpenAD_Symbol_79
      REAL(w2f__8) OpenAD_Symbol_8
      type(active) :: OpenAD_Symbol_80
      REAL(w2f__8) OpenAD_Symbol_81
      type(active) :: OpenAD_Symbol_82
      REAL(w2f__8) OpenAD_Symbol_83
      type(active) :: OpenAD_Symbol_84
      REAL(w2f__8) OpenAD_Symbol_85
      REAL(w2f__8) OpenAD_Symbol_86
      REAL(w2f__8) OpenAD_Symbol_87
      type(active) :: OpenAD_Symbol_88
      REAL(w2f__8) OpenAD_Symbol_89
      REAL(w2f__8) OpenAD_Symbol_9
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_91
      REAL(w2f__8) OpenAD_Symbol_92
      type(active) :: OpenAD_Symbol_93
      REAL(w2f__8) OpenAD_Symbol_94
      type(active) :: OpenAD_Symbol_95
      REAL(w2f__8) OpenAD_Symbol_96
      REAL(w2f__8) OpenAD_Symbol_97
      REAL(w2f__8) OpenAD_Symbol_98
      type(active) :: OpenAD_Symbol_99
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 6)
      type(active) :: OBJ(1 : 1)
C
C     **** Local Variables and Functions ****
C
      REAL(w2f__8) A
      REAL(w2f__8) D00
      type(active) :: D03
      REAL(w2f__8) D11
      type(active) :: D12
      type(active) :: F
      type(active) :: G
      type(active) :: LOC1
      type(active) :: M00
      type(active) :: M03
      type(active) :: M11
      type(active) :: M12
      type(active) :: M22
      type(active) :: M33
      type(active) :: MATR(0 : 3)
      REAL(w2f__8) SQRT3
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(OBJ)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      A = 5.0D-01
      SQRT3 = 5.77350258827209472656D-01
      MATR(0)%v = (X(2)%v-X(1)%v)
      OpenAD_Symbol_0 = 1_w2f__i8
      OpenAD_Symbol_1 = (-1_w2f__i8)
      OpenAD_Symbol_2 = (X(3)%v*2.0D00-X(2)%v-X(1)%v)
      OpenAD_Symbol_11 = (SQRT3 * OpenAD_Symbol_2)
      OpenAD_Symbol_9 = 2.0D00
      OpenAD_Symbol_7 = 1_w2f__i8
      OpenAD_Symbol_8 = (-1_w2f__i8)
      OpenAD_Symbol_5 = 1_w2f__i8
      OpenAD_Symbol_6 = (-1_w2f__i8)
      OpenAD_Symbol_4 = SQRT3
      MATR(1)%v = OpenAD_Symbol_11
      MATR(2)%v = (X(5)%v-X(4)%v)
      OpenAD_Symbol_12 = 1_w2f__i8
      OpenAD_Symbol_13 = (-1_w2f__i8)
      OpenAD_Symbol_14 = (X(6)%v*2.0D00-X(5)%v-X(4)%v)
      OpenAD_Symbol_23 = (SQRT3 * OpenAD_Symbol_14)
      OpenAD_Symbol_21 = 2.0D00
      OpenAD_Symbol_19 = 1_w2f__i8
      OpenAD_Symbol_20 = (-1_w2f__i8)
      OpenAD_Symbol_17 = 1_w2f__i8
      OpenAD_Symbol_18 = (-1_w2f__i8)
      OpenAD_Symbol_16 = SQRT3
      MATR(3)%v = OpenAD_Symbol_23
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
      CALL setderiv(OpenAD_Symbol_84,X(4))
      CALL setderiv(OpenAD_Symbol_82,X(5))
      CALL setderiv(OpenAD_Symbol_80,X(1))
      CALL setderiv(OpenAD_Symbol_78,X(2))
      CALL setderiv(OpenAD_Symbol_76,X(3))
      CALL setderiv(OpenAD_Symbol_74,X(6))
      CALL setderiv(OpenAD_Symbol_72,X(2))
      CALL setderiv(OpenAD_Symbol_69,X(5))
      CALL setderiv(OpenAD_Symbol_66,X(1))
      CALL setderiv(OpenAD_Symbol_63,X(4))
      CALL sax(OpenAD_Symbol_62,OpenAD_Symbol_63,MATR(3))
      CALL sax(OpenAD_Symbol_65,OpenAD_Symbol_66,MATR(1))
      CALL saxpy(OpenAD_Symbol_68,OpenAD_Symbol_69,MATR(3))
      CALL saxpy(OpenAD_Symbol_71,OpenAD_Symbol_72,MATR(1))
      CALL saxpy(OpenAD_Symbol_73,OpenAD_Symbol_74,MATR(3))
      CALL saxpy(OpenAD_Symbol_75,OpenAD_Symbol_76,MATR(1))
      CALL sax(OpenAD_Symbol_77,OpenAD_Symbol_78,MATR(0))
      CALL saxpy(OpenAD_Symbol_79,OpenAD_Symbol_80,MATR(0))
      CALL sax(OpenAD_Symbol_81,OpenAD_Symbol_82,MATR(2))
      CALL saxpy(OpenAD_Symbol_83,OpenAD_Symbol_84,MATR(2))
      OpenAD_Symbol_26 = (MATR(0)%v*MATR(3)%v)
      OpenAD_Symbol_24 = MATR(3)%v
      OpenAD_Symbol_25 = MATR(0)%v
      M03%v = OpenAD_Symbol_26
      OpenAD_Symbol_29 = (MATR(1)%v*MATR(2)%v)
      OpenAD_Symbol_27 = MATR(2)%v
      OpenAD_Symbol_28 = MATR(1)%v
      M12%v = OpenAD_Symbol_29
      G%v = (M03%v-M12%v)
      OpenAD_Symbol_30 = 1_w2f__i8
      OpenAD_Symbol_31 = (-1_w2f__i8)
      D00 = (M03%v*2.0D00)
      D11 = (M12%v*2.0D00)
      OpenAD_Symbol_34 = (MATR(0)%v*MATR(0)%v)
      OpenAD_Symbol_32 = MATR(0)%v
      OpenAD_Symbol_33 = MATR(0)%v
      M00%v = OpenAD_Symbol_34
      OpenAD_Symbol_37 = (MATR(1)%v*MATR(1)%v)
      OpenAD_Symbol_35 = MATR(1)%v
      OpenAD_Symbol_36 = MATR(1)%v
      M11%v = OpenAD_Symbol_37
      OpenAD_Symbol_40 = (MATR(2)%v*MATR(2)%v)
      OpenAD_Symbol_38 = MATR(2)%v
      OpenAD_Symbol_39 = MATR(2)%v
      M22%v = OpenAD_Symbol_40
      OpenAD_Symbol_43 = (MATR(3)%v*MATR(3)%v)
      OpenAD_Symbol_41 = MATR(3)%v
      OpenAD_Symbol_42 = MATR(3)%v
      M33%v = OpenAD_Symbol_43
      OpenAD_Symbol_46 = (M00%v*M33%v)
      OpenAD_Symbol_44 = M33%v
      OpenAD_Symbol_45 = M00%v
      D12%v = OpenAD_Symbol_46
      OpenAD_Symbol_49 = (M11%v*M22%v)
      OpenAD_Symbol_47 = M22%v
      OpenAD_Symbol_48 = M11%v
      D03%v = OpenAD_Symbol_49
      F%v = (D03%v+D12%v)
      OpenAD_Symbol_50 = 1_w2f__i8
      OpenAD_Symbol_51 = 1_w2f__i8
      OpenAD_Symbol_52 = (1.0D00/G%v)
      OpenAD_Symbol_57 = (A * OpenAD_Symbol_52)
      OpenAD_Symbol_56 = (-(1.0D00/(G%v*G%v)))
      OpenAD_Symbol_54 = A
      LOC1%v = OpenAD_Symbol_57
      OpenAD_Symbol_60 = (F%v*LOC1%v)
      OpenAD_Symbol_58 = LOC1%v
      OpenAD_Symbol_59 = F%v
      OBJ(1)%v = OpenAD_Symbol_60
      OpenAD_Symbol_85 = (OpenAD_Symbol_50 * OpenAD_Symbol_58)
      OpenAD_Symbol_86 = (OpenAD_Symbol_47 * OpenAD_Symbol_85)
      OpenAD_Symbol_87 = (OpenAD_Symbol_35 * OpenAD_Symbol_86)
      OpenAD_Symbol_89 = (OpenAD_Symbol_54 * OpenAD_Symbol_59)
      OpenAD_Symbol_90 = (OpenAD_Symbol_56 * OpenAD_Symbol_89)
      OpenAD_Symbol_91 = (OpenAD_Symbol_30 * OpenAD_Symbol_90)
      OpenAD_Symbol_92 = (OpenAD_Symbol_24 * OpenAD_Symbol_91)
      OpenAD_Symbol_94 = (OpenAD_Symbol_25 * OpenAD_Symbol_91)
      OpenAD_Symbol_96 = (OpenAD_Symbol_51 * OpenAD_Symbol_58)
      OpenAD_Symbol_97 = (OpenAD_Symbol_44 * OpenAD_Symbol_96)
      OpenAD_Symbol_98 = (OpenAD_Symbol_32 * OpenAD_Symbol_97)
      OpenAD_Symbol_100 = (OpenAD_Symbol_48 * OpenAD_Symbol_85)
      OpenAD_Symbol_101 = (OpenAD_Symbol_38 * OpenAD_Symbol_100)
      OpenAD_Symbol_103 = (OpenAD_Symbol_45 * OpenAD_Symbol_96)
      OpenAD_Symbol_104 = (OpenAD_Symbol_41 * OpenAD_Symbol_103)
      OpenAD_Symbol_106 = (OpenAD_Symbol_42 * OpenAD_Symbol_103)
      OpenAD_Symbol_108 = (OpenAD_Symbol_39 * OpenAD_Symbol_100)
      OpenAD_Symbol_110 = (OpenAD_Symbol_36 * OpenAD_Symbol_86)
      OpenAD_Symbol_112 = (OpenAD_Symbol_33 * OpenAD_Symbol_97)
      OpenAD_Symbol_114 = (OpenAD_Symbol_31 * OpenAD_Symbol_90)
      OpenAD_Symbol_115 = (OpenAD_Symbol_27 * OpenAD_Symbol_114)
      OpenAD_Symbol_117 = (OpenAD_Symbol_28 * OpenAD_Symbol_114)
      OpenAD_Symbol_119 = OpenAD_Symbol_24
      OpenAD_Symbol_120 = OpenAD_Symbol_25
      OpenAD_Symbol_121 = OpenAD_Symbol_27
      OpenAD_Symbol_122 = OpenAD_Symbol_28
      CALL setderiv(OpenAD_Symbol_118,MATR(2))
      CALL setderiv(OpenAD_Symbol_116,MATR(1))
      CALL setderiv(OpenAD_Symbol_113,MATR(0))
      CALL setderiv(OpenAD_Symbol_111,MATR(1))
      CALL setderiv(OpenAD_Symbol_109,MATR(2))
      CALL setderiv(OpenAD_Symbol_107,MATR(3))
      CALL setderiv(OpenAD_Symbol_105,MATR(3))
      CALL setderiv(OpenAD_Symbol_102,MATR(2))
      CALL setderiv(OpenAD_Symbol_99,MATR(0))
      CALL setderiv(OpenAD_Symbol_95,MATR(3))
      CALL setderiv(OpenAD_Symbol_93,MATR(0))
      CALL setderiv(OpenAD_Symbol_88,MATR(1))
      CALL sax(OpenAD_Symbol_87,OpenAD_Symbol_88,OBJ(1))
      CALL saxpy(OpenAD_Symbol_92,OpenAD_Symbol_93,OBJ(1))
      CALL saxpy(OpenAD_Symbol_94,OpenAD_Symbol_95,OBJ(1))
      CALL saxpy(OpenAD_Symbol_98,OpenAD_Symbol_99,OBJ(1))
      CALL saxpy(OpenAD_Symbol_101,OpenAD_Symbol_102,OBJ(1))
      CALL saxpy(OpenAD_Symbol_104,OpenAD_Symbol_105,OBJ(1))
      CALL saxpy(OpenAD_Symbol_106,OpenAD_Symbol_107,OBJ(1))
      CALL saxpy(OpenAD_Symbol_108,OpenAD_Symbol_109,OBJ(1))
      CALL saxpy(OpenAD_Symbol_110,OpenAD_Symbol_111,OBJ(1))
      CALL saxpy(OpenAD_Symbol_112,OpenAD_Symbol_113,OBJ(1))
      CALL saxpy(OpenAD_Symbol_115,OpenAD_Symbol_116,OBJ(1))
      CALL saxpy(OpenAD_Symbol_117,OpenAD_Symbol_118,OBJ(1))
      CALL sax(OpenAD_Symbol_119,OpenAD_Symbol_93,M03)
      CALL saxpy(OpenAD_Symbol_120,OpenAD_Symbol_95,M03)
      CALL sax(OpenAD_Symbol_121,OpenAD_Symbol_116,M12)
      CALL saxpy(OpenAD_Symbol_122,OpenAD_Symbol_118,M12)
      END SUBROUTINE
