C ***********************************************************
C Fortran file translated from WHIRL Thu Jul 20 14:57:43 2006
C ***********************************************************
C ***********************************************************


      SUBROUTINE head(NX, NY, X, FVEC, R)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_101
      REAL(w2f__8) OpenAD_Symbol_102
      REAL(w2f__8) OpenAD_Symbol_103
      REAL(w2f__8) OpenAD_Symbol_104
      REAL(w2f__8) OpenAD_Symbol_105
      REAL(w2f__8) OpenAD_Symbol_107
      REAL(w2f__8) OpenAD_Symbol_108
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_110
      REAL(w2f__8) OpenAD_Symbol_111
      REAL(w2f__8) OpenAD_Symbol_112
      REAL(w2f__8) OpenAD_Symbol_113
      REAL(w2f__8) OpenAD_Symbol_114
      REAL(w2f__8) OpenAD_Symbol_116
      REAL(w2f__8) OpenAD_Symbol_117
      REAL(w2f__8) OpenAD_Symbol_118
      REAL(w2f__8) OpenAD_Symbol_119
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_120
      REAL(w2f__8) OpenAD_Symbol_121
      REAL(w2f__8) OpenAD_Symbol_122
      REAL(w2f__8) OpenAD_Symbol_124
      REAL(w2f__8) OpenAD_Symbol_125
      REAL(w2f__8) OpenAD_Symbol_126
      REAL(w2f__8) OpenAD_Symbol_127
      REAL(w2f__8) OpenAD_Symbol_128
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_130
      REAL(w2f__8) OpenAD_Symbol_131
      REAL(w2f__8) OpenAD_Symbol_133
      REAL(w2f__8) OpenAD_Symbol_134
      REAL(w2f__8) OpenAD_Symbol_135
      REAL(w2f__8) OpenAD_Symbol_136
      REAL(w2f__8) OpenAD_Symbol_137
      REAL(w2f__8) OpenAD_Symbol_139
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_141
      REAL(w2f__8) OpenAD_Symbol_142
      REAL(w2f__8) OpenAD_Symbol_143
      REAL(w2f__8) OpenAD_Symbol_144
      REAL(w2f__8) OpenAD_Symbol_145
      REAL(w2f__8) OpenAD_Symbol_146
      REAL(w2f__8) OpenAD_Symbol_148
      REAL(w2f__8) OpenAD_Symbol_149
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_150
      REAL(w2f__8) OpenAD_Symbol_151
      REAL(w2f__8) OpenAD_Symbol_152
      REAL(w2f__8) OpenAD_Symbol_153
      REAL(w2f__8) OpenAD_Symbol_154
      REAL(w2f__8) OpenAD_Symbol_155
      REAL(w2f__8) OpenAD_Symbol_157
      REAL(w2f__8) OpenAD_Symbol_158
      REAL(w2f__8) OpenAD_Symbol_159
      REAL(w2f__8) OpenAD_Symbol_160
      REAL(w2f__8) OpenAD_Symbol_161
      REAL(w2f__8) OpenAD_Symbol_162
      type(active) :: OpenAD_Symbol_163
      type(active) :: OpenAD_Symbol_164
      type(active) :: OpenAD_Symbol_165
      type(active) :: OpenAD_Symbol_166
      type(active) :: OpenAD_Symbol_167
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
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_200
      REAL(w2f__8) OpenAD_Symbol_201
      REAL(w2f__8) OpenAD_Symbol_202
      REAL(w2f__8) OpenAD_Symbol_203
      REAL(w2f__8) OpenAD_Symbol_204
      REAL(w2f__8) OpenAD_Symbol_205
      REAL(w2f__8) OpenAD_Symbol_206
      type(active) :: OpenAD_Symbol_207
      REAL(w2f__8) OpenAD_Symbol_208
      REAL(w2f__8) OpenAD_Symbol_209
      REAL(w2f__8) OpenAD_Symbol_21
      type(active) :: OpenAD_Symbol_210
      REAL(w2f__8) OpenAD_Symbol_211
      REAL(w2f__8) OpenAD_Symbol_212
      REAL(w2f__8) OpenAD_Symbol_213
      type(active) :: OpenAD_Symbol_214
      REAL(w2f__8) OpenAD_Symbol_215
      REAL(w2f__8) OpenAD_Symbol_216
      type(active) :: OpenAD_Symbol_217
      REAL(w2f__8) OpenAD_Symbol_218
      REAL(w2f__8) OpenAD_Symbol_219
      REAL(w2f__8) OpenAD_Symbol_220
      type(active) :: OpenAD_Symbol_221
      REAL(w2f__8) OpenAD_Symbol_222
      REAL(w2f__8) OpenAD_Symbol_223
      REAL(w2f__8) OpenAD_Symbol_224
      REAL(w2f__8) OpenAD_Symbol_225
      REAL(w2f__8) OpenAD_Symbol_226
      REAL(w2f__8) OpenAD_Symbol_227
      REAL(w2f__8) OpenAD_Symbol_228
      type(active) :: OpenAD_Symbol_229
      REAL(w2f__8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_230
      REAL(w2f__8) OpenAD_Symbol_231
      REAL(w2f__8) OpenAD_Symbol_232
      type(active) :: OpenAD_Symbol_233
      REAL(w2f__8) OpenAD_Symbol_234
      REAL(w2f__8) OpenAD_Symbol_235
      type(active) :: OpenAD_Symbol_236
      REAL(w2f__8) OpenAD_Symbol_237
      REAL(w2f__8) OpenAD_Symbol_238
      REAL(w2f__8) OpenAD_Symbol_239
      REAL(w2f__8) OpenAD_Symbol_24
      type(active) :: OpenAD_Symbol_240
      REAL(w2f__8) OpenAD_Symbol_241
      REAL(w2f__8) OpenAD_Symbol_242
      type(active) :: OpenAD_Symbol_243
      REAL(w2f__8) OpenAD_Symbol_244
      REAL(w2f__8) OpenAD_Symbol_245
      REAL(w2f__8) OpenAD_Symbol_246
      type(active) :: OpenAD_Symbol_247
      REAL(w2f__8) OpenAD_Symbol_248
      REAL(w2f__8) OpenAD_Symbol_249
      REAL(w2f__8) OpenAD_Symbol_250
      REAL(w2f__8) OpenAD_Symbol_251
      REAL(w2f__8) OpenAD_Symbol_252
      type(active) :: OpenAD_Symbol_253
      REAL(w2f__8) OpenAD_Symbol_254
      REAL(w2f__8) OpenAD_Symbol_255
      REAL(w2f__8) OpenAD_Symbol_256
      REAL(w2f__8) OpenAD_Symbol_257
      REAL(w2f__8) OpenAD_Symbol_258
      REAL(w2f__8) OpenAD_Symbol_259
      REAL(w2f__8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_260
      REAL(w2f__8) OpenAD_Symbol_261
      REAL(w2f__8) OpenAD_Symbol_262
      REAL(w2f__8) OpenAD_Symbol_263
      type(active) :: OpenAD_Symbol_264
      REAL(w2f__8) OpenAD_Symbol_265
      REAL(w2f__8) OpenAD_Symbol_266
      REAL(w2f__8) OpenAD_Symbol_267
      REAL(w2f__8) OpenAD_Symbol_268
      REAL(w2f__8) OpenAD_Symbol_269
      REAL(w2f__8) OpenAD_Symbol_27
      REAL(w2f__8) OpenAD_Symbol_270
      REAL(w2f__8) OpenAD_Symbol_271
      REAL(w2f__8) OpenAD_Symbol_272
      REAL(w2f__8) OpenAD_Symbol_273
      REAL(w2f__8) OpenAD_Symbol_274
      REAL(w2f__8) OpenAD_Symbol_275
      REAL(w2f__8) OpenAD_Symbol_276
      REAL(w2f__8) OpenAD_Symbol_277
      REAL(w2f__8) OpenAD_Symbol_278
      REAL(w2f__8) OpenAD_Symbol_279
      REAL(w2f__8) OpenAD_Symbol_28
      REAL(w2f__8) OpenAD_Symbol_280
      REAL(w2f__8) OpenAD_Symbol_281
      REAL(w2f__8) OpenAD_Symbol_282
      REAL(w2f__8) OpenAD_Symbol_283
      type(active) :: OpenAD_Symbol_284
      type(active) :: OpenAD_Symbol_285
      type(active) :: OpenAD_Symbol_286
      type(active) :: OpenAD_Symbol_287
      type(active) :: OpenAD_Symbol_288
      type(active) :: OpenAD_Symbol_289
      REAL(w2f__8) OpenAD_Symbol_29
      type(active) :: OpenAD_Symbol_290
      type(active) :: OpenAD_Symbol_291
      type(active) :: OpenAD_Symbol_292
      type(active) :: OpenAD_Symbol_293
      type(active) :: OpenAD_Symbol_294
      type(active) :: OpenAD_Symbol_295
      type(active) :: OpenAD_Symbol_296
      type(active) :: OpenAD_Symbol_297
      type(active) :: OpenAD_Symbol_298
      type(active) :: OpenAD_Symbol_299
      REAL(w2f__8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_32
      REAL(w2f__8) OpenAD_Symbol_33
      REAL(w2f__8) OpenAD_Symbol_34
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_36
      REAL(w2f__8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_42
      REAL(w2f__8) OpenAD_Symbol_44
      REAL(w2f__8) OpenAD_Symbol_45
      REAL(w2f__8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_50
      REAL(w2f__8) OpenAD_Symbol_51
      REAL(w2f__8) OpenAD_Symbol_53
      REAL(w2f__8) OpenAD_Symbol_54
      REAL(w2f__8) OpenAD_Symbol_55
      REAL(w2f__8) OpenAD_Symbol_56
      REAL(w2f__8) OpenAD_Symbol_57
      REAL(w2f__8) OpenAD_Symbol_59
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_60
      REAL(w2f__8) OpenAD_Symbol_61
      REAL(w2f__8) OpenAD_Symbol_62
      REAL(w2f__8) OpenAD_Symbol_63
      REAL(w2f__8) OpenAD_Symbol_65
      REAL(w2f__8) OpenAD_Symbol_66
      REAL(w2f__8) OpenAD_Symbol_68
      REAL(w2f__8) OpenAD_Symbol_69
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_70
      REAL(w2f__8) OpenAD_Symbol_71
      REAL(w2f__8) OpenAD_Symbol_72
      REAL(w2f__8) OpenAD_Symbol_74
      REAL(w2f__8) OpenAD_Symbol_75
      REAL(w2f__8) OpenAD_Symbol_76
      REAL(w2f__8) OpenAD_Symbol_77
      REAL(w2f__8) OpenAD_Symbol_78
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_80
      REAL(w2f__8) OpenAD_Symbol_81
      REAL(w2f__8) OpenAD_Symbol_82
      REAL(w2f__8) OpenAD_Symbol_83
      REAL(w2f__8) OpenAD_Symbol_84
      REAL(w2f__8) OpenAD_Symbol_86
      REAL(w2f__8) OpenAD_Symbol_87
      REAL(w2f__8) OpenAD_Symbol_89
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_91
      REAL(w2f__8) OpenAD_Symbol_92
      REAL(w2f__8) OpenAD_Symbol_93
      REAL(w2f__8) OpenAD_Symbol_95
      REAL(w2f__8) OpenAD_Symbol_96
      REAL(w2f__8) OpenAD_Symbol_97
      REAL(w2f__8) OpenAD_Symbol_98
      REAL(w2f__8) OpenAD_Symbol_99
C
C     **** Parameters and Result ****
C
      INTEGER(w2f__i4) NX
      INTEGER(w2f__i4) NY
      type(active) :: X(1 : INT((NX * NY)))
      type(active) :: FVEC(1 : INT((NX * NY)))
      REAL(w2f__8) R
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i8) t__1
      INTEGER(w2f__i8) t__2
      type(active) :: DPDX
      type(active) :: DPDY
      REAL(w2f__8) FOUR
      PARAMETER ( FOUR =     4.000000000000000)
      REAL(w2f__8) HX
      REAL(w2f__8) HX2
      REAL(w2f__8) HY
      REAL(w2f__8) HY2
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) J
      INTEGER(w2f__i4) K
      INTEGER(w2f__i4) N
      REAL(w2f__8) NXP1
      REAL(w2f__8) NYP1
      REAL(w2f__8) ONE
      PARAMETER ( ONE =     1.000000000000000)
      type(active) :: P
      type(active) :: PB
      type(active) :: PBB
      type(active) :: PBL
      type(active) :: PBLAP
      type(active) :: PBR
      type(active) :: PL
      type(active) :: PLAP
      type(active) :: PLL
      type(active) :: PLLAP
      type(active) :: PR
      type(active) :: PRLAP
      type(active) :: PRR
      type(active) :: PT
      type(active) :: PTL
      type(active) :: PTLAP
      type(active) :: PTR
      type(active) :: PTT
      REAL(w2f__8) THREE
      PARAMETER ( THREE =     3.000000000000000)
      REAL(w2f__8) TWO
      PARAMETER ( TWO =     2.000000000000000)
      REAL(w2f__8) ZERO
      PARAMETER ( ZERO =     0.000000000000000)
      INTEGER(w2f__i4) t__3
      INTEGER(w2f__i4) t__4
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(FVEC)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      t__1 = INT(NX * NY)
      t__2 = MAX(t__1, 0_w2f__i8)
      N = NX * NY
      NXP1 = (NX + INT(1_w2f__i8))
      NYP1 = (NY + INT(1_w2f__i8))
      HX = (1.0D00 / NXP1)
      HY = (1.0D00 / NYP1)
      HY2 = (HY * HY)
      HX2 = (HX * HX)
      t__3 = NY
      DO I = 1, t__3, 1
        t__4 = NX
        DO J = 1, t__4, 1
          K = J + NX *(I +(-1))
          IF((I .eq. INT(1_w2f__i8)) .OR.(J .eq. INT(1_w2f__i8))) THEN
            PBL%v = 0.0D00
            CALL zero_deriv(PBL)
          ELSE
            PBL%v = X(K-NX+(-1))%v
            CALL setderiv(OpenAD_Symbol_299,X(K-NX+(-1)))
            CALL setderiv(PBL,OpenAD_Symbol_299)
          ENDIF
          IF(I .eq. INT(1_w2f__i8)) THEN
            PB%v = 0.0D00
            PBB%v = X(K)%v
            CALL setderiv(OpenAD_Symbol_163,X(K))
            CALL setderiv(PBB,OpenAD_Symbol_163)
            CALL zero_deriv(PB)
          ELSE
            IF(I .eq. INT(2_w2f__i8)) THEN
              PB%v = X(K-NX)%v
              PBB%v = 0.0D00
              CALL setderiv(OpenAD_Symbol_296,X(K-NX))
              CALL setderiv(PB,OpenAD_Symbol_296)
              CALL zero_deriv(PBB)
            ELSE
              PB%v = X(K-NX)%v
              PBB%v = X(K-NX*2)%v
              CALL setderiv(OpenAD_Symbol_298,X(K-NX*2))
              CALL setderiv(OpenAD_Symbol_297,X(K-NX))
              CALL setderiv(PB,OpenAD_Symbol_297)
              CALL setderiv(PBB,OpenAD_Symbol_298)
            ENDIF
          ENDIF
          IF((NX .eq. J) .OR.(I .eq. INT(1_w2f__i8))) THEN
            PBR%v = 0.0D00
            CALL zero_deriv(PBR)
          ELSE
            PBR%v = X(K-NX+1)%v
            CALL setderiv(OpenAD_Symbol_295,X(K-NX+1))
            CALL setderiv(PBR,OpenAD_Symbol_295)
          ENDIF
          IF(J .eq. INT(1_w2f__i8)) THEN
            PL%v = 0.0D00
            PLL%v = X(K)%v
            CALL setderiv(OpenAD_Symbol_164,X(K))
            CALL setderiv(PLL,OpenAD_Symbol_164)
            CALL zero_deriv(PL)
          ELSE
            IF(J .eq. INT(2_w2f__i8)) THEN
              PL%v = X(K+(-1))%v
              PLL%v = 0.0D00
              CALL setderiv(OpenAD_Symbol_292,X(K+(-1)))
              CALL setderiv(PL,OpenAD_Symbol_292)
              CALL zero_deriv(PLL)
            ELSE
              PL%v = X(K+(-1))%v
              PLL%v = X(K+(-2))%v
              CALL setderiv(OpenAD_Symbol_294,X(K+(-2)))
              CALL setderiv(OpenAD_Symbol_293,X(K+(-1)))
              CALL setderiv(PL,OpenAD_Symbol_293)
              CALL setderiv(PLL,OpenAD_Symbol_294)
            ENDIF
          ENDIF
          P%v = X(K)%v
          CALL setderiv(OpenAD_Symbol_165,X(K))
          CALL setderiv(P,OpenAD_Symbol_165)
          IF(J .eq.(NX + INT((-1_w2f__i8)))) THEN
            PR%v = X(K+1)%v
            PRR%v = 0.0D00
            CALL setderiv(OpenAD_Symbol_166,X(K+1))
            CALL setderiv(PR,OpenAD_Symbol_166)
            CALL zero_deriv(PRR)
          ELSE
            IF(NX .eq. J) THEN
              PR%v = 0.0D00
              PRR%v = X(K)%v
              CALL setderiv(OpenAD_Symbol_289,X(K))
              CALL setderiv(PRR,OpenAD_Symbol_289)
              CALL zero_deriv(PR)
            ELSE
              PR%v = X(K+1)%v
              PRR%v = X(K+2)%v
              CALL setderiv(OpenAD_Symbol_291,X(K+2))
              CALL setderiv(OpenAD_Symbol_290,X(K+1))
              CALL setderiv(PR,OpenAD_Symbol_290)
              CALL setderiv(PRR,OpenAD_Symbol_291)
            ENDIF
          ENDIF
          IF((NY .eq. I) .OR.(J .eq. INT(1_w2f__i8))) THEN
            PTL%v = 0.0D00
            CALL zero_deriv(PTL)
          ELSE
            PTL%v = X(NX+K+(-1))%v
            CALL setderiv(OpenAD_Symbol_288,X(NX+K+(-1)))
            CALL setderiv(PTL,OpenAD_Symbol_288)
          ENDIF
          IF(I .eq.(NY + INT((-1_w2f__i8)))) THEN
            PT%v = X(NX+K)%v
            PTT%v = 0.0D00
            CALL setderiv(OpenAD_Symbol_167,X(NX+K))
            CALL setderiv(PT,OpenAD_Symbol_167)
            CALL zero_deriv(PTT)
          ELSE
            IF(NY .eq. I) THEN
              PT%v = 0.0D00
              PTT%v = X(K)%v
              CALL setderiv(OpenAD_Symbol_285,X(K))
              CALL setderiv(PTT,OpenAD_Symbol_285)
              CALL zero_deriv(PT)
            ELSE
              PT%v = X(NX+K)%v
              PTT%v = X(K+NX*2)%v
              CALL setderiv(OpenAD_Symbol_287,X(K+NX*2))
              CALL setderiv(OpenAD_Symbol_286,X(NX+K))
              CALL setderiv(PT,OpenAD_Symbol_286)
              CALL setderiv(PTT,OpenAD_Symbol_287)
            ENDIF
          ENDIF
          IF((NX .eq. J) .OR.(NY .eq. I)) THEN
            PTR%v = 0.0D00
            CALL zero_deriv(PTR)
          ELSE
            PTR%v = X(NX+K+1)%v
            CALL setderiv(OpenAD_Symbol_284,X(NX+K+1))
            CALL setderiv(PTR,OpenAD_Symbol_284)
          ENDIF
          OpenAD_Symbol_0 = (PT%v-PB%v)
          OpenAD_Symbol_1 = (HY * 2.0D00)
          DPDY%v = (OpenAD_Symbol_0/OpenAD_Symbol_1)
          OpenAD_Symbol_4 = 1_w2f__i8
          OpenAD_Symbol_5 = (-1_w2f__i8)
          OpenAD_Symbol_2 = (INT(1_w2f__i8) / OpenAD_Symbol_1)
          OpenAD_Symbol_6 = (PR%v-PL%v)
          OpenAD_Symbol_7 = (HX * 2.0D00)
          DPDX%v = (OpenAD_Symbol_6/OpenAD_Symbol_7)
          OpenAD_Symbol_10 = 1_w2f__i8
          OpenAD_Symbol_11 = (-1_w2f__i8)
          OpenAD_Symbol_8 = (INT(1_w2f__i8) / OpenAD_Symbol_7)
          OpenAD_Symbol_14 = (PBB%v+P%v-PB%v*2.0D00)
          OpenAD_Symbol_23 = (PBL%v+PBR%v-PB%v*2.0D00)
          OpenAD_Symbol_32 = ((OpenAD_Symbol_14 / HY2) +(
     > OpenAD_Symbol_23 / HX2))
          OpenAD_Symbol_17 = 1_w2f__i8
          OpenAD_Symbol_19 = 1_w2f__i8
          OpenAD_Symbol_21 = 2.0D00
          OpenAD_Symbol_20 = (-1_w2f__i8)
          OpenAD_Symbol_18 = 1_w2f__i8
          OpenAD_Symbol_15 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_12 = 1_w2f__i8
          OpenAD_Symbol_26 = 1_w2f__i8
          OpenAD_Symbol_28 = 1_w2f__i8
          OpenAD_Symbol_30 = 2.0D00
          OpenAD_Symbol_29 = (-1_w2f__i8)
          OpenAD_Symbol_27 = 1_w2f__i8
          OpenAD_Symbol_24 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_13 = 1_w2f__i8
          PBLAP%v = OpenAD_Symbol_32
          OpenAD_Symbol_35 = (PBL%v+PTL%v-PL%v*2.0D00)
          OpenAD_Symbol_44 = (PLL%v+P%v-PL%v*2.0D00)
          OpenAD_Symbol_53 = ((OpenAD_Symbol_35 / HY2) +(
     > OpenAD_Symbol_44 / HX2))
          OpenAD_Symbol_38 = 1_w2f__i8
          OpenAD_Symbol_40 = 1_w2f__i8
          OpenAD_Symbol_42 = 2.0D00
          OpenAD_Symbol_41 = (-1_w2f__i8)
          OpenAD_Symbol_39 = 1_w2f__i8
          OpenAD_Symbol_36 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_33 = 1_w2f__i8
          OpenAD_Symbol_47 = 1_w2f__i8
          OpenAD_Symbol_49 = 1_w2f__i8
          OpenAD_Symbol_51 = 2.0D00
          OpenAD_Symbol_50 = (-1_w2f__i8)
          OpenAD_Symbol_48 = 1_w2f__i8
          OpenAD_Symbol_45 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_34 = 1_w2f__i8
          PLLAP%v = OpenAD_Symbol_53
          OpenAD_Symbol_56 = (PB%v+PT%v-P%v*2.0D00)
          OpenAD_Symbol_65 = (PL%v+PR%v-P%v*2.0D00)
          OpenAD_Symbol_74 = ((OpenAD_Symbol_56 / HY2) +(
     > OpenAD_Symbol_65 / HX2))
          OpenAD_Symbol_59 = 1_w2f__i8
          OpenAD_Symbol_61 = 1_w2f__i8
          OpenAD_Symbol_63 = 2.0D00
          OpenAD_Symbol_62 = (-1_w2f__i8)
          OpenAD_Symbol_60 = 1_w2f__i8
          OpenAD_Symbol_57 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_54 = 1_w2f__i8
          OpenAD_Symbol_68 = 1_w2f__i8
          OpenAD_Symbol_70 = 1_w2f__i8
          OpenAD_Symbol_72 = 2.0D00
          OpenAD_Symbol_71 = (-1_w2f__i8)
          OpenAD_Symbol_69 = 1_w2f__i8
          OpenAD_Symbol_66 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_55 = 1_w2f__i8
          PLAP%v = OpenAD_Symbol_74
          OpenAD_Symbol_77 = (P%v+PRR%v-PR%v*2.0D00)
          OpenAD_Symbol_86 = (PBR%v+PTR%v-PR%v*2.0D00)
          OpenAD_Symbol_95 = ((OpenAD_Symbol_77 / HX2) +(
     > OpenAD_Symbol_86 / HY2))
          OpenAD_Symbol_80 = 1_w2f__i8
          OpenAD_Symbol_82 = 1_w2f__i8
          OpenAD_Symbol_84 = 2.0D00
          OpenAD_Symbol_83 = (-1_w2f__i8)
          OpenAD_Symbol_81 = 1_w2f__i8
          OpenAD_Symbol_78 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_75 = 1_w2f__i8
          OpenAD_Symbol_89 = 1_w2f__i8
          OpenAD_Symbol_91 = 1_w2f__i8
          OpenAD_Symbol_93 = 2.0D00
          OpenAD_Symbol_92 = (-1_w2f__i8)
          OpenAD_Symbol_90 = 1_w2f__i8
          OpenAD_Symbol_87 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_76 = 1_w2f__i8
          PRLAP%v = OpenAD_Symbol_95
          OpenAD_Symbol_98 = (P%v+PTT%v-PT%v*2.0D00)
          OpenAD_Symbol_107 = (PTL%v+PTR%v-PT%v*2.0D00)
          OpenAD_Symbol_116 = ((OpenAD_Symbol_98 / HY2) +(
     > OpenAD_Symbol_107 / HX2))
          OpenAD_Symbol_101 = 1_w2f__i8
          OpenAD_Symbol_103 = 1_w2f__i8
          OpenAD_Symbol_105 = 2.0D00
          OpenAD_Symbol_104 = (-1_w2f__i8)
          OpenAD_Symbol_102 = 1_w2f__i8
          OpenAD_Symbol_99 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_96 = 1_w2f__i8
          OpenAD_Symbol_110 = 1_w2f__i8
          OpenAD_Symbol_112 = 1_w2f__i8
          OpenAD_Symbol_114 = 2.0D00
          OpenAD_Symbol_113 = (-1_w2f__i8)
          OpenAD_Symbol_111 = 1_w2f__i8
          OpenAD_Symbol_108 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_97 = 1_w2f__i8
          PTLAP%v = OpenAD_Symbol_116
          OpenAD_Symbol_121 = (PBLAP%v+PTLAP%v-PLAP%v*2.0D00)
          OpenAD_Symbol_130 = (PLLAP%v+PRLAP%v-PLAP%v*2.0D00)
          OpenAD_Symbol_148 = (PRLAP%v-PLLAP%v)
          OpenAD_Symbol_144 = (DPDY%v*OpenAD_Symbol_148)
          OpenAD_Symbol_145 = (HX * 2.0D00)
          OpenAD_Symbol_157 = (PTLAP%v-PBLAP%v)
          OpenAD_Symbol_153 = (DPDX%v*OpenAD_Symbol_157)
          OpenAD_Symbol_154 = (HY * 2.0D00)
          OpenAD_Symbol_139 = ((OpenAD_Symbol_144 / OpenAD_Symbol_145)
     >  -(OpenAD_Symbol_153 / OpenAD_Symbol_154))
          OpenAD_Symbol_162 = ((OpenAD_Symbol_121 / HY2) +(
     > OpenAD_Symbol_130 / HX2) - R * OpenAD_Symbol_139)
          OpenAD_Symbol_124 = 1_w2f__i8
          OpenAD_Symbol_126 = 1_w2f__i8
          OpenAD_Symbol_128 = 2.0D00
          OpenAD_Symbol_127 = (-1_w2f__i8)
          OpenAD_Symbol_125 = 1_w2f__i8
          OpenAD_Symbol_122 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_119 = 1_w2f__i8
          OpenAD_Symbol_133 = 1_w2f__i8
          OpenAD_Symbol_135 = 1_w2f__i8
          OpenAD_Symbol_137 = 2.0D00
          OpenAD_Symbol_136 = (-1_w2f__i8)
          OpenAD_Symbol_134 = 1_w2f__i8
          OpenAD_Symbol_131 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_120 = 1_w2f__i8
          OpenAD_Symbol_117 = 1_w2f__i8
          OpenAD_Symbol_149 = OpenAD_Symbol_148
          OpenAD_Symbol_151 = 1_w2f__i8
          OpenAD_Symbol_152 = (-1_w2f__i8)
          OpenAD_Symbol_150 = DPDY%v
          OpenAD_Symbol_146 = (INT(1_w2f__i8) / OpenAD_Symbol_145)
          OpenAD_Symbol_142 = 1_w2f__i8
          OpenAD_Symbol_158 = OpenAD_Symbol_157
          OpenAD_Symbol_160 = 1_w2f__i8
          OpenAD_Symbol_161 = (-1_w2f__i8)
          OpenAD_Symbol_159 = DPDX%v
          OpenAD_Symbol_155 = (INT(1_w2f__i8) / OpenAD_Symbol_154)
          OpenAD_Symbol_143 = (-1_w2f__i8)
          OpenAD_Symbol_141 = R
          OpenAD_Symbol_118 = (-1_w2f__i8)
          FVEC(INT(K))%v = OpenAD_Symbol_162
          OpenAD_Symbol_168 = (OpenAD_Symbol_119 * OpenAD_Symbol_117)
          OpenAD_Symbol_169 = (OpenAD_Symbol_120 * OpenAD_Symbol_117)
          OpenAD_Symbol_170 = (OpenAD_Symbol_141 * OpenAD_Symbol_118)
          OpenAD_Symbol_171 = (OpenAD_Symbol_142 * OpenAD_Symbol_170)
          OpenAD_Symbol_172 = (OpenAD_Symbol_143 * OpenAD_Symbol_170)
          OpenAD_Symbol_173 = (OpenAD_Symbol_131 * OpenAD_Symbol_169)
          OpenAD_Symbol_174 = (OpenAD_Symbol_133 * OpenAD_Symbol_173)
          OpenAD_Symbol_175 = (OpenAD_Symbol_134 * OpenAD_Symbol_173)
          OpenAD_Symbol_176 = (OpenAD_Symbol_135 * OpenAD_Symbol_175)
          OpenAD_Symbol_177 = (OpenAD_Symbol_136 * OpenAD_Symbol_175)
          OpenAD_Symbol_178 = (OpenAD_Symbol_122 * OpenAD_Symbol_168)
          OpenAD_Symbol_179 = (OpenAD_Symbol_124 * OpenAD_Symbol_178)
          OpenAD_Symbol_180 = (OpenAD_Symbol_125 * OpenAD_Symbol_178)
          OpenAD_Symbol_181 = (OpenAD_Symbol_126 * OpenAD_Symbol_180)
          OpenAD_Symbol_182 = (OpenAD_Symbol_127 * OpenAD_Symbol_180)
          OpenAD_Symbol_183 = (OpenAD_Symbol_155 * OpenAD_Symbol_172)
          OpenAD_Symbol_184 = (OpenAD_Symbol_158 * OpenAD_Symbol_183)
          OpenAD_Symbol_185 = (OpenAD_Symbol_159 * OpenAD_Symbol_183)
          OpenAD_Symbol_186 = (OpenAD_Symbol_181 + OpenAD_Symbol_160 *
     >  OpenAD_Symbol_185)
          OpenAD_Symbol_187 = (OpenAD_Symbol_179 + OpenAD_Symbol_161 *
     >  OpenAD_Symbol_185)
          OpenAD_Symbol_188 = (OpenAD_Symbol_96 * OpenAD_Symbol_186)
          OpenAD_Symbol_189 = (OpenAD_Symbol_97 * OpenAD_Symbol_186)
          OpenAD_Symbol_190 = (OpenAD_Symbol_12 * OpenAD_Symbol_187)
          OpenAD_Symbol_191 = (OpenAD_Symbol_13 * OpenAD_Symbol_187)
          OpenAD_Symbol_192 = (OpenAD_Symbol_146 * OpenAD_Symbol_171)
          OpenAD_Symbol_193 = (OpenAD_Symbol_149 * OpenAD_Symbol_192)
          OpenAD_Symbol_194 = (OpenAD_Symbol_150 * OpenAD_Symbol_192)
          OpenAD_Symbol_195 = (OpenAD_Symbol_176 + OpenAD_Symbol_151 *
     >  OpenAD_Symbol_194)
          OpenAD_Symbol_196 = (OpenAD_Symbol_174 + OpenAD_Symbol_152 *
     >  OpenAD_Symbol_194)
          OpenAD_Symbol_197 = (OpenAD_Symbol_75 * OpenAD_Symbol_195)
          OpenAD_Symbol_198 = (OpenAD_Symbol_76 * OpenAD_Symbol_195)
          OpenAD_Symbol_199 = (OpenAD_Symbol_33 * OpenAD_Symbol_196)
          OpenAD_Symbol_200 = (OpenAD_Symbol_34 * OpenAD_Symbol_196)
          OpenAD_Symbol_201 = (OpenAD_Symbol_137 * OpenAD_Symbol_177)
          OpenAD_Symbol_202 = (OpenAD_Symbol_201 + OpenAD_Symbol_128 *
     >  OpenAD_Symbol_182)
          OpenAD_Symbol_203 = (OpenAD_Symbol_54 * OpenAD_Symbol_202)
          OpenAD_Symbol_204 = (OpenAD_Symbol_55 * OpenAD_Symbol_202)
          OpenAD_Symbol_205 = (OpenAD_Symbol_108 * OpenAD_Symbol_189)
          OpenAD_Symbol_206 = (OpenAD_Symbol_110 * OpenAD_Symbol_205)
          OpenAD_Symbol_208 = (OpenAD_Symbol_111 * OpenAD_Symbol_205)
          OpenAD_Symbol_209 = (OpenAD_Symbol_112 * OpenAD_Symbol_208)
          OpenAD_Symbol_211 = (OpenAD_Symbol_113 * OpenAD_Symbol_208)
          OpenAD_Symbol_212 = (OpenAD_Symbol_99 * OpenAD_Symbol_188)
          OpenAD_Symbol_213 = (OpenAD_Symbol_101 * OpenAD_Symbol_212)
          OpenAD_Symbol_215 = (OpenAD_Symbol_102 * OpenAD_Symbol_212)
          OpenAD_Symbol_216 = (OpenAD_Symbol_103 * OpenAD_Symbol_215)
          OpenAD_Symbol_218 = (OpenAD_Symbol_104 * OpenAD_Symbol_215)
          OpenAD_Symbol_219 = (OpenAD_Symbol_87 * OpenAD_Symbol_198)
          OpenAD_Symbol_220 = (OpenAD_Symbol_89 * OpenAD_Symbol_219)
          OpenAD_Symbol_222 = (OpenAD_Symbol_90 * OpenAD_Symbol_219)
          OpenAD_Symbol_223 = (OpenAD_Symbol_91 * OpenAD_Symbol_222)
          OpenAD_Symbol_224 = (OpenAD_Symbol_92 * OpenAD_Symbol_222)
          OpenAD_Symbol_225 = (OpenAD_Symbol_78 * OpenAD_Symbol_197)
          OpenAD_Symbol_226 = (OpenAD_Symbol_80 * OpenAD_Symbol_225)
          OpenAD_Symbol_227 = (OpenAD_Symbol_81 * OpenAD_Symbol_225)
          OpenAD_Symbol_228 = (OpenAD_Symbol_82 * OpenAD_Symbol_227)
          OpenAD_Symbol_230 = (OpenAD_Symbol_83 * OpenAD_Symbol_227)
          OpenAD_Symbol_231 = (OpenAD_Symbol_66 * OpenAD_Symbol_204)
          OpenAD_Symbol_232 = (OpenAD_Symbol_68 * OpenAD_Symbol_231)
          OpenAD_Symbol_234 = (OpenAD_Symbol_69 * OpenAD_Symbol_231)
          OpenAD_Symbol_235 = (OpenAD_Symbol_70 * OpenAD_Symbol_234)
          OpenAD_Symbol_237 = (OpenAD_Symbol_71 * OpenAD_Symbol_234)
          OpenAD_Symbol_238 = (OpenAD_Symbol_57 * OpenAD_Symbol_203)
          OpenAD_Symbol_239 = (OpenAD_Symbol_59 * OpenAD_Symbol_238)
          OpenAD_Symbol_241 = (OpenAD_Symbol_60 * OpenAD_Symbol_238)
          OpenAD_Symbol_242 = (OpenAD_Symbol_61 * OpenAD_Symbol_241)
          OpenAD_Symbol_244 = (OpenAD_Symbol_62 * OpenAD_Symbol_241)
          OpenAD_Symbol_245 = (OpenAD_Symbol_45 * OpenAD_Symbol_200)
          OpenAD_Symbol_246 = (OpenAD_Symbol_47 * OpenAD_Symbol_245)
          OpenAD_Symbol_248 = (OpenAD_Symbol_48 * OpenAD_Symbol_245)
          OpenAD_Symbol_249 = (OpenAD_Symbol_49 * OpenAD_Symbol_248)
          OpenAD_Symbol_250 = (OpenAD_Symbol_50 * OpenAD_Symbol_248)
          OpenAD_Symbol_251 = (OpenAD_Symbol_36 * OpenAD_Symbol_199)
          OpenAD_Symbol_252 = (OpenAD_Symbol_38 * OpenAD_Symbol_251)
          OpenAD_Symbol_254 = (OpenAD_Symbol_39 * OpenAD_Symbol_251)
          OpenAD_Symbol_255 = (OpenAD_Symbol_40 * OpenAD_Symbol_254)
          OpenAD_Symbol_256 = (OpenAD_Symbol_41 * OpenAD_Symbol_254)
          OpenAD_Symbol_257 = (OpenAD_Symbol_24 * OpenAD_Symbol_191)
          OpenAD_Symbol_258 = (OpenAD_Symbol_26 * OpenAD_Symbol_257)
          OpenAD_Symbol_259 = (OpenAD_Symbol_27 * OpenAD_Symbol_257)
          OpenAD_Symbol_260 = (OpenAD_Symbol_28 * OpenAD_Symbol_259)
          OpenAD_Symbol_261 = (OpenAD_Symbol_29 * OpenAD_Symbol_259)
          OpenAD_Symbol_262 = (OpenAD_Symbol_15 * OpenAD_Symbol_190)
          OpenAD_Symbol_263 = (OpenAD_Symbol_17 * OpenAD_Symbol_262)
          OpenAD_Symbol_265 = (OpenAD_Symbol_18 * OpenAD_Symbol_262)
          OpenAD_Symbol_266 = (OpenAD_Symbol_19 * OpenAD_Symbol_265)
          OpenAD_Symbol_267 = (OpenAD_Symbol_20 * OpenAD_Symbol_265)
          OpenAD_Symbol_268 = (OpenAD_Symbol_8 * OpenAD_Symbol_184)
          OpenAD_Symbol_269 = (OpenAD_Symbol_10 * OpenAD_Symbol_268)
          OpenAD_Symbol_270 = (OpenAD_Symbol_11 * OpenAD_Symbol_268)
          OpenAD_Symbol_271 = (OpenAD_Symbol_2 * OpenAD_Symbol_193)
          OpenAD_Symbol_272 = (OpenAD_Symbol_4 * OpenAD_Symbol_271)
          OpenAD_Symbol_273 = (OpenAD_Symbol_5 * OpenAD_Symbol_271)
          OpenAD_Symbol_274 = (OpenAD_Symbol_114 * OpenAD_Symbol_211)
          OpenAD_Symbol_275 = (OpenAD_Symbol_105 * OpenAD_Symbol_218)
          OpenAD_Symbol_276 = (OpenAD_Symbol_93 * OpenAD_Symbol_224)
          OpenAD_Symbol_277 = (OpenAD_Symbol_84 * OpenAD_Symbol_230)
          OpenAD_Symbol_278 = (OpenAD_Symbol_72 * OpenAD_Symbol_237)
          OpenAD_Symbol_279 = (OpenAD_Symbol_63 * OpenAD_Symbol_244)
          OpenAD_Symbol_280 = (OpenAD_Symbol_51 * OpenAD_Symbol_250)
          OpenAD_Symbol_281 = (OpenAD_Symbol_42 * OpenAD_Symbol_256)
          OpenAD_Symbol_282 = (OpenAD_Symbol_30 * OpenAD_Symbol_261)
          OpenAD_Symbol_283 = (OpenAD_Symbol_21 * OpenAD_Symbol_267)
          CALL setderiv(OpenAD_Symbol_264,PBB)
          CALL setderiv(OpenAD_Symbol_253,PBL)
          CALL setderiv(OpenAD_Symbol_247,PLL)
          CALL setderiv(OpenAD_Symbol_243,PT)
          CALL setderiv(OpenAD_Symbol_240,PB)
          CALL setderiv(OpenAD_Symbol_236,PR)
          CALL setderiv(OpenAD_Symbol_233,PL)
          CALL setderiv(OpenAD_Symbol_229,PRR)
          CALL setderiv(OpenAD_Symbol_221,PBR)
          CALL setderiv(OpenAD_Symbol_217,PTT)
          CALL setderiv(OpenAD_Symbol_214,P)
          CALL setderiv(OpenAD_Symbol_210,PTR)
          CALL setderiv(OpenAD_Symbol_207,PTL)
          CALL sax(OpenAD_Symbol_206,OpenAD_Symbol_207,FVEC(K))
          CALL saxpy(OpenAD_Symbol_209,OpenAD_Symbol_210,FVEC(K))
          CALL saxpy(OpenAD_Symbol_213,OpenAD_Symbol_214,FVEC(K))
          CALL saxpy(OpenAD_Symbol_216,OpenAD_Symbol_217,FVEC(K))
          CALL saxpy(OpenAD_Symbol_220,OpenAD_Symbol_221,FVEC(K))
          CALL saxpy(OpenAD_Symbol_223,OpenAD_Symbol_210,FVEC(K))
          CALL saxpy(OpenAD_Symbol_226,OpenAD_Symbol_214,FVEC(K))
          CALL saxpy(OpenAD_Symbol_228,OpenAD_Symbol_229,FVEC(K))
          CALL saxpy(OpenAD_Symbol_232,OpenAD_Symbol_233,FVEC(K))
          CALL saxpy(OpenAD_Symbol_235,OpenAD_Symbol_236,FVEC(K))
          CALL saxpy(OpenAD_Symbol_239,OpenAD_Symbol_240,FVEC(K))
          CALL saxpy(OpenAD_Symbol_242,OpenAD_Symbol_243,FVEC(K))
          CALL saxpy(OpenAD_Symbol_246,OpenAD_Symbol_247,FVEC(K))
          CALL saxpy(OpenAD_Symbol_249,OpenAD_Symbol_214,FVEC(K))
          CALL saxpy(OpenAD_Symbol_252,OpenAD_Symbol_253,FVEC(K))
          CALL saxpy(OpenAD_Symbol_255,OpenAD_Symbol_207,FVEC(K))
          CALL saxpy(OpenAD_Symbol_258,OpenAD_Symbol_253,FVEC(K))
          CALL saxpy(OpenAD_Symbol_260,OpenAD_Symbol_221,FVEC(K))
          CALL saxpy(OpenAD_Symbol_263,OpenAD_Symbol_264,FVEC(K))
          CALL saxpy(OpenAD_Symbol_266,OpenAD_Symbol_214,FVEC(K))
          CALL saxpy(OpenAD_Symbol_269,OpenAD_Symbol_236,FVEC(K))
          CALL saxpy(OpenAD_Symbol_270,OpenAD_Symbol_233,FVEC(K))
          CALL saxpy(OpenAD_Symbol_272,OpenAD_Symbol_243,FVEC(K))
          CALL saxpy(OpenAD_Symbol_273,OpenAD_Symbol_240,FVEC(K))
          CALL saxpy(OpenAD_Symbol_274,OpenAD_Symbol_243,FVEC(K))
          CALL saxpy(OpenAD_Symbol_275,OpenAD_Symbol_243,FVEC(K))
          CALL saxpy(OpenAD_Symbol_276,OpenAD_Symbol_236,FVEC(K))
          CALL saxpy(OpenAD_Symbol_277,OpenAD_Symbol_236,FVEC(K))
          CALL saxpy(OpenAD_Symbol_278,OpenAD_Symbol_214,FVEC(K))
          CALL saxpy(OpenAD_Symbol_279,OpenAD_Symbol_214,FVEC(K))
          CALL saxpy(OpenAD_Symbol_280,OpenAD_Symbol_233,FVEC(K))
          CALL saxpy(OpenAD_Symbol_281,OpenAD_Symbol_233,FVEC(K))
          CALL saxpy(OpenAD_Symbol_282,OpenAD_Symbol_240,FVEC(K))
          CALL saxpy(OpenAD_Symbol_283,OpenAD_Symbol_240,FVEC(K))
        END DO
      END DO
      RETURN
      END SUBROUTINE