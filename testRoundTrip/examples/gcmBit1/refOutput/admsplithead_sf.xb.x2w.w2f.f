C ***********************************************************
C Fortran file translated from WHIRL Tue Nov 28 15:55:43 2006
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
      TYPE (OpenADTy_active) OpenAD_Symbol_147
      TYPE (OpenADTy_active) OpenAD_Symbol_148
      REAL(w2f__8) OpenAD_Symbol_149
      REAL(w2f__8) OpenAD_Symbol_150
      REAL(w2f__8) OpenAD_Symbol_151
      REAL(w2f__8) OpenAD_Symbol_152
      TYPE (OpenADTy_active) OpenAD_Symbol_153
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
      TYPE (OpenADTy_active) OpenAD_Symbol_174
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
      TYPE (OpenADTy_active) OpenAD_Symbol_189
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
      TYPE (OpenADTy_active) OpenAD_Symbol_222
      REAL(w2f__8) OpenAD_Symbol_223
      TYPE (OpenADTy_active) OpenAD_Symbol_224
      REAL(w2f__8) OpenAD_Symbol_225
      REAL(w2f__8) OpenAD_Symbol_226
      REAL(w2f__8) OpenAD_Symbol_227
      REAL(w2f__8) OpenAD_Symbol_228
      REAL(w2f__8) OpenAD_Symbol_229
      REAL(w2f__8) OpenAD_Symbol_23
      TYPE (OpenADTy_active) OpenAD_Symbol_230
      REAL(w2f__8) OpenAD_Symbol_231
      REAL(w2f__8) OpenAD_Symbol_232
      REAL(w2f__8) OpenAD_Symbol_233
      REAL(w2f__8) OpenAD_Symbol_234
      REAL(w2f__8) OpenAD_Symbol_235
      REAL(w2f__8) OpenAD_Symbol_236
      REAL(w2f__8) OpenAD_Symbol_237
      REAL(w2f__8) OpenAD_Symbol_238
      TYPE (OpenADTy_active) OpenAD_Symbol_239
      REAL(w2f__8) OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_240
      REAL(w2f__8) OpenAD_Symbol_241
      REAL(w2f__8) OpenAD_Symbol_242
      REAL(w2f__8) OpenAD_Symbol_243
      TYPE (OpenADTy_active) OpenAD_Symbol_244
      REAL(w2f__8) OpenAD_Symbol_25
      INTEGER(w2f__i8) OpenAD_Symbol_252
      INTEGER(w2f__i8) OpenAD_Symbol_253
      INTEGER(w2f__i8) OpenAD_Symbol_254
      INTEGER(w2f__i8) OpenAD_Symbol_255
      INTEGER(w2f__i8) OpenAD_Symbol_256
      INTEGER(w2f__i8) OpenAD_Symbol_257
      INTEGER(w2f__i8) OpenAD_Symbol_258
      INTEGER(w2f__i8) OpenAD_Symbol_259
      INTEGER(w2f__i8) OpenAD_Symbol_260
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
      REAL(w2f__8) OpenAD_Symbol_261
      REAL(w2f__8) OpenAD_Symbol_262
      REAL(w2f__8) OpenAD_Symbol_263
      INTEGER(w2f__i8) OpenAD_Symbol_264
      INTEGER(w2f__i8) OpenAD_Symbol_265
      INTEGER(w2f__i8) OpenAD_Symbol_266
      INTEGER(w2f__i8) OpenAD_Symbol_267
      INTEGER(w2f__i8) OpenAD_Symbol_268
      INTEGER(w2f__i8) OpenAD_Symbol_269
      INTEGER(w2f__i8) OpenAD_Symbol_270
      INTEGER(w2f__i8) OpenAD_Symbol_271
      INTEGER(w2f__i8) OpenAD_Symbol_272
      INTEGER(w2f__i8) OpenAD_Symbol_273
      REAL(w2f__8) OpenAD_Symbol_274
      REAL(w2f__8) OpenAD_Symbol_275
      INTEGER(w2f__i8) OpenAD_Symbol_276
      INTEGER(w2f__i8) OpenAD_Symbol_277
      REAL(w2f__8) OpenAD_Symbol_278
      INTEGER(w2f__i8) OpenAD_Symbol_279
      INTEGER(w2f__i8) OpenAD_Symbol_280
      REAL(w2f__8) OpenAD_Symbol_281
      INTEGER(w2f__i8) OpenAD_Symbol_282
      INTEGER(w2f__i8) OpenAD_Symbol_283
      REAL(w2f__8) OpenAD_Symbol_284
      INTEGER(w2f__i8) OpenAD_Symbol_285
      INTEGER(w2f__i8) OpenAD_Symbol_286
      REAL(w2f__8) OpenAD_Symbol_287
      INTEGER(w2f__i8) OpenAD_Symbol_288
      INTEGER(w2f__i8) OpenAD_Symbol_289
      REAL(w2f__8) OpenAD_Symbol_290
      INTEGER(w2f__i8) OpenAD_Symbol_291
      INTEGER(w2f__i8) OpenAD_Symbol_292
      REAL(w2f__8) OpenAD_Symbol_293
      INTEGER(w2f__i8) OpenAD_Symbol_294
      INTEGER(w2f__i8) OpenAD_Symbol_295
      REAL(w2f__8) OpenAD_Symbol_296
      INTEGER(w2f__i8) OpenAD_Symbol_297
      INTEGER(w2f__i8) OpenAD_Symbol_298
      REAL(w2f__8) OpenAD_Symbol_299
      INTEGER(w2f__i8) OpenAD_Symbol_300
      INTEGER(w2f__i8) OpenAD_Symbol_301
      REAL(w2f__8) OpenAD_Symbol_302
      INTEGER(w2f__i8) OpenAD_Symbol_303
      INTEGER(w2f__i8) OpenAD_Symbol_304
      REAL(w2f__8) OpenAD_Symbol_305
      INTEGER(w2f__i8) OpenAD_Symbol_306
      INTEGER(w2f__i8) OpenAD_Symbol_307
      REAL(w2f__8) OpenAD_Symbol_308
      INTEGER(w2f__i8) OpenAD_Symbol_309
      INTEGER(w2f__i8) OpenAD_Symbol_310
      REAL(w2f__8) OpenAD_Symbol_311
      INTEGER(w2f__i8) OpenAD_Symbol_312
      INTEGER(w2f__i8) OpenAD_Symbol_313
      REAL(w2f__8) OpenAD_Symbol_314
      INTEGER(w2f__i8) OpenAD_Symbol_315
      INTEGER(w2f__i8) OpenAD_Symbol_316
      REAL(w2f__8) OpenAD_Symbol_317
      INTEGER(w2f__i8) OpenAD_Symbol_318
      INTEGER(w2f__i8) OpenAD_Symbol_319
      REAL(w2f__8) OpenAD_Symbol_320
      INTEGER(w2f__i8) OpenAD_Symbol_321
      INTEGER(w2f__i8) OpenAD_Symbol_322
      REAL(w2f__8) OpenAD_Symbol_323
      INTEGER(w2f__i8) OpenAD_Symbol_324
      INTEGER(w2f__i8) OpenAD_Symbol_325
      REAL(w2f__8) OpenAD_Symbol_326
      INTEGER(w2f__i8) OpenAD_Symbol_327
      INTEGER(w2f__i8) OpenAD_Symbol_328
      REAL(w2f__8) OpenAD_Symbol_329
      INTEGER(w2f__i8) OpenAD_Symbol_330
      INTEGER(w2f__i8) OpenAD_Symbol_331
      REAL(w2f__8) OpenAD_Symbol_332
      INTEGER(w2f__i8) OpenAD_Symbol_333
      INTEGER(w2f__i8) OpenAD_Symbol_334
      REAL(w2f__8) OpenAD_Symbol_335
      INTEGER(w2f__i8) OpenAD_Symbol_336
      INTEGER(w2f__i8) OpenAD_Symbol_337
      REAL(w2f__8) OpenAD_Symbol_338
      INTEGER(w2f__i8) OpenAD_Symbol_339
      INTEGER(w2f__i8) OpenAD_Symbol_340
      REAL(w2f__8) OpenAD_Symbol_341
      INTEGER(w2f__i8) OpenAD_Symbol_342
      INTEGER(w2f__i8) OpenAD_Symbol_343
      REAL(w2f__8) OpenAD_Symbol_344
      INTEGER(w2f__i8) OpenAD_Symbol_345
      INTEGER(w2f__i8) OpenAD_Symbol_346
      REAL(w2f__8) OpenAD_Symbol_347
      INTEGER(w2f__i8) OpenAD_Symbol_348
      INTEGER(w2f__i8) OpenAD_Symbol_349
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
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
          __value__(T3) = (__value__(T) * __value__(T2))
          __value__(T4) = (__value__(T) * __value__(T3))
          __value__(S) = __value__(SFLD(I, J, K, BI, BJ))
          IF(__value__(S) .GT. 0.0D00) THEN
            __value__(S3O2) = (__value__(S) * SQRT(__value__(S)))
          ELSE
            __value__(S) = 0.0D00
            __value__(S3O2) = 0.0D00
          ENDIF
          __value__(P) = (__value__(LOCPRES(I, J)) * SITOBAR)
          __value__(P2) = (__value__(P) * __value__(P))
          __value__(BMFRESH) = (EOSJMDCKFW(1) + EOSJMDCKFW(2) *
     >  __value__(T) + EOSJMDCKFW(3) * __value__(T2) + EOSJMDCKFW(4) *
     >  __value__(T3) + EOSJMDCKFW(5) * __value__(T4))
          __value__(BMSALT) = (__value__(S) *(EOSJMDCKSW(1) +
     >  EOSJMDCKSW(2) * __value__(T) + EOSJMDCKSW(3) * __value__(T2) +
     >  EOSJMDCKSW(4) * __value__(T3)) + __value__(S3O2) *(EOSJMDCKSW(5
     > ) + EOSJMDCKSW(6) * __value__(T) + EOSJMDCKSW(7) * __value__(T2)
     > ))
          __value__(BMPRES) = (__value__(P) *(EOSJMDCKP(1) + EOSJMDCKP(
     > 2) * __value__(T) + EOSJMDCKP(3) * __value__(T2) + EOSJMDCKP(4)
     >  * __value__(T3)) + __value__(P) * __value__(S) *(EOSJMDCKP(5) +
     >  EOSJMDCKP(6) * __value__(T) + EOSJMDCKP(7) * __value__(T2)) +
     >  EOSJMDCKP(8) * __value__(P) * __value__(S3O2) + __value__(P2) *
     > (EOSJMDCKP(9) + EOSJMDCKP(10) * __value__(T) + EOSJMDCKP(11) *
     >  __value__(T2)) + __value__(P2) * __value__(S) *(EOSJMDCKP(12) +
     >  EOSJMDCKP(13) * __value__(T) + EOSJMDCKP(14) * __value__(T2)))
          __value__(BULKMOD(INT(I), INT(J))) = (__value__(BMPRES) +
     >  __value__(BMFRESH) + __value__(BMSALT))
        END DO
      END DO
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
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
      OpenAD_Symbol_257 = 0_w2f__i8
      DO J = 1, 2, 1
        OpenAD_Symbol_258 = 0_w2f__i8
        DO I = 1, 2, 1
          __value__(T) = __value__(TFLD(I, J, K, BI, BJ))
          OpenAD_Symbol_2 = (__value__(T) * __value__(T))
          OpenAD_Symbol_0 = __value__(T)
          OpenAD_Symbol_1 = __value__(T)
          __value__(T2) = OpenAD_Symbol_2
          OpenAD_Symbol_5 = (__value__(T) * __value__(T2))
          OpenAD_Symbol_3 = __value__(T2)
          OpenAD_Symbol_4 = __value__(T)
          __value__(T3) = OpenAD_Symbol_5
          OpenAD_Symbol_8 = (__value__(T) * __value__(T3))
          OpenAD_Symbol_6 = __value__(T3)
          OpenAD_Symbol_7 = __value__(T)
          __value__(T4) = OpenAD_Symbol_8
          __value__(S) = __value__(SFLD(I, J, K, BI, BJ))
          OpenAD_Symbol_149 = (OpenAD_Symbol_3 +(OpenAD_Symbol_1 +
     >  OpenAD_Symbol_0) * OpenAD_Symbol_4)
          OpenAD_Symbol_150 = (OpenAD_Symbol_6 + OpenAD_Symbol_149 *
     >  OpenAD_Symbol_7)
          OpenAD_Symbol_151 = (OpenAD_Symbol_1 + OpenAD_Symbol_0)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(BI)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(BJ)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(BI)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(BJ)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_149)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_150)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_151)
          IF(__value__(S) .GT. 0.0D00) THEN
            OpenAD_Symbol_9 = SQRT(__value__(S))
            OpenAD_Symbol_13 = (__value__(S) * OpenAD_Symbol_9)
            OpenAD_Symbol_10 = OpenAD_Symbol_9
            OpenAD_Symbol_12 = (5.0D-01 / OpenAD_Symbol_9)
            OpenAD_Symbol_11 = __value__(S)
            __value__(S3O2) = OpenAD_Symbol_13
            OpenAD_Symbol_152 = (OpenAD_Symbol_12 * OpenAD_Symbol_11)
            OpenAD_Symbol_154 = OpenAD_Symbol_10
C           $OpenAD$ INLINE push(subst)
            CALL push(OpenAD_Symbol_152)
C           $OpenAD$ INLINE push(subst)
            CALL push(OpenAD_Symbol_154)
            OpenAD_Symbol_259 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_259)
          ELSE
            __value__(S) = 0.0D00
            __value__(S3O2) = 0.0D00
            OpenAD_Symbol_260 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_260)
          ENDIF
          OpenAD_Symbol_16 = (__value__(LOCPRES(I, J)) * SITOBAR)
          OpenAD_Symbol_14 = SITOBAR
          __value__(P) = OpenAD_Symbol_16
          OpenAD_Symbol_19 = (__value__(P) * __value__(P))
          OpenAD_Symbol_17 = __value__(P)
          OpenAD_Symbol_18 = __value__(P)
          __value__(P2) = OpenAD_Symbol_19
          OpenAD_Symbol_36 = (EOSJMDCKFW(1) + EOSJMDCKFW(2) * __value__
     > (T) + EOSJMDCKFW(3) * __value__(T2) + EOSJMDCKFW(4) * __value__(
     > T3) + EOSJMDCKFW(5) * __value__(T4))
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
          __value__(BMFRESH) = OpenAD_Symbol_36
          OpenAD_Symbol_39 = (EOSJMDCKSW(1) + EOSJMDCKSW(2) * __value__
     > (T) + EOSJMDCKSW(3) * __value__(T2) + EOSJMDCKSW(4) * __value__(
     > T3))
          OpenAD_Symbol_54 = (EOSJMDCKSW(5) + EOSJMDCKSW(6) * __value__
     > (T) + EOSJMDCKSW(7) * __value__(T2))
          OpenAD_Symbol_65 = (__value__(S) * OpenAD_Symbol_39 +
     >  __value__(S3O2) * OpenAD_Symbol_54)
          OpenAD_Symbol_40 = OpenAD_Symbol_39
          OpenAD_Symbol_49 = EOSJMDCKSW(2)
          OpenAD_Symbol_47 = 1_w2f__i8
          OpenAD_Symbol_44 = 1_w2f__i8
          OpenAD_Symbol_51 = EOSJMDCKSW(3)
          OpenAD_Symbol_45 = 1_w2f__i8
          OpenAD_Symbol_42 = 1_w2f__i8
          OpenAD_Symbol_53 = EOSJMDCKSW(4)
          OpenAD_Symbol_43 = 1_w2f__i8
          OpenAD_Symbol_41 = __value__(S)
          OpenAD_Symbol_37 = 1_w2f__i8
          OpenAD_Symbol_55 = OpenAD_Symbol_54
          OpenAD_Symbol_62 = EOSJMDCKSW(6)
          OpenAD_Symbol_60 = 1_w2f__i8
          OpenAD_Symbol_57 = 1_w2f__i8
          OpenAD_Symbol_64 = EOSJMDCKSW(7)
          OpenAD_Symbol_58 = 1_w2f__i8
          OpenAD_Symbol_56 = __value__(S3O2)
          OpenAD_Symbol_38 = 1_w2f__i8
          __value__(BMSALT) = OpenAD_Symbol_65
          OpenAD_Symbol_74 = (EOSJMDCKP(1) + EOSJMDCKP(2) * __value__(T
     > ) + EOSJMDCKP(3) * __value__(T2) + EOSJMDCKP(4) * __value__(T3))
          OpenAD_Symbol_89 = (__value__(P) * __value__(S))
          OpenAD_Symbol_90 = (EOSJMDCKP(5) + EOSJMDCKP(6) * __value__(T
     > ) + EOSJMDCKP(7) * __value__(T2))
          OpenAD_Symbol_103 = (__value__(P) * __value__(S3O2))
          OpenAD_Symbol_108 = (EOSJMDCKP(9) + EOSJMDCKP(10) * __value__
     > (T) + EOSJMDCKP(11) * __value__(T2))
          OpenAD_Symbol_119 = (__value__(P2) * __value__(S))
          OpenAD_Symbol_120 = (EOSJMDCKP(12) + EOSJMDCKP(13) *
     >  __value__(T) + EOSJMDCKP(14) * __value__(T2))
          OpenAD_Symbol_133 = (__value__(P) * OpenAD_Symbol_74 +
     >  OpenAD_Symbol_89 * OpenAD_Symbol_90 + EOSJMDCKP(8) *
     >  OpenAD_Symbol_103 + __value__(P2) * OpenAD_Symbol_108 +
     >  OpenAD_Symbol_119 * OpenAD_Symbol_120)
          OpenAD_Symbol_75 = OpenAD_Symbol_74
          OpenAD_Symbol_84 = EOSJMDCKP(2)
          OpenAD_Symbol_82 = 1_w2f__i8
          OpenAD_Symbol_79 = 1_w2f__i8
          OpenAD_Symbol_86 = EOSJMDCKP(3)
          OpenAD_Symbol_80 = 1_w2f__i8
          OpenAD_Symbol_77 = 1_w2f__i8
          OpenAD_Symbol_88 = EOSJMDCKP(4)
          OpenAD_Symbol_78 = 1_w2f__i8
          OpenAD_Symbol_76 = __value__(P)
          OpenAD_Symbol_72 = 1_w2f__i8
          OpenAD_Symbol_93 = __value__(S)
          OpenAD_Symbol_94 = __value__(P)
          OpenAD_Symbol_91 = OpenAD_Symbol_90
          OpenAD_Symbol_100 = EOSJMDCKP(6)
          OpenAD_Symbol_98 = 1_w2f__i8
          OpenAD_Symbol_95 = 1_w2f__i8
          OpenAD_Symbol_102 = EOSJMDCKP(7)
          OpenAD_Symbol_96 = 1_w2f__i8
          OpenAD_Symbol_92 = OpenAD_Symbol_89
          OpenAD_Symbol_73 = 1_w2f__i8
          OpenAD_Symbol_70 = 1_w2f__i8
          OpenAD_Symbol_106 = __value__(S3O2)
          OpenAD_Symbol_107 = __value__(P)
          OpenAD_Symbol_105 = EOSJMDCKP(8)
          OpenAD_Symbol_71 = 1_w2f__i8
          OpenAD_Symbol_68 = 1_w2f__i8
          OpenAD_Symbol_109 = OpenAD_Symbol_108
          OpenAD_Symbol_116 = EOSJMDCKP(10)
          OpenAD_Symbol_114 = 1_w2f__i8
          OpenAD_Symbol_111 = 1_w2f__i8
          OpenAD_Symbol_118 = EOSJMDCKP(11)
          OpenAD_Symbol_112 = 1_w2f__i8
          OpenAD_Symbol_110 = __value__(P2)
          OpenAD_Symbol_69 = 1_w2f__i8
          OpenAD_Symbol_66 = 1_w2f__i8
          OpenAD_Symbol_123 = __value__(S)
          OpenAD_Symbol_124 = __value__(P2)
          OpenAD_Symbol_121 = OpenAD_Symbol_120
          OpenAD_Symbol_130 = EOSJMDCKP(13)
          OpenAD_Symbol_128 = 1_w2f__i8
          OpenAD_Symbol_125 = 1_w2f__i8
          OpenAD_Symbol_132 = EOSJMDCKP(14)
          OpenAD_Symbol_126 = 1_w2f__i8
          OpenAD_Symbol_122 = OpenAD_Symbol_119
          OpenAD_Symbol_67 = 1_w2f__i8
          __value__(BMPRES) = OpenAD_Symbol_133
          __value__(BULKMOD(INT(I), INT(J))) = (__value__(BMPRES) +
     >  __value__(BMFRESH) + __value__(BMSALT))
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
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_173)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_183)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_188)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_209)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_214)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_221)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_223)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_225)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_226)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_227)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_228)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_229)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_231)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_232)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_233)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_234)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_235)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_236)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_237)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_238)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_240)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_241)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_242)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_243)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
          OpenAD_Symbol_258 = (INT(OpenAD_Symbol_258) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_258)
        OpenAD_Symbol_257 = (INT(OpenAD_Symbol_257) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_257)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_252)
      OpenAD_Symbol_253 = 1
      DO WHILE(INT(OpenAD_Symbol_253) .LE. INT(OpenAD_Symbol_252))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_254)
        OpenAD_Symbol_255 = 1
        DO WHILE(INT(OpenAD_Symbol_255) .LE. INT(OpenAD_Symbol_254))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_276)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_277)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_278)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_278, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_277), INT(OpenAD_Symbol_276))), __deriv__(
     > OpenAD_Symbol_244))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_279)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_280)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_281)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_281, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_280), INT(OpenAD_Symbol_279))), __deriv__(
     > OpenAD_Symbol_224))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_282)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_283)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_284)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_284, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_283), INT(OpenAD_Symbol_282))), __deriv__(
     > OpenAD_Symbol_222))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_285)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_286)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_287)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_287, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_286), INT(OpenAD_Symbol_285))), __deriv__(
     > OpenAD_Symbol_230))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_288)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_289)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_290)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_290, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_289), INT(OpenAD_Symbol_288))), __deriv__(
     > OpenAD_Symbol_239))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_291)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_292)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_293)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_293, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_292), INT(OpenAD_Symbol_291))), __deriv__(
     > OpenAD_Symbol_224))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_294)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_295)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_296)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_296, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_295), INT(OpenAD_Symbol_294))), __deriv__(
     > OpenAD_Symbol_222))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_297)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_298)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_299)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_299, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_298), INT(OpenAD_Symbol_297))), __deriv__(
     > OpenAD_Symbol_230))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_300)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_301)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_302)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_302, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_301), INT(OpenAD_Symbol_300))), __deriv__(
     > OpenAD_Symbol_224))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_303)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_304)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_305)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_305, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_304), INT(OpenAD_Symbol_303))), __deriv__(
     > OpenAD_Symbol_222))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_306)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_307)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_308)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_308, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_307), INT(OpenAD_Symbol_306))), __deriv__(
     > OpenAD_Symbol_224))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_309)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_310)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_311)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_311, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_310), INT(OpenAD_Symbol_309))), __deriv__(
     > OpenAD_Symbol_222))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_312)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_313)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_314)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_314, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_313), INT(OpenAD_Symbol_312))), __deriv__(
     > OpenAD_Symbol_230))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_315)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_316)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_317)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_317, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_316), INT(OpenAD_Symbol_315))), __deriv__(
     > OpenAD_Symbol_224))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_318)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_319)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_320)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_320, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_319), INT(OpenAD_Symbol_318))), __deriv__(
     > OpenAD_Symbol_222))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_321)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_322)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_323)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_323, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_322), INT(OpenAD_Symbol_321))), __deriv__(
     > OpenAD_Symbol_224))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_324)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_325)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_326)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_326, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_325), INT(OpenAD_Symbol_324))), __deriv__(
     > OpenAD_Symbol_222))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_327)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_328)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_329)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_329, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_328), INT(OpenAD_Symbol_327))), __deriv__(
     > OpenAD_Symbol_224))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_330)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_331)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_332)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_332, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_331), INT(OpenAD_Symbol_330))), __deriv__(
     > OpenAD_Symbol_222))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_333)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_334)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_335)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_335, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_334), INT(OpenAD_Symbol_333))), __deriv__(
     > OpenAD_Symbol_189))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_336)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_337)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_338)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_338, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_337), INT(OpenAD_Symbol_336))), __deriv__(
     > OpenAD_Symbol_174))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_339)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_340)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_341)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_341, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_340), INT(OpenAD_Symbol_339))), __deriv__(
     > OpenAD_Symbol_189))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_342)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_343)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_344)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_344, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_343), INT(OpenAD_Symbol_342))), __deriv__(
     > OpenAD_Symbol_174))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_345)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_346)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_347)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_347, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_346), INT(OpenAD_Symbol_345))), __deriv__(
     > OpenAD_Symbol_174))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(BULKMOD(INT(OpenAD_Symbol_346), INT(
     > OpenAD_Symbol_345))))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_174), __deriv__(S))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_174))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_189), __deriv__(S3O2))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_189))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_222), __deriv__(T2))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_222))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_224), __deriv__(T))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_224))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_230), __deriv__(T3))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_230))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_239), __deriv__(T4))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_239))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_348)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_349)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_244), __deriv__(LOCPRES
     > (INT(OpenAD_Symbol_349), INT(OpenAD_Symbol_348))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_244))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_256)
          IF(OpenAD_Symbol_256 .ne. 0) THEN
C           $OpenAD$ INLINE Pop(subst)
            CALL Pop(OpenAD_Symbol_274)
C           $OpenAD$ INLINE Saxpy(subst,subst,subst)
            CALL Saxpy(OpenAD_Symbol_274, __deriv__(S3O2), __deriv__(
     > OpenAD_Symbol_153))
C           $OpenAD$ INLINE Pop(subst)
            CALL Pop(OpenAD_Symbol_275)
C           $OpenAD$ INLINE Saxpy(subst,subst,subst)
            CALL Saxpy(OpenAD_Symbol_275, __deriv__(S3O2), __deriv__(
     > OpenAD_Symbol_153))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(S3O2))
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_153), __deriv__(S))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_153))
          ELSE
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(S3O2))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(S))
          ENDIF
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_261)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_261, __deriv__(T2), __deriv__(
     > OpenAD_Symbol_148))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(T2))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_262)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_262, __deriv__(T4), __deriv__(
     > OpenAD_Symbol_148))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(T4))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_263)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_263, __deriv__(T3), __deriv__(
     > OpenAD_Symbol_148))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(T3))
C         $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
          CALL CondIncZeroDeriv(__deriv__(T), __deriv__(
     > OpenAD_Symbol_148))
C         $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
          CALL CondIncZeroDeriv(__deriv__(S), __deriv__(
     > OpenAD_Symbol_147))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_264)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_265)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_266)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_267)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_268)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_147), __deriv__(SFLD(
     > INT(OpenAD_Symbol_268), INT(OpenAD_Symbol_267), INT(
     > OpenAD_Symbol_266), INT(OpenAD_Symbol_265), INT(
     > OpenAD_Symbol_264))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_147))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_269)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_270)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_271)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_272)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_273)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_148), __deriv__(TFLD(
     > INT(OpenAD_Symbol_273), INT(OpenAD_Symbol_272), INT(
     > OpenAD_Symbol_271), INT(OpenAD_Symbol_270), INT(
     > OpenAD_Symbol_269))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_148))
          OpenAD_Symbol_255 = INT(OpenAD_Symbol_255) + 1
        END DO
        OpenAD_Symbol_253 = INT(OpenAD_Symbol_253) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_matrix_a(subst)
      CALL cp_arg_store_real_matrix_a(__deriv__(LOCPRES))
C     $OpenAD$ INLINE cp_arg_store_real_five_tensor_a(subst)
      CALL cp_arg_store_real_five_tensor_a(__deriv__(TFLD))
C     $OpenAD$ INLINE cp_arg_store_real_five_tensor_a(subst)
      CALL cp_arg_store_real_five_tensor_a(__deriv__(SFLD))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ INLINE cp_res_store_real_matrix_a(subst)
      CALL cp_res_store_real_matrix_a(__deriv__(BULKMOD))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_five_tensor_a(subst)
      CALL cp_arg_restore_real_five_tensor_a(__deriv__(SFLD))
C     $OpenAD$ INLINE cp_arg_restore_real_five_tensor_a(subst)
      CALL cp_arg_restore_real_five_tensor_a(__deriv__(TFLD))
C     $OpenAD$ INLINE cp_arg_restore_real_matrix_a(subst)
      CALL cp_arg_restore_real_matrix_a(__deriv__(LOCPRES))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ INLINE cp_res_restore_real_matrix_a(subst)
      CALL cp_res_restore_real_matrix_a(__deriv__(BULKMOD))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_matrix_a(subst)
      CALL cp_arg_store_real_matrix_a(__deriv__(BULKMOD))
C     $OpenAD$ INLINE cp_arg_store_real_matrix_a(subst)
      CALL cp_arg_store_real_matrix_a(__deriv__(LOCPRES))
C     $OpenAD$ INLINE cp_arg_store_real_five_tensor_a(subst)
      CALL cp_arg_store_real_five_tensor_a(__deriv__(TFLD))
C     $OpenAD$ INLINE cp_arg_store_real_five_tensor_a(subst)
      CALL cp_arg_store_real_five_tensor_a(__deriv__(SFLD))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_five_tensor_a(subst)
      CALL cp_arg_restore_real_five_tensor_a(__deriv__(SFLD))
C     $OpenAD$ INLINE cp_arg_restore_real_five_tensor_a(subst)
      CALL cp_arg_restore_real_five_tensor_a(__deriv__(TFLD))
C     $OpenAD$ INLINE cp_arg_restore_real_matrix_a(subst)
      CALL cp_arg_restore_real_matrix_a(__deriv__(LOCPRES))
C     $OpenAD$ INLINE cp_arg_restore_real_matrix_a(subst)
      CALL cp_arg_restore_real_matrix_a(__deriv__(BULKMOD))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_139
      REAL(w2f__8) OpenAD_Symbol_140
      REAL(w2f__8) OpenAD_Symbol_142
      REAL(w2f__8) OpenAD_Symbol_143
      REAL(w2f__8) OpenAD_Symbol_145
      REAL(w2f__8) OpenAD_Symbol_146
      REAL(w2f__8) OpenAD_Symbol_245
      TYPE (OpenADTy_active) OpenAD_Symbol_246
      REAL(w2f__8) OpenAD_Symbol_247
      TYPE (OpenADTy_active) OpenAD_Symbol_248
      REAL(w2f__8) OpenAD_Symbol_249
      TYPE (OpenADTy_active) OpenAD_Symbol_250
      TYPE (OpenADTy_active) OpenAD_Symbol_251
      INTEGER(w2f__i8) OpenAD_Symbol_350
      INTEGER(w2f__i8) OpenAD_Symbol_351
      INTEGER(w2f__i8) OpenAD_Symbol_352
      INTEGER(w2f__i8) OpenAD_Symbol_353
      INTEGER(w2f__i8) OpenAD_Symbol_354
      INTEGER(w2f__i8) OpenAD_Symbol_355
      INTEGER(w2f__i8) OpenAD_Symbol_356
      INTEGER(w2f__i8) OpenAD_Symbol_357
      INTEGER(w2f__i8) OpenAD_Symbol_358
      INTEGER(w2f__i8) OpenAD_Symbol_359
      INTEGER(w2f__i8) OpenAD_Symbol_360
      INTEGER(w2f__i8) OpenAD_Symbol_361
      INTEGER(w2f__i8) OpenAD_Symbol_362
      INTEGER(w2f__i8) OpenAD_Symbol_363
      INTEGER(w2f__i8) OpenAD_Symbol_364
      INTEGER(w2f__i8) OpenAD_Symbol_365
      INTEGER(w2f__i8) OpenAD_Symbol_366
      INTEGER(w2f__i8) OpenAD_Symbol_367
      INTEGER(w2f__i8) OpenAD_Symbol_368
      INTEGER(w2f__i8) OpenAD_Symbol_369
      INTEGER(w2f__i8) OpenAD_Symbol_370
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
      INTEGER(w2f__i8) OpenAD_Symbol_371
      INTEGER(w2f__i8) OpenAD_Symbol_372
      REAL(w2f__8) OpenAD_Symbol_373
      INTEGER(w2f__i8) OpenAD_Symbol_374
      INTEGER(w2f__i8) OpenAD_Symbol_375
      INTEGER(w2f__i8) OpenAD_Symbol_376
      INTEGER(w2f__i8) OpenAD_Symbol_377
      INTEGER(w2f__i8) OpenAD_Symbol_378
      INTEGER(w2f__i8) OpenAD_Symbol_379
      REAL(w2f__8) OpenAD_Symbol_380
      INTEGER(w2f__i8) OpenAD_Symbol_381
      INTEGER(w2f__i8) OpenAD_Symbol_382
      INTEGER(w2f__i8) OpenAD_Symbol_383
      INTEGER(w2f__i8) OpenAD_Symbol_384
      INTEGER(w2f__i8) OpenAD_Symbol_385
      REAL(w2f__8) OpenAD_Symbol_386
      INTEGER(w2f__i8) OpenAD_Symbol_387
      INTEGER(w2f__i8) OpenAD_Symbol_388
      INTEGER(w2f__i8) OpenAD_Symbol_389
      INTEGER(w2f__i8) OpenAD_Symbol_390
      INTEGER(w2f__i8) OpenAD_Symbol_391
      INTEGER(w2f__i8) OpenAD_Symbol_392
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      XCOUNT = 1
      DO I = 1, 2, 1
        DO J = 1, 2, 1
          __value__(LOCPRES(INT(I), INT(J))) = (2.0D00 * __value__(X(
     > XCOUNT)))
          DO K = 1, 2, 1
            DO L = 1, 2, 1
              DO M = 1, 2, 1
                __value__(TFLD(INT(I), INT(J), INT(K), INT(L), INT(M)))
     >  = (3.0D00 * __value__(X(XCOUNT)))
                __value__(SFLD(INT(I), INT(J), INT(K), INT(L), INT(M)))
     >  = (4.0D00 * __value__(X(XCOUNT)))
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
        END DO
      END DO
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      XCOUNT = 1
      OpenAD_Symbol_364 = 0_w2f__i8
      DO I = 1, 2, 1
        OpenAD_Symbol_365 = 0_w2f__i8
        DO J = 1, 2, 1
          OpenAD_Symbol_140 = (2.0D00 * __value__(X(XCOUNT)))
          OpenAD_Symbol_139 = 2.0D00
          __value__(LOCPRES(INT(I), INT(J))) = OpenAD_Symbol_140
          OpenAD_Symbol_245 = OpenAD_Symbol_139
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(XCOUNT)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_245)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
          OpenAD_Symbol_366 = 0_w2f__i8
          DO K = 1, 2, 1
            OpenAD_Symbol_367 = 0_w2f__i8
            DO L = 1, 2, 1
              OpenAD_Symbol_368 = 0_w2f__i8
              DO M = 1, 2, 1
                OpenAD_Symbol_143 = (3.0D00 * __value__(X(XCOUNT)))
                OpenAD_Symbol_142 = 3.0D00
                __value__(TFLD(INT(I), INT(J), INT(K), INT(L), INT(M)))
     >  = OpenAD_Symbol_143
                OpenAD_Symbol_146 = (4.0D00 * __value__(X(XCOUNT)))
                OpenAD_Symbol_145 = 4.0D00
                __value__(SFLD(INT(I), INT(J), INT(K), INT(L), INT(M)))
     >  = OpenAD_Symbol_146
                OpenAD_Symbol_247 = OpenAD_Symbol_142
                OpenAD_Symbol_249 = OpenAD_Symbol_145
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(XCOUNT)
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(XCOUNT)
C               $OpenAD$ INLINE push(subst)
                CALL push(OpenAD_Symbol_247)
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(I)
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(J)
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(K)
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(L)
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(M)
C               $OpenAD$ INLINE push(subst)
                CALL push(OpenAD_Symbol_249)
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(I)
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(J)
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(K)
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(L)
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(M)
                XCOUNT = XCOUNT + 1
                OpenAD_Symbol_368 = (INT(OpenAD_Symbol_368) + INT(
     > 1_w2f__i8))
              END DO
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_368)
              OpenAD_Symbol_367 = (INT(OpenAD_Symbol_367) + INT(
     > 1_w2f__i8))
            END DO
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_367)
            OpenAD_Symbol_366 = (INT(OpenAD_Symbol_366) + INT(1_w2f__i8
     > ))
          END DO
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_366)
          OpenAD_Symbol_365 = (INT(OpenAD_Symbol_365) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_365)
        OpenAD_Symbol_364 = (INT(OpenAD_Symbol_364) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_364)
      CALL find_bulkmod(__deriv__(LOCPRES), __deriv__(TFLD), __deriv__(
     > SFLD), __deriv__(BULKMOD))
      OpenAD_Symbol_369 = 0_w2f__i8
      DO I = 1, 2, 1
        OpenAD_Symbol_370 = 0_w2f__i8
        DO J = 1, 2, 1
          __value__(Y(INT(J + INT((I * 2)) +(-2)))) = __value__(BULKMOD
     > (I, J))
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
          OpenAD_Symbol_389 = (J + I * INT(2_w2f__i8) + INT((-2_w2f__i8
     > )))
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_389)
          OpenAD_Symbol_370 = (INT(OpenAD_Symbol_370) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_370)
        OpenAD_Symbol_369 = (INT(OpenAD_Symbol_369) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_369)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_350)
      OpenAD_Symbol_351 = 1
      DO WHILE(INT(OpenAD_Symbol_351) .LE. INT(OpenAD_Symbol_350))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_352)
        OpenAD_Symbol_353 = 1
        DO WHILE(INT(OpenAD_Symbol_353) .LE. INT(OpenAD_Symbol_352))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_390)
C         $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
          CALL CondIncZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_390))),
     >  __deriv__(OpenAD_Symbol_251))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_391)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_392)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_251), __deriv__(BULKMOD
     > (INT(OpenAD_Symbol_392), INT(OpenAD_Symbol_391))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_251))
          OpenAD_Symbol_353 = INT(OpenAD_Symbol_353) + 1
        END DO
        OpenAD_Symbol_351 = INT(OpenAD_Symbol_351) + 1
      END DO
      CALL find_bulkmod(__deriv__(LOCPRES), __deriv__(TFLD), __deriv__(
     > SFLD), __deriv__(BULKMOD))
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_354)
      OpenAD_Symbol_355 = 1
      DO WHILE(INT(OpenAD_Symbol_355) .LE. INT(OpenAD_Symbol_354))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_356)
        OpenAD_Symbol_357 = 1
        DO WHILE(INT(OpenAD_Symbol_357) .LE. INT(OpenAD_Symbol_356))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_358)
          OpenAD_Symbol_359 = 1
          DO WHILE(INT(OpenAD_Symbol_359) .LE. INT(OpenAD_Symbol_358))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_360)
            OpenAD_Symbol_361 = 1
            DO WHILE(INT(OpenAD_Symbol_361) .LE. INT(OpenAD_Symbol_360)
     > )
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_362)
              OpenAD_Symbol_363 = 1
              DO WHILE(INT(OpenAD_Symbol_363) .LE. INT(
     > OpenAD_Symbol_362))
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_375)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_376)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_377)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_378)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_379)
C               $OpenAD$ INLINE Pop(subst)
                CALL Pop(OpenAD_Symbol_380)
C               $OpenAD$ INLINE Saxpy(subst,subst,subst)
                CALL Saxpy(OpenAD_Symbol_380, __deriv__(SFLD(INT(
     > OpenAD_Symbol_379), INT(OpenAD_Symbol_378), INT(
     > OpenAD_Symbol_377), INT(OpenAD_Symbol_376), INT(
     > OpenAD_Symbol_375))), __deriv__(OpenAD_Symbol_250))
C               $OpenAD$ INLINE ZeroDeriv(subst)
                CALL ZeroDeriv(__deriv__(SFLD(INT(OpenAD_Symbol_379),
     >  INT(OpenAD_Symbol_378), INT(OpenAD_Symbol_377), INT(
     > OpenAD_Symbol_376), INT(OpenAD_Symbol_375))))
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_381)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_382)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_383)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_384)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_385)
C               $OpenAD$ INLINE Pop(subst)
                CALL Pop(OpenAD_Symbol_386)
C               $OpenAD$ INLINE Saxpy(subst,subst,subst)
                CALL Saxpy(OpenAD_Symbol_386, __deriv__(TFLD(INT(
     > OpenAD_Symbol_385), INT(OpenAD_Symbol_384), INT(
     > OpenAD_Symbol_383), INT(OpenAD_Symbol_382), INT(
     > OpenAD_Symbol_381))), __deriv__(OpenAD_Symbol_248))
C               $OpenAD$ INLINE ZeroDeriv(subst)
                CALL ZeroDeriv(__deriv__(TFLD(INT(OpenAD_Symbol_385),
     >  INT(OpenAD_Symbol_384), INT(OpenAD_Symbol_383), INT(
     > OpenAD_Symbol_382), INT(OpenAD_Symbol_381))))
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_387)
C               $OpenAD$ INLINE IncDeriv(subst,subst)
                CALL IncDeriv(__deriv__(OpenAD_Symbol_248), __deriv__(X
     > (INT(OpenAD_Symbol_387))))
C               $OpenAD$ INLINE ZeroDeriv(subst)
                CALL ZeroDeriv(__deriv__(OpenAD_Symbol_248))
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_388)
C               $OpenAD$ INLINE IncDeriv(subst,subst)
                CALL IncDeriv(__deriv__(OpenAD_Symbol_250), __deriv__(X
     > (INT(OpenAD_Symbol_388))))
C               $OpenAD$ INLINE ZeroDeriv(subst)
                CALL ZeroDeriv(__deriv__(OpenAD_Symbol_250))
                OpenAD_Symbol_363 = INT(OpenAD_Symbol_363) + 1
              END DO
              OpenAD_Symbol_361 = INT(OpenAD_Symbol_361) + 1
            END DO
            OpenAD_Symbol_359 = INT(OpenAD_Symbol_359) + 1
          END DO
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_371)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_372)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_373)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_373, __deriv__(LOCPRES(INT(
     > OpenAD_Symbol_372), INT(OpenAD_Symbol_371))), __deriv__(
     > OpenAD_Symbol_246))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(LOCPRES(INT(OpenAD_Symbol_372), INT(
     > OpenAD_Symbol_371))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_374)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_246), __deriv__(X(INT(
     > OpenAD_Symbol_374))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_246))
          OpenAD_Symbol_357 = INT(OpenAD_Symbol_357) + 1
        END DO
        OpenAD_Symbol_355 = INT(OpenAD_Symbol_355) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(X))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ INLINE cp_res_store_real_vector_a(subst)
      CALL cp_res_store_real_vector_a(__deriv__(Y))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(X))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ INLINE cp_res_restore_real_vector_a(subst)
      CALL cp_res_restore_real_vector_a(__deriv__(Y))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(Y))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(X))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(Y))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
