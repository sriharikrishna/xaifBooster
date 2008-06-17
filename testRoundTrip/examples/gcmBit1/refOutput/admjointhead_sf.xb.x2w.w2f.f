
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
      INTEGER(w2f__i8) OpenAD_Symbol_157
      INTEGER(w2f__i8) OpenAD_Symbol_158
      INTEGER(w2f__i8) OpenAD_Symbol_159
      REAL(w2f__8) OpenAD_Symbol_16
      INTEGER(w2f__i8) OpenAD_Symbol_160
      INTEGER(w2f__i8) OpenAD_Symbol_161
      INTEGER(w2f__i8) OpenAD_Symbol_162
      INTEGER(w2f__i8) OpenAD_Symbol_163
      INTEGER(w2f__i8) OpenAD_Symbol_164
      INTEGER(w2f__i8) OpenAD_Symbol_165
      INTEGER(w2f__i8) OpenAD_Symbol_166
      INTEGER(w2f__i8) OpenAD_Symbol_167
      INTEGER(w2f__i8) OpenAD_Symbol_168
      INTEGER(w2f__i8) OpenAD_Symbol_169
      REAL(w2f__8) OpenAD_Symbol_17
      INTEGER(w2f__i8) OpenAD_Symbol_170
      INTEGER(w2f__i8) OpenAD_Symbol_171
      INTEGER(w2f__i8) OpenAD_Symbol_172
      INTEGER(w2f__i8) OpenAD_Symbol_173
      INTEGER(w2f__i8) OpenAD_Symbol_174
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_21
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
      INTEGER(w2f__i8) OpenAD_Symbol_218
      INTEGER(w2f__i8) OpenAD_Symbol_219
      INTEGER(w2f__i8) OpenAD_Symbol_220
      INTEGER(w2f__i8) OpenAD_Symbol_221
      INTEGER(w2f__i8) OpenAD_Symbol_222
      INTEGER(w2f__i8) OpenAD_Symbol_223
      INTEGER(w2f__i8) OpenAD_Symbol_224
      INTEGER(w2f__i8) OpenAD_Symbol_225
      INTEGER(w2f__i8) OpenAD_Symbol_226
      INTEGER(w2f__i8) OpenAD_Symbol_227
      REAL(w2f__8) OpenAD_Symbol_228
      INTEGER(w2f__i8) OpenAD_Symbol_229
      INTEGER(w2f__i8) OpenAD_Symbol_230
      INTEGER(w2f__i8) OpenAD_Symbol_231
      INTEGER(w2f__i8) OpenAD_Symbol_232
      INTEGER(w2f__i8) OpenAD_Symbol_233
      REAL(w2f__8) OpenAD_Symbol_234
      INTEGER(w2f__i8) OpenAD_Symbol_235
      INTEGER(w2f__i8) OpenAD_Symbol_236
      INTEGER(w2f__i8) OpenAD_Symbol_237
      INTEGER(w2f__i8) OpenAD_Symbol_238
      INTEGER(w2f__i8) OpenAD_Symbol_239
      REAL(w2f__8) OpenAD_Symbol_240
      INTEGER(w2f__i8) OpenAD_Symbol_241
      INTEGER(w2f__i8) OpenAD_Symbol_242
      INTEGER(w2f__i8) OpenAD_Symbol_243
      INTEGER(w2f__i8) OpenAD_Symbol_244
      INTEGER(w2f__i8) OpenAD_Symbol_245
      REAL(w2f__8) OpenAD_Symbol_246
      REAL(w2f__8) OpenAD_Symbol_247
      INTEGER(w2f__i8) OpenAD_Symbol_248
      INTEGER(w2f__i8) OpenAD_Symbol_249
      INTEGER(w2f__i8) OpenAD_Symbol_250
      INTEGER(w2f__i8) OpenAD_Symbol_251
      REAL(w2f__8) OpenAD_Symbol_252
      INTEGER(w2f__i8) OpenAD_Symbol_253
      INTEGER(w2f__i8) OpenAD_Symbol_254
      REAL(w2f__8) OpenAD_Symbol_255
      INTEGER(w2f__i8) OpenAD_Symbol_256
      INTEGER(w2f__i8) OpenAD_Symbol_257
      REAL(w2f__8) OpenAD_Symbol_258
      INTEGER(w2f__i8) OpenAD_Symbol_259
      INTEGER(w2f__i8) OpenAD_Symbol_260
      REAL(w2f__8) OpenAD_Symbol_261
      INTEGER(w2f__i8) OpenAD_Symbol_262
      INTEGER(w2f__i8) OpenAD_Symbol_263
      REAL(w2f__8) OpenAD_Symbol_264
      INTEGER(w2f__i8) OpenAD_Symbol_265
      INTEGER(w2f__i8) OpenAD_Symbol_266
      REAL(w2f__8) OpenAD_Symbol_267
      INTEGER(w2f__i8) OpenAD_Symbol_268
      INTEGER(w2f__i8) OpenAD_Symbol_269
      REAL(w2f__8) OpenAD_Symbol_270
      INTEGER(w2f__i8) OpenAD_Symbol_271
      INTEGER(w2f__i8) OpenAD_Symbol_272
      REAL(w2f__8) OpenAD_Symbol_273
      INTEGER(w2f__i8) OpenAD_Symbol_274
      INTEGER(w2f__i8) OpenAD_Symbol_275
      REAL(w2f__8) OpenAD_Symbol_276
      INTEGER(w2f__i8) OpenAD_Symbol_277
      INTEGER(w2f__i8) OpenAD_Symbol_278
      REAL(w2f__8) OpenAD_Symbol_279
      INTEGER(w2f__i8) OpenAD_Symbol_280
      INTEGER(w2f__i8) OpenAD_Symbol_281
      REAL(w2f__8) OpenAD_Symbol_282
      INTEGER(w2f__i8) OpenAD_Symbol_283
      INTEGER(w2f__i8) OpenAD_Symbol_284
      REAL(w2f__8) OpenAD_Symbol_285
      INTEGER(w2f__i8) OpenAD_Symbol_286
      INTEGER(w2f__i8) OpenAD_Symbol_287
      REAL(w2f__8) OpenAD_Symbol_288
      INTEGER(w2f__i8) OpenAD_Symbol_289
      INTEGER(w2f__i8) OpenAD_Symbol_290
      REAL(w2f__8) OpenAD_Symbol_291
      INTEGER(w2f__i8) OpenAD_Symbol_292
      INTEGER(w2f__i8) OpenAD_Symbol_293
      REAL(w2f__8) OpenAD_Symbol_294
      INTEGER(w2f__i8) OpenAD_Symbol_295
      INTEGER(w2f__i8) OpenAD_Symbol_296
      REAL(w2f__8) OpenAD_Symbol_297
      INTEGER(w2f__i8) OpenAD_Symbol_298
      INTEGER(w2f__i8) OpenAD_Symbol_299
      REAL(w2f__8) OpenAD_Symbol_300
      INTEGER(w2f__i8) OpenAD_Symbol_301
      INTEGER(w2f__i8) OpenAD_Symbol_302
      REAL(w2f__8) OpenAD_Symbol_303
      INTEGER(w2f__i8) OpenAD_Symbol_304
      INTEGER(w2f__i8) OpenAD_Symbol_305
      REAL(w2f__8) OpenAD_Symbol_306
      INTEGER(w2f__i8) OpenAD_Symbol_307
      INTEGER(w2f__i8) OpenAD_Symbol_308
      REAL(w2f__8) OpenAD_Symbol_309
      INTEGER(w2f__i8) OpenAD_Symbol_310
      INTEGER(w2f__i8) OpenAD_Symbol_311
      REAL(w2f__8) OpenAD_Symbol_312
      INTEGER(w2f__i8) OpenAD_Symbol_313
      INTEGER(w2f__i8) OpenAD_Symbol_314
      REAL(w2f__8) OpenAD_Symbol_315
      INTEGER(w2f__i8) OpenAD_Symbol_316
      INTEGER(w2f__i8) OpenAD_Symbol_317
      REAL(w2f__8) OpenAD_Symbol_318
      INTEGER(w2f__i8) OpenAD_Symbol_319
      INTEGER(w2f__i8) OpenAD_Symbol_320
      REAL(w2f__8) OpenAD_Symbol_321
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
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
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
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
      OpenAD_Symbol_162 = 0_w2f__i8
      DO J = 1, 2, 1
        OpenAD_Symbol_163 = 0_w2f__i8
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
          OpenAD_Symbol_135 = (OpenAD_Symbol_0 + OpenAD_Symbol_1)
          OpenAD_Symbol_136 = (OpenAD_Symbol_2 + OpenAD_Symbol_135 *
     >  OpenAD_Symbol_3)
          OpenAD_Symbol_137 = (OpenAD_Symbol_4 + OpenAD_Symbol_136 *
     >  OpenAD_Symbol_5)
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
          CALL push(OpenAD_Symbol_135)
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
          CALL push(OpenAD_Symbol_136)
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
          CALL push(OpenAD_Symbol_137)
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
          IF(__value__(S) .GT. 0.0D00) THEN
            OpenAD_Symbol_6 = SQRT(__value__(S))
            __value__(S3O2) = (__value__(S) * OpenAD_Symbol_6)
            OpenAD_Symbol_7 = OpenAD_Symbol_6
            OpenAD_Symbol_9 = (5.0D-01 / OpenAD_Symbol_6)
            OpenAD_Symbol_8 = __value__(S)
            OpenAD_Symbol_138 = (OpenAD_Symbol_9 * OpenAD_Symbol_8)
C           $OpenAD$ INLINE push(subst)
            CALL push(OpenAD_Symbol_138)
C           $OpenAD$ INLINE push(subst)
            CALL push(OpenAD_Symbol_7)
            OpenAD_Symbol_164 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_164)
          ELSE
            __value__(S) = 0.0D00
            __value__(S3O2) = 0.0D00
            OpenAD_Symbol_165 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_165)
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
          OpenAD_Symbol_139 = (OpenAD_Symbol_116 * OpenAD_Symbol_113)
          OpenAD_Symbol_140 = (OpenAD_Symbol_86 * OpenAD_Symbol_83)
          OpenAD_Symbol_141 = (OpenAD_Symbol_99 * OpenAD_Symbol_97)
          OpenAD_Symbol_142 = (OpenAD_Symbol_124 * OpenAD_Symbol_114)
          OpenAD_Symbol_143 = (OpenAD_Symbol_122 * OpenAD_Symbol_114)
          OpenAD_Symbol_144 = (OpenAD_Symbol_110 * OpenAD_Symbol_102)
          OpenAD_Symbol_145 = (OpenAD_Symbol_108 * OpenAD_Symbol_102)
          OpenAD_Symbol_146 = (OpenAD_Symbol_94 * OpenAD_Symbol_84)
          OpenAD_Symbol_147 = (OpenAD_Symbol_92 * OpenAD_Symbol_84)
          OpenAD_Symbol_148 = (OpenAD_Symbol_80 * OpenAD_Symbol_68)
          OpenAD_Symbol_149 = (OpenAD_Symbol_78 * OpenAD_Symbol_68)
          OpenAD_Symbol_150 = (OpenAD_Symbol_76 * OpenAD_Symbol_68)
          OpenAD_Symbol_151 = (OpenAD_Symbol_57 * OpenAD_Symbol_49)
          OpenAD_Symbol_152 = (OpenAD_Symbol_55 * OpenAD_Symbol_49)
          OpenAD_Symbol_153 = (OpenAD_Symbol_46 * OpenAD_Symbol_34)
          OpenAD_Symbol_154 = (OpenAD_Symbol_44 * OpenAD_Symbol_34)
          OpenAD_Symbol_155 = (OpenAD_Symbol_42 * OpenAD_Symbol_34)
          OpenAD_Symbol_156 = (OpenAD_Symbol_10 * OpenAD_Symbol_67 +
     >  OpenAD_Symbol_10 * OpenAD_Symbol_85 * OpenAD_Symbol_83 +
     >  OpenAD_Symbol_10 * OpenAD_Symbol_98 * OpenAD_Symbol_97 +
     >  OpenAD_Symbol_10 *(OpenAD_Symbol_12 + OpenAD_Symbol_13) *(
     > OpenAD_Symbol_101 + OpenAD_Symbol_115 * OpenAD_Symbol_113))
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_33)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_139)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_48)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_140)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_141)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_142)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_143)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_144)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_145)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_146)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_147)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_148)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_149)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_150)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_151)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_152)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_153)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_154)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_155)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_29)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_27)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_25)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_23)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_156)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
          OpenAD_Symbol_163 = (INT(OpenAD_Symbol_163) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_163)
        OpenAD_Symbol_162 = (INT(OpenAD_Symbol_162) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_162)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_157)
      OpenAD_Symbol_158 = 1
      DO WHILE(INT(OpenAD_Symbol_158) .LE. INT(OpenAD_Symbol_157))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_159)
        OpenAD_Symbol_160 = 1
        DO WHILE(INT(OpenAD_Symbol_160) .LE. INT(OpenAD_Symbol_159))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_248)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_249)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_250)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_251)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_252)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_252, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_249), INT(OpenAD_Symbol_248))), __deriv__(LOCPRES(
     > INT(OpenAD_Symbol_251), INT(OpenAD_Symbol_250))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_253)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_254)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_255)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_255, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_254), INT(OpenAD_Symbol_253))), __deriv__(T))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_256)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_257)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_258)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_258, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_257), INT(OpenAD_Symbol_256))), __deriv__(T2))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_259)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_260)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_261)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_261, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_260), INT(OpenAD_Symbol_259))), __deriv__(T3))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_262)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_263)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_264)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_264, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_263), INT(OpenAD_Symbol_262))), __deriv__(T4))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_265)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_266)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_267)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_267, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_266), INT(OpenAD_Symbol_265))), __deriv__(T))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_268)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_269)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_270)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_270, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_269), INT(OpenAD_Symbol_268))), __deriv__(T2))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_271)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_272)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_273)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_273, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_272), INT(OpenAD_Symbol_271))), __deriv__(T3))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_274)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_275)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_276)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_276, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_275), INT(OpenAD_Symbol_274))), __deriv__(T))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_277)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_278)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_279)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_279, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_278), INT(OpenAD_Symbol_277))), __deriv__(T2))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_280)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_281)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_282)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_282, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_281), INT(OpenAD_Symbol_280))), __deriv__(T))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_283)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_284)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_285)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_285, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_284), INT(OpenAD_Symbol_283))), __deriv__(T2))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_286)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_287)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_288)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_288, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_287), INT(OpenAD_Symbol_286))), __deriv__(T3))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_289)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_290)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_291)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_291, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_290), INT(OpenAD_Symbol_289))), __deriv__(T))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_292)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_293)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_294)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_294, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_293), INT(OpenAD_Symbol_292))), __deriv__(T2))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_295)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_296)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_297)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_297, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_296), INT(OpenAD_Symbol_295))), __deriv__(T))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_298)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_299)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_300)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_300, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_299), INT(OpenAD_Symbol_298))), __deriv__(T2))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_301)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_302)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_303)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_303, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_302), INT(OpenAD_Symbol_301))), __deriv__(T))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_304)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_305)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_306)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_306, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_305), INT(OpenAD_Symbol_304))), __deriv__(T2))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_307)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_308)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_309)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_309, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_308), INT(OpenAD_Symbol_307))), __deriv__(S3O2))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_310)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_311)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_312)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_312, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_311), INT(OpenAD_Symbol_310))), __deriv__(S))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_313)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_314)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_315)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_315, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_314), INT(OpenAD_Symbol_313))), __deriv__(S3O2))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_316)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_317)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_318)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_318, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_317), INT(OpenAD_Symbol_316))), __deriv__(S))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_319)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_320)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_321)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_321, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_320), INT(OpenAD_Symbol_319))), __deriv__(S))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(BULKMOD(INT(OpenAD_Symbol_320), INT(
     > OpenAD_Symbol_319))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_161)
          IF(OpenAD_Symbol_161 .ne. 0) THEN
C           $OpenAD$ INLINE Pop(subst)
            CALL Pop(OpenAD_Symbol_246)
C           $OpenAD$ INLINE Saxpy(subst,subst,subst)
            CALL Saxpy(OpenAD_Symbol_246, __deriv__(S3O2), __deriv__(S)
     > )
C           $OpenAD$ INLINE Pop(subst)
            CALL Pop(OpenAD_Symbol_247)
C           $OpenAD$ INLINE Saxpy(subst,subst,subst)
            CALL Saxpy(OpenAD_Symbol_247, __deriv__(S3O2), __deriv__(S)
     > )
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(S3O2))
          ELSE
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(S3O2))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(S))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_218)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_219)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_220)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_221)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_222)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(S), __deriv__(SFLD(INT(
     > OpenAD_Symbol_222), INT(OpenAD_Symbol_221), INT(
     > OpenAD_Symbol_220), INT(OpenAD_Symbol_219), INT(
     > OpenAD_Symbol_218))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(S))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_223)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_224)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_225)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_226)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_227)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_228)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_228, __deriv__(T4), __deriv__(TFLD(
     > INT(OpenAD_Symbol_227), INT(OpenAD_Symbol_226), INT(
     > OpenAD_Symbol_225), INT(OpenAD_Symbol_224), INT(
     > OpenAD_Symbol_223))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(T4))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_229)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_230)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_231)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_232)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_233)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_234)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_234, __deriv__(T3), __deriv__(TFLD(
     > INT(OpenAD_Symbol_233), INT(OpenAD_Symbol_232), INT(
     > OpenAD_Symbol_231), INT(OpenAD_Symbol_230), INT(
     > OpenAD_Symbol_229))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(T3))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_235)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_236)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_237)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_238)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_239)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_240)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_240, __deriv__(T2), __deriv__(TFLD(
     > INT(OpenAD_Symbol_239), INT(OpenAD_Symbol_238), INT(
     > OpenAD_Symbol_237), INT(OpenAD_Symbol_236), INT(
     > OpenAD_Symbol_235))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(T2))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_241)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_242)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_243)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_244)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_245)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(T), __deriv__(TFLD(INT(
     > OpenAD_Symbol_245), INT(OpenAD_Symbol_244), INT(
     > OpenAD_Symbol_243), INT(OpenAD_Symbol_242), INT(
     > OpenAD_Symbol_241))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(T))
          OpenAD_Symbol_160 = INT(OpenAD_Symbol_160) + 1
        END DO
        OpenAD_Symbol_158 = INT(OpenAD_Symbol_158) + 1
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
C     $OpenAD$ BEGIN REPLACEMENT 10
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
      OpenAD_Symbol_171 = 0_w2f__i8
      DO J = 1, 2, 1
        OpenAD_Symbol_172 = 0_w2f__i8
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
          OpenAD_Symbol_135 = (OpenAD_Symbol_0 + OpenAD_Symbol_1)
          OpenAD_Symbol_136 = (OpenAD_Symbol_2 + OpenAD_Symbol_135 *
     >  OpenAD_Symbol_3)
          OpenAD_Symbol_137 = (OpenAD_Symbol_4 + OpenAD_Symbol_136 *
     >  OpenAD_Symbol_5)
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
          CALL push(OpenAD_Symbol_135)
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
          CALL push(OpenAD_Symbol_136)
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
          CALL push(OpenAD_Symbol_137)
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
          IF(__value__(S) .GT. 0.0D00) THEN
            OpenAD_Symbol_6 = SQRT(__value__(S))
            __value__(S3O2) = (__value__(S) * OpenAD_Symbol_6)
            OpenAD_Symbol_7 = OpenAD_Symbol_6
            OpenAD_Symbol_9 = (5.0D-01 / OpenAD_Symbol_6)
            OpenAD_Symbol_8 = __value__(S)
            OpenAD_Symbol_138 = (OpenAD_Symbol_9 * OpenAD_Symbol_8)
C           $OpenAD$ INLINE push(subst)
            CALL push(OpenAD_Symbol_138)
C           $OpenAD$ INLINE push(subst)
            CALL push(OpenAD_Symbol_7)
            OpenAD_Symbol_173 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_173)
          ELSE
            __value__(S) = 0.0D00
            __value__(S3O2) = 0.0D00
            OpenAD_Symbol_174 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_174)
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
          OpenAD_Symbol_139 = (OpenAD_Symbol_116 * OpenAD_Symbol_113)
          OpenAD_Symbol_140 = (OpenAD_Symbol_86 * OpenAD_Symbol_83)
          OpenAD_Symbol_141 = (OpenAD_Symbol_99 * OpenAD_Symbol_97)
          OpenAD_Symbol_142 = (OpenAD_Symbol_124 * OpenAD_Symbol_114)
          OpenAD_Symbol_143 = (OpenAD_Symbol_122 * OpenAD_Symbol_114)
          OpenAD_Symbol_144 = (OpenAD_Symbol_110 * OpenAD_Symbol_102)
          OpenAD_Symbol_145 = (OpenAD_Symbol_108 * OpenAD_Symbol_102)
          OpenAD_Symbol_146 = (OpenAD_Symbol_94 * OpenAD_Symbol_84)
          OpenAD_Symbol_147 = (OpenAD_Symbol_92 * OpenAD_Symbol_84)
          OpenAD_Symbol_148 = (OpenAD_Symbol_80 * OpenAD_Symbol_68)
          OpenAD_Symbol_149 = (OpenAD_Symbol_78 * OpenAD_Symbol_68)
          OpenAD_Symbol_150 = (OpenAD_Symbol_76 * OpenAD_Symbol_68)
          OpenAD_Symbol_151 = (OpenAD_Symbol_57 * OpenAD_Symbol_49)
          OpenAD_Symbol_152 = (OpenAD_Symbol_55 * OpenAD_Symbol_49)
          OpenAD_Symbol_153 = (OpenAD_Symbol_46 * OpenAD_Symbol_34)
          OpenAD_Symbol_154 = (OpenAD_Symbol_44 * OpenAD_Symbol_34)
          OpenAD_Symbol_155 = (OpenAD_Symbol_42 * OpenAD_Symbol_34)
          OpenAD_Symbol_156 = (OpenAD_Symbol_10 * OpenAD_Symbol_67 +
     >  OpenAD_Symbol_10 * OpenAD_Symbol_85 * OpenAD_Symbol_83 +
     >  OpenAD_Symbol_10 * OpenAD_Symbol_98 * OpenAD_Symbol_97 +
     >  OpenAD_Symbol_10 *(OpenAD_Symbol_12 + OpenAD_Symbol_13) *(
     > OpenAD_Symbol_101 + OpenAD_Symbol_115 * OpenAD_Symbol_113))
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_33)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_139)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_48)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_140)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_141)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_142)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_143)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_144)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_145)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_146)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_147)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_148)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_149)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_150)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_151)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_152)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_153)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_154)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_155)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_29)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_27)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_25)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_23)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_156)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
          OpenAD_Symbol_172 = (INT(OpenAD_Symbol_172) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_172)
        OpenAD_Symbol_171 = (INT(OpenAD_Symbol_171) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_171)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_166)
      OpenAD_Symbol_167 = 1
      DO WHILE(INT(OpenAD_Symbol_167) .LE. INT(OpenAD_Symbol_166))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_168)
        OpenAD_Symbol_169 = 1
        DO WHILE(INT(OpenAD_Symbol_169) .LE. INT(OpenAD_Symbol_168))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_248)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_249)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_250)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_251)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_252)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_252, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_249), INT(OpenAD_Symbol_248))), __deriv__(LOCPRES(
     > INT(OpenAD_Symbol_251), INT(OpenAD_Symbol_250))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_253)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_254)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_255)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_255, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_254), INT(OpenAD_Symbol_253))), __deriv__(T))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_256)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_257)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_258)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_258, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_257), INT(OpenAD_Symbol_256))), __deriv__(T2))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_259)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_260)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_261)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_261, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_260), INT(OpenAD_Symbol_259))), __deriv__(T3))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_262)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_263)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_264)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_264, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_263), INT(OpenAD_Symbol_262))), __deriv__(T4))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_265)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_266)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_267)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_267, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_266), INT(OpenAD_Symbol_265))), __deriv__(T))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_268)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_269)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_270)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_270, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_269), INT(OpenAD_Symbol_268))), __deriv__(T2))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_271)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_272)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_273)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_273, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_272), INT(OpenAD_Symbol_271))), __deriv__(T3))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_274)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_275)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_276)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_276, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_275), INT(OpenAD_Symbol_274))), __deriv__(T))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_277)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_278)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_279)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_279, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_278), INT(OpenAD_Symbol_277))), __deriv__(T2))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_280)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_281)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_282)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_282, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_281), INT(OpenAD_Symbol_280))), __deriv__(T))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_283)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_284)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_285)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_285, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_284), INT(OpenAD_Symbol_283))), __deriv__(T2))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_286)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_287)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_288)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_288, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_287), INT(OpenAD_Symbol_286))), __deriv__(T3))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_289)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_290)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_291)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_291, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_290), INT(OpenAD_Symbol_289))), __deriv__(T))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_292)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_293)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_294)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_294, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_293), INT(OpenAD_Symbol_292))), __deriv__(T2))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_295)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_296)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_297)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_297, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_296), INT(OpenAD_Symbol_295))), __deriv__(T))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_298)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_299)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_300)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_300, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_299), INT(OpenAD_Symbol_298))), __deriv__(T2))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_301)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_302)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_303)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_303, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_302), INT(OpenAD_Symbol_301))), __deriv__(T))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_304)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_305)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_306)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_306, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_305), INT(OpenAD_Symbol_304))), __deriv__(T2))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_307)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_308)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_309)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_309, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_308), INT(OpenAD_Symbol_307))), __deriv__(S3O2))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_310)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_311)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_312)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_312, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_311), INT(OpenAD_Symbol_310))), __deriv__(S))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_313)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_314)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_315)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_315, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_314), INT(OpenAD_Symbol_313))), __deriv__(S3O2))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_316)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_317)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_318)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_318, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_317), INT(OpenAD_Symbol_316))), __deriv__(S))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_319)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_320)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_321)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_321, __deriv__(BULKMOD(INT(
     > OpenAD_Symbol_320), INT(OpenAD_Symbol_319))), __deriv__(S))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(BULKMOD(INT(OpenAD_Symbol_320), INT(
     > OpenAD_Symbol_319))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_170)
          IF(OpenAD_Symbol_170 .ne. 0) THEN
C           $OpenAD$ INLINE Pop(subst)
            CALL Pop(OpenAD_Symbol_246)
C           $OpenAD$ INLINE Saxpy(subst,subst,subst)
            CALL Saxpy(OpenAD_Symbol_246, __deriv__(S3O2), __deriv__(S)
     > )
C           $OpenAD$ INLINE Pop(subst)
            CALL Pop(OpenAD_Symbol_247)
C           $OpenAD$ INLINE Saxpy(subst,subst,subst)
            CALL Saxpy(OpenAD_Symbol_247, __deriv__(S3O2), __deriv__(S)
     > )
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(S3O2))
          ELSE
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(S3O2))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(S))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_218)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_219)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_220)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_221)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_222)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(S), __deriv__(SFLD(INT(
     > OpenAD_Symbol_222), INT(OpenAD_Symbol_221), INT(
     > OpenAD_Symbol_220), INT(OpenAD_Symbol_219), INT(
     > OpenAD_Symbol_218))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(S))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_223)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_224)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_225)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_226)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_227)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_228)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_228, __deriv__(T4), __deriv__(TFLD(
     > INT(OpenAD_Symbol_227), INT(OpenAD_Symbol_226), INT(
     > OpenAD_Symbol_225), INT(OpenAD_Symbol_224), INT(
     > OpenAD_Symbol_223))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(T4))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_229)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_230)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_231)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_232)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_233)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_234)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_234, __deriv__(T3), __deriv__(TFLD(
     > INT(OpenAD_Symbol_233), INT(OpenAD_Symbol_232), INT(
     > OpenAD_Symbol_231), INT(OpenAD_Symbol_230), INT(
     > OpenAD_Symbol_229))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(T3))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_235)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_236)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_237)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_238)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_239)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_240)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_240, __deriv__(T2), __deriv__(TFLD(
     > INT(OpenAD_Symbol_239), INT(OpenAD_Symbol_238), INT(
     > OpenAD_Symbol_237), INT(OpenAD_Symbol_236), INT(
     > OpenAD_Symbol_235))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(T2))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_241)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_242)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_243)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_244)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_245)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(T), __deriv__(TFLD(INT(
     > OpenAD_Symbol_245), INT(OpenAD_Symbol_244), INT(
     > OpenAD_Symbol_243), INT(OpenAD_Symbol_242), INT(
     > OpenAD_Symbol_241))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(T))
          OpenAD_Symbol_169 = INT(OpenAD_Symbol_169) + 1
        END DO
        OpenAD_Symbol_167 = INT(OpenAD_Symbol_167) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
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
      INTEGER(w2f__i8) OpenAD_Symbol_175
      INTEGER(w2f__i8) OpenAD_Symbol_176
      INTEGER(w2f__i8) OpenAD_Symbol_177
      INTEGER(w2f__i8) OpenAD_Symbol_178
      INTEGER(w2f__i8) OpenAD_Symbol_179
      INTEGER(w2f__i8) OpenAD_Symbol_180
      INTEGER(w2f__i8) OpenAD_Symbol_181
      INTEGER(w2f__i8) OpenAD_Symbol_182
      INTEGER(w2f__i8) OpenAD_Symbol_183
      INTEGER(w2f__i8) OpenAD_Symbol_184
      INTEGER(w2f__i8) OpenAD_Symbol_185
      INTEGER(w2f__i8) OpenAD_Symbol_186
      INTEGER(w2f__i8) OpenAD_Symbol_187
      INTEGER(w2f__i8) OpenAD_Symbol_188
      INTEGER(w2f__i8) OpenAD_Symbol_189
      INTEGER(w2f__i8) OpenAD_Symbol_190
      INTEGER(w2f__i8) OpenAD_Symbol_191
      INTEGER(w2f__i8) OpenAD_Symbol_192
      INTEGER(w2f__i8) OpenAD_Symbol_193
      INTEGER(w2f__i8) OpenAD_Symbol_194
      INTEGER(w2f__i8) OpenAD_Symbol_195
      INTEGER(w2f__i8) OpenAD_Symbol_196
      INTEGER(w2f__i8) OpenAD_Symbol_197
      INTEGER(w2f__i8) OpenAD_Symbol_198
      INTEGER(w2f__i8) OpenAD_Symbol_199
      INTEGER(w2f__i8) OpenAD_Symbol_200
      INTEGER(w2f__i8) OpenAD_Symbol_201
      INTEGER(w2f__i8) OpenAD_Symbol_202
      INTEGER(w2f__i8) OpenAD_Symbol_203
      INTEGER(w2f__i8) OpenAD_Symbol_204
      INTEGER(w2f__i8) OpenAD_Symbol_205
      INTEGER(w2f__i8) OpenAD_Symbol_206
      INTEGER(w2f__i8) OpenAD_Symbol_207
      INTEGER(w2f__i8) OpenAD_Symbol_208
      INTEGER(w2f__i8) OpenAD_Symbol_209
      INTEGER(w2f__i8) OpenAD_Symbol_210
      INTEGER(w2f__i8) OpenAD_Symbol_211
      INTEGER(w2f__i8) OpenAD_Symbol_212
      INTEGER(w2f__i8) OpenAD_Symbol_213
      INTEGER(w2f__i8) OpenAD_Symbol_214
      INTEGER(w2f__i8) OpenAD_Symbol_215
      INTEGER(w2f__i8) OpenAD_Symbol_216
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
      INTEGER(w2f__i8) OpenAD_Symbol_217
      INTEGER(w2f__i8) OpenAD_Symbol_322
      INTEGER(w2f__i8) OpenAD_Symbol_323
      INTEGER(w2f__i8) OpenAD_Symbol_324
      INTEGER(w2f__i8) OpenAD_Symbol_325
      INTEGER(w2f__i8) OpenAD_Symbol_326
      INTEGER(w2f__i8) OpenAD_Symbol_327
      INTEGER(w2f__i8) OpenAD_Symbol_328
      INTEGER(w2f__i8) OpenAD_Symbol_329
      INTEGER(w2f__i8) OpenAD_Symbol_330
      INTEGER(w2f__i8) OpenAD_Symbol_331
      INTEGER(w2f__i8) OpenAD_Symbol_332
      INTEGER(w2f__i8) OpenAD_Symbol_333
      INTEGER(w2f__i8) OpenAD_Symbol_334
      INTEGER(w2f__i8) OpenAD_Symbol_335
      INTEGER(w2f__i8) OpenAD_Symbol_336
      INTEGER(w2f__i8) OpenAD_Symbol_337
      INTEGER(w2f__i8) OpenAD_Symbol_338
      INTEGER(w2f__i8) OpenAD_Symbol_339
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
          __value__(LOCPRES(INT(I), INT(J))) = (__value__(X(XCOUNT)) *
     >  2.0D00)
          DO K = 1, 2, 1
            DO L = 1, 2, 1
              DO M = 1, 2, 1
                __value__(TFLD(INT(I), INT(J), INT(K), INT(L), INT(M)))
     >  = (__value__(X(XCOUNT)) * 3.0D00)
                __value__(SFLD(INT(I), INT(J), INT(K), INT(L), INT(M)))
     >  = (__value__(X(XCOUNT)) * 4.0D00)
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
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      XCOUNT = 1
      OpenAD_Symbol_189 = 0_w2f__i8
      DO I = 1, 2, 1
        OpenAD_Symbol_190 = 0_w2f__i8
        DO J = 1, 2, 1
          __value__(LOCPRES(INT(I), INT(J))) = (__value__(X(XCOUNT)) *
     >  2.0D00)
          OpenAD_Symbol_129 = 2.0D00
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(XCOUNT)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
          OpenAD_Symbol_191 = 0_w2f__i8
          DO K = 1, 2, 1
            OpenAD_Symbol_192 = 0_w2f__i8
            DO L = 1, 2, 1
              OpenAD_Symbol_193 = 0_w2f__i8
              DO M = 1, 2, 1
                __value__(TFLD(INT(I), INT(J), INT(K), INT(L), INT(M)))
     >  = (__value__(X(XCOUNT)) * 3.0D00)
                OpenAD_Symbol_131 = 3.0D00
                __value__(SFLD(INT(I), INT(J), INT(K), INT(L), INT(M)))
     >  = (__value__(X(XCOUNT)) * 4.0D00)
                OpenAD_Symbol_133 = 4.0D00
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(XCOUNT)
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
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(XCOUNT)
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
                OpenAD_Symbol_193 = (INT(OpenAD_Symbol_193) + INT(
     > 1_w2f__i8))
              END DO
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_193)
              OpenAD_Symbol_192 = (INT(OpenAD_Symbol_192) + INT(
     > 1_w2f__i8))
            END DO
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_192)
            OpenAD_Symbol_191 = (INT(OpenAD_Symbol_191) + INT(1_w2f__i8
     > ))
          END DO
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_191)
          OpenAD_Symbol_190 = (INT(OpenAD_Symbol_190) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_190)
        OpenAD_Symbol_189 = (INT(OpenAD_Symbol_189) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_189)
      CALL find_bulkmod(__deriv__(LOCPRES), __deriv__(TFLD), __deriv__(
     > SFLD), __deriv__(BULKMOD))
      OpenAD_Symbol_194 = 0_w2f__i8
      DO I = 1, 2, 1
        OpenAD_Symbol_195 = 0_w2f__i8
        DO J = 1, 2, 1
          __value__(Y(INT(J + INT((I * 2)) +(-2)))) = __value__(BULKMOD
     > (I, J))
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
          OpenAD_Symbol_217 = (J + I * 2 +(-2))
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_217)
          OpenAD_Symbol_195 = (INT(OpenAD_Symbol_195) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_195)
        OpenAD_Symbol_194 = (INT(OpenAD_Symbol_194) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_194)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_175)
      OpenAD_Symbol_176 = 1
      DO WHILE(INT(OpenAD_Symbol_176) .LE. INT(OpenAD_Symbol_175))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_177)
        OpenAD_Symbol_178 = 1
        DO WHILE(INT(OpenAD_Symbol_178) .LE. INT(OpenAD_Symbol_177))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_337)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_338)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_339)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(Y(INT(OpenAD_Symbol_337))), __deriv__
     > (BULKMOD(INT(OpenAD_Symbol_339), INT(OpenAD_Symbol_338))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_337))))
          OpenAD_Symbol_178 = INT(OpenAD_Symbol_178) + 1
        END DO
        OpenAD_Symbol_176 = INT(OpenAD_Symbol_176) + 1
      END DO
      CALL find_bulkmod(__deriv__(LOCPRES), __deriv__(TFLD), __deriv__(
     > SFLD), __deriv__(BULKMOD))
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_179)
      OpenAD_Symbol_180 = 1
      DO WHILE(INT(OpenAD_Symbol_180) .LE. INT(OpenAD_Symbol_179))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_181)
        OpenAD_Symbol_182 = 1
        DO WHILE(INT(OpenAD_Symbol_182) .LE. INT(OpenAD_Symbol_181))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_183)
          OpenAD_Symbol_184 = 1
          DO WHILE(INT(OpenAD_Symbol_184) .LE. INT(OpenAD_Symbol_183))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_185)
            OpenAD_Symbol_186 = 1
            DO WHILE(INT(OpenAD_Symbol_186) .LE. INT(OpenAD_Symbol_185)
     > )
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_187)
              OpenAD_Symbol_188 = 1
              DO WHILE(INT(OpenAD_Symbol_188) .LE. INT(
     > OpenAD_Symbol_187))
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_325)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_326)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_327)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_328)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_329)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_330)
C               $OpenAD$ INLINE Saxpy(subst,subst,subst)
                CALL Saxpy(4.0D00, __deriv__(SFLD(INT(OpenAD_Symbol_329
     > ), INT(OpenAD_Symbol_328), INT(OpenAD_Symbol_327), INT(
     > OpenAD_Symbol_326), INT(OpenAD_Symbol_325))), __deriv__(X(INT(
     > OpenAD_Symbol_330))))
C               $OpenAD$ INLINE ZeroDeriv(subst)
                CALL ZeroDeriv(__deriv__(SFLD(INT(OpenAD_Symbol_329),
     >  INT(OpenAD_Symbol_328), INT(OpenAD_Symbol_327), INT(
     > OpenAD_Symbol_326), INT(OpenAD_Symbol_325))))
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_331)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_332)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_333)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_334)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_335)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_336)
C               $OpenAD$ INLINE Saxpy(subst,subst,subst)
                CALL Saxpy(3.0D00, __deriv__(TFLD(INT(OpenAD_Symbol_335
     > ), INT(OpenAD_Symbol_334), INT(OpenAD_Symbol_333), INT(
     > OpenAD_Symbol_332), INT(OpenAD_Symbol_331))), __deriv__(X(INT(
     > OpenAD_Symbol_336))))
C               $OpenAD$ INLINE ZeroDeriv(subst)
                CALL ZeroDeriv(__deriv__(TFLD(INT(OpenAD_Symbol_335),
     >  INT(OpenAD_Symbol_334), INT(OpenAD_Symbol_333), INT(
     > OpenAD_Symbol_332), INT(OpenAD_Symbol_331))))
                OpenAD_Symbol_188 = INT(OpenAD_Symbol_188) + 1
              END DO
              OpenAD_Symbol_186 = INT(OpenAD_Symbol_186) + 1
            END DO
            OpenAD_Symbol_184 = INT(OpenAD_Symbol_184) + 1
          END DO
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_322)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_323)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_324)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(2.0D00, __deriv__(LOCPRES(INT(OpenAD_Symbol_323),
     >  INT(OpenAD_Symbol_322))), __deriv__(X(INT(OpenAD_Symbol_324))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(LOCPRES(INT(OpenAD_Symbol_323), INT(
     > OpenAD_Symbol_322))))
          OpenAD_Symbol_182 = INT(OpenAD_Symbol_182) + 1
        END DO
        OpenAD_Symbol_180 = INT(OpenAD_Symbol_180) + 1
      END DO
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
      XCOUNT = 1
      OpenAD_Symbol_210 = 0_w2f__i8
      DO I = 1, 2, 1
        OpenAD_Symbol_211 = 0_w2f__i8
        DO J = 1, 2, 1
          __value__(LOCPRES(INT(I), INT(J))) = (__value__(X(XCOUNT)) *
     >  2.0D00)
          OpenAD_Symbol_129 = 2.0D00
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(XCOUNT)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
          OpenAD_Symbol_212 = 0_w2f__i8
          DO K = 1, 2, 1
            OpenAD_Symbol_213 = 0_w2f__i8
            DO L = 1, 2, 1
              OpenAD_Symbol_214 = 0_w2f__i8
              DO M = 1, 2, 1
                __value__(TFLD(INT(I), INT(J), INT(K), INT(L), INT(M)))
     >  = (__value__(X(XCOUNT)) * 3.0D00)
                OpenAD_Symbol_131 = 3.0D00
                __value__(SFLD(INT(I), INT(J), INT(K), INT(L), INT(M)))
     >  = (__value__(X(XCOUNT)) * 4.0D00)
                OpenAD_Symbol_133 = 4.0D00
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(XCOUNT)
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
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(XCOUNT)
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
                OpenAD_Symbol_214 = (INT(OpenAD_Symbol_214) + INT(
     > 1_w2f__i8))
              END DO
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_214)
              OpenAD_Symbol_213 = (INT(OpenAD_Symbol_213) + INT(
     > 1_w2f__i8))
            END DO
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_213)
            OpenAD_Symbol_212 = (INT(OpenAD_Symbol_212) + INT(1_w2f__i8
     > ))
          END DO
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_212)
          OpenAD_Symbol_211 = (INT(OpenAD_Symbol_211) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_211)
        OpenAD_Symbol_210 = (INT(OpenAD_Symbol_210) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_210)
      CALL find_bulkmod(__deriv__(LOCPRES), __deriv__(TFLD), __deriv__(
     > SFLD), __deriv__(BULKMOD))
      OpenAD_Symbol_215 = 0_w2f__i8
      DO I = 1, 2, 1
        OpenAD_Symbol_216 = 0_w2f__i8
        DO J = 1, 2, 1
          __value__(Y(INT(J + INT((I * 2)) +(-2)))) = __value__(BULKMOD
     > (I, J))
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(I)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(J)
          OpenAD_Symbol_217 = (J + I * 2 +(-2))
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_217)
          OpenAD_Symbol_216 = (INT(OpenAD_Symbol_216) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_216)
        OpenAD_Symbol_215 = (INT(OpenAD_Symbol_215) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_215)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_196)
      OpenAD_Symbol_197 = 1
      DO WHILE(INT(OpenAD_Symbol_197) .LE. INT(OpenAD_Symbol_196))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_198)
        OpenAD_Symbol_199 = 1
        DO WHILE(INT(OpenAD_Symbol_199) .LE. INT(OpenAD_Symbol_198))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_337)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_338)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_339)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(Y(INT(OpenAD_Symbol_337))), __deriv__
     > (BULKMOD(INT(OpenAD_Symbol_339), INT(OpenAD_Symbol_338))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(Y(INT(OpenAD_Symbol_337))))
          OpenAD_Symbol_199 = INT(OpenAD_Symbol_199) + 1
        END DO
        OpenAD_Symbol_197 = INT(OpenAD_Symbol_197) + 1
      END DO
      CALL find_bulkmod(__deriv__(LOCPRES), __deriv__(TFLD), __deriv__(
     > SFLD), __deriv__(BULKMOD))
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_200)
      OpenAD_Symbol_201 = 1
      DO WHILE(INT(OpenAD_Symbol_201) .LE. INT(OpenAD_Symbol_200))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_202)
        OpenAD_Symbol_203 = 1
        DO WHILE(INT(OpenAD_Symbol_203) .LE. INT(OpenAD_Symbol_202))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_204)
          OpenAD_Symbol_205 = 1
          DO WHILE(INT(OpenAD_Symbol_205) .LE. INT(OpenAD_Symbol_204))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_206)
            OpenAD_Symbol_207 = 1
            DO WHILE(INT(OpenAD_Symbol_207) .LE. INT(OpenAD_Symbol_206)
     > )
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_208)
              OpenAD_Symbol_209 = 1
              DO WHILE(INT(OpenAD_Symbol_209) .LE. INT(
     > OpenAD_Symbol_208))
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_325)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_326)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_327)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_328)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_329)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_330)
C               $OpenAD$ INLINE Saxpy(subst,subst,subst)
                CALL Saxpy(4.0D00, __deriv__(SFLD(INT(OpenAD_Symbol_329
     > ), INT(OpenAD_Symbol_328), INT(OpenAD_Symbol_327), INT(
     > OpenAD_Symbol_326), INT(OpenAD_Symbol_325))), __deriv__(X(INT(
     > OpenAD_Symbol_330))))
C               $OpenAD$ INLINE ZeroDeriv(subst)
                CALL ZeroDeriv(__deriv__(SFLD(INT(OpenAD_Symbol_329),
     >  INT(OpenAD_Symbol_328), INT(OpenAD_Symbol_327), INT(
     > OpenAD_Symbol_326), INT(OpenAD_Symbol_325))))
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_331)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_332)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_333)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_334)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_335)
C               $OpenAD$ INLINE pop_i(subst)
                CALL pop_i(OpenAD_Symbol_336)
C               $OpenAD$ INLINE Saxpy(subst,subst,subst)
                CALL Saxpy(3.0D00, __deriv__(TFLD(INT(OpenAD_Symbol_335
     > ), INT(OpenAD_Symbol_334), INT(OpenAD_Symbol_333), INT(
     > OpenAD_Symbol_332), INT(OpenAD_Symbol_331))), __deriv__(X(INT(
     > OpenAD_Symbol_336))))
C               $OpenAD$ INLINE ZeroDeriv(subst)
                CALL ZeroDeriv(__deriv__(TFLD(INT(OpenAD_Symbol_335),
     >  INT(OpenAD_Symbol_334), INT(OpenAD_Symbol_333), INT(
     > OpenAD_Symbol_332), INT(OpenAD_Symbol_331))))
                OpenAD_Symbol_209 = INT(OpenAD_Symbol_209) + 1
              END DO
              OpenAD_Symbol_207 = INT(OpenAD_Symbol_207) + 1
            END DO
            OpenAD_Symbol_205 = INT(OpenAD_Symbol_205) + 1
          END DO
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_322)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_323)
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_324)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(2.0D00, __deriv__(LOCPRES(INT(OpenAD_Symbol_323),
     >  INT(OpenAD_Symbol_322))), __deriv__(X(INT(OpenAD_Symbol_324))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(LOCPRES(INT(OpenAD_Symbol_323), INT(
     > OpenAD_Symbol_322))))
          OpenAD_Symbol_203 = INT(OpenAD_Symbol_203) + 1
        END DO
        OpenAD_Symbol_201 = INT(OpenAD_Symbol_201) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
