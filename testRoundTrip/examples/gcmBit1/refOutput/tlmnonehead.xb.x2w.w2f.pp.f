

      SUBROUTINE find_bulkmod(LOCPRES, TFLD, SFLD, BULKMOD)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_100
      REAL(w2f__8) OpenAD_Symbol_102
      REAL(w2f__8) OpenAD_Symbol_103
      REAL(w2f__8) OpenAD_Symbol_105
      REAL(w2f__8) OpenAD_Symbol_106
      REAL(w2f__8) OpenAD_Symbol_107
      REAL(w2f__8) OpenAD_Symbol_108
      REAL(w2f__8) OpenAD_Symbol_109
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_110
      REAL(w2f__8) OpenAD_Symbol_111
      REAL(w2f__8) OpenAD_Symbol_112
      REAL(w2f__8) OpenAD_Symbol_114
      REAL(w2f__8) OpenAD_Symbol_116
      REAL(w2f__8) OpenAD_Symbol_118
      REAL(w2f__8) OpenAD_Symbol_119
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_120
      REAL(w2f__8) OpenAD_Symbol_121
      REAL(w2f__8) OpenAD_Symbol_122
      REAL(w2f__8) OpenAD_Symbol_123
      REAL(w2f__8) OpenAD_Symbol_124
      REAL(w2f__8) OpenAD_Symbol_125
      REAL(w2f__8) OpenAD_Symbol_126
      REAL(w2f__8) OpenAD_Symbol_128
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_130
      REAL(w2f__8) OpenAD_Symbol_132
      REAL(w2f__8) OpenAD_Symbol_133
      REAL(w2f__8) OpenAD_Symbol_134
      REAL(w2f__8) OpenAD_Symbol_135
      REAL(w2f__8) OpenAD_Symbol_136
      REAL(w2f__8) OpenAD_Symbol_137
      REAL(w2f__8) OpenAD_Symbol_14
      type(active) :: OpenAD_Symbol_147
      type(active) :: OpenAD_Symbol_148
      REAL(w2f__8) OpenAD_Symbol_149
      REAL(w2f__8) OpenAD_Symbol_150
      REAL(w2f__8) OpenAD_Symbol_151
      REAL(w2f__8) OpenAD_Symbol_152
      type(active) :: OpenAD_Symbol_153
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
      type(active) :: OpenAD_Symbol_174
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
      type(active) :: OpenAD_Symbol_189
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
      REAL(w2f__8) OpenAD_Symbol_20
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
      REAL(w2f__8) OpenAD_Symbol_22
      REAL(w2f__8) OpenAD_Symbol_220
      REAL(w2f__8) OpenAD_Symbol_221
      type(active) :: OpenAD_Symbol_222
      REAL(w2f__8) OpenAD_Symbol_223
      type(active) :: OpenAD_Symbol_224
      REAL(w2f__8) OpenAD_Symbol_225
      REAL(w2f__8) OpenAD_Symbol_226
      REAL(w2f__8) OpenAD_Symbol_227
      REAL(w2f__8) OpenAD_Symbol_228
      REAL(w2f__8) OpenAD_Symbol_229
      REAL(w2f__8) OpenAD_Symbol_23
      type(active) :: OpenAD_Symbol_230
      REAL(w2f__8) OpenAD_Symbol_231
      REAL(w2f__8) OpenAD_Symbol_232
      REAL(w2f__8) OpenAD_Symbol_233
      REAL(w2f__8) OpenAD_Symbol_234
      REAL(w2f__8) OpenAD_Symbol_235
      REAL(w2f__8) OpenAD_Symbol_236
      REAL(w2f__8) OpenAD_Symbol_237
      REAL(w2f__8) OpenAD_Symbol_238
      type(active) :: OpenAD_Symbol_239
      REAL(w2f__8) OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_240
      REAL(w2f__8) OpenAD_Symbol_241
      REAL(w2f__8) OpenAD_Symbol_242
      REAL(w2f__8) OpenAD_Symbol_243
      type(active) :: OpenAD_Symbol_244
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_27
      REAL(w2f__8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_31
      REAL(w2f__8) OpenAD_Symbol_33
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
      REAL(w2f__8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_51
      REAL(w2f__8) OpenAD_Symbol_53
      REAL(w2f__8) OpenAD_Symbol_54
      REAL(w2f__8) OpenAD_Symbol_55
      REAL(w2f__8) OpenAD_Symbol_56
      REAL(w2f__8) OpenAD_Symbol_57
      REAL(w2f__8) OpenAD_Symbol_58
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_60
      REAL(w2f__8) OpenAD_Symbol_62
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
      REAL(w2f__8) OpenAD_Symbol_73
      REAL(w2f__8) OpenAD_Symbol_74
      REAL(w2f__8) OpenAD_Symbol_75
      REAL(w2f__8) OpenAD_Symbol_76
      REAL(w2f__8) OpenAD_Symbol_77
      REAL(w2f__8) OpenAD_Symbol_78
      REAL(w2f__8) OpenAD_Symbol_79
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_80
      REAL(w2f__8) OpenAD_Symbol_82
      REAL(w2f__8) OpenAD_Symbol_84
      REAL(w2f__8) OpenAD_Symbol_86
      REAL(w2f__8) OpenAD_Symbol_88
      REAL(w2f__8) OpenAD_Symbol_89
      REAL(w2f__8) OpenAD_Symbol_9
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_91
      REAL(w2f__8) OpenAD_Symbol_92
      REAL(w2f__8) OpenAD_Symbol_93
      REAL(w2f__8) OpenAD_Symbol_94
      REAL(w2f__8) OpenAD_Symbol_95
      REAL(w2f__8) OpenAD_Symbol_96
      REAL(w2f__8) OpenAD_Symbol_98
C
C     **** Parameters and Result ****
C
      type(active) :: LOCPRES(1 : 2, 1 : 2)
      type(active) :: TFLD(1 : 2, 1 : 2, 1 : 2, 1 : 2, 1 : 2)
      type(active) :: SFLD(1 : 2, 1 : 2, 1 : 2, 1 : 2, 1 : 2)
      type(active) :: BULKMOD(1 : 2, 1 : 2)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) BI
      INTEGER(w2f__i4) BJ
      type(active) :: BMFRESH
      type(active) :: BMPRES
      type(active) :: BMSALT
      REAL(w2f__8) EOSJMDCKFW(1 : 5)
      REAL(w2f__8) EOSJMDCKP(1 : 14)
      REAL(w2f__8) EOSJMDCKSW(1 : 7)
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) J
      INTEGER(w2f__i4) K
      type(active) :: P
      type(active) :: P2
      type(active) :: S
      type(active) :: S3O2
      REAL(w2f__8) SITOBAR
      type(active) :: T
      type(active) :: T2
      type(active) :: T3
      type(active) :: T4
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
          T%v = TFLD(I,J,K,BI,BJ)%v
          OpenAD_Symbol_2 = (T%v*T%v)
          OpenAD_Symbol_0 = T%v
          OpenAD_Symbol_1 = T%v
          T2%v = OpenAD_Symbol_2
          OpenAD_Symbol_5 = (T%v*T2%v)
          OpenAD_Symbol_3 = T2%v
          OpenAD_Symbol_4 = T%v
          T3%v = OpenAD_Symbol_5
          OpenAD_Symbol_8 = (T%v*T3%v)
          OpenAD_Symbol_6 = T3%v
          OpenAD_Symbol_7 = T%v
          T4%v = OpenAD_Symbol_8
          S%v = SFLD(I,J,K,BI,BJ)%v
          OpenAD_Symbol_149 = (OpenAD_Symbol_3 +(OpenAD_Symbol_1 +
     >  OpenAD_Symbol_0) * OpenAD_Symbol_4)
          OpenAD_Symbol_150 = (OpenAD_Symbol_6 + OpenAD_Symbol_149 *
     >  OpenAD_Symbol_7)
          OpenAD_Symbol_151 = (OpenAD_Symbol_1 + OpenAD_Symbol_0)
          CALL setderiv(OpenAD_Symbol_148,TFLD(I,J,K,BI,BJ))
          CALL setderiv(OpenAD_Symbol_147,SFLD(I,J,K,BI,BJ))
          CALL setderiv(S,OpenAD_Symbol_147)
          CALL setderiv(T,OpenAD_Symbol_148)
          CALL sax(OpenAD_Symbol_149,OpenAD_Symbol_148,T3)
          CALL sax(OpenAD_Symbol_150,OpenAD_Symbol_148,T4)
          CALL sax(OpenAD_Symbol_151,OpenAD_Symbol_148,T2)
          IF (S%v .GT. 0.0D00) THEN
            OpenAD_Symbol_9 = SQRT(S%v)
            OpenAD_Symbol_13 = (S%v*OpenAD_Symbol_9)
            OpenAD_Symbol_10 = OpenAD_Symbol_9
            OpenAD_Symbol_12 = (5.0D-01 / OpenAD_Symbol_9)
            OpenAD_Symbol_11 = S%v
            S3O2%v = OpenAD_Symbol_13
            OpenAD_Symbol_152 = (OpenAD_Symbol_12 * OpenAD_Symbol_11)
            OpenAD_Symbol_154 = OpenAD_Symbol_10
            CALL setderiv(OpenAD_Symbol_153,S)
            CALL sax(OpenAD_Symbol_152,OpenAD_Symbol_153,S3O2)
            CALL saxpy(OpenAD_Symbol_154,OpenAD_Symbol_153,S3O2)
          ELSE
            S%v = 0.0D00
            S3O2%v = 0.0D00
            CALL zero_deriv(S)
            CALL zero_deriv(S3O2)
          ENDIF
          OpenAD_Symbol_16 = (LOCPRES(I,J)%v*SITOBAR)
          OpenAD_Symbol_14 = SITOBAR
          P%v = OpenAD_Symbol_16
          OpenAD_Symbol_19 = (P%v*P%v)
          OpenAD_Symbol_17 = P%v
          OpenAD_Symbol_18 = P%v
          P2%v = OpenAD_Symbol_19
          OpenAD_Symbol_36 = (EOSJMDCKFW(1)+EOSJMDCKFW(2)*T%v+EOSJMDCKFW
     +(3)*T2%v+EOSJMDCKFW(4)*T3%v+EOSJMDCKFW(5)*T4%v)
          OpenAD_Symbol_29 = EOSJMDCKFW(2)
          OpenAD_Symbol_27 = 1_w2f__i8
          OpenAD_Symbol_24 = 1_w2f__i8
          OpenAD_Symbol_31 = EOSJMDCKFW(3)
          OpenAD_Symbol_25 = 1_w2f__i8
          OpenAD_Symbol_22 = 1_w2f__i8
          OpenAD_Symbol_33 = EOSJMDCKFW(4)
          OpenAD_Symbol_23 = 1_w2f__i8
          OpenAD_Symbol_20 = 1_w2f__i8
          OpenAD_Symbol_35 = EOSJMDCKFW(5)
          OpenAD_Symbol_21 = 1_w2f__i8
          BMFRESH%v = OpenAD_Symbol_36
          OpenAD_Symbol_39 = (EOSJMDCKSW(1)+EOSJMDCKSW(2)*T%v+EOSJMDCKSW
     +(3)*T2%v+EOSJMDCKSW(4)*T3%v)
          OpenAD_Symbol_54 = (EOSJMDCKSW(5)+EOSJMDCKSW(6)*T%v+EOSJMDCKSW
     +(7)*T2%v)
          OpenAD_Symbol_65 = (S%v*OpenAD_Symbol_39+S3O2%v*OpenAD_Symbol_
     +54)
          OpenAD_Symbol_40 = OpenAD_Symbol_39
          OpenAD_Symbol_49 = EOSJMDCKSW(2)
          OpenAD_Symbol_47 = 1_w2f__i8
          OpenAD_Symbol_44 = 1_w2f__i8
          OpenAD_Symbol_51 = EOSJMDCKSW(3)
          OpenAD_Symbol_45 = 1_w2f__i8
          OpenAD_Symbol_42 = 1_w2f__i8
          OpenAD_Symbol_53 = EOSJMDCKSW(4)
          OpenAD_Symbol_43 = 1_w2f__i8
          OpenAD_Symbol_41 = S%v
          OpenAD_Symbol_37 = 1_w2f__i8
          OpenAD_Symbol_55 = OpenAD_Symbol_54
          OpenAD_Symbol_62 = EOSJMDCKSW(6)
          OpenAD_Symbol_60 = 1_w2f__i8
          OpenAD_Symbol_57 = 1_w2f__i8
          OpenAD_Symbol_64 = EOSJMDCKSW(7)
          OpenAD_Symbol_58 = 1_w2f__i8
          OpenAD_Symbol_56 = S3O2%v
          OpenAD_Symbol_38 = 1_w2f__i8
          BMSALT%v = OpenAD_Symbol_65
          OpenAD_Symbol_74 = (EOSJMDCKP(1)+EOSJMDCKP(2)*T%v+EOSJMDCKP(3)
     +*T2%v+EOSJMDCKP(4)*T3%v)
          OpenAD_Symbol_89 = (P%v*S%v)
          OpenAD_Symbol_90 = (EOSJMDCKP(5)+EOSJMDCKP(6)*T%v+EOSJMDCKP(7)
     +*T2%v)
          OpenAD_Symbol_103 = (P%v*S3O2%v)
          OpenAD_Symbol_108 = (EOSJMDCKP(9)+EOSJMDCKP(10)*T%v+EOSJMDCKP(
     +11)*T2%v)
          OpenAD_Symbol_119 = (P2%v*S%v)
          OpenAD_Symbol_120 = (EOSJMDCKP(12)+EOSJMDCKP(13)*T%v+EOSJMDCKP
     +(14)*T2%v)
          OpenAD_Symbol_133 = (P%v*OpenAD_Symbol_74+OpenAD_Symbol_89*Ope
     +nAD_Symbol_90+EOSJMDCKP(8)*OpenAD_Symbol_103+P2%v*OpenAD_Symbol_10
     +8+OpenAD_Symbol_119*OpenAD_Symbol_120)
          OpenAD_Symbol_75 = OpenAD_Symbol_74
          OpenAD_Symbol_84 = EOSJMDCKP(2)
          OpenAD_Symbol_82 = 1_w2f__i8
          OpenAD_Symbol_79 = 1_w2f__i8
          OpenAD_Symbol_86 = EOSJMDCKP(3)
          OpenAD_Symbol_80 = 1_w2f__i8
          OpenAD_Symbol_77 = 1_w2f__i8
          OpenAD_Symbol_88 = EOSJMDCKP(4)
          OpenAD_Symbol_78 = 1_w2f__i8
          OpenAD_Symbol_76 = P%v
          OpenAD_Symbol_72 = 1_w2f__i8
          OpenAD_Symbol_93 = S%v
          OpenAD_Symbol_94 = P%v
          OpenAD_Symbol_91 = OpenAD_Symbol_90
          OpenAD_Symbol_100 = EOSJMDCKP(6)
          OpenAD_Symbol_98 = 1_w2f__i8
          OpenAD_Symbol_95 = 1_w2f__i8
          OpenAD_Symbol_102 = EOSJMDCKP(7)
          OpenAD_Symbol_96 = 1_w2f__i8
          OpenAD_Symbol_92 = OpenAD_Symbol_89
          OpenAD_Symbol_73 = 1_w2f__i8
          OpenAD_Symbol_70 = 1_w2f__i8
          OpenAD_Symbol_106 = S3O2%v
          OpenAD_Symbol_107 = P%v
          OpenAD_Symbol_105 = EOSJMDCKP(8)
          OpenAD_Symbol_71 = 1_w2f__i8
          OpenAD_Symbol_68 = 1_w2f__i8
          OpenAD_Symbol_109 = OpenAD_Symbol_108
          OpenAD_Symbol_116 = EOSJMDCKP(10)
          OpenAD_Symbol_114 = 1_w2f__i8
          OpenAD_Symbol_111 = 1_w2f__i8
          OpenAD_Symbol_118 = EOSJMDCKP(11)
          OpenAD_Symbol_112 = 1_w2f__i8
          OpenAD_Symbol_110 = P2%v
          OpenAD_Symbol_69 = 1_w2f__i8
          OpenAD_Symbol_66 = 1_w2f__i8
          OpenAD_Symbol_123 = S%v
          OpenAD_Symbol_124 = P2%v
          OpenAD_Symbol_121 = OpenAD_Symbol_120
          OpenAD_Symbol_130 = EOSJMDCKP(13)
          OpenAD_Symbol_128 = 1_w2f__i8
          OpenAD_Symbol_125 = 1_w2f__i8
          OpenAD_Symbol_132 = EOSJMDCKP(14)
          OpenAD_Symbol_126 = 1_w2f__i8
          OpenAD_Symbol_122 = OpenAD_Symbol_119
          OpenAD_Symbol_67 = 1_w2f__i8
          BMPRES%v = OpenAD_Symbol_133
          BULKMOD(INT(I),INT(J))%v = (BMPRES%v+BMFRESH%v+BMSALT%v)
          OpenAD_Symbol_134 = 1_w2f__i8
          OpenAD_Symbol_136 = 1_w2f__i8
          OpenAD_Symbol_137 = 1_w2f__i8
          OpenAD_Symbol_135 = 1_w2f__i8
          OpenAD_Symbol_155 = (OpenAD_Symbol_14 *(OpenAD_Symbol_18 +
     >  OpenAD_Symbol_17))
          OpenAD_Symbol_156 = (OpenAD_Symbol_14 * OpenAD_Symbol_75)
          OpenAD_Symbol_157 = (OpenAD_Symbol_14 * OpenAD_Symbol_93)
          OpenAD_Symbol_158 = (OpenAD_Symbol_14 * OpenAD_Symbol_106)
          OpenAD_Symbol_159 = (OpenAD_Symbol_66 * OpenAD_Symbol_134)
          OpenAD_Symbol_160 = (OpenAD_Symbol_67 * OpenAD_Symbol_134)
          OpenAD_Symbol_161 = (OpenAD_Symbol_68 * OpenAD_Symbol_159)
          OpenAD_Symbol_162 = (OpenAD_Symbol_69 * OpenAD_Symbol_159)
          OpenAD_Symbol_163 = (OpenAD_Symbol_70 * OpenAD_Symbol_161)
          OpenAD_Symbol_164 = (OpenAD_Symbol_71 * OpenAD_Symbol_161)
          OpenAD_Symbol_165 = (OpenAD_Symbol_136 * OpenAD_Symbol_135)
          OpenAD_Symbol_166 = (OpenAD_Symbol_137 * OpenAD_Symbol_135)
          OpenAD_Symbol_167 = (OpenAD_Symbol_72 * OpenAD_Symbol_163)
          OpenAD_Symbol_168 = (OpenAD_Symbol_73 * OpenAD_Symbol_163)
          OpenAD_Symbol_169 = (OpenAD_Symbol_37 * OpenAD_Symbol_166)
          OpenAD_Symbol_170 = (OpenAD_Symbol_38 * OpenAD_Symbol_166)
          OpenAD_Symbol_171 = (OpenAD_Symbol_76 * OpenAD_Symbol_167)
          OpenAD_Symbol_172 = (OpenAD_Symbol_156 * OpenAD_Symbol_167)
          OpenAD_Symbol_173 = (OpenAD_Symbol_40 * OpenAD_Symbol_169)
          OpenAD_Symbol_175 = (OpenAD_Symbol_41 * OpenAD_Symbol_169)
          OpenAD_Symbol_176 = (OpenAD_Symbol_20 * OpenAD_Symbol_165)
          OpenAD_Symbol_177 = (OpenAD_Symbol_21 * OpenAD_Symbol_165)
          OpenAD_Symbol_178 = (OpenAD_Symbol_121 * OpenAD_Symbol_160)
          OpenAD_Symbol_179 = (OpenAD_Symbol_122 * OpenAD_Symbol_160)
          OpenAD_Symbol_180 = (OpenAD_Symbol_109 * OpenAD_Symbol_162)
          OpenAD_Symbol_181 = (OpenAD_Symbol_110 * OpenAD_Symbol_162)
          OpenAD_Symbol_182 = (OpenAD_Symbol_180 + OpenAD_Symbol_123 *
     >  OpenAD_Symbol_178)
          OpenAD_Symbol_183 = (OpenAD_Symbol_124 * OpenAD_Symbol_178)
          OpenAD_Symbol_184 = (OpenAD_Symbol_91 * OpenAD_Symbol_168)
          OpenAD_Symbol_185 = (OpenAD_Symbol_92 * OpenAD_Symbol_168)
          OpenAD_Symbol_186 = (OpenAD_Symbol_77 * OpenAD_Symbol_171)
          OpenAD_Symbol_187 = (OpenAD_Symbol_78 * OpenAD_Symbol_171)
          OpenAD_Symbol_188 = (OpenAD_Symbol_55 * OpenAD_Symbol_170)
          OpenAD_Symbol_190 = (OpenAD_Symbol_56 * OpenAD_Symbol_170)
          OpenAD_Symbol_191 = (OpenAD_Symbol_42 * OpenAD_Symbol_175)
          OpenAD_Symbol_192 = (OpenAD_Symbol_43 * OpenAD_Symbol_175)
          OpenAD_Symbol_193 = (OpenAD_Symbol_22 * OpenAD_Symbol_176)
          OpenAD_Symbol_194 = (OpenAD_Symbol_23 * OpenAD_Symbol_176)
          OpenAD_Symbol_195 = (OpenAD_Symbol_125 * OpenAD_Symbol_179)
          OpenAD_Symbol_196 = (OpenAD_Symbol_126 * OpenAD_Symbol_179)
          OpenAD_Symbol_197 = (OpenAD_Symbol_111 * OpenAD_Symbol_181)
          OpenAD_Symbol_198 = (OpenAD_Symbol_112 * OpenAD_Symbol_181)
          OpenAD_Symbol_199 = (OpenAD_Symbol_95 * OpenAD_Symbol_185)
          OpenAD_Symbol_200 = (OpenAD_Symbol_96 * OpenAD_Symbol_185)
          OpenAD_Symbol_201 = (OpenAD_Symbol_79 * OpenAD_Symbol_186)
          OpenAD_Symbol_202 = (OpenAD_Symbol_80 * OpenAD_Symbol_186)
          OpenAD_Symbol_203 = (OpenAD_Symbol_57 * OpenAD_Symbol_190)
          OpenAD_Symbol_204 = (OpenAD_Symbol_58 * OpenAD_Symbol_190)
          OpenAD_Symbol_205 = (OpenAD_Symbol_44 * OpenAD_Symbol_191)
          OpenAD_Symbol_206 = (OpenAD_Symbol_45 * OpenAD_Symbol_191)
          OpenAD_Symbol_207 = (OpenAD_Symbol_24 * OpenAD_Symbol_193)
          OpenAD_Symbol_208 = (OpenAD_Symbol_25 * OpenAD_Symbol_193)
          OpenAD_Symbol_209 = (OpenAD_Symbol_94 * OpenAD_Symbol_184)
          OpenAD_Symbol_210 = (OpenAD_Symbol_172 + OpenAD_Symbol_157 *
     >  OpenAD_Symbol_184)
          OpenAD_Symbol_211 = (OpenAD_Symbol_128 * OpenAD_Symbol_195)
          OpenAD_Symbol_212 = (OpenAD_Symbol_114 * OpenAD_Symbol_197)
          OpenAD_Symbol_213 = (OpenAD_Symbol_105 * OpenAD_Symbol_164)
          OpenAD_Symbol_214 = (OpenAD_Symbol_107 * OpenAD_Symbol_213)
          OpenAD_Symbol_215 = (OpenAD_Symbol_210 + OpenAD_Symbol_158 *
     >  OpenAD_Symbol_213)
          OpenAD_Symbol_216 = (OpenAD_Symbol_98 * OpenAD_Symbol_199)
          OpenAD_Symbol_217 = (OpenAD_Symbol_82 * OpenAD_Symbol_201)
          OpenAD_Symbol_218 = (OpenAD_Symbol_60 * OpenAD_Symbol_203)
          OpenAD_Symbol_219 = (OpenAD_Symbol_47 * OpenAD_Symbol_205)
          OpenAD_Symbol_220 = (OpenAD_Symbol_27 * OpenAD_Symbol_207)
          OpenAD_Symbol_221 = (OpenAD_Symbol_132 * OpenAD_Symbol_196)
          OpenAD_Symbol_223 = (OpenAD_Symbol_130 * OpenAD_Symbol_211)
          OpenAD_Symbol_225 = (OpenAD_Symbol_118 * OpenAD_Symbol_198)
          OpenAD_Symbol_226 = (OpenAD_Symbol_116 * OpenAD_Symbol_212)
          OpenAD_Symbol_227 = (OpenAD_Symbol_102 * OpenAD_Symbol_200)
          OpenAD_Symbol_228 = (OpenAD_Symbol_100 * OpenAD_Symbol_216)
          OpenAD_Symbol_229 = (OpenAD_Symbol_88 * OpenAD_Symbol_187)
          OpenAD_Symbol_231 = (OpenAD_Symbol_86 * OpenAD_Symbol_202)
          OpenAD_Symbol_232 = (OpenAD_Symbol_84 * OpenAD_Symbol_217)
          OpenAD_Symbol_233 = (OpenAD_Symbol_64 * OpenAD_Symbol_204)
          OpenAD_Symbol_234 = (OpenAD_Symbol_62 * OpenAD_Symbol_218)
          OpenAD_Symbol_235 = (OpenAD_Symbol_53 * OpenAD_Symbol_192)
          OpenAD_Symbol_236 = (OpenAD_Symbol_51 * OpenAD_Symbol_206)
          OpenAD_Symbol_237 = (OpenAD_Symbol_49 * OpenAD_Symbol_219)
          OpenAD_Symbol_238 = (OpenAD_Symbol_35 * OpenAD_Symbol_177)
          OpenAD_Symbol_240 = (OpenAD_Symbol_33 * OpenAD_Symbol_194)
          OpenAD_Symbol_241 = (OpenAD_Symbol_31 * OpenAD_Symbol_208)
          OpenAD_Symbol_242 = (OpenAD_Symbol_29 * OpenAD_Symbol_220)
          OpenAD_Symbol_243 = (OpenAD_Symbol_215 + OpenAD_Symbol_155 *
     >  OpenAD_Symbol_182)
          CALL setderiv(OpenAD_Symbol_244,LOCPRES(I,J))
          CALL setderiv(OpenAD_Symbol_239,T4)
          CALL setderiv(OpenAD_Symbol_230,T3)
          CALL setderiv(OpenAD_Symbol_224,T)
          CALL setderiv(OpenAD_Symbol_222,T2)
          CALL setderiv(OpenAD_Symbol_189,S3O2)
          CALL setderiv(OpenAD_Symbol_174,S)
          CALL sax(OpenAD_Symbol_173,OpenAD_Symbol_174,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_183,OpenAD_Symbol_174,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_188,OpenAD_Symbol_189,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_209,OpenAD_Symbol_174,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_214,OpenAD_Symbol_189,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_221,OpenAD_Symbol_222,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_223,OpenAD_Symbol_224,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_225,OpenAD_Symbol_222,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_226,OpenAD_Symbol_224,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_227,OpenAD_Symbol_222,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_228,OpenAD_Symbol_224,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_229,OpenAD_Symbol_230,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_231,OpenAD_Symbol_222,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_232,OpenAD_Symbol_224,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_233,OpenAD_Symbol_222,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_234,OpenAD_Symbol_224,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_235,OpenAD_Symbol_230,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_236,OpenAD_Symbol_222,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_237,OpenAD_Symbol_224,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_238,OpenAD_Symbol_239,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_240,OpenAD_Symbol_230,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_241,OpenAD_Symbol_222,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_242,OpenAD_Symbol_224,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_243,OpenAD_Symbol_244,BULKMOD(I,J))
        END DO
      END DO
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_138
      REAL(w2f__8) OpenAD_Symbol_140
      REAL(w2f__8) OpenAD_Symbol_141
      REAL(w2f__8) OpenAD_Symbol_143
      REAL(w2f__8) OpenAD_Symbol_144
      REAL(w2f__8) OpenAD_Symbol_146
      REAL(w2f__8) OpenAD_Symbol_245
      type(active) :: OpenAD_Symbol_246
      REAL(w2f__8) OpenAD_Symbol_247
      type(active) :: OpenAD_Symbol_248
      REAL(w2f__8) OpenAD_Symbol_249
      type(active) :: OpenAD_Symbol_250
      type(active) :: OpenAD_Symbol_251
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 32)
      type(active) :: Y(1 : 4)
C
C     **** Local Variables and Functions ****
C
      type(active) :: BULKMOD(1 : 2, 1 : 2)
      EXTERNAL find_bulkmod
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) J
      INTEGER(w2f__i4) K
      INTEGER(w2f__i4) L
      type(active) :: LOCPRES(1 : 2, 1 : 2)
      INTEGER(w2f__i4) M
      type(active) :: SFLD(1 : 2, 1 : 2, 1 : 2, 1 : 2, 1 : 2)
      type(active) :: TFLD(1 : 2, 1 : 2, 1 : 2, 1 : 2, 1 : 2)
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
          OpenAD_Symbol_140 = (X(XCOUNT)%v*2.0D00)
          OpenAD_Symbol_138 = 2.0D00
          LOCPRES(INT(I),INT(J))%v = OpenAD_Symbol_140
          OpenAD_Symbol_245 = OpenAD_Symbol_138
          CALL setderiv(OpenAD_Symbol_246,X(XCOUNT))
          CALL sax(OpenAD_Symbol_245,OpenAD_Symbol_246,LOCPRES(I,J))
          DO K = 1, 2, 1
            DO L = 1, 2, 1
              DO M = 1, 2, 1
                OpenAD_Symbol_143 = (X(XCOUNT)%v*3.0D00)
                OpenAD_Symbol_141 = 3.0D00
                TFLD(INT(I),INT(J),INT(K),INT(L),INT(M))%v = OpenAD_Symb
     +ol_143
                OpenAD_Symbol_146 = (X(XCOUNT)%v*4.0D00)
                OpenAD_Symbol_144 = 4.0D00
                SFLD(INT(I),INT(J),INT(K),INT(L),INT(M))%v = OpenAD_Symb
     +ol_146
                OpenAD_Symbol_247 = OpenAD_Symbol_141
                OpenAD_Symbol_249 = OpenAD_Symbol_144
                CALL setderiv(OpenAD_Symbol_250,X(XCOUNT))
                CALL setderiv(OpenAD_Symbol_248,X(XCOUNT))
                CALL sax(OpenAD_Symbol_247,OpenAD_Symbol_248,TFLD(I,J,K,
     +L,M))
                CALL sax(OpenAD_Symbol_249,OpenAD_Symbol_250,SFLD(I,J,K,
     +L,M))
                XCOUNT = XCOUNT + 1
              END DO
            END DO
          END DO
        END DO
      END DO
      CALL find_bulkmod(LOCPRES,TFLD,SFLD,BULKMOD)
      DO I = 1, 2, 1
        DO J = 1, 2, 1
          Y(INT(J+INT((I*2))+(-2)))%v = BULKMOD(I,J)%v
          CALL setderiv(OpenAD_Symbol_251,BULKMOD(I,J))
          CALL setderiv(Y(J+I*2+(-2)),OpenAD_Symbol_251)
        END DO
      END DO
      END SUBROUTINE
