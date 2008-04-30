
      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE box_timestep(GAMMALOC, FLDSTAR, EXTFORLOC, UVELLOC,
     >  FLDNOW, FLDOLD, FLDNEW)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_100
      REAL(w2f__8) OpenAD_Symbol_101
      REAL(w2f__8) OpenAD_Symbol_102
      REAL(w2f__8) OpenAD_Symbol_103
      REAL(w2f__8) OpenAD_Symbol_104
      REAL(w2f__8) OpenAD_Symbol_105
      REAL(w2f__8) OpenAD_Symbol_106
      REAL(w2f__8) OpenAD_Symbol_107
      REAL(w2f__8) OpenAD_Symbol_108
      REAL(w2f__8) OpenAD_Symbol_109
      REAL(w2f__8) OpenAD_Symbol_110
      REAL(w2f__8) OpenAD_Symbol_111
      REAL(w2f__8) OpenAD_Symbol_112
      REAL(w2f__8) OpenAD_Symbol_113
      REAL(w2f__8) OpenAD_Symbol_114
      REAL(w2f__8) OpenAD_Symbol_115
      REAL(w2f__8) OpenAD_Symbol_116
      REAL(w2f__8) OpenAD_Symbol_117
      INTEGER(w2f__i8) OpenAD_Symbol_118
      INTEGER(w2f__i8) OpenAD_Symbol_119
      REAL(w2f__8) OpenAD_Symbol_12
      INTEGER(w2f__i8) OpenAD_Symbol_120
      INTEGER(w2f__i8) OpenAD_Symbol_121
      INTEGER(w2f__i8) OpenAD_Symbol_122
      INTEGER(w2f__i8) OpenAD_Symbol_123
      INTEGER(w2f__i8) OpenAD_Symbol_124
      INTEGER(w2f__i8) OpenAD_Symbol_125
      INTEGER(w2f__i8) OpenAD_Symbol_126
      INTEGER(w2f__i8) OpenAD_Symbol_127
      INTEGER(w2f__i8) OpenAD_Symbol_128
      INTEGER(w2f__i8) OpenAD_Symbol_129
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_27
      REAL(w2f__8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_32
      REAL(w2f__8) OpenAD_Symbol_34
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_37
      REAL(w2f__8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_43
      REAL(w2f__8) OpenAD_Symbol_45
      REAL(w2f__8) OpenAD_Symbol_46
      REAL(w2f__8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_50
      REAL(w2f__8) OpenAD_Symbol_51
      REAL(w2f__8) OpenAD_Symbol_53
      REAL(w2f__8) OpenAD_Symbol_54
      REAL(w2f__8) OpenAD_Symbol_56
      REAL(w2f__8) OpenAD_Symbol_57
      REAL(w2f__8) OpenAD_Symbol_59
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_60
      REAL(w2f__8) OpenAD_Symbol_62
      REAL(w2f__8) OpenAD_Symbol_63
      REAL(w2f__8) OpenAD_Symbol_65
      REAL(w2f__8) OpenAD_Symbol_67
      REAL(w2f__8) OpenAD_Symbol_68
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_70
      REAL(w2f__8) OpenAD_Symbol_71
      REAL(w2f__8) OpenAD_Symbol_72
      REAL(w2f__8) OpenAD_Symbol_73
      REAL(w2f__8) OpenAD_Symbol_74
      REAL(w2f__8) OpenAD_Symbol_76
      REAL(w2f__8) OpenAD_Symbol_77
      REAL(w2f__8) OpenAD_Symbol_79
      REAL(w2f__8) OpenAD_Symbol_80
      REAL(w2f__8) OpenAD_Symbol_82
      REAL(w2f__8) OpenAD_Symbol_83
      REAL(w2f__8) OpenAD_Symbol_85
      REAL(w2f__8) OpenAD_Symbol_87
      REAL(w2f__8) OpenAD_Symbol_88
      REAL(w2f__8) OpenAD_Symbol_9
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_91
      REAL(w2f__8) OpenAD_Symbol_92
      REAL(w2f__8) OpenAD_Symbol_93
      REAL(w2f__8) OpenAD_Symbol_94
      REAL(w2f__8) OpenAD_Symbol_95
      REAL(w2f__8) OpenAD_Symbol_97
      REAL(w2f__8) OpenAD_Symbol_99
C
C     **** Parameters and Result ****
C
      REAL(w2f__8) GAMMALOC
      REAL(w2f__8) FLDSTAR(1 : 2)
      REAL(w2f__8) EXTFORLOC(1 : 2)
      REAL(w2f__8) UVELLOC
      TYPE (OpenADTy_active) FLDNOW(1 : 3)
      REAL(w2f__8) FLDOLD(1 : 3)
      TYPE (OpenADTy_active) FLDNEW(1 : 3)
C
C     **** Local Variables and Functions ****
C
      REAL(w2f__8) DELTA_T
      TYPE (OpenADTy_active) DFLDDT(1 : 3)
      INTEGER(w2f__i4) L
      REAL(w2f__8) VOL(1 : 3)
      REAL(w2f__8) OpenAD_Symbol_130
      REAL(w2f__8) OpenAD_Symbol_131
      REAL(w2f__8) OpenAD_Symbol_132
      REAL(w2f__8) OpenAD_Symbol_133
      REAL(w2f__8) OpenAD_Symbol_134
      REAL(w2f__8) OpenAD_Symbol_135
      REAL(w2f__8) OpenAD_Symbol_136
      REAL(w2f__8) OpenAD_Symbol_137
      INTEGER(w2f__i8) OpenAD_Symbol_138
      INTEGER(w2f__i8) OpenAD_Symbol_139
      REAL(w2f__8) OpenAD_Symbol_140
      REAL(w2f__8) OpenAD_Symbol_141
      REAL(w2f__8) OpenAD_Symbol_142
      REAL(w2f__8) OpenAD_Symbol_143
      REAL(w2f__8) OpenAD_Symbol_144
      REAL(w2f__8) OpenAD_Symbol_145
      REAL(w2f__8) OpenAD_Symbol_146
      REAL(w2f__8) OpenAD_Symbol_147
      REAL(w2f__8) OpenAD_Symbol_148
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(FLDNOW)
C$OPENAD DEPENDENT(FLDNEW)
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      VOL(1) = 1.0E+01
      VOL(2) = 1.2E+01
      VOL(3) = 1.4E+01
      DELTA_T = 2.0D+01
      IF(UVELLOC .GE. 0.0D00) THEN
        __value__(DFLDDT(1)) = ((EXTFORLOC(1) + VOL(1) * GAMMALOC *(
     > FLDSTAR(1) - __value__(FLDNOW(1))) + UVELLOC *(__value__(FLDNOW(
     > 3)) - __value__(FLDNOW(1)))) / VOL(1))
        __value__(DFLDDT(2)) = ((EXTFORLOC(2) + VOL(2) * GAMMALOC *(
     > FLDSTAR(2) - __value__(FLDNOW(2))) + UVELLOC *(__value__(FLDNOW(
     > 1)) - __value__(FLDNOW(2)))) / VOL(2))
        __value__(DFLDDT(3)) = ((UVELLOC *(__value__(FLDNOW(2)) -
     >  __value__(FLDNOW(3)))) / VOL(3))
      ELSE
        __value__(DFLDDT(1)) = ((EXTFORLOC(1) + VOL(1) * GAMMALOC *(
     > FLDSTAR(1) - __value__(FLDNOW(1))) - UVELLOC *(__value__(FLDNOW(
     > 2)) - __value__(FLDNOW(1)))) / VOL(1))
        __value__(DFLDDT(2)) = ((EXTFORLOC(2) + VOL(2) * GAMMALOC *(
     > FLDSTAR(2) - __value__(FLDNOW(2))) - UVELLOC *(__value__(FLDNOW(
     > 3)) - __value__(FLDNOW(2)))) / VOL(2))
        __value__(DFLDDT(3)) = (-((UVELLOC *(__value__(FLDNOW(1)) -
     >  __value__(FLDNOW(3)))) / VOL(3)))
      ENDIF
      DO L = 1, 3, 1
        __value__(FLDNEW(INT(L))) = (FLDOLD(L) + __value__(DFLDDT(L)) *
     >  DELTA_T * 2.0D00)
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      VOL(1) = 1.0E+01
      VOL(2) = 1.2E+01
      VOL(3) = 1.4E+01
      DELTA_T = 2.0D+01
      IF(UVELLOC .GE. 0.0D00) THEN
        OpenAD_Symbol_10 = (FLDSTAR(1) - __value__(FLDNOW(1)))
        OpenAD_Symbol_7 = (GAMMALOC * OpenAD_Symbol_10)
        OpenAD_Symbol_15 = (__value__(FLDNOW(3)) - __value__(FLDNOW(1))
     > )
        OpenAD_Symbol_0 = (EXTFORLOC(1) + VOL(1) * OpenAD_Symbol_7 +
     >  UVELLOC * OpenAD_Symbol_15)
        __value__(DFLDDT(1)) = (OpenAD_Symbol_0 / VOL(1))
        OpenAD_Symbol_14 = (-1_w2f__i8)
        OpenAD_Symbol_12 = GAMMALOC
        OpenAD_Symbol_9 = VOL(1)
        OpenAD_Symbol_6 = 1_w2f__i8
        OpenAD_Symbol_3 = 1_w2f__i8
        OpenAD_Symbol_18 = 1_w2f__i8
        OpenAD_Symbol_19 = (-1_w2f__i8)
        OpenAD_Symbol_17 = UVELLOC
        OpenAD_Symbol_4 = 1_w2f__i8
        OpenAD_Symbol_1 = (INT(1_w2f__i8) / VOL(1))
        OpenAD_Symbol_102 = (OpenAD_Symbol_17 * OpenAD_Symbol_1)
        OpenAD_Symbol_103 = (INT((-1_w2f__i8)) * OpenAD_Symbol_102)
        OpenAD_Symbol_104 = (INT((-1_w2f__i8)) * OpenAD_Symbol_12 *
     >  OpenAD_Symbol_9 * OpenAD_Symbol_1)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_102)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_103)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_104)
        OpenAD_Symbol_30 = (FLDSTAR(2) - __value__(FLDNOW(2)))
        OpenAD_Symbol_27 = (GAMMALOC * OpenAD_Symbol_30)
        OpenAD_Symbol_35 = (__value__(FLDNOW(1)) - __value__(FLDNOW(2))
     > )
        OpenAD_Symbol_20 = (EXTFORLOC(2) + VOL(2) * OpenAD_Symbol_27 +
     >  UVELLOC * OpenAD_Symbol_35)
        __value__(DFLDDT(2)) = (OpenAD_Symbol_20 / VOL(2))
        OpenAD_Symbol_34 = (-1_w2f__i8)
        OpenAD_Symbol_32 = GAMMALOC
        OpenAD_Symbol_29 = VOL(2)
        OpenAD_Symbol_26 = 1_w2f__i8
        OpenAD_Symbol_23 = 1_w2f__i8
        OpenAD_Symbol_38 = 1_w2f__i8
        OpenAD_Symbol_39 = (-1_w2f__i8)
        OpenAD_Symbol_37 = UVELLOC
        OpenAD_Symbol_24 = 1_w2f__i8
        OpenAD_Symbol_21 = (INT(1_w2f__i8) / VOL(2))
        OpenAD_Symbol_105 = (OpenAD_Symbol_37 * OpenAD_Symbol_21)
        OpenAD_Symbol_106 = (INT((-1_w2f__i8)) * OpenAD_Symbol_105)
        OpenAD_Symbol_107 = (INT((-1_w2f__i8)) * OpenAD_Symbol_32 *
     >  OpenAD_Symbol_29 * OpenAD_Symbol_21)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_105)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_106)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_107)
        OpenAD_Symbol_43 = (__value__(FLDNOW(2)) - __value__(FLDNOW(3))
     > )
        OpenAD_Symbol_40 = (UVELLOC * OpenAD_Symbol_43)
        __value__(DFLDDT(3)) = (OpenAD_Symbol_40 / VOL(3))
        OpenAD_Symbol_46 = 1_w2f__i8
        OpenAD_Symbol_47 = (-1_w2f__i8)
        OpenAD_Symbol_45 = UVELLOC
        OpenAD_Symbol_41 = (INT(1_w2f__i8) / VOL(3))
        OpenAD_Symbol_108 = (OpenAD_Symbol_45 * OpenAD_Symbol_41)
        OpenAD_Symbol_109 = (INT((-1_w2f__i8)) * OpenAD_Symbol_108)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_108)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_109)
        OpenAD_Symbol_121 = 1_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_121)
      ELSE
        OpenAD_Symbol_63 = (FLDSTAR(1) - __value__(FLDNOW(1)))
        OpenAD_Symbol_60 = (GAMMALOC * OpenAD_Symbol_63)
        OpenAD_Symbol_68 = (__value__(FLDNOW(2)) - __value__(FLDNOW(1))
     > )
        OpenAD_Symbol_53 = (EXTFORLOC(1) + VOL(1) * OpenAD_Symbol_60 -
     >  UVELLOC * OpenAD_Symbol_68)
        __value__(DFLDDT(1)) = (OpenAD_Symbol_53 / VOL(1))
        OpenAD_Symbol_67 = (-1_w2f__i8)
        OpenAD_Symbol_65 = GAMMALOC
        OpenAD_Symbol_62 = VOL(1)
        OpenAD_Symbol_59 = 1_w2f__i8
        OpenAD_Symbol_56 = 1_w2f__i8
        OpenAD_Symbol_71 = 1_w2f__i8
        OpenAD_Symbol_72 = (-1_w2f__i8)
        OpenAD_Symbol_70 = UVELLOC
        OpenAD_Symbol_57 = (-1_w2f__i8)
        OpenAD_Symbol_54 = (INT(1_w2f__i8) / VOL(1))
        OpenAD_Symbol_110 = (OpenAD_Symbol_70 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_54)
        OpenAD_Symbol_111 = (INT((-1_w2f__i8)) * OpenAD_Symbol_110)
        OpenAD_Symbol_112 = (INT((-1_w2f__i8)) * OpenAD_Symbol_65 *
     >  OpenAD_Symbol_62 * OpenAD_Symbol_54)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_110)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_111)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_112)
        OpenAD_Symbol_83 = (FLDSTAR(2) - __value__(FLDNOW(2)))
        OpenAD_Symbol_80 = (GAMMALOC * OpenAD_Symbol_83)
        OpenAD_Symbol_88 = (__value__(FLDNOW(3)) - __value__(FLDNOW(2))
     > )
        OpenAD_Symbol_73 = (EXTFORLOC(2) + VOL(2) * OpenAD_Symbol_80 -
     >  UVELLOC * OpenAD_Symbol_88)
        __value__(DFLDDT(2)) = (OpenAD_Symbol_73 / VOL(2))
        OpenAD_Symbol_87 = (-1_w2f__i8)
        OpenAD_Symbol_85 = GAMMALOC
        OpenAD_Symbol_82 = VOL(2)
        OpenAD_Symbol_79 = 1_w2f__i8
        OpenAD_Symbol_76 = 1_w2f__i8
        OpenAD_Symbol_91 = 1_w2f__i8
        OpenAD_Symbol_92 = (-1_w2f__i8)
        OpenAD_Symbol_90 = UVELLOC
        OpenAD_Symbol_77 = (-1_w2f__i8)
        OpenAD_Symbol_74 = (INT(1_w2f__i8) / VOL(2))
        OpenAD_Symbol_113 = (OpenAD_Symbol_90 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_74)
        OpenAD_Symbol_114 = (INT((-1_w2f__i8)) * OpenAD_Symbol_113)
        OpenAD_Symbol_115 = (INT((-1_w2f__i8)) * OpenAD_Symbol_85 *
     >  OpenAD_Symbol_82 * OpenAD_Symbol_74)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_113)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_114)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_115)
        OpenAD_Symbol_97 = (__value__(FLDNOW(1)) - __value__(FLDNOW(3))
     > )
        OpenAD_Symbol_94 = (UVELLOC * OpenAD_Symbol_97)
        __value__(DFLDDT(3)) = (-(OpenAD_Symbol_94 / VOL(3)))
        OpenAD_Symbol_100 = 1_w2f__i8
        OpenAD_Symbol_101 = (-1_w2f__i8)
        OpenAD_Symbol_99 = UVELLOC
        OpenAD_Symbol_95 = (INT(1_w2f__i8) / VOL(3))
        OpenAD_Symbol_93 = (-1_w2f__i8)
        OpenAD_Symbol_116 = (OpenAD_Symbol_99 * OpenAD_Symbol_95 * INT(
     > (-1_w2f__i8)))
        OpenAD_Symbol_117 = (INT((-1_w2f__i8)) * OpenAD_Symbol_116)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_116)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_117)
        OpenAD_Symbol_122 = 0_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_122)
      ENDIF
      OpenAD_Symbol_123 = 0_w2f__i8
      DO L = 1, 3, 1
        OpenAD_Symbol_50 = (DELTA_T * 2.0D00)
        __value__(FLDNEW(INT(L))) = (FLDOLD(L) + __value__(DFLDDT(L)) *
     >  OpenAD_Symbol_50)
        OpenAD_Symbol_51 = OpenAD_Symbol_50
        OpenAD_Symbol_49 = 1_w2f__i8
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_51)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        OpenAD_Symbol_123 = (INT(OpenAD_Symbol_123) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_123)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_118)
      OpenAD_Symbol_119 = 1
      DO WHILE(INT(OpenAD_Symbol_119) .LE. INT(OpenAD_Symbol_118))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_138)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_139)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_140)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_140, __deriv__(FLDNEW(INT(
     > OpenAD_Symbol_138))), __deriv__(DFLDDT(INT(OpenAD_Symbol_139))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(FLDNEW(INT(OpenAD_Symbol_138))))
        OpenAD_Symbol_119 = INT(OpenAD_Symbol_119) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_120)
      IF(OpenAD_Symbol_120 .ne. 0) THEN
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_130)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_130, __deriv__(DFLDDT(3)), __deriv__(
     > FLDNOW(3)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_131)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_131, __deriv__(DFLDDT(3)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(3)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_132)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_132, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_133)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_133, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_134)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_134, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_135)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_135, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_136)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_136, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_137)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_137, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(3)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(1)))
      ELSE
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_141)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_141, __deriv__(DFLDDT(3)), __deriv__(
     > FLDNOW(3)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_142)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_142, __deriv__(DFLDDT(3)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(3)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_143)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_143, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_144)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_144, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_145)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_145, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(3)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_146)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_146, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_147)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_147, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_148)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_148, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(1)))
      ENDIF
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
      VOL(1) = 1.0E+01
      VOL(2) = 1.2E+01
      VOL(3) = 1.4E+01
      DELTA_T = 2.0D+01
      IF(UVELLOC .GE. 0.0D00) THEN
        OpenAD_Symbol_10 = (FLDSTAR(1) - __value__(FLDNOW(1)))
        OpenAD_Symbol_7 = (GAMMALOC * OpenAD_Symbol_10)
        OpenAD_Symbol_15 = (__value__(FLDNOW(3)) - __value__(FLDNOW(1))
     > )
        OpenAD_Symbol_0 = (EXTFORLOC(1) + VOL(1) * OpenAD_Symbol_7 +
     >  UVELLOC * OpenAD_Symbol_15)
        __value__(DFLDDT(1)) = (OpenAD_Symbol_0 / VOL(1))
        OpenAD_Symbol_14 = (-1_w2f__i8)
        OpenAD_Symbol_12 = GAMMALOC
        OpenAD_Symbol_9 = VOL(1)
        OpenAD_Symbol_6 = 1_w2f__i8
        OpenAD_Symbol_3 = 1_w2f__i8
        OpenAD_Symbol_18 = 1_w2f__i8
        OpenAD_Symbol_19 = (-1_w2f__i8)
        OpenAD_Symbol_17 = UVELLOC
        OpenAD_Symbol_4 = 1_w2f__i8
        OpenAD_Symbol_1 = (INT(1_w2f__i8) / VOL(1))
        OpenAD_Symbol_102 = (OpenAD_Symbol_17 * OpenAD_Symbol_1)
        OpenAD_Symbol_103 = (INT((-1_w2f__i8)) * OpenAD_Symbol_102)
        OpenAD_Symbol_104 = (INT((-1_w2f__i8)) * OpenAD_Symbol_12 *
     >  OpenAD_Symbol_9 * OpenAD_Symbol_1)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_102)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_103)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_104)
        OpenAD_Symbol_30 = (FLDSTAR(2) - __value__(FLDNOW(2)))
        OpenAD_Symbol_27 = (GAMMALOC * OpenAD_Symbol_30)
        OpenAD_Symbol_35 = (__value__(FLDNOW(1)) - __value__(FLDNOW(2))
     > )
        OpenAD_Symbol_20 = (EXTFORLOC(2) + VOL(2) * OpenAD_Symbol_27 +
     >  UVELLOC * OpenAD_Symbol_35)
        __value__(DFLDDT(2)) = (OpenAD_Symbol_20 / VOL(2))
        OpenAD_Symbol_34 = (-1_w2f__i8)
        OpenAD_Symbol_32 = GAMMALOC
        OpenAD_Symbol_29 = VOL(2)
        OpenAD_Symbol_26 = 1_w2f__i8
        OpenAD_Symbol_23 = 1_w2f__i8
        OpenAD_Symbol_38 = 1_w2f__i8
        OpenAD_Symbol_39 = (-1_w2f__i8)
        OpenAD_Symbol_37 = UVELLOC
        OpenAD_Symbol_24 = 1_w2f__i8
        OpenAD_Symbol_21 = (INT(1_w2f__i8) / VOL(2))
        OpenAD_Symbol_105 = (OpenAD_Symbol_37 * OpenAD_Symbol_21)
        OpenAD_Symbol_106 = (INT((-1_w2f__i8)) * OpenAD_Symbol_105)
        OpenAD_Symbol_107 = (INT((-1_w2f__i8)) * OpenAD_Symbol_32 *
     >  OpenAD_Symbol_29 * OpenAD_Symbol_21)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_105)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_106)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_107)
        OpenAD_Symbol_43 = (__value__(FLDNOW(2)) - __value__(FLDNOW(3))
     > )
        OpenAD_Symbol_40 = (UVELLOC * OpenAD_Symbol_43)
        __value__(DFLDDT(3)) = (OpenAD_Symbol_40 / VOL(3))
        OpenAD_Symbol_46 = 1_w2f__i8
        OpenAD_Symbol_47 = (-1_w2f__i8)
        OpenAD_Symbol_45 = UVELLOC
        OpenAD_Symbol_41 = (INT(1_w2f__i8) / VOL(3))
        OpenAD_Symbol_108 = (OpenAD_Symbol_45 * OpenAD_Symbol_41)
        OpenAD_Symbol_109 = (INT((-1_w2f__i8)) * OpenAD_Symbol_108)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_108)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_109)
        OpenAD_Symbol_127 = 1_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_127)
      ELSE
        OpenAD_Symbol_63 = (FLDSTAR(1) - __value__(FLDNOW(1)))
        OpenAD_Symbol_60 = (GAMMALOC * OpenAD_Symbol_63)
        OpenAD_Symbol_68 = (__value__(FLDNOW(2)) - __value__(FLDNOW(1))
     > )
        OpenAD_Symbol_53 = (EXTFORLOC(1) + VOL(1) * OpenAD_Symbol_60 -
     >  UVELLOC * OpenAD_Symbol_68)
        __value__(DFLDDT(1)) = (OpenAD_Symbol_53 / VOL(1))
        OpenAD_Symbol_67 = (-1_w2f__i8)
        OpenAD_Symbol_65 = GAMMALOC
        OpenAD_Symbol_62 = VOL(1)
        OpenAD_Symbol_59 = 1_w2f__i8
        OpenAD_Symbol_56 = 1_w2f__i8
        OpenAD_Symbol_71 = 1_w2f__i8
        OpenAD_Symbol_72 = (-1_w2f__i8)
        OpenAD_Symbol_70 = UVELLOC
        OpenAD_Symbol_57 = (-1_w2f__i8)
        OpenAD_Symbol_54 = (INT(1_w2f__i8) / VOL(1))
        OpenAD_Symbol_110 = (OpenAD_Symbol_70 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_54)
        OpenAD_Symbol_111 = (INT((-1_w2f__i8)) * OpenAD_Symbol_110)
        OpenAD_Symbol_112 = (INT((-1_w2f__i8)) * OpenAD_Symbol_65 *
     >  OpenAD_Symbol_62 * OpenAD_Symbol_54)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_110)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_111)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_112)
        OpenAD_Symbol_83 = (FLDSTAR(2) - __value__(FLDNOW(2)))
        OpenAD_Symbol_80 = (GAMMALOC * OpenAD_Symbol_83)
        OpenAD_Symbol_88 = (__value__(FLDNOW(3)) - __value__(FLDNOW(2))
     > )
        OpenAD_Symbol_73 = (EXTFORLOC(2) + VOL(2) * OpenAD_Symbol_80 -
     >  UVELLOC * OpenAD_Symbol_88)
        __value__(DFLDDT(2)) = (OpenAD_Symbol_73 / VOL(2))
        OpenAD_Symbol_87 = (-1_w2f__i8)
        OpenAD_Symbol_85 = GAMMALOC
        OpenAD_Symbol_82 = VOL(2)
        OpenAD_Symbol_79 = 1_w2f__i8
        OpenAD_Symbol_76 = 1_w2f__i8
        OpenAD_Symbol_91 = 1_w2f__i8
        OpenAD_Symbol_92 = (-1_w2f__i8)
        OpenAD_Symbol_90 = UVELLOC
        OpenAD_Symbol_77 = (-1_w2f__i8)
        OpenAD_Symbol_74 = (INT(1_w2f__i8) / VOL(2))
        OpenAD_Symbol_113 = (OpenAD_Symbol_90 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_74)
        OpenAD_Symbol_114 = (INT((-1_w2f__i8)) * OpenAD_Symbol_113)
        OpenAD_Symbol_115 = (INT((-1_w2f__i8)) * OpenAD_Symbol_85 *
     >  OpenAD_Symbol_82 * OpenAD_Symbol_74)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_113)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_114)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_115)
        OpenAD_Symbol_97 = (__value__(FLDNOW(1)) - __value__(FLDNOW(3))
     > )
        OpenAD_Symbol_94 = (UVELLOC * OpenAD_Symbol_97)
        __value__(DFLDDT(3)) = (-(OpenAD_Symbol_94 / VOL(3)))
        OpenAD_Symbol_100 = 1_w2f__i8
        OpenAD_Symbol_101 = (-1_w2f__i8)
        OpenAD_Symbol_99 = UVELLOC
        OpenAD_Symbol_95 = (INT(1_w2f__i8) / VOL(3))
        OpenAD_Symbol_93 = (-1_w2f__i8)
        OpenAD_Symbol_116 = (OpenAD_Symbol_99 * OpenAD_Symbol_95 * INT(
     > (-1_w2f__i8)))
        OpenAD_Symbol_117 = (INT((-1_w2f__i8)) * OpenAD_Symbol_116)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_116)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_117)
        OpenAD_Symbol_128 = 0_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_128)
      ENDIF
      OpenAD_Symbol_129 = 0_w2f__i8
      DO L = 1, 3, 1
        OpenAD_Symbol_50 = (DELTA_T * 2.0D00)
        __value__(FLDNEW(INT(L))) = (FLDOLD(L) + __value__(DFLDDT(L)) *
     >  OpenAD_Symbol_50)
        OpenAD_Symbol_51 = OpenAD_Symbol_50
        OpenAD_Symbol_49 = 1_w2f__i8
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_51)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        OpenAD_Symbol_129 = (INT(OpenAD_Symbol_129) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_129)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_124)
      OpenAD_Symbol_125 = 1
      DO WHILE(INT(OpenAD_Symbol_125) .LE. INT(OpenAD_Symbol_124))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_138)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_139)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_140)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_140, __deriv__(FLDNEW(INT(
     > OpenAD_Symbol_138))), __deriv__(DFLDDT(INT(OpenAD_Symbol_139))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(FLDNEW(INT(OpenAD_Symbol_138))))
        OpenAD_Symbol_125 = INT(OpenAD_Symbol_125) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_126)
      IF(OpenAD_Symbol_126 .ne. 0) THEN
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_130)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_130, __deriv__(DFLDDT(3)), __deriv__(
     > FLDNOW(3)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_131)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_131, __deriv__(DFLDDT(3)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(3)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_132)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_132, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_133)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_133, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_134)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_134, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_135)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_135, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_136)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_136, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_137)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_137, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(3)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(1)))
      ELSE
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_141)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_141, __deriv__(DFLDDT(3)), __deriv__(
     > FLDNOW(3)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_142)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_142, __deriv__(DFLDDT(3)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(3)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_143)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_143, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_144)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_144, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_145)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_145, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(3)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_146)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_146, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_147)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_147, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_148)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_148, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(1)))
      ENDIF
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
