
      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE find_bulkmod(LOCPRES, TFLD, SFLD, BULKMOD)
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
      REAL(w2f__8) OpenAD_Symbol_106
      REAL(w2f__8) OpenAD_Symbol_108
      REAL(w2f__8) OpenAD_Symbol_110
      REAL(w2f__8) OpenAD_Symbol_111
      REAL(w2f__8) OpenAD_Symbol_112
      REAL(w2f__8) OpenAD_Symbol_113
      REAL(w2f__8) OpenAD_Symbol_114
      REAL(w2f__8) OpenAD_Symbol_115
      REAL(w2f__8) OpenAD_Symbol_116
      REAL(w2f__8) OpenAD_Symbol_117
      REAL(w2f__8) OpenAD_Symbol_118
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_120
      REAL(w2f__8) OpenAD_Symbol_122
      REAL(w2f__8) OpenAD_Symbol_124
      REAL(w2f__8) OpenAD_Symbol_125
      REAL(w2f__8) OpenAD_Symbol_126
      REAL(w2f__8) OpenAD_Symbol_127
      REAL(w2f__8) OpenAD_Symbol_128
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_135
      REAL(w2f__8) OpenAD_Symbol_136
      REAL(w2f__8) OpenAD_Symbol_137
      REAL(w2f__8) OpenAD_Symbol_138
      REAL(w2f__8) OpenAD_Symbol_139
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_140
      REAL(w2f__8) OpenAD_Symbol_141
      REAL(w2f__8) OpenAD_Symbol_142
      REAL(w2f__8) OpenAD_Symbol_143
      REAL(w2f__8) OpenAD_Symbol_144
      REAL(w2f__8) OpenAD_Symbol_145
      REAL(w2f__8) OpenAD_Symbol_146
      REAL(w2f__8) OpenAD_Symbol_147
      REAL(w2f__8) OpenAD_Symbol_148
      REAL(w2f__8) OpenAD_Symbol_149
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_150
      REAL(w2f__8) OpenAD_Symbol_151
      REAL(w2f__8) OpenAD_Symbol_152
      REAL(w2f__8) OpenAD_Symbol_153
      REAL(w2f__8) OpenAD_Symbol_154
      REAL(w2f__8) OpenAD_Symbol_155
      REAL(w2f__8) OpenAD_Symbol_156
      REAL(w2f__8) OpenAD_Symbol_157
      REAL(w2f__8) OpenAD_Symbol_158
      REAL(w2f__8) OpenAD_Symbol_159
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_160
      REAL(w2f__8) OpenAD_Symbol_161
      REAL(w2f__8) OpenAD_Symbol_162
      REAL(w2f__8) OpenAD_Symbol_163
      REAL(w2f__8) OpenAD_Symbol_164
      REAL(w2f__8) OpenAD_Symbol_165
      REAL(w2f__8) OpenAD_Symbol_166
      REAL(w2f__8) OpenAD_Symbol_167
      REAL(w2f__8) OpenAD_Symbol_168
      REAL(w2f__8) OpenAD_Symbol_169
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_170
      REAL(w2f__8) OpenAD_Symbol_171
      REAL(w2f__8) OpenAD_Symbol_172
      REAL(w2f__8) OpenAD_Symbol_173
      REAL(w2f__8) OpenAD_Symbol_174
      REAL(w2f__8) OpenAD_Symbol_175
      REAL(w2f__8) OpenAD_Symbol_176
      REAL(w2f__8) OpenAD_Symbol_177
      REAL(w2f__8) OpenAD_Symbol_178
      REAL(w2f__8) OpenAD_Symbol_179
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_180
      REAL(w2f__8) OpenAD_Symbol_181
      REAL(w2f__8) OpenAD_Symbol_182
      REAL(w2f__8) OpenAD_Symbol_183
      REAL(w2f__8) OpenAD_Symbol_184
      REAL(w2f__8) OpenAD_Symbol_185
      REAL(w2f__8) OpenAD_Symbol_186
      REAL(w2f__8) OpenAD_Symbol_187
      REAL(w2f__8) OpenAD_Symbol_188
      REAL(w2f__8) OpenAD_Symbol_189
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_190
      REAL(w2f__8) OpenAD_Symbol_191
      REAL(w2f__8) OpenAD_Symbol_192
      REAL(w2f__8) OpenAD_Symbol_193
      REAL(w2f__8) OpenAD_Symbol_194
      REAL(w2f__8) OpenAD_Symbol_195
      REAL(w2f__8) OpenAD_Symbol_196
      REAL(w2f__8) OpenAD_Symbol_197
      REAL(w2f__8) OpenAD_Symbol_198
      REAL(w2f__8) OpenAD_Symbol_199
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_200
      REAL(w2f__8) OpenAD_Symbol_201
      REAL(w2f__8) OpenAD_Symbol_202
      REAL(w2f__8) OpenAD_Symbol_203
      REAL(w2f__8) OpenAD_Symbol_204
      REAL(w2f__8) OpenAD_Symbol_205
      REAL(w2f__8) OpenAD_Symbol_206
      REAL(w2f__8) OpenAD_Symbol_207
      REAL(w2f__8) OpenAD_Symbol_208
      REAL(w2f__8) OpenAD_Symbol_209
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_210
      REAL(w2f__8) OpenAD_Symbol_211
      REAL(w2f__8) OpenAD_Symbol_212
      REAL(w2f__8) OpenAD_Symbol_213
      REAL(w2f__8) OpenAD_Symbol_214
      REAL(w2f__8) OpenAD_Symbol_215
      REAL(w2f__8) OpenAD_Symbol_216
      REAL(w2f__8) OpenAD_Symbol_217
      REAL(w2f__8) OpenAD_Symbol_218
      REAL(w2f__8) OpenAD_Symbol_219
      REAL(w2f__8) OpenAD_Symbol_220
      REAL(w2f__8) OpenAD_Symbol_221
      REAL(w2f__8) OpenAD_Symbol_222
      REAL(w2f__8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_27
      REAL(w2f__8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_31
      REAL(w2f__8) OpenAD_Symbol_32
      REAL(w2f__8) OpenAD_Symbol_33
      REAL(w2f__8) OpenAD_Symbol_34
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_36
      REAL(w2f__8) OpenAD_Symbol_37
      REAL(w2f__8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_42
      REAL(w2f__8) OpenAD_Symbol_44
      REAL(w2f__8) OpenAD_Symbol_46
      REAL(w2f__8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_50
      REAL(w2f__8) OpenAD_Symbol_51
      REAL(w2f__8) OpenAD_Symbol_53
      REAL(w2f__8) OpenAD_Symbol_55
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
      REAL(w2f__8) OpenAD_Symbol_74
      REAL(w2f__8) OpenAD_Symbol_76
      REAL(w2f__8) OpenAD_Symbol_78
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_80
      REAL(w2f__8) OpenAD_Symbol_81
      REAL(w2f__8) OpenAD_Symbol_82
      REAL(w2f__8) OpenAD_Symbol_83
      REAL(w2f__8) OpenAD_Symbol_84
      REAL(w2f__8) OpenAD_Symbol_85
      REAL(w2f__8) OpenAD_Symbol_86
      REAL(w2f__8) OpenAD_Symbol_87
      REAL(w2f__8) OpenAD_Symbol_88
      REAL(w2f__8) OpenAD_Symbol_9
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_92
      REAL(w2f__8) OpenAD_Symbol_94
      REAL(w2f__8) OpenAD_Symbol_95
      REAL(w2f__8) OpenAD_Symbol_97
      REAL(w2f__8) OpenAD_Symbol_98
      REAL(w2f__8) OpenAD_Symbol_99
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) LOCPRES(1 : 2, 1 : 2)
      TYPE (OpenADTy_active) TFLD(1 : 2, 1 : 2, 1 : 2, 1 : 2, 1 : 2)
      TYPE (OpenADTy_active) SFLD(1 : 2, 1 : 2, 1 : 2, 1 : 2, 1 : 2)
      TYPE (OpenADTy_active) BULKMOD(1 : 2, 1 : 2)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) BI
      INTEGER(w2f__i4) BJ
      TYPE (OpenADTy_active) BMFRESH
      TYPE (OpenADTy_active) BMPRES
      TYPE (OpenADTy_active) BMSALT
      REAL(w2f__8) EOSJMDCKFW(1 : 5)
      REAL(w2f__8) EOSJMDCKP(1 : 14)
      REAL(w2f__8) EOSJMDCKSW(1 : 7)
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) J
      INTEGER(w2f__i4) K
      TYPE (OpenADTy_active) P
      TYPE (OpenADTy_active) P2
      TYPE (OpenADTy_active) S
      TYPE (OpenADTy_active) S3O2
      REAL(w2f__8) SITOBAR
      TYPE (OpenADTy_active) T
      TYPE (OpenADTy_active) T2
      TYPE (OpenADTy_active) T3
      TYPE (OpenADTy_active) T4
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      EOSJMDCKFW(1) = 1.96593300779999990482D+04
      EOSJMDCKFW(1) = 1.44430404659999993555D+02
      EOSJMDCKFW(1) = (-1.70610296730000010612D00)
      EOSJMDCKFW(1) = 9.64870397000000025456D-03
      EOSJMDCKFW(1) = (-4.19025309379999992402D-05)
      EOSJMDCKSW(1) = 5.28485488889999999174D+01
      EOSJMDCKSW(2) = (-3.10108900070000026439D-01)
      EOSJMDCKSW(3) = 6.2832632101999996363D-03
      EOSJMDCKSW(4) = (-5.08418816029999971122D-05)
      EOSJMDCKSW(5) = 3.88664007189999993752D-01
      EOSJMDCKSW(6) = 9.08583030100000056672D-03
      EOSJMDCKSW(7) = (-4.61992400230000011332D-04)
      EOSJMDCKP(1) = 3.18651890749999999741D00
      EOSJMDCKP(2) = 2.2122759371999999034D-02
      EOSJMDCKP(3) = (-2.98464205119999999305D-04)
      EOSJMDCKP(4) = 1.95641496250000003533D-06
      EOSJMDCKP(5) = 6.70438818630000009369D-03
      EOSJMDCKP(6) = (-1.84731805350000003168D-04)
      EOSJMDCKP(7) = 2.05933105239999988355D-07
      EOSJMDCKP(8) = 1.48026592800000000947D-04
      EOSJMDCKP(9) = 2.10289799719999998548D-04
      EOSJMDCKP(10) = (-1.20201602839999992066D-05)
      EOSJMDCKP(11) = 1.394679998200000081D-07
      EOSJMDCKP(12) = (-2.04023695009999982071D-06)
      EOSJMDCKP(13) = 6.12877286699999960113D-08
      EOSJMDCKP(14) = 6.20732298890000023583D-10
      K = 1
      BI = 1
      BJ = 1
      SITOBAR = 1.0D00
      DO J = 1, 2, 1
        DO I = 1, 2, 1
          __value__(T) = __value__(TFLD(I, J, K, BI, BJ))
          __value__(T2) = (__value__(T) * __value__(T))
          OpenAD_Symbol_0 = __value__(T)
          OpenAD_Symbol_1 = __value__(T)
          __value__(T3) = (__value__(T) * __value__(T2))
          OpenAD_Symbol_2 = __value__(T2)
          OpenAD_Symbol_3 = __value__(T)
          __value__(T4) = (__value__(T) * __value__(T3))
          OpenAD_Symbol_4 = __value__(T3)
          OpenAD_Symbol_5 = __value__(T)
          __value__(S) = __value__(SFLD(I, J, K, BI, BJ))
          OpenAD_Symbol_135 = (OpenAD_Symbol_2 +(OpenAD_Symbol_1 +
     >  OpenAD_Symbol_0) * OpenAD_Symbol_3)
          OpenAD_Symbol_136 = (OpenAD_Symbol_4 + OpenAD_Symbol_135 *
     >  OpenAD_Symbol_5)
          OpenAD_Symbol_137 = (OpenAD_Symbol_1 + OpenAD_Symbol_0)
          CALL setderiv(__deriv__(S), __deriv__(SFLD(I, J, K, BI, BJ)))
          CALL setderiv(__deriv__(T), __deriv__(TFLD(I, J, K, BI, BJ)))
          CALL sax(OpenAD_Symbol_135, __deriv__(TFLD(I, J, K, BI, BJ)),
     >  __deriv__(T3))
          CALL sax(OpenAD_Symbol_136, __deriv__(TFLD(I, J, K, BI, BJ)),
     >  __deriv__(T4))
          CALL sax(OpenAD_Symbol_137, __deriv__(TFLD(I, J, K, BI, BJ)),
     >  __deriv__(T2))
          IF(__value__(S) .GT. 0.0D00) THEN
            OpenAD_Symbol_6 = SQRT(__value__(S))
            __value__(S3O2) = (__value__(S) * OpenAD_Symbol_6)
            OpenAD_Symbol_7 = OpenAD_Symbol_6
            OpenAD_Symbol_9 = (5.0D-01 / OpenAD_Symbol_6)
            OpenAD_Symbol_8 = __value__(S)
            OpenAD_Symbol_138 = (OpenAD_Symbol_9 * OpenAD_Symbol_8)
            OpenAD_Symbol_139 = OpenAD_Symbol_7
            CALL sax(OpenAD_Symbol_138, __deriv__(S), __deriv__(S3O2))
            CALL saxpy(OpenAD_Symbol_139, __deriv__(S), __deriv__(S3O2)
     > )
          ELSE
            __value__(S) = 0.0D00
            __value__(S3O2) = 0.0D00
            CALL zero_deriv(__deriv__(S))
            CALL zero_deriv(__deriv__(S3O2))
          ENDIF
          __value__(P) = (__value__(LOCPRES(I, J)) * SITOBAR)
          OpenAD_Symbol_10 = SITOBAR
          __value__(P2) = (__value__(P) * __value__(P))
          OpenAD_Symbol_12 = __value__(P)
          OpenAD_Symbol_13 = __value__(P)
          __value__(BMFRESH) = (EOSJMDCKFW(1) + EOSJMDCKFW(2) *
     >  __value__(T) + EOSJMDCKFW(3) * __value__(T2) + EOSJMDCKFW(4) *
     >  __value__(T3) + EOSJMDCKFW(5) * __value__(T4))
          OpenAD_Symbol_23 = EOSJMDCKFW(2)
          OpenAD_Symbol_21 = 1_w2f__i8
          OpenAD_Symbol_18 = 1_w2f__i8
          OpenAD_Symbol_25 = EOSJMDCKFW(3)
          OpenAD_Symbol_19 = 1_w2f__i8
          OpenAD_Symbol_16 = 1_w2f__i8
          OpenAD_Symbol_27 = EOSJMDCKFW(4)
          OpenAD_Symbol_17 = 1_w2f__i8
          OpenAD_Symbol_14 = 1_w2f__i8
          OpenAD_Symbol_29 = EOSJMDCKFW(5)
          OpenAD_Symbol_15 = 1_w2f__i8
          OpenAD_Symbol_32 = (EOSJMDCKSW(1) + EOSJMDCKSW(2) * __value__
     > (T) + EOSJMDCKSW(3) * __value__(T2) + EOSJMDCKSW(4) * __value__(
     > T3))
          OpenAD_Symbol_47 = (EOSJMDCKSW(5) + EOSJMDCKSW(6) * __value__
     > (T) + EOSJMDCKSW(7) * __value__(T2))
          __value__(BMSALT) = (__value__(S) * OpenAD_Symbol_32 +
     >  __value__(S3O2) * OpenAD_Symbol_47)
          OpenAD_Symbol_33 = OpenAD_Symbol_32
          OpenAD_Symbol_42 = EOSJMDCKSW(2)
          OpenAD_Symbol_40 = 1_w2f__i8
          OpenAD_Symbol_37 = 1_w2f__i8
          OpenAD_Symbol_44 = EOSJMDCKSW(3)
          OpenAD_Symbol_38 = 1_w2f__i8
          OpenAD_Symbol_35 = 1_w2f__i8
          OpenAD_Symbol_46 = EOSJMDCKSW(4)
          OpenAD_Symbol_36 = 1_w2f__i8
          OpenAD_Symbol_34 = __value__(S)
          OpenAD_Symbol_30 = 1_w2f__i8
          OpenAD_Symbol_48 = OpenAD_Symbol_47
          OpenAD_Symbol_55 = EOSJMDCKSW(6)
          OpenAD_Symbol_53 = 1_w2f__i8
          OpenAD_Symbol_50 = 1_w2f__i8
          OpenAD_Symbol_57 = EOSJMDCKSW(7)
          OpenAD_Symbol_51 = 1_w2f__i8
          OpenAD_Symbol_49 = __value__(S3O2)
          OpenAD_Symbol_31 = 1_w2f__i8
          OpenAD_Symbol_66 = (EOSJMDCKP(1) + EOSJMDCKP(2) * __value__(T
     > ) + EOSJMDCKP(3) * __value__(T2) + EOSJMDCKP(4) * __value__(T3))
          OpenAD_Symbol_81 = (__value__(P) * __value__(S))
          OpenAD_Symbol_82 = (EOSJMDCKP(5) + EOSJMDCKP(6) * __value__(T
     > ) + EOSJMDCKP(7) * __value__(T2))
          OpenAD_Symbol_95 = (__value__(P) * __value__(S3O2))
          OpenAD_Symbol_100 = (EOSJMDCKP(9) + EOSJMDCKP(10) * __value__
     > (T) + EOSJMDCKP(11) * __value__(T2))
          OpenAD_Symbol_111 = (__value__(P2) * __value__(S))
          OpenAD_Symbol_112 = (EOSJMDCKP(12) + EOSJMDCKP(13) *
     >  __value__(T) + EOSJMDCKP(14) * __value__(T2))
          __value__(BMPRES) = (__value__(P) * OpenAD_Symbol_66 +
     >  OpenAD_Symbol_81 * OpenAD_Symbol_82 + EOSJMDCKP(8) *
     >  OpenAD_Symbol_95 + __value__(P2) * OpenAD_Symbol_100 +
     >  OpenAD_Symbol_111 * OpenAD_Symbol_112)
          OpenAD_Symbol_67 = OpenAD_Symbol_66
          OpenAD_Symbol_76 = EOSJMDCKP(2)
          OpenAD_Symbol_74 = 1_w2f__i8
          OpenAD_Symbol_71 = 1_w2f__i8
          OpenAD_Symbol_78 = EOSJMDCKP(3)
          OpenAD_Symbol_72 = 1_w2f__i8
          OpenAD_Symbol_69 = 1_w2f__i8
          OpenAD_Symbol_80 = EOSJMDCKP(4)
          OpenAD_Symbol_70 = 1_w2f__i8
          OpenAD_Symbol_68 = __value__(P)
          OpenAD_Symbol_64 = 1_w2f__i8
          OpenAD_Symbol_85 = __value__(S)
          OpenAD_Symbol_86 = __value__(P)
          OpenAD_Symbol_83 = OpenAD_Symbol_82
          OpenAD_Symbol_92 = EOSJMDCKP(6)
          OpenAD_Symbol_90 = 1_w2f__i8
          OpenAD_Symbol_87 = 1_w2f__i8
          OpenAD_Symbol_94 = EOSJMDCKP(7)
          OpenAD_Symbol_88 = 1_w2f__i8
          OpenAD_Symbol_84 = OpenAD_Symbol_81
          OpenAD_Symbol_65 = 1_w2f__i8
          OpenAD_Symbol_62 = 1_w2f__i8
          OpenAD_Symbol_98 = __value__(S3O2)
          OpenAD_Symbol_99 = __value__(P)
          OpenAD_Symbol_97 = EOSJMDCKP(8)
          OpenAD_Symbol_63 = 1_w2f__i8
          OpenAD_Symbol_60 = 1_w2f__i8
          OpenAD_Symbol_101 = OpenAD_Symbol_100
          OpenAD_Symbol_108 = EOSJMDCKP(10)
          OpenAD_Symbol_106 = 1_w2f__i8
          OpenAD_Symbol_103 = 1_w2f__i8
          OpenAD_Symbol_110 = EOSJMDCKP(11)
          OpenAD_Symbol_104 = 1_w2f__i8
          OpenAD_Symbol_102 = __value__(P2)
          OpenAD_Symbol_61 = 1_w2f__i8
          OpenAD_Symbol_58 = 1_w2f__i8
          OpenAD_Symbol_115 = __value__(S)
          OpenAD_Symbol_116 = __value__(P2)
          OpenAD_Symbol_113 = OpenAD_Symbol_112
          OpenAD_Symbol_122 = EOSJMDCKP(13)
          OpenAD_Symbol_120 = 1_w2f__i8
          OpenAD_Symbol_117 = 1_w2f__i8
          OpenAD_Symbol_124 = EOSJMDCKP(14)
          OpenAD_Symbol_118 = 1_w2f__i8
          OpenAD_Symbol_114 = OpenAD_Symbol_111
          OpenAD_Symbol_59 = 1_w2f__i8
          __value__(BULKMOD(INT(I), INT(J))) = (__value__(BMPRES) +
     >  __value__(BMFRESH) + __value__(BMSALT))
          OpenAD_Symbol_125 = 1_w2f__i8
          OpenAD_Symbol_127 = 1_w2f__i8
          OpenAD_Symbol_128 = 1_w2f__i8
          OpenAD_Symbol_126 = 1_w2f__i8
          OpenAD_Symbol_140 = (OpenAD_Symbol_10 *(OpenAD_Symbol_13 +
     >  OpenAD_Symbol_12))
          OpenAD_Symbol_141 = (OpenAD_Symbol_10 * OpenAD_Symbol_67)
          OpenAD_Symbol_142 = (OpenAD_Symbol_10 * OpenAD_Symbol_85)
          OpenAD_Symbol_143 = (OpenAD_Symbol_10 * OpenAD_Symbol_98)
          OpenAD_Symbol_144 = (OpenAD_Symbol_58 * OpenAD_Symbol_125)
          OpenAD_Symbol_145 = (OpenAD_Symbol_59 * OpenAD_Symbol_125)
          OpenAD_Symbol_146 = (OpenAD_Symbol_60 * OpenAD_Symbol_144)
          OpenAD_Symbol_147 = (OpenAD_Symbol_61 * OpenAD_Symbol_144)
          OpenAD_Symbol_148 = (OpenAD_Symbol_62 * OpenAD_Symbol_146)
          OpenAD_Symbol_149 = (OpenAD_Symbol_63 * OpenAD_Symbol_146)
          OpenAD_Symbol_150 = (OpenAD_Symbol_127 * OpenAD_Symbol_126)
          OpenAD_Symbol_151 = (OpenAD_Symbol_128 * OpenAD_Symbol_126)
          OpenAD_Symbol_152 = (OpenAD_Symbol_64 * OpenAD_Symbol_148)
          OpenAD_Symbol_153 = (OpenAD_Symbol_65 * OpenAD_Symbol_148)
          OpenAD_Symbol_154 = (OpenAD_Symbol_30 * OpenAD_Symbol_151)
          OpenAD_Symbol_155 = (OpenAD_Symbol_31 * OpenAD_Symbol_151)
          OpenAD_Symbol_156 = (OpenAD_Symbol_68 * OpenAD_Symbol_152)
          OpenAD_Symbol_157 = (OpenAD_Symbol_141 * OpenAD_Symbol_152)
          OpenAD_Symbol_158 = (OpenAD_Symbol_33 * OpenAD_Symbol_154)
          OpenAD_Symbol_159 = (OpenAD_Symbol_34 * OpenAD_Symbol_154)
          OpenAD_Symbol_160 = (OpenAD_Symbol_14 * OpenAD_Symbol_150)
          OpenAD_Symbol_161 = (OpenAD_Symbol_15 * OpenAD_Symbol_150)
          OpenAD_Symbol_162 = (OpenAD_Symbol_113 * OpenAD_Symbol_145)
          OpenAD_Symbol_163 = (OpenAD_Symbol_114 * OpenAD_Symbol_145)
          OpenAD_Symbol_164 = (OpenAD_Symbol_101 * OpenAD_Symbol_147)
          OpenAD_Symbol_165 = (OpenAD_Symbol_102 * OpenAD_Symbol_147)
          OpenAD_Symbol_166 = (OpenAD_Symbol_164 + OpenAD_Symbol_115 *
     >  OpenAD_Symbol_162)
          OpenAD_Symbol_167 = (OpenAD_Symbol_116 * OpenAD_Symbol_162)
          OpenAD_Symbol_168 = (OpenAD_Symbol_83 * OpenAD_Symbol_153)
          OpenAD_Symbol_169 = (OpenAD_Symbol_84 * OpenAD_Symbol_153)
          OpenAD_Symbol_170 = (OpenAD_Symbol_69 * OpenAD_Symbol_156)
          OpenAD_Symbol_171 = (OpenAD_Symbol_70 * OpenAD_Symbol_156)
          OpenAD_Symbol_172 = (OpenAD_Symbol_48 * OpenAD_Symbol_155)
          OpenAD_Symbol_173 = (OpenAD_Symbol_49 * OpenAD_Symbol_155)
          OpenAD_Symbol_174 = (OpenAD_Symbol_35 * OpenAD_Symbol_159)
          OpenAD_Symbol_175 = (OpenAD_Symbol_36 * OpenAD_Symbol_159)
          OpenAD_Symbol_176 = (OpenAD_Symbol_16 * OpenAD_Symbol_160)
          OpenAD_Symbol_177 = (OpenAD_Symbol_17 * OpenAD_Symbol_160)
          OpenAD_Symbol_178 = (OpenAD_Symbol_117 * OpenAD_Symbol_163)
          OpenAD_Symbol_179 = (OpenAD_Symbol_118 * OpenAD_Symbol_163)
          OpenAD_Symbol_180 = (OpenAD_Symbol_103 * OpenAD_Symbol_165)
          OpenAD_Symbol_181 = (OpenAD_Symbol_104 * OpenAD_Symbol_165)
          OpenAD_Symbol_182 = (OpenAD_Symbol_87 * OpenAD_Symbol_169)
          OpenAD_Symbol_183 = (OpenAD_Symbol_88 * OpenAD_Symbol_169)
          OpenAD_Symbol_184 = (OpenAD_Symbol_71 * OpenAD_Symbol_170)
          OpenAD_Symbol_185 = (OpenAD_Symbol_72 * OpenAD_Symbol_170)
          OpenAD_Symbol_186 = (OpenAD_Symbol_50 * OpenAD_Symbol_173)
          OpenAD_Symbol_187 = (OpenAD_Symbol_51 * OpenAD_Symbol_173)
          OpenAD_Symbol_188 = (OpenAD_Symbol_37 * OpenAD_Symbol_174)
          OpenAD_Symbol_189 = (OpenAD_Symbol_38 * OpenAD_Symbol_174)
          OpenAD_Symbol_190 = (OpenAD_Symbol_18 * OpenAD_Symbol_176)
          OpenAD_Symbol_191 = (OpenAD_Symbol_19 * OpenAD_Symbol_176)
          OpenAD_Symbol_192 = (OpenAD_Symbol_86 * OpenAD_Symbol_168)
          OpenAD_Symbol_193 = (OpenAD_Symbol_157 + OpenAD_Symbol_142 *
     >  OpenAD_Symbol_168)
          OpenAD_Symbol_194 = (OpenAD_Symbol_120 * OpenAD_Symbol_178)
          OpenAD_Symbol_195 = (OpenAD_Symbol_106 * OpenAD_Symbol_180)
          OpenAD_Symbol_196 = (OpenAD_Symbol_97 * OpenAD_Symbol_149)
          OpenAD_Symbol_197 = (OpenAD_Symbol_99 * OpenAD_Symbol_196)
          OpenAD_Symbol_198 = (OpenAD_Symbol_193 + OpenAD_Symbol_143 *
     >  OpenAD_Symbol_196)
          OpenAD_Symbol_199 = (OpenAD_Symbol_90 * OpenAD_Symbol_182)
          OpenAD_Symbol_200 = (OpenAD_Symbol_74 * OpenAD_Symbol_184)
          OpenAD_Symbol_201 = (OpenAD_Symbol_53 * OpenAD_Symbol_186)
          OpenAD_Symbol_202 = (OpenAD_Symbol_40 * OpenAD_Symbol_188)
          OpenAD_Symbol_203 = (OpenAD_Symbol_21 * OpenAD_Symbol_190)
          OpenAD_Symbol_204 = (OpenAD_Symbol_124 * OpenAD_Symbol_179)
          OpenAD_Symbol_205 = (OpenAD_Symbol_122 * OpenAD_Symbol_194)
          OpenAD_Symbol_206 = (OpenAD_Symbol_110 * OpenAD_Symbol_181)
          OpenAD_Symbol_207 = (OpenAD_Symbol_108 * OpenAD_Symbol_195)
          OpenAD_Symbol_208 = (OpenAD_Symbol_94 * OpenAD_Symbol_183)
          OpenAD_Symbol_209 = (OpenAD_Symbol_92 * OpenAD_Symbol_199)
          OpenAD_Symbol_210 = (OpenAD_Symbol_80 * OpenAD_Symbol_171)
          OpenAD_Symbol_211 = (OpenAD_Symbol_78 * OpenAD_Symbol_185)
          OpenAD_Symbol_212 = (OpenAD_Symbol_76 * OpenAD_Symbol_200)
          OpenAD_Symbol_213 = (OpenAD_Symbol_57 * OpenAD_Symbol_187)
          OpenAD_Symbol_214 = (OpenAD_Symbol_55 * OpenAD_Symbol_201)
          OpenAD_Symbol_215 = (OpenAD_Symbol_46 * OpenAD_Symbol_175)
          OpenAD_Symbol_216 = (OpenAD_Symbol_44 * OpenAD_Symbol_189)
          OpenAD_Symbol_217 = (OpenAD_Symbol_42 * OpenAD_Symbol_202)
          OpenAD_Symbol_218 = (OpenAD_Symbol_29 * OpenAD_Symbol_161)
          OpenAD_Symbol_219 = (OpenAD_Symbol_27 * OpenAD_Symbol_177)
          OpenAD_Symbol_220 = (OpenAD_Symbol_25 * OpenAD_Symbol_191)
          OpenAD_Symbol_221 = (OpenAD_Symbol_23 * OpenAD_Symbol_203)
          OpenAD_Symbol_222 = (OpenAD_Symbol_198 + OpenAD_Symbol_140 *
     >  OpenAD_Symbol_166)
          CALL sax(OpenAD_Symbol_158, __deriv__(S), __deriv__(BULKMOD(I
     > , J)))
          CALL saxpy(OpenAD_Symbol_167, __deriv__(S), __deriv__(BULKMOD
     > (I, J)))
          CALL saxpy(OpenAD_Symbol_172, __deriv__(S3O2), __deriv__(
     > BULKMOD(I, J)))
          CALL saxpy(OpenAD_Symbol_192, __deriv__(S), __deriv__(BULKMOD
     > (I, J)))
          CALL saxpy(OpenAD_Symbol_197, __deriv__(S3O2), __deriv__(
     > BULKMOD(I, J)))
          CALL saxpy(OpenAD_Symbol_204, __deriv__(T2), __deriv__(
     > BULKMOD(I, J)))
          CALL saxpy(OpenAD_Symbol_205, __deriv__(T), __deriv__(BULKMOD
     > (I, J)))
          CALL saxpy(OpenAD_Symbol_206, __deriv__(T2), __deriv__(
     > BULKMOD(I, J)))
          CALL saxpy(OpenAD_Symbol_207, __deriv__(T), __deriv__(BULKMOD
     > (I, J)))
          CALL saxpy(OpenAD_Symbol_208, __deriv__(T2), __deriv__(
     > BULKMOD(I, J)))
          CALL saxpy(OpenAD_Symbol_209, __deriv__(T), __deriv__(BULKMOD
     > (I, J)))
          CALL saxpy(OpenAD_Symbol_210, __deriv__(T3), __deriv__(
     > BULKMOD(I, J)))
          CALL saxpy(OpenAD_Symbol_211, __deriv__(T2), __deriv__(
     > BULKMOD(I, J)))
          CALL saxpy(OpenAD_Symbol_212, __deriv__(T), __deriv__(BULKMOD
     > (I, J)))
          CALL saxpy(OpenAD_Symbol_213, __deriv__(T2), __deriv__(
     > BULKMOD(I, J)))
          CALL saxpy(OpenAD_Symbol_214, __deriv__(T), __deriv__(BULKMOD
     > (I, J)))
          CALL saxpy(OpenAD_Symbol_215, __deriv__(T3), __deriv__(
     > BULKMOD(I, J)))
          CALL saxpy(OpenAD_Symbol_216, __deriv__(T2), __deriv__(
     > BULKMOD(I, J)))
          CALL saxpy(OpenAD_Symbol_217, __deriv__(T), __deriv__(BULKMOD
     > (I, J)))
          CALL saxpy(OpenAD_Symbol_218, __deriv__(T4), __deriv__(
     > BULKMOD(I, J)))
          CALL saxpy(OpenAD_Symbol_219, __deriv__(T3), __deriv__(
     > BULKMOD(I, J)))
          CALL saxpy(OpenAD_Symbol_220, __deriv__(T2), __deriv__(
     > BULKMOD(I, J)))
          CALL saxpy(OpenAD_Symbol_221, __deriv__(T), __deriv__(BULKMOD
     > (I, J)))
          CALL saxpy(OpenAD_Symbol_222, __deriv__(LOCPRES(I, J)),
     >  __deriv__(BULKMOD(I, J)))
        END DO
      END DO
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_129
      REAL(w2f__8) OpenAD_Symbol_131
      REAL(w2f__8) OpenAD_Symbol_133
      REAL(w2f__8) OpenAD_Symbol_223
      REAL(w2f__8) OpenAD_Symbol_224
      REAL(w2f__8) OpenAD_Symbol_225
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 32)
      TYPE (OpenADTy_active) Y(1 : 4)
C
C     **** Local Variables and Functions ****
C
      TYPE (OpenADTy_active) BULKMOD(1 : 2, 1 : 2)
      EXTERNAL find_bulkmod
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) J
      INTEGER(w2f__i4) K
      INTEGER(w2f__i4) L
      TYPE (OpenADTy_active) LOCPRES(1 : 2, 1 : 2)
      INTEGER(w2f__i4) M
      TYPE (OpenADTy_active) SFLD(1 : 2, 1 : 2, 1 : 2, 1 : 2, 1 : 2)
      TYPE (OpenADTy_active) TFLD(1 : 2, 1 : 2, 1 : 2, 1 : 2, 1 : 2)
      INTEGER(w2f__i4) XCOUNT
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      XCOUNT = 1
      DO I = 1, 2, 1
        DO J = 1, 2, 1
          __value__(LOCPRES(INT(I), INT(J))) = (__value__(X(XCOUNT)) *
     >  2.0D00)
          OpenAD_Symbol_129 = 2.0D00
          OpenAD_Symbol_223 = OpenAD_Symbol_129
          CALL sax(OpenAD_Symbol_223, __deriv__(X(XCOUNT)), __deriv__(
     > LOCPRES(I, J)))
          DO K = 1, 2, 1
            DO L = 1, 2, 1
              DO M = 1, 2, 1
                __value__(TFLD(INT(I), INT(J), INT(K), INT(L), INT(M)))
     >  = (__value__(X(XCOUNT)) * 3.0D00)
                OpenAD_Symbol_131 = 3.0D00
                __value__(SFLD(INT(I), INT(J), INT(K), INT(L), INT(M)))
     >  = (__value__(X(XCOUNT)) * 4.0D00)
                OpenAD_Symbol_133 = 4.0D00
                OpenAD_Symbol_224 = OpenAD_Symbol_131
                OpenAD_Symbol_225 = OpenAD_Symbol_133
                CALL sax(OpenAD_Symbol_224, __deriv__(X(XCOUNT)),
     >  __deriv__(TFLD(I, J, K, L, M)))
                CALL sax(OpenAD_Symbol_225, __deriv__(X(XCOUNT)),
     >  __deriv__(SFLD(I, J, K, L, M)))
                XCOUNT = XCOUNT + 1
              END DO
            END DO
          END DO
        END DO
      END DO
      CALL find_bulkmod(__deriv__(LOCPRES), __deriv__(TFLD), __deriv__(
     > SFLD), __deriv__(BULKMOD))
      DO I = 1, 2, 1
        DO J = 1, 2, 1
          __value__(Y(INT(J + INT((I * 2)) +(-2)))) = __value__(BULKMOD
     > (I, J))
          CALL setderiv(__deriv__(Y(J + I * 2 + (-2))), __deriv__(
     > BULKMOD(I, J)))
        END DO
      END DO
      END SUBROUTINE
