
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
      REAL(w2f__8) OpenAD_Symbol_12
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
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(FLDNOW)
C$OPENAD DEPENDENT(FLDNEW)
C
C     **** Statements ****
C
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
        CALL sax(OpenAD_Symbol_102, __deriv__(FLDNOW(3)), __deriv__(
     > DFLDDT(1)))
        CALL saxpy(OpenAD_Symbol_103, __deriv__(FLDNOW(1)), __deriv__(
     > DFLDDT(1)))
        CALL saxpy(OpenAD_Symbol_104, __deriv__(FLDNOW(1)), __deriv__(
     > DFLDDT(1)))
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
        CALL sax(OpenAD_Symbol_105, __deriv__(FLDNOW(1)), __deriv__(
     > DFLDDT(2)))
        CALL saxpy(OpenAD_Symbol_106, __deriv__(FLDNOW(2)), __deriv__(
     > DFLDDT(2)))
        CALL saxpy(OpenAD_Symbol_107, __deriv__(FLDNOW(2)), __deriv__(
     > DFLDDT(2)))
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
        CALL sax(OpenAD_Symbol_108, __deriv__(FLDNOW(2)), __deriv__(
     > DFLDDT(3)))
        CALL saxpy(OpenAD_Symbol_109, __deriv__(FLDNOW(3)), __deriv__(
     > DFLDDT(3)))
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
        CALL sax(OpenAD_Symbol_110, __deriv__(FLDNOW(2)), __deriv__(
     > DFLDDT(1)))
        CALL saxpy(OpenAD_Symbol_111, __deriv__(FLDNOW(1)), __deriv__(
     > DFLDDT(1)))
        CALL saxpy(OpenAD_Symbol_112, __deriv__(FLDNOW(1)), __deriv__(
     > DFLDDT(1)))
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
        CALL sax(OpenAD_Symbol_113, __deriv__(FLDNOW(3)), __deriv__(
     > DFLDDT(2)))
        CALL saxpy(OpenAD_Symbol_114, __deriv__(FLDNOW(2)), __deriv__(
     > DFLDDT(2)))
        CALL saxpy(OpenAD_Symbol_115, __deriv__(FLDNOW(2)), __deriv__(
     > DFLDDT(2)))
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
        CALL sax(OpenAD_Symbol_116, __deriv__(FLDNOW(1)), __deriv__(
     > DFLDDT(3)))
        CALL saxpy(OpenAD_Symbol_117, __deriv__(FLDNOW(3)), __deriv__(
     > DFLDDT(3)))
      ENDIF
      DO L = 1, 3, 1
        OpenAD_Symbol_50 = (DELTA_T * 2.0D00)
        __value__(FLDNEW(INT(L))) = (FLDOLD(L) + __value__(DFLDDT(L)) *
     >  OpenAD_Symbol_50)
        OpenAD_Symbol_51 = OpenAD_Symbol_50
        OpenAD_Symbol_49 = 1_w2f__i8
        CALL sax(OpenAD_Symbol_51, __deriv__(DFLDDT(L)), __deriv__(
     > FLDNEW(L)))
      END DO
      END SUBROUTINE
