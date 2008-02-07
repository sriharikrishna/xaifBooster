

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
      EOSJMDCKFW(1) = 1.9659330078E+04
      EOSJMDCKFW(1) = 1.4443040466E+02
      EOSJMDCKFW(1) = (-1.7061029673)
      EOSJMDCKFW(1) = 9.64870397E-03
      EOSJMDCKFW(1) = (-4.1902530938E-05)
      EOSJMDCKSW(1) = 5.2848548889E+01
      EOSJMDCKSW(2) = (-3.1010890007E-01)
      EOSJMDCKSW(3) = 6.2832632102E-03
      EOSJMDCKSW(4) = (-5.0841881603E-05)
      EOSJMDCKSW(5) = 3.8866400719E-01
      EOSJMDCKSW(6) = 9.085830301E-03
      EOSJMDCKSW(7) = (-4.6199240023E-04)
      EOSJMDCKP(1) = 3.1865189075
      EOSJMDCKP(2) = 2.2122759372E-02
      EOSJMDCKP(3) = (-2.9846420512E-04)
      EOSJMDCKP(4) = 1.9564149625E-06
      EOSJMDCKP(5) = 6.7043881863E-03
      EOSJMDCKP(6) = (-1.8473180535E-04)
      EOSJMDCKP(7) = 2.0593310524E-07
      EOSJMDCKP(8) = 1.480265928E-04
      EOSJMDCKP(9) = 2.1028979972E-04
      EOSJMDCKP(10) = (-1.2020160284E-05)
      EOSJMDCKP(11) = 1.3946799982E-07
      EOSJMDCKP(12) = (-2.0402369501E-06)
      EOSJMDCKP(13) = 6.128772867E-08
      EOSJMDCKP(14) = 6.2073229889E-10
      K = 1
      BI = 1
      BJ = 1
      SITOBAR = 1.0D00
      DO J = 1, 2, 1
        DO I = 1, 2, 1
          T%v = TFLD(I,J,K,BI,BJ)%v
          T2%v = (T%v*T%v)
          OpenAD_Symbol_0 = T%v
          OpenAD_Symbol_1 = T%v
          T3%v = (T%v*T2%v)
          OpenAD_Symbol_2 = T2%v
          OpenAD_Symbol_3 = T%v
          T4%v = (T%v*T3%v)
          OpenAD_Symbol_4 = T3%v
          OpenAD_Symbol_5 = T%v
          S%v = SFLD(I,J,K,BI,BJ)%v
          OpenAD_Symbol_135 = (OpenAD_Symbol_2 +(OpenAD_Symbol_1 +
     >  OpenAD_Symbol_0) * OpenAD_Symbol_3)
          OpenAD_Symbol_136 = (OpenAD_Symbol_4 + OpenAD_Symbol_135 *
     >  OpenAD_Symbol_5)
          OpenAD_Symbol_137 = (OpenAD_Symbol_1 + OpenAD_Symbol_0)
          CALL setderiv(S,SFLD(I,J,K,BI,BJ))
          CALL setderiv(T,TFLD(I,J,K,BI,BJ))
          CALL sax(OpenAD_Symbol_135,TFLD(I,J,K,BI,BJ),T3)
          CALL sax(OpenAD_Symbol_136,TFLD(I,J,K,BI,BJ),T4)
          CALL sax(OpenAD_Symbol_137,TFLD(I,J,K,BI,BJ),T2)
          IF (S%v .GT. 0.0D00) THEN
            OpenAD_Symbol_6 = SQRT(S%v)
            S3O2%v = (S%v*OpenAD_Symbol_6)
            OpenAD_Symbol_7 = OpenAD_Symbol_6
            OpenAD_Symbol_9 = (5.0D-01 / OpenAD_Symbol_6)
            OpenAD_Symbol_8 = S%v
            OpenAD_Symbol_138 = (OpenAD_Symbol_9 * OpenAD_Symbol_8)
            OpenAD_Symbol_139 = OpenAD_Symbol_7
            CALL sax(OpenAD_Symbol_138,S,S3O2)
            CALL saxpy(OpenAD_Symbol_139,S,S3O2)
          ELSE
            S%v = 0.0D00
            S3O2%v = 0.0D00
            CALL zero_deriv(S)
            CALL zero_deriv(S3O2)
          ENDIF
          P%v = (LOCPRES(I,J)%v*SITOBAR)
          OpenAD_Symbol_10 = SITOBAR
          P2%v = (P%v*P%v)
          OpenAD_Symbol_12 = P%v
          OpenAD_Symbol_13 = P%v
          BMFRESH%v = (EOSJMDCKFW(1)+EOSJMDCKFW(2)*T%v+EOSJMDCKFW(3)*T2%
     +v+EOSJMDCKFW(4)*T3%v+EOSJMDCKFW(5)*T4%v)
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
          OpenAD_Symbol_32 = (EOSJMDCKSW(1)+EOSJMDCKSW(2)*T%v+EOSJMDCKSW
     +(3)*T2%v+EOSJMDCKSW(4)*T3%v)
          OpenAD_Symbol_47 = (EOSJMDCKSW(5)+EOSJMDCKSW(6)*T%v+EOSJMDCKSW
     +(7)*T2%v)
          BMSALT%v = (S%v*OpenAD_Symbol_32+S3O2%v*OpenAD_Symbol_47)
          OpenAD_Symbol_33 = OpenAD_Symbol_32
          OpenAD_Symbol_42 = EOSJMDCKSW(2)
          OpenAD_Symbol_40 = 1_w2f__i8
          OpenAD_Symbol_37 = 1_w2f__i8
          OpenAD_Symbol_44 = EOSJMDCKSW(3)
          OpenAD_Symbol_38 = 1_w2f__i8
          OpenAD_Symbol_35 = 1_w2f__i8
          OpenAD_Symbol_46 = EOSJMDCKSW(4)
          OpenAD_Symbol_36 = 1_w2f__i8
          OpenAD_Symbol_34 = S%v
          OpenAD_Symbol_30 = 1_w2f__i8
          OpenAD_Symbol_48 = OpenAD_Symbol_47
          OpenAD_Symbol_55 = EOSJMDCKSW(6)
          OpenAD_Symbol_53 = 1_w2f__i8
          OpenAD_Symbol_50 = 1_w2f__i8
          OpenAD_Symbol_57 = EOSJMDCKSW(7)
          OpenAD_Symbol_51 = 1_w2f__i8
          OpenAD_Symbol_49 = S3O2%v
          OpenAD_Symbol_31 = 1_w2f__i8
          OpenAD_Symbol_66 = (EOSJMDCKP(1)+EOSJMDCKP(2)*T%v+EOSJMDCKP(3)
     +*T2%v+EOSJMDCKP(4)*T3%v)
          OpenAD_Symbol_81 = (P%v*S%v)
          OpenAD_Symbol_82 = (EOSJMDCKP(5)+EOSJMDCKP(6)*T%v+EOSJMDCKP(7)
     +*T2%v)
          OpenAD_Symbol_95 = (P%v*S3O2%v)
          OpenAD_Symbol_100 = (EOSJMDCKP(9)+EOSJMDCKP(10)*T%v+EOSJMDCKP(
     +11)*T2%v)
          OpenAD_Symbol_111 = (P2%v*S%v)
          OpenAD_Symbol_112 = (EOSJMDCKP(12)+EOSJMDCKP(13)*T%v+EOSJMDCKP
     +(14)*T2%v)
          BMPRES%v = (P%v*OpenAD_Symbol_66+OpenAD_Symbol_81*OpenAD_Symbo
     +l_82+EOSJMDCKP(8)*OpenAD_Symbol_95+P2%v*OpenAD_Symbol_100+OpenAD_S
     +ymbol_111*OpenAD_Symbol_112)
          OpenAD_Symbol_67 = OpenAD_Symbol_66
          OpenAD_Symbol_76 = EOSJMDCKP(2)
          OpenAD_Symbol_74 = 1_w2f__i8
          OpenAD_Symbol_71 = 1_w2f__i8
          OpenAD_Symbol_78 = EOSJMDCKP(3)
          OpenAD_Symbol_72 = 1_w2f__i8
          OpenAD_Symbol_69 = 1_w2f__i8
          OpenAD_Symbol_80 = EOSJMDCKP(4)
          OpenAD_Symbol_70 = 1_w2f__i8
          OpenAD_Symbol_68 = P%v
          OpenAD_Symbol_64 = 1_w2f__i8
          OpenAD_Symbol_85 = S%v
          OpenAD_Symbol_86 = P%v
          OpenAD_Symbol_83 = OpenAD_Symbol_82
          OpenAD_Symbol_92 = EOSJMDCKP(6)
          OpenAD_Symbol_90 = 1_w2f__i8
          OpenAD_Symbol_87 = 1_w2f__i8
          OpenAD_Symbol_94 = EOSJMDCKP(7)
          OpenAD_Symbol_88 = 1_w2f__i8
          OpenAD_Symbol_84 = OpenAD_Symbol_81
          OpenAD_Symbol_65 = 1_w2f__i8
          OpenAD_Symbol_62 = 1_w2f__i8
          OpenAD_Symbol_98 = S3O2%v
          OpenAD_Symbol_99 = P%v
          OpenAD_Symbol_97 = EOSJMDCKP(8)
          OpenAD_Symbol_63 = 1_w2f__i8
          OpenAD_Symbol_60 = 1_w2f__i8
          OpenAD_Symbol_101 = OpenAD_Symbol_100
          OpenAD_Symbol_108 = EOSJMDCKP(10)
          OpenAD_Symbol_106 = 1_w2f__i8
          OpenAD_Symbol_103 = 1_w2f__i8
          OpenAD_Symbol_110 = EOSJMDCKP(11)
          OpenAD_Symbol_104 = 1_w2f__i8
          OpenAD_Symbol_102 = P2%v
          OpenAD_Symbol_61 = 1_w2f__i8
          OpenAD_Symbol_58 = 1_w2f__i8
          OpenAD_Symbol_115 = S%v
          OpenAD_Symbol_116 = P2%v
          OpenAD_Symbol_113 = OpenAD_Symbol_112
          OpenAD_Symbol_122 = EOSJMDCKP(13)
          OpenAD_Symbol_120 = 1_w2f__i8
          OpenAD_Symbol_117 = 1_w2f__i8
          OpenAD_Symbol_124 = EOSJMDCKP(14)
          OpenAD_Symbol_118 = 1_w2f__i8
          OpenAD_Symbol_114 = OpenAD_Symbol_111
          OpenAD_Symbol_59 = 1_w2f__i8
          BULKMOD(INT(I),INT(J))%v = (BMPRES%v+BMFRESH%v+BMSALT%v)
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
          CALL sax(OpenAD_Symbol_158,S,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_167,S,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_172,S3O2,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_192,S,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_197,S3O2,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_204,T2,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_205,T,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_206,T2,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_207,T,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_208,T2,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_209,T,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_210,T3,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_211,T2,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_212,T,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_213,T2,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_214,T,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_215,T3,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_216,T2,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_217,T,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_218,T4,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_219,T3,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_220,T2,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_221,T,BULKMOD(I,J))
          CALL saxpy(OpenAD_Symbol_222,LOCPRES(I,J),BULKMOD(I,J))
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
      REAL(w2f__8) OpenAD_Symbol_129
      REAL(w2f__8) OpenAD_Symbol_131
      REAL(w2f__8) OpenAD_Symbol_133
      REAL(w2f__8) OpenAD_Symbol_223
      REAL(w2f__8) OpenAD_Symbol_224
      REAL(w2f__8) OpenAD_Symbol_225
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
          LOCPRES(INT(I),INT(J))%v = (X(XCOUNT)%v*2.0D00)
          OpenAD_Symbol_129 = 2.0D00
          OpenAD_Symbol_223 = OpenAD_Symbol_129
          CALL sax(OpenAD_Symbol_223,X(XCOUNT),LOCPRES(I,J))
          DO K = 1, 2, 1
            DO L = 1, 2, 1
              DO M = 1, 2, 1
                TFLD(INT(I),INT(J),INT(K),INT(L),INT(M))%v = (X(XCOUNT)%
     +v*3.0D00)
                OpenAD_Symbol_131 = 3.0D00
                SFLD(INT(I),INT(J),INT(K),INT(L),INT(M))%v = (X(XCOUNT)%
     +v*4.0D00)
                OpenAD_Symbol_133 = 4.0D00
                OpenAD_Symbol_224 = OpenAD_Symbol_131
                OpenAD_Symbol_225 = OpenAD_Symbol_133
                CALL sax(OpenAD_Symbol_224,X(XCOUNT),TFLD(I,J,K,L,M))
                CALL sax(OpenAD_Symbol_225,X(XCOUNT),SFLD(I,J,K,L,M))
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
          CALL setderiv(Y(J+I*2+(-2)),BULKMOD(I,J))
        END DO
      END DO
      END SUBROUTINE
