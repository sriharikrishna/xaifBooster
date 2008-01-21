
      MODULE all_globals_mod
      use w2f__types
      use active_module
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(NX, NY, X, FVEC, R)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_169
      type(active) :: OpenAD_Symbol_170
      REAL(w2f__8) OpenAD_Symbol_3
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
      EXTERNAL foo
      REAL(w2f__8) FOUR
      PARAMETER ( FOUR = 4.0D00)
      REAL(w2f__8) HX
      REAL(w2f__8) HX2
      REAL(w2f__8) HY
      REAL(w2f__8) HY2
      INTEGER(w2f__i4) K
      INTEGER(w2f__i4) N
      REAL(w2f__8) NXP1
      REAL(w2f__8) NYP1
      REAL(w2f__8) ONE
      PARAMETER ( ONE = 1.0D00)
      REAL(w2f__8) THREE
      PARAMETER ( THREE = 3.0D00)
      REAL(w2f__8) TWO
      PARAMETER ( TWO = 2.0D00)
      REAL(w2f__8) ZERO
      PARAMETER ( ZERO = 0.0D00)
      INTEGER(w2f__i4) t__3
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
      NXP1 = (NX + 1)
      NYP1 = (NY + 1)
      HX = (1.0D00 / NXP1)
      HY = (1.0D00 / NYP1)
      HY2 = (HY * HY)
      HX2 = (HX * HX)
      CALL foo(NX,NY,X,FVEC,R,N,HX,HY,HY2,HX2)
      t__3 = N
      DO K = 1, N, 1
        OpenAD_Symbol_0 = (HX2 * HY2)
        OpenAD_Symbol_3 = (FVEC(K)%v*OpenAD_Symbol_0)
        OpenAD_Symbol_1 = OpenAD_Symbol_0
        FVEC(INT(K))%v = OpenAD_Symbol_3
        OpenAD_Symbol_169 = OpenAD_Symbol_1
        CALL setderiv(OpenAD_Symbol_170,FVEC(K))
        CALL sax(OpenAD_Symbol_169,OpenAD_Symbol_170,FVEC(K))
      END DO
      END SUBROUTINE

      SUBROUTINE foo(NX, NY, X, FVEC, R, N, HX, HY, HY2, HX2)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_17
      type(active) :: OpenAD_Symbol_171
      type(active) :: OpenAD_Symbol_172
      type(active) :: OpenAD_Symbol_173
      type(active) :: OpenAD_Symbol_174
      type(active) :: OpenAD_Symbol_175
      REAL(w2f__8) OpenAD_Symbol_176
      type(active) :: OpenAD_Symbol_177
      REAL(w2f__8) OpenAD_Symbol_178
      type(active) :: OpenAD_Symbol_179
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_180
      type(active) :: OpenAD_Symbol_181
      REAL(w2f__8) OpenAD_Symbol_182
      type(active) :: OpenAD_Symbol_183
      REAL(w2f__8) OpenAD_Symbol_184
      REAL(w2f__8) OpenAD_Symbol_185
      REAL(w2f__8) OpenAD_Symbol_186
      REAL(w2f__8) OpenAD_Symbol_187
      REAL(w2f__8) OpenAD_Symbol_188
      REAL(w2f__8) OpenAD_Symbol_189
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_190
      type(active) :: OpenAD_Symbol_191
      REAL(w2f__8) OpenAD_Symbol_192
      REAL(w2f__8) OpenAD_Symbol_193
      type(active) :: OpenAD_Symbol_194
      REAL(w2f__8) OpenAD_Symbol_195
      REAL(w2f__8) OpenAD_Symbol_196
      REAL(w2f__8) OpenAD_Symbol_197
      type(active) :: OpenAD_Symbol_198
      REAL(w2f__8) OpenAD_Symbol_199
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_200
      type(active) :: OpenAD_Symbol_201
      REAL(w2f__8) OpenAD_Symbol_202
      REAL(w2f__8) OpenAD_Symbol_203
      REAL(w2f__8) OpenAD_Symbol_204
      type(active) :: OpenAD_Symbol_205
      REAL(w2f__8) OpenAD_Symbol_206
      REAL(w2f__8) OpenAD_Symbol_207
      REAL(w2f__8) OpenAD_Symbol_208
      REAL(w2f__8) OpenAD_Symbol_209
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_210
      type(active) :: OpenAD_Symbol_211
      REAL(w2f__8) OpenAD_Symbol_212
      REAL(w2f__8) OpenAD_Symbol_213
      REAL(w2f__8) OpenAD_Symbol_214
      REAL(w2f__8) OpenAD_Symbol_215
      type(active) :: OpenAD_Symbol_216
      REAL(w2f__8) OpenAD_Symbol_217
      type(active) :: OpenAD_Symbol_218
      REAL(w2f__8) OpenAD_Symbol_219
      type(active) :: OpenAD_Symbol_220
      type(active) :: OpenAD_Symbol_221
      type(active) :: OpenAD_Symbol_222
      type(active) :: OpenAD_Symbol_223
      type(active) :: OpenAD_Symbol_224
      type(active) :: OpenAD_Symbol_225
      type(active) :: OpenAD_Symbol_226
      type(active) :: OpenAD_Symbol_227
      type(active) :: OpenAD_Symbol_228
      type(active) :: OpenAD_Symbol_229
      REAL(w2f__8) OpenAD_Symbol_23
      type(active) :: OpenAD_Symbol_230
      type(active) :: OpenAD_Symbol_231
      type(active) :: OpenAD_Symbol_232
      type(active) :: OpenAD_Symbol_233
      type(active) :: OpenAD_Symbol_234
      REAL(w2f__8) OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_27
      REAL(w2f__8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_32
      REAL(w2f__8) OpenAD_Symbol_33
      REAL(w2f__8) OpenAD_Symbol_34
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_36
      REAL(w2f__8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_42
      REAL(w2f__8) OpenAD_Symbol_43
      REAL(w2f__8) OpenAD_Symbol_44
      REAL(w2f__8) OpenAD_Symbol_45
      REAL(w2f__8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_50
      REAL(w2f__8) OpenAD_Symbol_51
      REAL(w2f__8) OpenAD_Symbol_52
      REAL(w2f__8) OpenAD_Symbol_53
      REAL(w2f__8) OpenAD_Symbol_54
      REAL(w2f__8) OpenAD_Symbol_56
      REAL(w2f__8) OpenAD_Symbol_57
      REAL(w2f__8) OpenAD_Symbol_58
      REAL(w2f__8) OpenAD_Symbol_59
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_60
      REAL(w2f__8) OpenAD_Symbol_61
      REAL(w2f__8) OpenAD_Symbol_62
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      INTEGER(w2f__i4) NX
      INTEGER(w2f__i4) NY
      type(active) :: X(1 : INT((NX * NY)))
      type(active) :: FVEC(1 : INT((NX * NY)))
      REAL(w2f__8) R
      INTEGER(w2f__i4) N
      REAL(w2f__8) HX
      REAL(w2f__8) HY
      REAL(w2f__8) HY2
      REAL(w2f__8) HX2
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i8) t__4
      INTEGER(w2f__i8) t__5
      EXTERNAL bar
      type(active) :: DPDX
      type(active) :: DPDY
      REAL(w2f__8) FOUR
      PARAMETER ( FOUR = 4.0D00)
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) J
      INTEGER(w2f__i4) K
      REAL(w2f__8) ONE
      PARAMETER ( ONE = 1.0D00)
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
      PARAMETER ( THREE = 3.0D00)
      REAL(w2f__8) TWO
      PARAMETER ( TWO = 2.0D00)
      REAL(w2f__8) ZERO
      PARAMETER ( ZERO = 0.0D00)
      INTEGER(w2f__i4) t__6
      INTEGER(w2f__i4) t__7
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      t__4 = INT(NX * NY)
      t__5 = MAX(INT(NX * NY), 0_w2f__i8)
      t__6 = NY
      DO I = 1, NY, 1
        t__7 = NX
        DO J = 1, NX, 1
          K = J + NX *(I +(-1))
          IF((I .eq. 1) .OR.(J .eq. 1)) THEN
            PBL%v = 0.0D00
            CALL zero_deriv(PBL)
          ELSE
            PBL%v = X(K-NX+(-1))%v
            CALL setderiv(OpenAD_Symbol_234,X(K-NX+(-1)))
            CALL setderiv(PBL,OpenAD_Symbol_234)
          ENDIF
          IF(I .eq. 1) THEN
            PB%v = 0.0D00
            PBB%v = X(K)%v
            CALL setderiv(OpenAD_Symbol_171,X(K))
            CALL setderiv(PBB,OpenAD_Symbol_171)
            CALL zero_deriv(PB)
          ELSE
            IF(I .eq. 2) THEN
              PB%v = X(K-NX)%v
              PBB%v = 0.0D00
              CALL setderiv(OpenAD_Symbol_231,X(K-NX))
              CALL setderiv(PB,OpenAD_Symbol_231)
              CALL zero_deriv(PBB)
            ELSE
              PB%v = X(K-NX)%v
              PBB%v = X(K-NX*2)%v
              CALL setderiv(OpenAD_Symbol_233,X(K-NX*2))
              CALL setderiv(OpenAD_Symbol_232,X(K-NX))
              CALL setderiv(PB,OpenAD_Symbol_232)
              CALL setderiv(PBB,OpenAD_Symbol_233)
            ENDIF
          ENDIF
          IF((NX .eq. J) .OR.(I .eq. 1)) THEN
            PBR%v = 0.0D00
            CALL zero_deriv(PBR)
          ELSE
            PBR%v = X(K-NX+1)%v
            CALL setderiv(OpenAD_Symbol_230,X(K-NX+1))
            CALL setderiv(PBR,OpenAD_Symbol_230)
          ENDIF
          IF(J .eq. 1) THEN
            PL%v = 0.0D00
            PLL%v = X(K)%v
            CALL setderiv(OpenAD_Symbol_172,X(K))
            CALL setderiv(PLL,OpenAD_Symbol_172)
            CALL zero_deriv(PL)
          ELSE
            IF(J .eq. 2) THEN
              PL%v = X(K+(-1))%v
              PLL%v = 0.0D00
              CALL setderiv(OpenAD_Symbol_227,X(K+(-1)))
              CALL setderiv(PL,OpenAD_Symbol_227)
              CALL zero_deriv(PLL)
            ELSE
              PL%v = X(K+(-1))%v
              PLL%v = X(K+(-2))%v
              CALL setderiv(OpenAD_Symbol_229,X(K+(-2)))
              CALL setderiv(OpenAD_Symbol_228,X(K+(-1)))
              CALL setderiv(PL,OpenAD_Symbol_228)
              CALL setderiv(PLL,OpenAD_Symbol_229)
            ENDIF
          ENDIF
          P%v = X(K)%v
          CALL setderiv(OpenAD_Symbol_173,X(K))
          CALL setderiv(P,OpenAD_Symbol_173)
          IF(J .eq.(NX +(-1))) THEN
            PR%v = X(K+1)%v
            PRR%v = 0.0D00
            CALL setderiv(OpenAD_Symbol_174,X(K+1))
            CALL setderiv(PR,OpenAD_Symbol_174)
            CALL zero_deriv(PRR)
          ELSE
            IF(NX .eq. J) THEN
              PR%v = 0.0D00
              PRR%v = X(K)%v
              CALL setderiv(OpenAD_Symbol_224,X(K))
              CALL setderiv(PRR,OpenAD_Symbol_224)
              CALL zero_deriv(PR)
            ELSE
              PR%v = X(K+1)%v
              PRR%v = X(K+2)%v
              CALL setderiv(OpenAD_Symbol_226,X(K+2))
              CALL setderiv(OpenAD_Symbol_225,X(K+1))
              CALL setderiv(PR,OpenAD_Symbol_225)
              CALL setderiv(PRR,OpenAD_Symbol_226)
            ENDIF
          ENDIF
          IF((NY .eq. I) .OR.(J .eq. 1)) THEN
            PTL%v = 0.0D00
            CALL zero_deriv(PTL)
          ELSE
            PTL%v = X(NX+K+(-1))%v
            CALL setderiv(OpenAD_Symbol_223,X(NX+K+(-1)))
            CALL setderiv(PTL,OpenAD_Symbol_223)
          ENDIF
          IF(I .eq.(NY +(-1))) THEN
            PT%v = X(NX+K)%v
            PTT%v = 0.0D00
            CALL setderiv(OpenAD_Symbol_175,X(NX+K))
            CALL setderiv(PT,OpenAD_Symbol_175)
            CALL zero_deriv(PTT)
          ELSE
            IF(NY .eq. I) THEN
              PT%v = 0.0D00
              PTT%v = (X(K)%v+HY*2.0D00)
              OpenAD_Symbol_62 = 1_w2f__i8
              OpenAD_Symbol_219 = OpenAD_Symbol_62
              CALL setderiv(OpenAD_Symbol_220,X(K))
              CALL zero_deriv(PT)
              CALL sax(OpenAD_Symbol_219,OpenAD_Symbol_220,PTT)
            ELSE
              PT%v = X(NX+K)%v
              PTT%v = X(K+NX*2)%v
              CALL setderiv(OpenAD_Symbol_222,X(K+NX*2))
              CALL setderiv(OpenAD_Symbol_221,X(NX+K))
              CALL setderiv(PT,OpenAD_Symbol_221)
              CALL setderiv(PTT,OpenAD_Symbol_222)
            ENDIF
          ENDIF
          IF((NX .eq. J) .OR.(NY .eq. I)) THEN
            PTR%v = 0.0D00
            CALL zero_deriv(PTR)
          ELSE
            PTR%v = X(NX+K+1)%v
            CALL setderiv(OpenAD_Symbol_218,X(NX+K+1))
            CALL setderiv(PTR,OpenAD_Symbol_218)
          ENDIF
          OpenAD_Symbol_4 = (PT%v-PB%v)
          OpenAD_Symbol_5 = (HY * 2.0D00)
          DPDY%v = (OpenAD_Symbol_4/OpenAD_Symbol_5)
          OpenAD_Symbol_8 = 1_w2f__i8
          OpenAD_Symbol_9 = (-1_w2f__i8)
          OpenAD_Symbol_6 = (INT(1_w2f__i8) / OpenAD_Symbol_5)
          OpenAD_Symbol_10 = (PR%v-PL%v)
          OpenAD_Symbol_11 = (HX * 2.0D00)
          DPDX%v = (OpenAD_Symbol_10/OpenAD_Symbol_11)
          OpenAD_Symbol_14 = 1_w2f__i8
          OpenAD_Symbol_15 = (-1_w2f__i8)
          OpenAD_Symbol_12 = (INT(1_w2f__i8) / OpenAD_Symbol_11)
          OpenAD_Symbol_176 = (OpenAD_Symbol_8 * OpenAD_Symbol_6)
          OpenAD_Symbol_178 = (OpenAD_Symbol_9 * OpenAD_Symbol_6)
          OpenAD_Symbol_180 = (OpenAD_Symbol_14 * OpenAD_Symbol_12)
          OpenAD_Symbol_182 = (OpenAD_Symbol_15 * OpenAD_Symbol_12)
          CALL setderiv(OpenAD_Symbol_183,PL)
          CALL setderiv(OpenAD_Symbol_181,PR)
          CALL setderiv(OpenAD_Symbol_179,PB)
          CALL setderiv(OpenAD_Symbol_177,PT)
          CALL sax(OpenAD_Symbol_176,OpenAD_Symbol_177,DPDY)
          CALL saxpy(OpenAD_Symbol_178,OpenAD_Symbol_179,DPDY)
          CALL sax(OpenAD_Symbol_180,OpenAD_Symbol_181,DPDX)
          CALL saxpy(OpenAD_Symbol_182,OpenAD_Symbol_183,DPDX)
          CALL bar(PBB,PBL,PB,PBR,PLL,PL,P,PR,PRR,PTL,PT,PTR,PTT,HY2,HX2
     +,PLAP,PBLAP,PLLAP,PRLAP,PTLAP)
          OpenAD_Symbol_20 = (PBLAP%v+PTLAP%v-PLAP%v*2.0D00)
          OpenAD_Symbol_29 = (PLLAP%v+PRLAP%v-PLAP%v*2.0D00)
          OpenAD_Symbol_47 = (PRLAP%v-PLLAP%v)
          OpenAD_Symbol_43 = (DPDY%v*OpenAD_Symbol_47)
          OpenAD_Symbol_44 = (HX * 2.0D00)
          OpenAD_Symbol_56 = (PTLAP%v-PBLAP%v)
          OpenAD_Symbol_52 = (DPDX%v*OpenAD_Symbol_56)
          OpenAD_Symbol_53 = (HY * 2.0D00)
          OpenAD_Symbol_38 = ((OpenAD_Symbol_43 / OpenAD_Symbol_44) -(
     > OpenAD_Symbol_52 / OpenAD_Symbol_53))
          OpenAD_Symbol_61 = ((OpenAD_Symbol_20 / HY2) +(
     > OpenAD_Symbol_29 / HX2) - R * OpenAD_Symbol_38)
          OpenAD_Symbol_23 = 1_w2f__i8
          OpenAD_Symbol_25 = 1_w2f__i8
          OpenAD_Symbol_27 = 2.0D00
          OpenAD_Symbol_26 = (-1_w2f__i8)
          OpenAD_Symbol_24 = 1_w2f__i8
          OpenAD_Symbol_21 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_18 = 1_w2f__i8
          OpenAD_Symbol_32 = 1_w2f__i8
          OpenAD_Symbol_34 = 1_w2f__i8
          OpenAD_Symbol_36 = 2.0D00
          OpenAD_Symbol_35 = (-1_w2f__i8)
          OpenAD_Symbol_33 = 1_w2f__i8
          OpenAD_Symbol_30 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_19 = 1_w2f__i8
          OpenAD_Symbol_16 = 1_w2f__i8
          OpenAD_Symbol_48 = OpenAD_Symbol_47
          OpenAD_Symbol_50 = 1_w2f__i8
          OpenAD_Symbol_51 = (-1_w2f__i8)
          OpenAD_Symbol_49 = DPDY%v
          OpenAD_Symbol_45 = (INT(1_w2f__i8) / OpenAD_Symbol_44)
          OpenAD_Symbol_41 = 1_w2f__i8
          OpenAD_Symbol_57 = OpenAD_Symbol_56
          OpenAD_Symbol_59 = 1_w2f__i8
          OpenAD_Symbol_60 = (-1_w2f__i8)
          OpenAD_Symbol_58 = DPDX%v
          OpenAD_Symbol_54 = (INT(1_w2f__i8) / OpenAD_Symbol_53)
          OpenAD_Symbol_42 = (-1_w2f__i8)
          OpenAD_Symbol_40 = R
          OpenAD_Symbol_17 = (-1_w2f__i8)
          FVEC(INT(K))%v = OpenAD_Symbol_61
          OpenAD_Symbol_184 = (OpenAD_Symbol_18 * OpenAD_Symbol_16)
          OpenAD_Symbol_185 = (OpenAD_Symbol_19 * OpenAD_Symbol_16)
          OpenAD_Symbol_186 = (OpenAD_Symbol_40 * OpenAD_Symbol_17)
          OpenAD_Symbol_187 = (OpenAD_Symbol_41 * OpenAD_Symbol_186)
          OpenAD_Symbol_188 = (OpenAD_Symbol_42 * OpenAD_Symbol_186)
          OpenAD_Symbol_189 = (OpenAD_Symbol_30 * OpenAD_Symbol_185)
          OpenAD_Symbol_190 = (OpenAD_Symbol_32 * OpenAD_Symbol_189)
          OpenAD_Symbol_192 = (OpenAD_Symbol_33 * OpenAD_Symbol_189)
          OpenAD_Symbol_193 = (OpenAD_Symbol_34 * OpenAD_Symbol_192)
          OpenAD_Symbol_195 = (OpenAD_Symbol_35 * OpenAD_Symbol_192)
          OpenAD_Symbol_196 = (OpenAD_Symbol_21 * OpenAD_Symbol_184)
          OpenAD_Symbol_197 = (OpenAD_Symbol_23 * OpenAD_Symbol_196)
          OpenAD_Symbol_199 = (OpenAD_Symbol_24 * OpenAD_Symbol_196)
          OpenAD_Symbol_200 = (OpenAD_Symbol_25 * OpenAD_Symbol_199)
          OpenAD_Symbol_202 = (OpenAD_Symbol_26 * OpenAD_Symbol_199)
          OpenAD_Symbol_203 = (OpenAD_Symbol_54 * OpenAD_Symbol_188)
          OpenAD_Symbol_204 = (OpenAD_Symbol_57 * OpenAD_Symbol_203)
          OpenAD_Symbol_206 = (OpenAD_Symbol_58 * OpenAD_Symbol_203)
          OpenAD_Symbol_207 = (OpenAD_Symbol_59 * OpenAD_Symbol_206)
          OpenAD_Symbol_208 = (OpenAD_Symbol_60 * OpenAD_Symbol_206)
          OpenAD_Symbol_209 = (OpenAD_Symbol_45 * OpenAD_Symbol_187)
          OpenAD_Symbol_210 = (OpenAD_Symbol_48 * OpenAD_Symbol_209)
          OpenAD_Symbol_212 = (OpenAD_Symbol_49 * OpenAD_Symbol_209)
          OpenAD_Symbol_213 = (OpenAD_Symbol_50 * OpenAD_Symbol_212)
          OpenAD_Symbol_214 = (OpenAD_Symbol_51 * OpenAD_Symbol_212)
          OpenAD_Symbol_215 = (OpenAD_Symbol_36 * OpenAD_Symbol_195)
          OpenAD_Symbol_217 = (OpenAD_Symbol_27 * OpenAD_Symbol_202)
          CALL setderiv(OpenAD_Symbol_216,PLAP)
          CALL setderiv(OpenAD_Symbol_211,DPDY)
          CALL setderiv(OpenAD_Symbol_205,DPDX)
          CALL setderiv(OpenAD_Symbol_201,PTLAP)
          CALL setderiv(OpenAD_Symbol_198,PBLAP)
          CALL setderiv(OpenAD_Symbol_194,PRLAP)
          CALL setderiv(OpenAD_Symbol_191,PLLAP)
          CALL sax(OpenAD_Symbol_190,OpenAD_Symbol_191,FVEC(K))
          CALL saxpy(OpenAD_Symbol_193,OpenAD_Symbol_194,FVEC(K))
          CALL saxpy(OpenAD_Symbol_197,OpenAD_Symbol_198,FVEC(K))
          CALL saxpy(OpenAD_Symbol_200,OpenAD_Symbol_201,FVEC(K))
          CALL saxpy(OpenAD_Symbol_204,OpenAD_Symbol_205,FVEC(K))
          CALL saxpy(OpenAD_Symbol_207,OpenAD_Symbol_201,FVEC(K))
          CALL saxpy(OpenAD_Symbol_208,OpenAD_Symbol_198,FVEC(K))
          CALL saxpy(OpenAD_Symbol_210,OpenAD_Symbol_211,FVEC(K))
          CALL saxpy(OpenAD_Symbol_213,OpenAD_Symbol_194,FVEC(K))
          CALL saxpy(OpenAD_Symbol_214,OpenAD_Symbol_191,FVEC(K))
          CALL saxpy(OpenAD_Symbol_215,OpenAD_Symbol_216,FVEC(K))
          CALL saxpy(OpenAD_Symbol_217,OpenAD_Symbol_216,FVEC(K))
        END DO
      END DO
      END SUBROUTINE

      SUBROUTINE bar(PBB, PBL, PB, PBR, PLL, PL, P, PR, PRR, PTL, PT,
     >  PTR, PTT, HY2, HX2, PLAP, PBLAP, PLLAP, PRLAP, PTLAP)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_100
      REAL(w2f__8) OpenAD_Symbol_101
      REAL(w2f__8) OpenAD_Symbol_102
      REAL(w2f__8) OpenAD_Symbol_103
      REAL(w2f__8) OpenAD_Symbol_105
      REAL(w2f__8) OpenAD_Symbol_106
      REAL(w2f__8) OpenAD_Symbol_107
      REAL(w2f__8) OpenAD_Symbol_108
      REAL(w2f__8) OpenAD_Symbol_109
      REAL(w2f__8) OpenAD_Symbol_111
      REAL(w2f__8) OpenAD_Symbol_112
      REAL(w2f__8) OpenAD_Symbol_113
      REAL(w2f__8) OpenAD_Symbol_114
      REAL(w2f__8) OpenAD_Symbol_115
      REAL(w2f__8) OpenAD_Symbol_117
      REAL(w2f__8) OpenAD_Symbol_118
      REAL(w2f__8) OpenAD_Symbol_120
      REAL(w2f__8) OpenAD_Symbol_121
      REAL(w2f__8) OpenAD_Symbol_122
      REAL(w2f__8) OpenAD_Symbol_123
      REAL(w2f__8) OpenAD_Symbol_124
      REAL(w2f__8) OpenAD_Symbol_126
      REAL(w2f__8) OpenAD_Symbol_127
      REAL(w2f__8) OpenAD_Symbol_128
      REAL(w2f__8) OpenAD_Symbol_129
      REAL(w2f__8) OpenAD_Symbol_130
      REAL(w2f__8) OpenAD_Symbol_132
      REAL(w2f__8) OpenAD_Symbol_133
      REAL(w2f__8) OpenAD_Symbol_134
      REAL(w2f__8) OpenAD_Symbol_135
      REAL(w2f__8) OpenAD_Symbol_136
      REAL(w2f__8) OpenAD_Symbol_138
      REAL(w2f__8) OpenAD_Symbol_139
      REAL(w2f__8) OpenAD_Symbol_141
      REAL(w2f__8) OpenAD_Symbol_142
      REAL(w2f__8) OpenAD_Symbol_143
      REAL(w2f__8) OpenAD_Symbol_144
      REAL(w2f__8) OpenAD_Symbol_145
      REAL(w2f__8) OpenAD_Symbol_147
      REAL(w2f__8) OpenAD_Symbol_148
      REAL(w2f__8) OpenAD_Symbol_149
      REAL(w2f__8) OpenAD_Symbol_150
      REAL(w2f__8) OpenAD_Symbol_151
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
      REAL(w2f__8) OpenAD_Symbol_168
      REAL(w2f__8) OpenAD_Symbol_235
      REAL(w2f__8) OpenAD_Symbol_236
      type(active) :: OpenAD_Symbol_237
      REAL(w2f__8) OpenAD_Symbol_238
      REAL(w2f__8) OpenAD_Symbol_239
      type(active) :: OpenAD_Symbol_240
      REAL(w2f__8) OpenAD_Symbol_241
      REAL(w2f__8) OpenAD_Symbol_242
      REAL(w2f__8) OpenAD_Symbol_243
      type(active) :: OpenAD_Symbol_244
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
      type(active) :: OpenAD_Symbol_257
      REAL(w2f__8) OpenAD_Symbol_258
      REAL(w2f__8) OpenAD_Symbol_259
      REAL(w2f__8) OpenAD_Symbol_260
      REAL(w2f__8) OpenAD_Symbol_261
      REAL(w2f__8) OpenAD_Symbol_262
      type(active) :: OpenAD_Symbol_263
      REAL(w2f__8) OpenAD_Symbol_264
      REAL(w2f__8) OpenAD_Symbol_265
      type(active) :: OpenAD_Symbol_266
      REAL(w2f__8) OpenAD_Symbol_267
      REAL(w2f__8) OpenAD_Symbol_268
      REAL(w2f__8) OpenAD_Symbol_269
      type(active) :: OpenAD_Symbol_270
      REAL(w2f__8) OpenAD_Symbol_271
      REAL(w2f__8) OpenAD_Symbol_272
      type(active) :: OpenAD_Symbol_273
      REAL(w2f__8) OpenAD_Symbol_274
      REAL(w2f__8) OpenAD_Symbol_275
      REAL(w2f__8) OpenAD_Symbol_276
      type(active) :: OpenAD_Symbol_277
      REAL(w2f__8) OpenAD_Symbol_278
      REAL(w2f__8) OpenAD_Symbol_279
      REAL(w2f__8) OpenAD_Symbol_280
      REAL(w2f__8) OpenAD_Symbol_281
      REAL(w2f__8) OpenAD_Symbol_282
      type(active) :: OpenAD_Symbol_283
      REAL(w2f__8) OpenAD_Symbol_284
      REAL(w2f__8) OpenAD_Symbol_285
      REAL(w2f__8) OpenAD_Symbol_286
      REAL(w2f__8) OpenAD_Symbol_287
      REAL(w2f__8) OpenAD_Symbol_288
      REAL(w2f__8) OpenAD_Symbol_289
      REAL(w2f__8) OpenAD_Symbol_290
      REAL(w2f__8) OpenAD_Symbol_291
      REAL(w2f__8) OpenAD_Symbol_292
      REAL(w2f__8) OpenAD_Symbol_293
      type(active) :: OpenAD_Symbol_294
      REAL(w2f__8) OpenAD_Symbol_295
      REAL(w2f__8) OpenAD_Symbol_296
      REAL(w2f__8) OpenAD_Symbol_297
      REAL(w2f__8) OpenAD_Symbol_298
      REAL(w2f__8) OpenAD_Symbol_299
      REAL(w2f__8) OpenAD_Symbol_300
      REAL(w2f__8) OpenAD_Symbol_301
      REAL(w2f__8) OpenAD_Symbol_302
      REAL(w2f__8) OpenAD_Symbol_303
      REAL(w2f__8) OpenAD_Symbol_304
      REAL(w2f__8) OpenAD_Symbol_305
      REAL(w2f__8) OpenAD_Symbol_306
      REAL(w2f__8) OpenAD_Symbol_307
      REAL(w2f__8) OpenAD_Symbol_64
      REAL(w2f__8) OpenAD_Symbol_65
      REAL(w2f__8) OpenAD_Symbol_66
      REAL(w2f__8) OpenAD_Symbol_67
      REAL(w2f__8) OpenAD_Symbol_69
      REAL(w2f__8) OpenAD_Symbol_70
      REAL(w2f__8) OpenAD_Symbol_71
      REAL(w2f__8) OpenAD_Symbol_72
      REAL(w2f__8) OpenAD_Symbol_73
      REAL(w2f__8) OpenAD_Symbol_75
      REAL(w2f__8) OpenAD_Symbol_76
      REAL(w2f__8) OpenAD_Symbol_78
      REAL(w2f__8) OpenAD_Symbol_79
      REAL(w2f__8) OpenAD_Symbol_80
      REAL(w2f__8) OpenAD_Symbol_81
      REAL(w2f__8) OpenAD_Symbol_82
      REAL(w2f__8) OpenAD_Symbol_84
      REAL(w2f__8) OpenAD_Symbol_85
      REAL(w2f__8) OpenAD_Symbol_86
      REAL(w2f__8) OpenAD_Symbol_87
      REAL(w2f__8) OpenAD_Symbol_88
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_91
      REAL(w2f__8) OpenAD_Symbol_92
      REAL(w2f__8) OpenAD_Symbol_93
      REAL(w2f__8) OpenAD_Symbol_94
      REAL(w2f__8) OpenAD_Symbol_96
      REAL(w2f__8) OpenAD_Symbol_97
      REAL(w2f__8) OpenAD_Symbol_99
C
C     **** Parameters and Result ****
C
      type(active) :: PBB
      type(active) :: PBL
      type(active) :: PB
      type(active) :: PBR
      type(active) :: PLL
      type(active) :: PL
      type(active) :: P
      type(active) :: PR
      type(active) :: PRR
      type(active) :: PTL
      type(active) :: PT
      type(active) :: PTR
      type(active) :: PTT
      REAL(w2f__8) HY2
      REAL(w2f__8) HX2
      type(active) :: PLAP
      type(active) :: PBLAP
      type(active) :: PLLAP
      type(active) :: PRLAP
      type(active) :: PTLAP
C
C     **** Local Variables and Functions ****
C
      REAL(w2f__8) FOUR
      PARAMETER ( FOUR = 4.0D00)
      REAL(w2f__8) ONE
      PARAMETER ( ONE = 1.0D00)
      REAL(w2f__8) THREE
      PARAMETER ( THREE = 3.0D00)
      REAL(w2f__8) TWO
      PARAMETER ( TWO = 2.0D00)
      REAL(w2f__8) ZERO
      PARAMETER ( ZERO = 0.0D00)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_66 = (PBB%v+P%v-PB%v*2.0D00)
      OpenAD_Symbol_75 = (PBL%v+PBR%v-PB%v*2.0D00)
      OpenAD_Symbol_84 = ((OpenAD_Symbol_66 / HY2) +(OpenAD_Symbol_75 /
     >  HX2))
      OpenAD_Symbol_69 = 1_w2f__i8
      OpenAD_Symbol_71 = 1_w2f__i8
      OpenAD_Symbol_73 = 2.0D00
      OpenAD_Symbol_72 = (-1_w2f__i8)
      OpenAD_Symbol_70 = 1_w2f__i8
      OpenAD_Symbol_67 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_64 = 1_w2f__i8
      OpenAD_Symbol_78 = 1_w2f__i8
      OpenAD_Symbol_80 = 1_w2f__i8
      OpenAD_Symbol_82 = 2.0D00
      OpenAD_Symbol_81 = (-1_w2f__i8)
      OpenAD_Symbol_79 = 1_w2f__i8
      OpenAD_Symbol_76 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_65 = 1_w2f__i8
      PBLAP%v = OpenAD_Symbol_84
      OpenAD_Symbol_87 = (PBL%v+PTL%v-PL%v*2.0D00)
      OpenAD_Symbol_96 = (PLL%v+P%v-PL%v*2.0D00)
      OpenAD_Symbol_105 = ((OpenAD_Symbol_87 / HY2) +(OpenAD_Symbol_96
     >  / HX2))
      OpenAD_Symbol_90 = 1_w2f__i8
      OpenAD_Symbol_92 = 1_w2f__i8
      OpenAD_Symbol_94 = 2.0D00
      OpenAD_Symbol_93 = (-1_w2f__i8)
      OpenAD_Symbol_91 = 1_w2f__i8
      OpenAD_Symbol_88 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_85 = 1_w2f__i8
      OpenAD_Symbol_99 = 1_w2f__i8
      OpenAD_Symbol_101 = 1_w2f__i8
      OpenAD_Symbol_103 = 2.0D00
      OpenAD_Symbol_102 = (-1_w2f__i8)
      OpenAD_Symbol_100 = 1_w2f__i8
      OpenAD_Symbol_97 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_86 = 1_w2f__i8
      PLLAP%v = OpenAD_Symbol_105
      OpenAD_Symbol_108 = (PB%v+PT%v-P%v*2.0D00)
      OpenAD_Symbol_117 = (PL%v+PR%v-P%v*2.0D00)
      OpenAD_Symbol_126 = ((OpenAD_Symbol_108 / HY2) +(
     > OpenAD_Symbol_117 / HX2))
      OpenAD_Symbol_111 = 1_w2f__i8
      OpenAD_Symbol_113 = 1_w2f__i8
      OpenAD_Symbol_115 = 2.0D00
      OpenAD_Symbol_114 = (-1_w2f__i8)
      OpenAD_Symbol_112 = 1_w2f__i8
      OpenAD_Symbol_109 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_106 = 1_w2f__i8
      OpenAD_Symbol_120 = 1_w2f__i8
      OpenAD_Symbol_122 = 1_w2f__i8
      OpenAD_Symbol_124 = 2.0D00
      OpenAD_Symbol_123 = (-1_w2f__i8)
      OpenAD_Symbol_121 = 1_w2f__i8
      OpenAD_Symbol_118 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_107 = 1_w2f__i8
      PLAP%v = OpenAD_Symbol_126
      OpenAD_Symbol_129 = (PBR%v+PTR%v-PR%v*2.0D00)
      OpenAD_Symbol_138 = (P%v+PRR%v-PR%v*2.0D00)
      OpenAD_Symbol_147 = ((OpenAD_Symbol_129 / HY2) +(
     > OpenAD_Symbol_138 / HX2))
      OpenAD_Symbol_132 = 1_w2f__i8
      OpenAD_Symbol_134 = 1_w2f__i8
      OpenAD_Symbol_136 = 2.0D00
      OpenAD_Symbol_135 = (-1_w2f__i8)
      OpenAD_Symbol_133 = 1_w2f__i8
      OpenAD_Symbol_130 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_127 = 1_w2f__i8
      OpenAD_Symbol_141 = 1_w2f__i8
      OpenAD_Symbol_143 = 1_w2f__i8
      OpenAD_Symbol_145 = 2.0D00
      OpenAD_Symbol_144 = (-1_w2f__i8)
      OpenAD_Symbol_142 = 1_w2f__i8
      OpenAD_Symbol_139 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_128 = 1_w2f__i8
      PRLAP%v = OpenAD_Symbol_147
      OpenAD_Symbol_150 = (P%v+PTT%v-PT%v*2.0D00)
      OpenAD_Symbol_159 = (PTL%v+PTR%v-PT%v*2.0D00)
      OpenAD_Symbol_168 = ((OpenAD_Symbol_150 / HY2) +(
     > OpenAD_Symbol_159 / HX2))
      OpenAD_Symbol_153 = 1_w2f__i8
      OpenAD_Symbol_155 = 1_w2f__i8
      OpenAD_Symbol_157 = 2.0D00
      OpenAD_Symbol_156 = (-1_w2f__i8)
      OpenAD_Symbol_154 = 1_w2f__i8
      OpenAD_Symbol_151 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_148 = 1_w2f__i8
      OpenAD_Symbol_162 = 1_w2f__i8
      OpenAD_Symbol_164 = 1_w2f__i8
      OpenAD_Symbol_166 = 2.0D00
      OpenAD_Symbol_165 = (-1_w2f__i8)
      OpenAD_Symbol_163 = 1_w2f__i8
      OpenAD_Symbol_160 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_149 = 1_w2f__i8
      PTLAP%v = OpenAD_Symbol_168
      OpenAD_Symbol_235 = (OpenAD_Symbol_160 * OpenAD_Symbol_149)
      OpenAD_Symbol_236 = (OpenAD_Symbol_162 * OpenAD_Symbol_235)
      OpenAD_Symbol_238 = (OpenAD_Symbol_163 * OpenAD_Symbol_235)
      OpenAD_Symbol_239 = (OpenAD_Symbol_164 * OpenAD_Symbol_238)
      OpenAD_Symbol_241 = (OpenAD_Symbol_165 * OpenAD_Symbol_238)
      OpenAD_Symbol_242 = (OpenAD_Symbol_151 * OpenAD_Symbol_148)
      OpenAD_Symbol_243 = (OpenAD_Symbol_153 * OpenAD_Symbol_242)
      OpenAD_Symbol_245 = (OpenAD_Symbol_154 * OpenAD_Symbol_242)
      OpenAD_Symbol_246 = (OpenAD_Symbol_155 * OpenAD_Symbol_245)
      OpenAD_Symbol_248 = (OpenAD_Symbol_156 * OpenAD_Symbol_245)
      OpenAD_Symbol_249 = (OpenAD_Symbol_139 * OpenAD_Symbol_128)
      OpenAD_Symbol_250 = (OpenAD_Symbol_141 * OpenAD_Symbol_249)
      OpenAD_Symbol_251 = (OpenAD_Symbol_142 * OpenAD_Symbol_249)
      OpenAD_Symbol_252 = (OpenAD_Symbol_143 * OpenAD_Symbol_251)
      OpenAD_Symbol_254 = (OpenAD_Symbol_144 * OpenAD_Symbol_251)
      OpenAD_Symbol_255 = (OpenAD_Symbol_130 * OpenAD_Symbol_127)
      OpenAD_Symbol_256 = (OpenAD_Symbol_132 * OpenAD_Symbol_255)
      OpenAD_Symbol_258 = (OpenAD_Symbol_133 * OpenAD_Symbol_255)
      OpenAD_Symbol_259 = (OpenAD_Symbol_134 * OpenAD_Symbol_258)
      OpenAD_Symbol_260 = (OpenAD_Symbol_135 * OpenAD_Symbol_258)
      OpenAD_Symbol_261 = (OpenAD_Symbol_118 * OpenAD_Symbol_107)
      OpenAD_Symbol_262 = (OpenAD_Symbol_120 * OpenAD_Symbol_261)
      OpenAD_Symbol_264 = (OpenAD_Symbol_121 * OpenAD_Symbol_261)
      OpenAD_Symbol_265 = (OpenAD_Symbol_122 * OpenAD_Symbol_264)
      OpenAD_Symbol_267 = (OpenAD_Symbol_123 * OpenAD_Symbol_264)
      OpenAD_Symbol_268 = (OpenAD_Symbol_109 * OpenAD_Symbol_106)
      OpenAD_Symbol_269 = (OpenAD_Symbol_111 * OpenAD_Symbol_268)
      OpenAD_Symbol_271 = (OpenAD_Symbol_112 * OpenAD_Symbol_268)
      OpenAD_Symbol_272 = (OpenAD_Symbol_113 * OpenAD_Symbol_271)
      OpenAD_Symbol_274 = (OpenAD_Symbol_114 * OpenAD_Symbol_271)
      OpenAD_Symbol_275 = (OpenAD_Symbol_97 * OpenAD_Symbol_86)
      OpenAD_Symbol_276 = (OpenAD_Symbol_99 * OpenAD_Symbol_275)
      OpenAD_Symbol_278 = (OpenAD_Symbol_100 * OpenAD_Symbol_275)
      OpenAD_Symbol_279 = (OpenAD_Symbol_101 * OpenAD_Symbol_278)
      OpenAD_Symbol_280 = (OpenAD_Symbol_102 * OpenAD_Symbol_278)
      OpenAD_Symbol_281 = (OpenAD_Symbol_88 * OpenAD_Symbol_85)
      OpenAD_Symbol_282 = (OpenAD_Symbol_90 * OpenAD_Symbol_281)
      OpenAD_Symbol_284 = (OpenAD_Symbol_91 * OpenAD_Symbol_281)
      OpenAD_Symbol_285 = (OpenAD_Symbol_92 * OpenAD_Symbol_284)
      OpenAD_Symbol_286 = (OpenAD_Symbol_93 * OpenAD_Symbol_284)
      OpenAD_Symbol_287 = (OpenAD_Symbol_76 * OpenAD_Symbol_65)
      OpenAD_Symbol_288 = (OpenAD_Symbol_78 * OpenAD_Symbol_287)
      OpenAD_Symbol_289 = (OpenAD_Symbol_79 * OpenAD_Symbol_287)
      OpenAD_Symbol_290 = (OpenAD_Symbol_80 * OpenAD_Symbol_289)
      OpenAD_Symbol_291 = (OpenAD_Symbol_81 * OpenAD_Symbol_289)
      OpenAD_Symbol_292 = (OpenAD_Symbol_67 * OpenAD_Symbol_64)
      OpenAD_Symbol_293 = (OpenAD_Symbol_69 * OpenAD_Symbol_292)
      OpenAD_Symbol_295 = (OpenAD_Symbol_70 * OpenAD_Symbol_292)
      OpenAD_Symbol_296 = (OpenAD_Symbol_71 * OpenAD_Symbol_295)
      OpenAD_Symbol_297 = (OpenAD_Symbol_72 * OpenAD_Symbol_295)
      OpenAD_Symbol_298 = (OpenAD_Symbol_166 * OpenAD_Symbol_241)
      OpenAD_Symbol_299 = (OpenAD_Symbol_157 * OpenAD_Symbol_248)
      OpenAD_Symbol_300 = (OpenAD_Symbol_145 * OpenAD_Symbol_254)
      OpenAD_Symbol_301 = (OpenAD_Symbol_136 * OpenAD_Symbol_260)
      OpenAD_Symbol_302 = (OpenAD_Symbol_124 * OpenAD_Symbol_267)
      OpenAD_Symbol_303 = (OpenAD_Symbol_115 * OpenAD_Symbol_274)
      OpenAD_Symbol_304 = (OpenAD_Symbol_103 * OpenAD_Symbol_280)
      OpenAD_Symbol_305 = (OpenAD_Symbol_94 * OpenAD_Symbol_286)
      OpenAD_Symbol_306 = (OpenAD_Symbol_82 * OpenAD_Symbol_291)
      OpenAD_Symbol_307 = (OpenAD_Symbol_73 * OpenAD_Symbol_297)
      CALL setderiv(OpenAD_Symbol_294,PBB)
      CALL setderiv(OpenAD_Symbol_283,PBL)
      CALL setderiv(OpenAD_Symbol_277,PLL)
      CALL setderiv(OpenAD_Symbol_273,PT)
      CALL setderiv(OpenAD_Symbol_270,PB)
      CALL setderiv(OpenAD_Symbol_266,PR)
      CALL setderiv(OpenAD_Symbol_263,PL)
      CALL setderiv(OpenAD_Symbol_257,PBR)
      CALL setderiv(OpenAD_Symbol_253,PRR)
      CALL setderiv(OpenAD_Symbol_247,PTT)
      CALL setderiv(OpenAD_Symbol_244,P)
      CALL setderiv(OpenAD_Symbol_240,PTR)
      CALL setderiv(OpenAD_Symbol_237,PTL)
      CALL sax(OpenAD_Symbol_236,OpenAD_Symbol_237,PTLAP)
      CALL saxpy(OpenAD_Symbol_239,OpenAD_Symbol_240,PTLAP)
      CALL saxpy(OpenAD_Symbol_243,OpenAD_Symbol_244,PTLAP)
      CALL saxpy(OpenAD_Symbol_246,OpenAD_Symbol_247,PTLAP)
      CALL sax(OpenAD_Symbol_250,OpenAD_Symbol_244,PRLAP)
      CALL saxpy(OpenAD_Symbol_252,OpenAD_Symbol_253,PRLAP)
      CALL saxpy(OpenAD_Symbol_256,OpenAD_Symbol_257,PRLAP)
      CALL saxpy(OpenAD_Symbol_259,OpenAD_Symbol_240,PRLAP)
      CALL sax(OpenAD_Symbol_262,OpenAD_Symbol_263,PLAP)
      CALL saxpy(OpenAD_Symbol_265,OpenAD_Symbol_266,PLAP)
      CALL saxpy(OpenAD_Symbol_269,OpenAD_Symbol_270,PLAP)
      CALL saxpy(OpenAD_Symbol_272,OpenAD_Symbol_273,PLAP)
      CALL sax(OpenAD_Symbol_276,OpenAD_Symbol_277,PLLAP)
      CALL saxpy(OpenAD_Symbol_279,OpenAD_Symbol_244,PLLAP)
      CALL saxpy(OpenAD_Symbol_282,OpenAD_Symbol_283,PLLAP)
      CALL saxpy(OpenAD_Symbol_285,OpenAD_Symbol_237,PLLAP)
      CALL sax(OpenAD_Symbol_288,OpenAD_Symbol_283,PBLAP)
      CALL saxpy(OpenAD_Symbol_290,OpenAD_Symbol_257,PBLAP)
      CALL saxpy(OpenAD_Symbol_293,OpenAD_Symbol_294,PBLAP)
      CALL saxpy(OpenAD_Symbol_296,OpenAD_Symbol_244,PBLAP)
      CALL saxpy(OpenAD_Symbol_298,OpenAD_Symbol_273,PTLAP)
      CALL saxpy(OpenAD_Symbol_299,OpenAD_Symbol_273,PTLAP)
      CALL saxpy(OpenAD_Symbol_300,OpenAD_Symbol_266,PRLAP)
      CALL saxpy(OpenAD_Symbol_301,OpenAD_Symbol_266,PRLAP)
      CALL saxpy(OpenAD_Symbol_302,OpenAD_Symbol_244,PLAP)
      CALL saxpy(OpenAD_Symbol_303,OpenAD_Symbol_244,PLAP)
      CALL saxpy(OpenAD_Symbol_304,OpenAD_Symbol_263,PLLAP)
      CALL saxpy(OpenAD_Symbol_305,OpenAD_Symbol_263,PLLAP)
      CALL saxpy(OpenAD_Symbol_306,OpenAD_Symbol_270,PBLAP)
      CALL saxpy(OpenAD_Symbol_307,OpenAD_Symbol_270,PBLAP)
      END SUBROUTINE
