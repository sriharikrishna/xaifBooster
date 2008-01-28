
      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(NX, NY, X, FVEC, R)
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
      REAL(w2f__8) OpenAD_Symbol_103
      REAL(w2f__8) OpenAD_Symbol_104
      REAL(w2f__8) OpenAD_Symbol_106
      REAL(w2f__8) OpenAD_Symbol_107
      REAL(w2f__8) OpenAD_Symbol_108
      REAL(w2f__8) OpenAD_Symbol_109
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_110
      REAL(w2f__8) OpenAD_Symbol_112
      REAL(w2f__8) OpenAD_Symbol_113
      REAL(w2f__8) OpenAD_Symbol_114
      REAL(w2f__8) OpenAD_Symbol_115
      REAL(w2f__8) OpenAD_Symbol_116
      REAL(w2f__8) OpenAD_Symbol_117
      REAL(w2f__8) OpenAD_Symbol_119
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_120
      REAL(w2f__8) OpenAD_Symbol_121
      REAL(w2f__8) OpenAD_Symbol_122
      REAL(w2f__8) OpenAD_Symbol_123
      REAL(w2f__8) OpenAD_Symbol_125
      REAL(w2f__8) OpenAD_Symbol_126
      REAL(w2f__8) OpenAD_Symbol_128
      REAL(w2f__8) OpenAD_Symbol_129
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_130
      REAL(w2f__8) OpenAD_Symbol_131
      REAL(w2f__8) OpenAD_Symbol_132
      REAL(w2f__8) OpenAD_Symbol_134
      REAL(w2f__8) OpenAD_Symbol_136
      REAL(w2f__8) OpenAD_Symbol_137
      REAL(w2f__8) OpenAD_Symbol_138
      REAL(w2f__8) OpenAD_Symbol_139
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_140
      REAL(w2f__8) OpenAD_Symbol_141
      REAL(w2f__8) OpenAD_Symbol_143
      REAL(w2f__8) OpenAD_Symbol_144
      REAL(w2f__8) OpenAD_Symbol_145
      REAL(w2f__8) OpenAD_Symbol_146
      REAL(w2f__8) OpenAD_Symbol_147
      REAL(w2f__8) OpenAD_Symbol_148
      REAL(w2f__8) OpenAD_Symbol_149
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_150
      REAL(w2f__8) OpenAD_Symbol_152
      REAL(w2f__8) OpenAD_Symbol_153
      REAL(w2f__8) OpenAD_Symbol_154
      REAL(w2f__8) OpenAD_Symbol_155
      REAL(w2f__8) OpenAD_Symbol_156
      REAL(w2f__8) OpenAD_Symbol_157
      REAL(w2f__8) OpenAD_Symbol_159
      REAL(w2f__8) OpenAD_Symbol_160
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
      REAL(w2f__8) OpenAD_Symbol_220
      REAL(w2f__8) OpenAD_Symbol_221
      REAL(w2f__8) OpenAD_Symbol_222
      REAL(w2f__8) OpenAD_Symbol_223
      REAL(w2f__8) OpenAD_Symbol_224
      REAL(w2f__8) OpenAD_Symbol_225
      REAL(w2f__8) OpenAD_Symbol_226
      REAL(w2f__8) OpenAD_Symbol_227
      REAL(w2f__8) OpenAD_Symbol_228
      REAL(w2f__8) OpenAD_Symbol_229
      REAL(w2f__8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_230
      REAL(w2f__8) OpenAD_Symbol_231
      REAL(w2f__8) OpenAD_Symbol_232
      REAL(w2f__8) OpenAD_Symbol_233
      REAL(w2f__8) OpenAD_Symbol_234
      REAL(w2f__8) OpenAD_Symbol_235
      REAL(w2f__8) OpenAD_Symbol_236
      REAL(w2f__8) OpenAD_Symbol_237
      REAL(w2f__8) OpenAD_Symbol_238
      REAL(w2f__8) OpenAD_Symbol_239
      REAL(w2f__8) OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_240
      REAL(w2f__8) OpenAD_Symbol_241
      REAL(w2f__8) OpenAD_Symbol_242
      REAL(w2f__8) OpenAD_Symbol_243
      REAL(w2f__8) OpenAD_Symbol_244
      REAL(w2f__8) OpenAD_Symbol_245
      REAL(w2f__8) OpenAD_Symbol_246
      REAL(w2f__8) OpenAD_Symbol_247
      REAL(w2f__8) OpenAD_Symbol_248
      REAL(w2f__8) OpenAD_Symbol_249
      REAL(w2f__8) OpenAD_Symbol_250
      REAL(w2f__8) OpenAD_Symbol_251
      REAL(w2f__8) OpenAD_Symbol_252
      REAL(w2f__8) OpenAD_Symbol_253
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
      REAL(w2f__8) OpenAD_Symbol_264
      REAL(w2f__8) OpenAD_Symbol_265
      REAL(w2f__8) OpenAD_Symbol_266
      REAL(w2f__8) OpenAD_Symbol_267
      TYPE (OpenADTy_active) OpenAD_Symbol_268
      REAL(w2f__8) OpenAD_Symbol_27
      REAL(w2f__8) OpenAD_Symbol_28
      REAL(w2f__8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_32
      REAL(w2f__8) OpenAD_Symbol_33
      REAL(w2f__8) OpenAD_Symbol_34
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_37
      REAL(w2f__8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_43
      REAL(w2f__8) OpenAD_Symbol_44
      REAL(w2f__8) OpenAD_Symbol_46
      REAL(w2f__8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_50
      REAL(w2f__8) OpenAD_Symbol_52
      REAL(w2f__8) OpenAD_Symbol_53
      REAL(w2f__8) OpenAD_Symbol_54
      REAL(w2f__8) OpenAD_Symbol_55
      REAL(w2f__8) OpenAD_Symbol_57
      REAL(w2f__8) OpenAD_Symbol_58
      REAL(w2f__8) OpenAD_Symbol_59
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_60
      REAL(w2f__8) OpenAD_Symbol_61
      REAL(w2f__8) OpenAD_Symbol_63
      REAL(w2f__8) OpenAD_Symbol_64
      REAL(w2f__8) OpenAD_Symbol_66
      REAL(w2f__8) OpenAD_Symbol_67
      REAL(w2f__8) OpenAD_Symbol_68
      REAL(w2f__8) OpenAD_Symbol_69
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_70
      REAL(w2f__8) OpenAD_Symbol_72
      REAL(w2f__8) OpenAD_Symbol_73
      REAL(w2f__8) OpenAD_Symbol_74
      REAL(w2f__8) OpenAD_Symbol_75
      REAL(w2f__8) OpenAD_Symbol_77
      REAL(w2f__8) OpenAD_Symbol_78
      REAL(w2f__8) OpenAD_Symbol_79
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_80
      REAL(w2f__8) OpenAD_Symbol_81
      REAL(w2f__8) OpenAD_Symbol_83
      REAL(w2f__8) OpenAD_Symbol_84
      REAL(w2f__8) OpenAD_Symbol_86
      REAL(w2f__8) OpenAD_Symbol_87
      REAL(w2f__8) OpenAD_Symbol_88
      REAL(w2f__8) OpenAD_Symbol_89
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_92
      REAL(w2f__8) OpenAD_Symbol_93
      REAL(w2f__8) OpenAD_Symbol_94
      REAL(w2f__8) OpenAD_Symbol_95
      REAL(w2f__8) OpenAD_Symbol_97
      REAL(w2f__8) OpenAD_Symbol_98
      REAL(w2f__8) OpenAD_Symbol_99
C
C     **** Parameters and Result ****
C
      INTEGER(w2f__i4) NX
      INTEGER(w2f__i4) NY
      TYPE (OpenADTy_active) X(1 : INT((NX * NY)))
      TYPE (OpenADTy_active) FVEC(1 : INT((NX * NY)))
      REAL(w2f__8) R
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i8) t__1
      INTEGER(w2f__i8) t__2
      TYPE (OpenADTy_active) DPDX
      TYPE (OpenADTy_active) DPDY
      REAL(w2f__8) FOUR
      PARAMETER ( FOUR = 4.0D00)
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
      PARAMETER ( ONE = 1.0D00)
      TYPE (OpenADTy_active) P
      TYPE (OpenADTy_active) PB
      TYPE (OpenADTy_active) PBB
      TYPE (OpenADTy_active) PBL
      TYPE (OpenADTy_active) PBLAP
      TYPE (OpenADTy_active) PBR
      TYPE (OpenADTy_active) PL
      TYPE (OpenADTy_active) PLAP
      TYPE (OpenADTy_active) PLL
      TYPE (OpenADTy_active) PLLAP
      TYPE (OpenADTy_active) PR
      TYPE (OpenADTy_active) PRLAP
      TYPE (OpenADTy_active) PRR
      TYPE (OpenADTy_active) PT
      TYPE (OpenADTy_active) PTL
      TYPE (OpenADTy_active) PTLAP
      TYPE (OpenADTy_active) PTR
      TYPE (OpenADTy_active) PTT
      REAL(w2f__8) THREE
      PARAMETER ( THREE = 3.0D00)
      REAL(w2f__8) TWO
      PARAMETER ( TWO = 2.0D00)
      REAL(w2f__8) ZERO
      PARAMETER ( ZERO = 0.0D00)
      INTEGER(w2f__i4) t__3
      INTEGER(w2f__i4) t__4
      INTEGER(w2f__i4) t__5
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
      t__2 = MAX(INT(NX * NY), 0_w2f__i8)
      N = NX * NY
      NXP1 = (NX + INT(1_w2f__i8))
      NYP1 = (NY + INT(1_w2f__i8))
      HX = (1.0D00 / NXP1)
      HY = (1.0D00 / NYP1)
      HY2 = (HY * HY)
      HX2 = (HX * HX)
      t__3 = NY
      DO I = 1, NY, 1
        t__4 = NX
        DO J = 1, NX, 1
          K = J + NX *(I +(-1))
          IF((I .eq. INT(1_w2f__i8)) .OR.(J .eq. INT(1_w2f__i8))) THEN
            __value__(PBL) = 0.0D00
            CALL zero_deriv(__deriv__(PBL))
          ELSE
            __value__(PBL) = __value__(X(K - NX + (-1)))
            CALL setderiv(__deriv__(PBL), __deriv__(X(K - NX + (-1))))
          ENDIF
          IF(I .eq. INT(1_w2f__i8)) THEN
            __value__(PB) = 0.0D00
            __value__(PBB) = __value__(X(K))
            CALL setderiv(__deriv__(PBB), __deriv__(X(K)))
            CALL zero_deriv(__deriv__(PB))
          ELSE
            IF(I .eq. INT(2_w2f__i8)) THEN
              __value__(PB) = __value__(X(K - NX))
              __value__(PBB) = 0.0D00
              CALL setderiv(__deriv__(PB), __deriv__(X(K - NX)))
              CALL zero_deriv(__deriv__(PBB))
            ELSE
              __value__(PB) = __value__(X(K - NX))
              __value__(PBB) = __value__(X(K - NX * 2))
              CALL setderiv(__deriv__(PB), __deriv__(X(K - NX)))
              CALL setderiv(__deriv__(PBB), __deriv__(X(K - NX * 2)))
            ENDIF
          ENDIF
          IF((NX .eq. J) .OR.(I .eq. INT(1_w2f__i8))) THEN
            __value__(PBR) = 0.0D00
            CALL zero_deriv(__deriv__(PBR))
          ELSE
            __value__(PBR) = __value__(X(K - NX + 1))
            CALL setderiv(__deriv__(PBR), __deriv__(X(K - NX + 1)))
          ENDIF
          IF(J .eq. INT(1_w2f__i8)) THEN
            __value__(PL) = 0.0D00
            __value__(PLL) = __value__(X(K))
            CALL setderiv(__deriv__(PLL), __deriv__(X(K)))
            CALL zero_deriv(__deriv__(PL))
          ELSE
            IF(J .eq. INT(2_w2f__i8)) THEN
              __value__(PL) = __value__(X(K + (-1)))
              __value__(PLL) = 0.0D00
              CALL setderiv(__deriv__(PL), __deriv__(X(K + (-1))))
              CALL zero_deriv(__deriv__(PLL))
            ELSE
              __value__(PL) = __value__(X(K + (-1)))
              __value__(PLL) = __value__(X(K + (-2)))
              CALL setderiv(__deriv__(PL), __deriv__(X(K + (-1))))
              CALL setderiv(__deriv__(PLL), __deriv__(X(K + (-2))))
            ENDIF
          ENDIF
          __value__(P) = __value__(X(K))
          CALL setderiv(__deriv__(P), __deriv__(X(K)))
          IF(J .eq.(NX + INT((-1_w2f__i8)))) THEN
            __value__(PR) = __value__(X(K + 1))
            __value__(PRR) = 0.0D00
            CALL setderiv(__deriv__(PR), __deriv__(X(K + 1)))
            CALL zero_deriv(__deriv__(PRR))
          ELSE
            IF(NX .eq. J) THEN
              __value__(PR) = 0.0D00
              __value__(PRR) = __value__(X(K))
              CALL setderiv(__deriv__(PRR), __deriv__(X(K)))
              CALL zero_deriv(__deriv__(PR))
            ELSE
              __value__(PR) = __value__(X(K + 1))
              __value__(PRR) = __value__(X(K + 2))
              CALL setderiv(__deriv__(PR), __deriv__(X(K + 1)))
              CALL setderiv(__deriv__(PRR), __deriv__(X(K + 2)))
            ENDIF
          ENDIF
          IF((NY .eq. I) .OR.(J .eq. INT(1_w2f__i8))) THEN
            __value__(PTL) = 0.0D00
            CALL zero_deriv(__deriv__(PTL))
          ELSE
            __value__(PTL) = __value__(X(NX + K + (-1)))
            CALL setderiv(__deriv__(PTL), __deriv__(X(NX + K + (-1))))
          ENDIF
          IF(I .eq.(NY + INT((-1_w2f__i8)))) THEN
            __value__(PT) = __value__(X(NX + K))
            __value__(PTT) = 0.0D00
            CALL setderiv(__deriv__(PT), __deriv__(X(NX + K)))
            CALL zero_deriv(__deriv__(PTT))
          ELSE
            IF(NY .eq. I) THEN
              __value__(PT) = 0.0D00
              __value__(PTT) = (__value__(X(K)) + HY * 2.0D00)
              OpenAD_Symbol_157 = 1_w2f__i8
              OpenAD_Symbol_266 = OpenAD_Symbol_157
              CALL zero_deriv(__deriv__(PT))
              CALL sax(OpenAD_Symbol_266, __deriv__(X(K)), __deriv__(
     > PTT))
            ELSE
              __value__(PT) = __value__(X(NX + K))
              __value__(PTT) = __value__(X(K + NX * 2))
              CALL setderiv(__deriv__(PT), __deriv__(X(NX + K)))
              CALL setderiv(__deriv__(PTT), __deriv__(X(K + NX * 2)))
            ENDIF
          ENDIF
          IF((NX .eq. J) .OR.(NY .eq. I)) THEN
            __value__(PTR) = 0.0D00
            CALL zero_deriv(__deriv__(PTR))
          ELSE
            __value__(PTR) = __value__(X(NX + K + 1))
            CALL setderiv(__deriv__(PTR), __deriv__(X(NX + K + 1)))
          ENDIF
          OpenAD_Symbol_0 = (__value__(PT) - __value__(PB))
          OpenAD_Symbol_1 = (HY * 2.0D00)
          __value__(DPDY) = (OpenAD_Symbol_0 / OpenAD_Symbol_1)
          OpenAD_Symbol_4 = 1_w2f__i8
          OpenAD_Symbol_5 = (-1_w2f__i8)
          OpenAD_Symbol_2 = (INT(1_w2f__i8) / OpenAD_Symbol_1)
          OpenAD_Symbol_6 = (__value__(PR) - __value__(PL))
          OpenAD_Symbol_7 = (HX * 2.0D00)
          __value__(DPDX) = (OpenAD_Symbol_6 / OpenAD_Symbol_7)
          OpenAD_Symbol_10 = 1_w2f__i8
          OpenAD_Symbol_11 = (-1_w2f__i8)
          OpenAD_Symbol_8 = (INT(1_w2f__i8) / OpenAD_Symbol_7)
          OpenAD_Symbol_14 = (__value__(PBB) + __value__(P) - __value__
     > (PB) * 2.0D00)
          OpenAD_Symbol_23 = (__value__(PBL) + __value__(PBR) -
     >  __value__(PB) * 2.0D00)
          __value__(PBLAP) = ((OpenAD_Symbol_14 / HY2) +(
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
          OpenAD_Symbol_34 = (__value__(PBL) + __value__(PTL) -
     >  __value__(PL) * 2.0D00)
          OpenAD_Symbol_43 = (__value__(PLL) + __value__(P) - __value__
     > (PL) * 2.0D00)
          __value__(PLLAP) = ((OpenAD_Symbol_34 / HY2) +(
     > OpenAD_Symbol_43 / HX2))
          OpenAD_Symbol_37 = 1_w2f__i8
          OpenAD_Symbol_39 = 1_w2f__i8
          OpenAD_Symbol_41 = 2.0D00
          OpenAD_Symbol_40 = (-1_w2f__i8)
          OpenAD_Symbol_38 = 1_w2f__i8
          OpenAD_Symbol_35 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_32 = 1_w2f__i8
          OpenAD_Symbol_46 = 1_w2f__i8
          OpenAD_Symbol_48 = 1_w2f__i8
          OpenAD_Symbol_50 = 2.0D00
          OpenAD_Symbol_49 = (-1_w2f__i8)
          OpenAD_Symbol_47 = 1_w2f__i8
          OpenAD_Symbol_44 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_33 = 1_w2f__i8
          OpenAD_Symbol_54 = (__value__(PB) + __value__(PT) - __value__
     > (P) * 2.0D00)
          OpenAD_Symbol_63 = (__value__(PL) + __value__(PR) - __value__
     > (P) * 2.0D00)
          __value__(PLAP) = ((OpenAD_Symbol_54 / HY2) +(
     > OpenAD_Symbol_63 / HX2))
          OpenAD_Symbol_57 = 1_w2f__i8
          OpenAD_Symbol_59 = 1_w2f__i8
          OpenAD_Symbol_61 = 2.0D00
          OpenAD_Symbol_60 = (-1_w2f__i8)
          OpenAD_Symbol_58 = 1_w2f__i8
          OpenAD_Symbol_55 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_52 = 1_w2f__i8
          OpenAD_Symbol_66 = 1_w2f__i8
          OpenAD_Symbol_68 = 1_w2f__i8
          OpenAD_Symbol_70 = 2.0D00
          OpenAD_Symbol_69 = (-1_w2f__i8)
          OpenAD_Symbol_67 = 1_w2f__i8
          OpenAD_Symbol_64 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_53 = 1_w2f__i8
          OpenAD_Symbol_74 = (__value__(P) + __value__(PRR) - __value__
     > (PR) * 2.0D00)
          OpenAD_Symbol_83 = (__value__(PBR) + __value__(PTR) -
     >  __value__(PR) * 2.0D00)
          __value__(PRLAP) = ((OpenAD_Symbol_74 / HX2) +(
     > OpenAD_Symbol_83 / HY2))
          OpenAD_Symbol_77 = 1_w2f__i8
          OpenAD_Symbol_79 = 1_w2f__i8
          OpenAD_Symbol_81 = 2.0D00
          OpenAD_Symbol_80 = (-1_w2f__i8)
          OpenAD_Symbol_78 = 1_w2f__i8
          OpenAD_Symbol_75 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_72 = 1_w2f__i8
          OpenAD_Symbol_86 = 1_w2f__i8
          OpenAD_Symbol_88 = 1_w2f__i8
          OpenAD_Symbol_90 = 2.0D00
          OpenAD_Symbol_89 = (-1_w2f__i8)
          OpenAD_Symbol_87 = 1_w2f__i8
          OpenAD_Symbol_84 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_73 = 1_w2f__i8
          OpenAD_Symbol_94 = (__value__(P) + __value__(PTT) - __value__
     > (PT) * 2.0D00)
          OpenAD_Symbol_103 = (__value__(PTL) + __value__(PTR) -
     >  __value__(PT) * 2.0D00)
          __value__(PTLAP) = ((OpenAD_Symbol_94 / HY2) +(
     > OpenAD_Symbol_103 / HX2))
          OpenAD_Symbol_97 = 1_w2f__i8
          OpenAD_Symbol_99 = 1_w2f__i8
          OpenAD_Symbol_101 = 2.0D00
          OpenAD_Symbol_100 = (-1_w2f__i8)
          OpenAD_Symbol_98 = 1_w2f__i8
          OpenAD_Symbol_95 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_92 = 1_w2f__i8
          OpenAD_Symbol_106 = 1_w2f__i8
          OpenAD_Symbol_108 = 1_w2f__i8
          OpenAD_Symbol_110 = 2.0D00
          OpenAD_Symbol_109 = (-1_w2f__i8)
          OpenAD_Symbol_107 = 1_w2f__i8
          OpenAD_Symbol_104 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_93 = 1_w2f__i8
          OpenAD_Symbol_116 = (__value__(PBLAP) + __value__(PTLAP) -
     >  __value__(PLAP) * 2.0D00)
          OpenAD_Symbol_125 = (__value__(PLLAP) + __value__(PRLAP) -
     >  __value__(PLAP) * 2.0D00)
          OpenAD_Symbol_143 = (__value__(PRLAP) - __value__(PLLAP))
          OpenAD_Symbol_139 = (__value__(DPDY) * OpenAD_Symbol_143)
          OpenAD_Symbol_140 = (HX * 2.0D00)
          OpenAD_Symbol_152 = (__value__(PTLAP) - __value__(PBLAP))
          OpenAD_Symbol_148 = (__value__(DPDX) * OpenAD_Symbol_152)
          OpenAD_Symbol_149 = (HY * 2.0D00)
          OpenAD_Symbol_134 = ((OpenAD_Symbol_139 / OpenAD_Symbol_140)
     >  -(OpenAD_Symbol_148 / OpenAD_Symbol_149))
          __value__(FVEC(INT(K))) = ((OpenAD_Symbol_116 / HY2) +(
     > OpenAD_Symbol_125 / HX2) - R * OpenAD_Symbol_134)
          OpenAD_Symbol_119 = 1_w2f__i8
          OpenAD_Symbol_121 = 1_w2f__i8
          OpenAD_Symbol_123 = 2.0D00
          OpenAD_Symbol_122 = (-1_w2f__i8)
          OpenAD_Symbol_120 = 1_w2f__i8
          OpenAD_Symbol_117 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_114 = 1_w2f__i8
          OpenAD_Symbol_128 = 1_w2f__i8
          OpenAD_Symbol_130 = 1_w2f__i8
          OpenAD_Symbol_132 = 2.0D00
          OpenAD_Symbol_131 = (-1_w2f__i8)
          OpenAD_Symbol_129 = 1_w2f__i8
          OpenAD_Symbol_126 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_115 = 1_w2f__i8
          OpenAD_Symbol_112 = 1_w2f__i8
          OpenAD_Symbol_144 = OpenAD_Symbol_143
          OpenAD_Symbol_146 = 1_w2f__i8
          OpenAD_Symbol_147 = (-1_w2f__i8)
          OpenAD_Symbol_145 = __value__(DPDY)
          OpenAD_Symbol_141 = (INT(1_w2f__i8) / OpenAD_Symbol_140)
          OpenAD_Symbol_137 = 1_w2f__i8
          OpenAD_Symbol_153 = OpenAD_Symbol_152
          OpenAD_Symbol_155 = 1_w2f__i8
          OpenAD_Symbol_156 = (-1_w2f__i8)
          OpenAD_Symbol_154 = __value__(DPDX)
          OpenAD_Symbol_150 = (INT(1_w2f__i8) / OpenAD_Symbol_149)
          OpenAD_Symbol_138 = (-1_w2f__i8)
          OpenAD_Symbol_136 = R
          OpenAD_Symbol_113 = (-1_w2f__i8)
          OpenAD_Symbol_163 = (OpenAD_Symbol_114 * OpenAD_Symbol_112)
          OpenAD_Symbol_164 = (OpenAD_Symbol_115 * OpenAD_Symbol_112)
          OpenAD_Symbol_165 = (OpenAD_Symbol_136 * OpenAD_Symbol_113)
          OpenAD_Symbol_166 = (OpenAD_Symbol_137 * OpenAD_Symbol_165)
          OpenAD_Symbol_167 = (OpenAD_Symbol_138 * OpenAD_Symbol_165)
          OpenAD_Symbol_168 = (OpenAD_Symbol_126 * OpenAD_Symbol_164)
          OpenAD_Symbol_169 = (OpenAD_Symbol_128 * OpenAD_Symbol_168)
          OpenAD_Symbol_170 = (OpenAD_Symbol_129 * OpenAD_Symbol_168)
          OpenAD_Symbol_171 = (OpenAD_Symbol_130 * OpenAD_Symbol_170)
          OpenAD_Symbol_172 = (OpenAD_Symbol_131 * OpenAD_Symbol_170)
          OpenAD_Symbol_173 = (OpenAD_Symbol_117 * OpenAD_Symbol_163)
          OpenAD_Symbol_174 = (OpenAD_Symbol_119 * OpenAD_Symbol_173)
          OpenAD_Symbol_175 = (OpenAD_Symbol_120 * OpenAD_Symbol_173)
          OpenAD_Symbol_176 = (OpenAD_Symbol_121 * OpenAD_Symbol_175)
          OpenAD_Symbol_177 = (OpenAD_Symbol_122 * OpenAD_Symbol_175)
          OpenAD_Symbol_178 = (OpenAD_Symbol_150 * OpenAD_Symbol_167)
          OpenAD_Symbol_179 = (OpenAD_Symbol_153 * OpenAD_Symbol_178)
          OpenAD_Symbol_180 = (OpenAD_Symbol_154 * OpenAD_Symbol_178)
          OpenAD_Symbol_181 = (OpenAD_Symbol_176 + OpenAD_Symbol_155 *
     >  OpenAD_Symbol_180)
          OpenAD_Symbol_182 = (OpenAD_Symbol_174 + OpenAD_Symbol_156 *
     >  OpenAD_Symbol_180)
          OpenAD_Symbol_183 = (OpenAD_Symbol_92 * OpenAD_Symbol_181)
          OpenAD_Symbol_184 = (OpenAD_Symbol_93 * OpenAD_Symbol_181)
          OpenAD_Symbol_185 = (OpenAD_Symbol_12 * OpenAD_Symbol_182)
          OpenAD_Symbol_186 = (OpenAD_Symbol_13 * OpenAD_Symbol_182)
          OpenAD_Symbol_187 = (OpenAD_Symbol_141 * OpenAD_Symbol_166)
          OpenAD_Symbol_188 = (OpenAD_Symbol_144 * OpenAD_Symbol_187)
          OpenAD_Symbol_189 = (OpenAD_Symbol_145 * OpenAD_Symbol_187)
          OpenAD_Symbol_190 = (OpenAD_Symbol_171 + OpenAD_Symbol_146 *
     >  OpenAD_Symbol_189)
          OpenAD_Symbol_191 = (OpenAD_Symbol_169 + OpenAD_Symbol_147 *
     >  OpenAD_Symbol_189)
          OpenAD_Symbol_192 = (OpenAD_Symbol_72 * OpenAD_Symbol_190)
          OpenAD_Symbol_193 = (OpenAD_Symbol_73 * OpenAD_Symbol_190)
          OpenAD_Symbol_194 = (OpenAD_Symbol_32 * OpenAD_Symbol_191)
          OpenAD_Symbol_195 = (OpenAD_Symbol_33 * OpenAD_Symbol_191)
          OpenAD_Symbol_196 = (OpenAD_Symbol_132 * OpenAD_Symbol_172)
          OpenAD_Symbol_197 = (OpenAD_Symbol_196 + OpenAD_Symbol_123 *
     >  OpenAD_Symbol_177)
          OpenAD_Symbol_198 = (OpenAD_Symbol_52 * OpenAD_Symbol_197)
          OpenAD_Symbol_199 = (OpenAD_Symbol_53 * OpenAD_Symbol_197)
          OpenAD_Symbol_200 = (OpenAD_Symbol_104 * OpenAD_Symbol_184)
          OpenAD_Symbol_201 = (OpenAD_Symbol_106 * OpenAD_Symbol_200)
          OpenAD_Symbol_202 = (OpenAD_Symbol_107 * OpenAD_Symbol_200)
          OpenAD_Symbol_203 = (OpenAD_Symbol_108 * OpenAD_Symbol_202)
          OpenAD_Symbol_204 = (OpenAD_Symbol_109 * OpenAD_Symbol_202)
          OpenAD_Symbol_205 = (OpenAD_Symbol_95 * OpenAD_Symbol_183)
          OpenAD_Symbol_206 = (OpenAD_Symbol_97 * OpenAD_Symbol_205)
          OpenAD_Symbol_207 = (OpenAD_Symbol_98 * OpenAD_Symbol_205)
          OpenAD_Symbol_208 = (OpenAD_Symbol_99 * OpenAD_Symbol_207)
          OpenAD_Symbol_209 = (OpenAD_Symbol_100 * OpenAD_Symbol_207)
          OpenAD_Symbol_210 = (OpenAD_Symbol_84 * OpenAD_Symbol_193)
          OpenAD_Symbol_211 = (OpenAD_Symbol_86 * OpenAD_Symbol_210)
          OpenAD_Symbol_212 = (OpenAD_Symbol_87 * OpenAD_Symbol_210)
          OpenAD_Symbol_213 = (OpenAD_Symbol_88 * OpenAD_Symbol_212)
          OpenAD_Symbol_214 = (OpenAD_Symbol_89 * OpenAD_Symbol_212)
          OpenAD_Symbol_215 = (OpenAD_Symbol_75 * OpenAD_Symbol_192)
          OpenAD_Symbol_216 = (OpenAD_Symbol_77 * OpenAD_Symbol_215)
          OpenAD_Symbol_217 = (OpenAD_Symbol_78 * OpenAD_Symbol_215)
          OpenAD_Symbol_218 = (OpenAD_Symbol_79 * OpenAD_Symbol_217)
          OpenAD_Symbol_219 = (OpenAD_Symbol_80 * OpenAD_Symbol_217)
          OpenAD_Symbol_220 = (OpenAD_Symbol_64 * OpenAD_Symbol_199)
          OpenAD_Symbol_221 = (OpenAD_Symbol_66 * OpenAD_Symbol_220)
          OpenAD_Symbol_222 = (OpenAD_Symbol_67 * OpenAD_Symbol_220)
          OpenAD_Symbol_223 = (OpenAD_Symbol_68 * OpenAD_Symbol_222)
          OpenAD_Symbol_224 = (OpenAD_Symbol_69 * OpenAD_Symbol_222)
          OpenAD_Symbol_225 = (OpenAD_Symbol_55 * OpenAD_Symbol_198)
          OpenAD_Symbol_226 = (OpenAD_Symbol_57 * OpenAD_Symbol_225)
          OpenAD_Symbol_227 = (OpenAD_Symbol_58 * OpenAD_Symbol_225)
          OpenAD_Symbol_228 = (OpenAD_Symbol_59 * OpenAD_Symbol_227)
          OpenAD_Symbol_229 = (OpenAD_Symbol_60 * OpenAD_Symbol_227)
          OpenAD_Symbol_230 = (OpenAD_Symbol_44 * OpenAD_Symbol_195)
          OpenAD_Symbol_231 = (OpenAD_Symbol_46 * OpenAD_Symbol_230)
          OpenAD_Symbol_232 = (OpenAD_Symbol_47 * OpenAD_Symbol_230)
          OpenAD_Symbol_233 = (OpenAD_Symbol_48 * OpenAD_Symbol_232)
          OpenAD_Symbol_234 = (OpenAD_Symbol_49 * OpenAD_Symbol_232)
          OpenAD_Symbol_235 = (OpenAD_Symbol_35 * OpenAD_Symbol_194)
          OpenAD_Symbol_236 = (OpenAD_Symbol_37 * OpenAD_Symbol_235)
          OpenAD_Symbol_237 = (OpenAD_Symbol_38 * OpenAD_Symbol_235)
          OpenAD_Symbol_238 = (OpenAD_Symbol_39 * OpenAD_Symbol_237)
          OpenAD_Symbol_239 = (OpenAD_Symbol_40 * OpenAD_Symbol_237)
          OpenAD_Symbol_240 = (OpenAD_Symbol_24 * OpenAD_Symbol_186)
          OpenAD_Symbol_241 = (OpenAD_Symbol_26 * OpenAD_Symbol_240)
          OpenAD_Symbol_242 = (OpenAD_Symbol_27 * OpenAD_Symbol_240)
          OpenAD_Symbol_243 = (OpenAD_Symbol_28 * OpenAD_Symbol_242)
          OpenAD_Symbol_244 = (OpenAD_Symbol_29 * OpenAD_Symbol_242)
          OpenAD_Symbol_245 = (OpenAD_Symbol_15 * OpenAD_Symbol_185)
          OpenAD_Symbol_246 = (OpenAD_Symbol_17 * OpenAD_Symbol_245)
          OpenAD_Symbol_247 = (OpenAD_Symbol_18 * OpenAD_Symbol_245)
          OpenAD_Symbol_248 = (OpenAD_Symbol_19 * OpenAD_Symbol_247)
          OpenAD_Symbol_249 = (OpenAD_Symbol_20 * OpenAD_Symbol_247)
          OpenAD_Symbol_250 = (OpenAD_Symbol_8 * OpenAD_Symbol_179)
          OpenAD_Symbol_251 = (OpenAD_Symbol_10 * OpenAD_Symbol_250)
          OpenAD_Symbol_252 = (OpenAD_Symbol_11 * OpenAD_Symbol_250)
          OpenAD_Symbol_253 = (OpenAD_Symbol_2 * OpenAD_Symbol_188)
          OpenAD_Symbol_254 = (OpenAD_Symbol_4 * OpenAD_Symbol_253)
          OpenAD_Symbol_255 = (OpenAD_Symbol_5 * OpenAD_Symbol_253)
          OpenAD_Symbol_256 = (OpenAD_Symbol_110 * OpenAD_Symbol_204)
          OpenAD_Symbol_257 = (OpenAD_Symbol_101 * OpenAD_Symbol_209)
          OpenAD_Symbol_258 = (OpenAD_Symbol_90 * OpenAD_Symbol_214)
          OpenAD_Symbol_259 = (OpenAD_Symbol_81 * OpenAD_Symbol_219)
          OpenAD_Symbol_260 = (OpenAD_Symbol_70 * OpenAD_Symbol_224)
          OpenAD_Symbol_261 = (OpenAD_Symbol_61 * OpenAD_Symbol_229)
          OpenAD_Symbol_262 = (OpenAD_Symbol_50 * OpenAD_Symbol_234)
          OpenAD_Symbol_263 = (OpenAD_Symbol_41 * OpenAD_Symbol_239)
          OpenAD_Symbol_264 = (OpenAD_Symbol_30 * OpenAD_Symbol_244)
          OpenAD_Symbol_265 = (OpenAD_Symbol_21 * OpenAD_Symbol_249)
          CALL sax(OpenAD_Symbol_201, __deriv__(PTL), __deriv__(FVEC(K)
     > ))
          CALL saxpy(OpenAD_Symbol_203, __deriv__(PTR), __deriv__(FVEC(
     > K)))
          CALL saxpy(OpenAD_Symbol_206, __deriv__(P), __deriv__(FVEC(K)
     > ))
          CALL saxpy(OpenAD_Symbol_208, __deriv__(PTT), __deriv__(FVEC(
     > K)))
          CALL saxpy(OpenAD_Symbol_211, __deriv__(PBR), __deriv__(FVEC(
     > K)))
          CALL saxpy(OpenAD_Symbol_213, __deriv__(PTR), __deriv__(FVEC(
     > K)))
          CALL saxpy(OpenAD_Symbol_216, __deriv__(P), __deriv__(FVEC(K)
     > ))
          CALL saxpy(OpenAD_Symbol_218, __deriv__(PRR), __deriv__(FVEC(
     > K)))
          CALL saxpy(OpenAD_Symbol_221, __deriv__(PL), __deriv__(FVEC(K
     > )))
          CALL saxpy(OpenAD_Symbol_223, __deriv__(PR), __deriv__(FVEC(K
     > )))
          CALL saxpy(OpenAD_Symbol_226, __deriv__(PB), __deriv__(FVEC(K
     > )))
          CALL saxpy(OpenAD_Symbol_228, __deriv__(PT), __deriv__(FVEC(K
     > )))
          CALL saxpy(OpenAD_Symbol_231, __deriv__(PLL), __deriv__(FVEC(
     > K)))
          CALL saxpy(OpenAD_Symbol_233, __deriv__(P), __deriv__(FVEC(K)
     > ))
          CALL saxpy(OpenAD_Symbol_236, __deriv__(PBL), __deriv__(FVEC(
     > K)))
          CALL saxpy(OpenAD_Symbol_238, __deriv__(PTL), __deriv__(FVEC(
     > K)))
          CALL saxpy(OpenAD_Symbol_241, __deriv__(PBL), __deriv__(FVEC(
     > K)))
          CALL saxpy(OpenAD_Symbol_243, __deriv__(PBR), __deriv__(FVEC(
     > K)))
          CALL saxpy(OpenAD_Symbol_246, __deriv__(PBB), __deriv__(FVEC(
     > K)))
          CALL saxpy(OpenAD_Symbol_248, __deriv__(P), __deriv__(FVEC(K)
     > ))
          CALL saxpy(OpenAD_Symbol_251, __deriv__(PR), __deriv__(FVEC(K
     > )))
          CALL saxpy(OpenAD_Symbol_252, __deriv__(PL), __deriv__(FVEC(K
     > )))
          CALL saxpy(OpenAD_Symbol_254, __deriv__(PT), __deriv__(FVEC(K
     > )))
          CALL saxpy(OpenAD_Symbol_255, __deriv__(PB), __deriv__(FVEC(K
     > )))
          CALL saxpy(OpenAD_Symbol_256, __deriv__(PT), __deriv__(FVEC(K
     > )))
          CALL saxpy(OpenAD_Symbol_257, __deriv__(PT), __deriv__(FVEC(K
     > )))
          CALL saxpy(OpenAD_Symbol_258, __deriv__(PR), __deriv__(FVEC(K
     > )))
          CALL saxpy(OpenAD_Symbol_259, __deriv__(PR), __deriv__(FVEC(K
     > )))
          CALL saxpy(OpenAD_Symbol_260, __deriv__(P), __deriv__(FVEC(K)
     > ))
          CALL saxpy(OpenAD_Symbol_261, __deriv__(P), __deriv__(FVEC(K)
     > ))
          CALL saxpy(OpenAD_Symbol_262, __deriv__(PL), __deriv__(FVEC(K
     > )))
          CALL saxpy(OpenAD_Symbol_263, __deriv__(PL), __deriv__(FVEC(K
     > )))
          CALL saxpy(OpenAD_Symbol_264, __deriv__(PB), __deriv__(FVEC(K
     > )))
          CALL saxpy(OpenAD_Symbol_265, __deriv__(PB), __deriv__(FVEC(K
     > )))
        END DO
      END DO
      t__5 = N
      DO K = 1, N, 1
        OpenAD_Symbol_159 = (HX2 * HY2)
        OpenAD_Symbol_162 = (__value__(FVEC(K)) * OpenAD_Symbol_159)
        OpenAD_Symbol_160 = OpenAD_Symbol_159
        __value__(FVEC(INT(K))) = OpenAD_Symbol_162
        OpenAD_Symbol_267 = OpenAD_Symbol_160
        CALL setderiv(__deriv__(OpenAD_Symbol_268), __deriv__(FVEC(K)))
        CALL sax(OpenAD_Symbol_267, __deriv__(OpenAD_Symbol_268),
     >  __deriv__(FVEC(K)))
      END DO
      END SUBROUTINE
