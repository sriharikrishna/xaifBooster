
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
      REAL(w2f__8) OpenAD_Symbol_163
      type(active) :: OpenAD_Symbol_164
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
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(FVEC)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      N = NX * NY
      NXP1 = (NX + 1)
      NYP1 = (NY + 1)
      HX = (1.0D00 / NXP1)
      HY = (1.0D00 / NYP1)
      HY2 = (HY * HY)
      HX2 = (HX * HX)
      CALL foo(NX,NY,X,FVEC,R,N,HX,HY,HY2,HX2)
      DO K = 1, N, 1
        OpenAD_Symbol_0 = (HX2 * HY2)
        OpenAD_Symbol_3 = (FVEC(K)%v*OpenAD_Symbol_0)
        OpenAD_Symbol_1 = OpenAD_Symbol_0
        FVEC(INT(K))%v = OpenAD_Symbol_3
        OpenAD_Symbol_163 = OpenAD_Symbol_1
        CALL setderiv(OpenAD_Symbol_164,FVEC(K))
        CALL sax(OpenAD_Symbol_163,OpenAD_Symbol_164,FVEC(K))
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
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_23
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
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      DO I = 1, NY, 1
        DO J = 1, NX, 1
          K = J + NX *(I +(-1))
          IF((I .eq. 1) .OR.(J .eq. 1)) THEN
            PBL%v = 0.0D00
            CALL zero_deriv(PBL)
          ELSE
            PBL%v = X(K-NX+(-1))%v
            CALL setderiv(PBL,X(K-NX+(-1)))
          ENDIF
          IF(I .eq. 1) THEN
            PB%v = 0.0D00
            PBB%v = X(K)%v
            CALL setderiv(PBB,X(K))
            CALL zero_deriv(PB)
          ELSE
            IF(I .eq. 2) THEN
              PB%v = X(K-NX)%v
              PBB%v = 0.0D00
              CALL setderiv(PB,X(K-NX))
              CALL zero_deriv(PBB)
            ELSE
              PB%v = X(K-NX)%v
              PBB%v = X(K-NX*2)%v
              CALL setderiv(PB,X(K-NX))
              CALL setderiv(PBB,X(K-NX*2))
            ENDIF
          ENDIF
          IF((NX .eq. J) .OR.(I .eq. 1)) THEN
            PBR%v = 0.0D00
            CALL zero_deriv(PBR)
          ELSE
            PBR%v = X(K-NX+1)%v
            CALL setderiv(PBR,X(K-NX+1))
          ENDIF
          IF(J .eq. 1) THEN
            PL%v = 0.0D00
            PLL%v = X(K)%v
            CALL setderiv(PLL,X(K))
            CALL zero_deriv(PL)
          ELSE
            IF(J .eq. 2) THEN
              PL%v = X(K+(-1))%v
              PLL%v = 0.0D00
              CALL setderiv(PL,X(K+(-1)))
              CALL zero_deriv(PLL)
            ELSE
              PL%v = X(K+(-1))%v
              PLL%v = X(K+(-2))%v
              CALL setderiv(PL,X(K+(-1)))
              CALL setderiv(PLL,X(K+(-2)))
            ENDIF
          ENDIF
          P%v = X(K)%v
          CALL setderiv(P,X(K))
          IF(J .eq.(NX +(-1))) THEN
            PR%v = X(K+1)%v
            PRR%v = 0.0D00
            CALL setderiv(PR,X(K+1))
            CALL zero_deriv(PRR)
          ELSE
            IF(NX .eq. J) THEN
              PR%v = 0.0D00
              PRR%v = X(K)%v
              CALL setderiv(PRR,X(K))
              CALL zero_deriv(PR)
            ELSE
              PR%v = X(K+1)%v
              PRR%v = X(K+2)%v
              CALL setderiv(PR,X(K+1))
              CALL setderiv(PRR,X(K+2))
            ENDIF
          ENDIF
          IF((NY .eq. I) .OR.(J .eq. 1)) THEN
            PTL%v = 0.0D00
            CALL zero_deriv(PTL)
          ELSE
            PTL%v = X(NX+K+(-1))%v
            CALL setderiv(PTL,X(NX+K+(-1)))
          ENDIF
          IF(I .eq.(NY +(-1))) THEN
            PT%v = X(NX+K)%v
            PTT%v = 0.0D00
            CALL setderiv(PT,X(NX+K))
            CALL zero_deriv(PTT)
          ELSE
            IF(NY .eq. I) THEN
              PT%v = 0.0D00
              PTT%v = (X(K)%v+HY*2.0D00)
              OpenAD_Symbol_61 = 1_w2f__i8
              OpenAD_Symbol_196 = OpenAD_Symbol_61
              CALL zero_deriv(PT)
              CALL sax(OpenAD_Symbol_196,X(K),PTT)
            ELSE
              PT%v = X(NX+K)%v
              PTT%v = X(K+NX*2)%v
              CALL setderiv(PT,X(NX+K))
              CALL setderiv(PTT,X(K+NX*2))
            ENDIF
          ENDIF
          IF((NX .eq. J) .OR.(NY .eq. I)) THEN
            PTR%v = 0.0D00
            CALL zero_deriv(PTR)
          ELSE
            PTR%v = X(NX+K+1)%v
            CALL setderiv(PTR,X(NX+K+1))
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
          OpenAD_Symbol_165 = (OpenAD_Symbol_8 * OpenAD_Symbol_6)
          OpenAD_Symbol_166 = (OpenAD_Symbol_9 * OpenAD_Symbol_6)
          OpenAD_Symbol_167 = (OpenAD_Symbol_14 * OpenAD_Symbol_12)
          OpenAD_Symbol_168 = (OpenAD_Symbol_15 * OpenAD_Symbol_12)
          CALL sax(OpenAD_Symbol_165,PT,DPDY)
          CALL saxpy(OpenAD_Symbol_166,PB,DPDY)
          CALL sax(OpenAD_Symbol_167,PR,DPDX)
          CALL saxpy(OpenAD_Symbol_168,PL,DPDX)
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
          FVEC(INT(K))%v = ((OpenAD_Symbol_20/HY2)+(OpenAD_Symbol_29/HX2
     +)-R*OpenAD_Symbol_38)
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
          OpenAD_Symbol_169 = (OpenAD_Symbol_18 * OpenAD_Symbol_16)
          OpenAD_Symbol_170 = (OpenAD_Symbol_19 * OpenAD_Symbol_16)
          OpenAD_Symbol_171 = (OpenAD_Symbol_40 * OpenAD_Symbol_17)
          OpenAD_Symbol_172 = (OpenAD_Symbol_41 * OpenAD_Symbol_171)
          OpenAD_Symbol_173 = (OpenAD_Symbol_42 * OpenAD_Symbol_171)
          OpenAD_Symbol_174 = (OpenAD_Symbol_30 * OpenAD_Symbol_170)
          OpenAD_Symbol_175 = (OpenAD_Symbol_32 * OpenAD_Symbol_174)
          OpenAD_Symbol_176 = (OpenAD_Symbol_33 * OpenAD_Symbol_174)
          OpenAD_Symbol_177 = (OpenAD_Symbol_34 * OpenAD_Symbol_176)
          OpenAD_Symbol_178 = (OpenAD_Symbol_35 * OpenAD_Symbol_176)
          OpenAD_Symbol_179 = (OpenAD_Symbol_21 * OpenAD_Symbol_169)
          OpenAD_Symbol_180 = (OpenAD_Symbol_23 * OpenAD_Symbol_179)
          OpenAD_Symbol_181 = (OpenAD_Symbol_24 * OpenAD_Symbol_179)
          OpenAD_Symbol_182 = (OpenAD_Symbol_25 * OpenAD_Symbol_181)
          OpenAD_Symbol_183 = (OpenAD_Symbol_26 * OpenAD_Symbol_181)
          OpenAD_Symbol_184 = (OpenAD_Symbol_54 * OpenAD_Symbol_173)
          OpenAD_Symbol_185 = (OpenAD_Symbol_57 * OpenAD_Symbol_184)
          OpenAD_Symbol_186 = (OpenAD_Symbol_58 * OpenAD_Symbol_184)
          OpenAD_Symbol_187 = (OpenAD_Symbol_59 * OpenAD_Symbol_186)
          OpenAD_Symbol_188 = (OpenAD_Symbol_60 * OpenAD_Symbol_186)
          OpenAD_Symbol_189 = (OpenAD_Symbol_45 * OpenAD_Symbol_172)
          OpenAD_Symbol_190 = (OpenAD_Symbol_48 * OpenAD_Symbol_189)
          OpenAD_Symbol_191 = (OpenAD_Symbol_49 * OpenAD_Symbol_189)
          OpenAD_Symbol_192 = (OpenAD_Symbol_50 * OpenAD_Symbol_191)
          OpenAD_Symbol_193 = (OpenAD_Symbol_51 * OpenAD_Symbol_191)
          OpenAD_Symbol_194 = (OpenAD_Symbol_36 * OpenAD_Symbol_178)
          OpenAD_Symbol_195 = (OpenAD_Symbol_27 * OpenAD_Symbol_183)
          CALL sax(OpenAD_Symbol_175,PLLAP,FVEC(K))
          CALL saxpy(OpenAD_Symbol_177,PRLAP,FVEC(K))
          CALL saxpy(OpenAD_Symbol_180,PBLAP,FVEC(K))
          CALL saxpy(OpenAD_Symbol_182,PTLAP,FVEC(K))
          CALL saxpy(OpenAD_Symbol_185,DPDX,FVEC(K))
          CALL saxpy(OpenAD_Symbol_187,PTLAP,FVEC(K))
          CALL saxpy(OpenAD_Symbol_188,PBLAP,FVEC(K))
          CALL saxpy(OpenAD_Symbol_190,DPDY,FVEC(K))
          CALL saxpy(OpenAD_Symbol_192,PRLAP,FVEC(K))
          CALL saxpy(OpenAD_Symbol_193,PLLAP,FVEC(K))
          CALL saxpy(OpenAD_Symbol_194,PLAP,FVEC(K))
          CALL saxpy(OpenAD_Symbol_195,PLAP,FVEC(K))
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
      REAL(w2f__8) OpenAD_Symbol_103
      REAL(w2f__8) OpenAD_Symbol_104
      REAL(w2f__8) OpenAD_Symbol_105
      REAL(w2f__8) OpenAD_Symbol_106
      REAL(w2f__8) OpenAD_Symbol_108
      REAL(w2f__8) OpenAD_Symbol_109
      REAL(w2f__8) OpenAD_Symbol_110
      REAL(w2f__8) OpenAD_Symbol_111
      REAL(w2f__8) OpenAD_Symbol_112
      REAL(w2f__8) OpenAD_Symbol_114
      REAL(w2f__8) OpenAD_Symbol_115
      REAL(w2f__8) OpenAD_Symbol_117
      REAL(w2f__8) OpenAD_Symbol_118
      REAL(w2f__8) OpenAD_Symbol_119
      REAL(w2f__8) OpenAD_Symbol_120
      REAL(w2f__8) OpenAD_Symbol_121
      REAL(w2f__8) OpenAD_Symbol_123
      REAL(w2f__8) OpenAD_Symbol_124
      REAL(w2f__8) OpenAD_Symbol_125
      REAL(w2f__8) OpenAD_Symbol_126
      REAL(w2f__8) OpenAD_Symbol_128
      REAL(w2f__8) OpenAD_Symbol_129
      REAL(w2f__8) OpenAD_Symbol_130
      REAL(w2f__8) OpenAD_Symbol_131
      REAL(w2f__8) OpenAD_Symbol_132
      REAL(w2f__8) OpenAD_Symbol_134
      REAL(w2f__8) OpenAD_Symbol_135
      REAL(w2f__8) OpenAD_Symbol_137
      REAL(w2f__8) OpenAD_Symbol_138
      REAL(w2f__8) OpenAD_Symbol_139
      REAL(w2f__8) OpenAD_Symbol_140
      REAL(w2f__8) OpenAD_Symbol_141
      REAL(w2f__8) OpenAD_Symbol_143
      REAL(w2f__8) OpenAD_Symbol_144
      REAL(w2f__8) OpenAD_Symbol_145
      REAL(w2f__8) OpenAD_Symbol_146
      REAL(w2f__8) OpenAD_Symbol_148
      REAL(w2f__8) OpenAD_Symbol_149
      REAL(w2f__8) OpenAD_Symbol_150
      REAL(w2f__8) OpenAD_Symbol_151
      REAL(w2f__8) OpenAD_Symbol_152
      REAL(w2f__8) OpenAD_Symbol_154
      REAL(w2f__8) OpenAD_Symbol_155
      REAL(w2f__8) OpenAD_Symbol_157
      REAL(w2f__8) OpenAD_Symbol_158
      REAL(w2f__8) OpenAD_Symbol_159
      REAL(w2f__8) OpenAD_Symbol_160
      REAL(w2f__8) OpenAD_Symbol_161
      REAL(w2f__8) OpenAD_Symbol_197
      REAL(w2f__8) OpenAD_Symbol_198
      REAL(w2f__8) OpenAD_Symbol_199
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
      REAL(w2f__8) OpenAD_Symbol_63
      REAL(w2f__8) OpenAD_Symbol_64
      REAL(w2f__8) OpenAD_Symbol_65
      REAL(w2f__8) OpenAD_Symbol_66
      REAL(w2f__8) OpenAD_Symbol_68
      REAL(w2f__8) OpenAD_Symbol_69
      REAL(w2f__8) OpenAD_Symbol_70
      REAL(w2f__8) OpenAD_Symbol_71
      REAL(w2f__8) OpenAD_Symbol_72
      REAL(w2f__8) OpenAD_Symbol_74
      REAL(w2f__8) OpenAD_Symbol_75
      REAL(w2f__8) OpenAD_Symbol_77
      REAL(w2f__8) OpenAD_Symbol_78
      REAL(w2f__8) OpenAD_Symbol_79
      REAL(w2f__8) OpenAD_Symbol_80
      REAL(w2f__8) OpenAD_Symbol_81
      REAL(w2f__8) OpenAD_Symbol_83
      REAL(w2f__8) OpenAD_Symbol_84
      REAL(w2f__8) OpenAD_Symbol_85
      REAL(w2f__8) OpenAD_Symbol_86
      REAL(w2f__8) OpenAD_Symbol_88
      REAL(w2f__8) OpenAD_Symbol_89
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_91
      REAL(w2f__8) OpenAD_Symbol_92
      REAL(w2f__8) OpenAD_Symbol_94
      REAL(w2f__8) OpenAD_Symbol_95
      REAL(w2f__8) OpenAD_Symbol_97
      REAL(w2f__8) OpenAD_Symbol_98
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
      OpenAD_Symbol_65 = (PBB%v+P%v-PB%v*2.0D00)
      OpenAD_Symbol_74 = (PBL%v+PBR%v-PB%v*2.0D00)
      PBLAP%v = ((OpenAD_Symbol_65/HY2)+(OpenAD_Symbol_74/HX2))
      OpenAD_Symbol_68 = 1_w2f__i8
      OpenAD_Symbol_70 = 1_w2f__i8
      OpenAD_Symbol_72 = 2.0D00
      OpenAD_Symbol_71 = (-1_w2f__i8)
      OpenAD_Symbol_69 = 1_w2f__i8
      OpenAD_Symbol_66 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_63 = 1_w2f__i8
      OpenAD_Symbol_77 = 1_w2f__i8
      OpenAD_Symbol_79 = 1_w2f__i8
      OpenAD_Symbol_81 = 2.0D00
      OpenAD_Symbol_80 = (-1_w2f__i8)
      OpenAD_Symbol_78 = 1_w2f__i8
      OpenAD_Symbol_75 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_64 = 1_w2f__i8
      OpenAD_Symbol_85 = (PBL%v+PTL%v-PL%v*2.0D00)
      OpenAD_Symbol_94 = (PLL%v+P%v-PL%v*2.0D00)
      PLLAP%v = ((OpenAD_Symbol_85/HY2)+(OpenAD_Symbol_94/HX2))
      OpenAD_Symbol_88 = 1_w2f__i8
      OpenAD_Symbol_90 = 1_w2f__i8
      OpenAD_Symbol_92 = 2.0D00
      OpenAD_Symbol_91 = (-1_w2f__i8)
      OpenAD_Symbol_89 = 1_w2f__i8
      OpenAD_Symbol_86 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_83 = 1_w2f__i8
      OpenAD_Symbol_97 = 1_w2f__i8
      OpenAD_Symbol_99 = 1_w2f__i8
      OpenAD_Symbol_101 = 2.0D00
      OpenAD_Symbol_100 = (-1_w2f__i8)
      OpenAD_Symbol_98 = 1_w2f__i8
      OpenAD_Symbol_95 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_84 = 1_w2f__i8
      OpenAD_Symbol_105 = (PB%v+PT%v-P%v*2.0D00)
      OpenAD_Symbol_114 = (PL%v+PR%v-P%v*2.0D00)
      PLAP%v = ((OpenAD_Symbol_105/HY2)+(OpenAD_Symbol_114/HX2))
      OpenAD_Symbol_108 = 1_w2f__i8
      OpenAD_Symbol_110 = 1_w2f__i8
      OpenAD_Symbol_112 = 2.0D00
      OpenAD_Symbol_111 = (-1_w2f__i8)
      OpenAD_Symbol_109 = 1_w2f__i8
      OpenAD_Symbol_106 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_103 = 1_w2f__i8
      OpenAD_Symbol_117 = 1_w2f__i8
      OpenAD_Symbol_119 = 1_w2f__i8
      OpenAD_Symbol_121 = 2.0D00
      OpenAD_Symbol_120 = (-1_w2f__i8)
      OpenAD_Symbol_118 = 1_w2f__i8
      OpenAD_Symbol_115 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_104 = 1_w2f__i8
      OpenAD_Symbol_125 = (PBR%v+PTR%v-PR%v*2.0D00)
      OpenAD_Symbol_134 = (P%v+PRR%v-PR%v*2.0D00)
      PRLAP%v = ((OpenAD_Symbol_125/HY2)+(OpenAD_Symbol_134/HX2))
      OpenAD_Symbol_128 = 1_w2f__i8
      OpenAD_Symbol_130 = 1_w2f__i8
      OpenAD_Symbol_132 = 2.0D00
      OpenAD_Symbol_131 = (-1_w2f__i8)
      OpenAD_Symbol_129 = 1_w2f__i8
      OpenAD_Symbol_126 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_123 = 1_w2f__i8
      OpenAD_Symbol_137 = 1_w2f__i8
      OpenAD_Symbol_139 = 1_w2f__i8
      OpenAD_Symbol_141 = 2.0D00
      OpenAD_Symbol_140 = (-1_w2f__i8)
      OpenAD_Symbol_138 = 1_w2f__i8
      OpenAD_Symbol_135 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_124 = 1_w2f__i8
      OpenAD_Symbol_145 = (P%v+PTT%v-PT%v*2.0D00)
      OpenAD_Symbol_154 = (PTL%v+PTR%v-PT%v*2.0D00)
      PTLAP%v = ((OpenAD_Symbol_145/HY2)+(OpenAD_Symbol_154/HX2))
      OpenAD_Symbol_148 = 1_w2f__i8
      OpenAD_Symbol_150 = 1_w2f__i8
      OpenAD_Symbol_152 = 2.0D00
      OpenAD_Symbol_151 = (-1_w2f__i8)
      OpenAD_Symbol_149 = 1_w2f__i8
      OpenAD_Symbol_146 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_143 = 1_w2f__i8
      OpenAD_Symbol_157 = 1_w2f__i8
      OpenAD_Symbol_159 = 1_w2f__i8
      OpenAD_Symbol_161 = 2.0D00
      OpenAD_Symbol_160 = (-1_w2f__i8)
      OpenAD_Symbol_158 = 1_w2f__i8
      OpenAD_Symbol_155 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_144 = 1_w2f__i8
      OpenAD_Symbol_197 = (OpenAD_Symbol_155 * OpenAD_Symbol_144)
      OpenAD_Symbol_198 = (OpenAD_Symbol_157 * OpenAD_Symbol_197)
      OpenAD_Symbol_199 = (OpenAD_Symbol_158 * OpenAD_Symbol_197)
      OpenAD_Symbol_200 = (OpenAD_Symbol_159 * OpenAD_Symbol_199)
      OpenAD_Symbol_201 = (OpenAD_Symbol_160 * OpenAD_Symbol_199)
      OpenAD_Symbol_202 = (OpenAD_Symbol_146 * OpenAD_Symbol_143)
      OpenAD_Symbol_203 = (OpenAD_Symbol_148 * OpenAD_Symbol_202)
      OpenAD_Symbol_204 = (OpenAD_Symbol_149 * OpenAD_Symbol_202)
      OpenAD_Symbol_205 = (OpenAD_Symbol_150 * OpenAD_Symbol_204)
      OpenAD_Symbol_206 = (OpenAD_Symbol_151 * OpenAD_Symbol_204)
      OpenAD_Symbol_207 = (OpenAD_Symbol_135 * OpenAD_Symbol_124)
      OpenAD_Symbol_208 = (OpenAD_Symbol_137 * OpenAD_Symbol_207)
      OpenAD_Symbol_209 = (OpenAD_Symbol_138 * OpenAD_Symbol_207)
      OpenAD_Symbol_210 = (OpenAD_Symbol_139 * OpenAD_Symbol_209)
      OpenAD_Symbol_211 = (OpenAD_Symbol_140 * OpenAD_Symbol_209)
      OpenAD_Symbol_212 = (OpenAD_Symbol_126 * OpenAD_Symbol_123)
      OpenAD_Symbol_213 = (OpenAD_Symbol_128 * OpenAD_Symbol_212)
      OpenAD_Symbol_214 = (OpenAD_Symbol_129 * OpenAD_Symbol_212)
      OpenAD_Symbol_215 = (OpenAD_Symbol_130 * OpenAD_Symbol_214)
      OpenAD_Symbol_216 = (OpenAD_Symbol_131 * OpenAD_Symbol_214)
      OpenAD_Symbol_217 = (OpenAD_Symbol_115 * OpenAD_Symbol_104)
      OpenAD_Symbol_218 = (OpenAD_Symbol_117 * OpenAD_Symbol_217)
      OpenAD_Symbol_219 = (OpenAD_Symbol_118 * OpenAD_Symbol_217)
      OpenAD_Symbol_220 = (OpenAD_Symbol_119 * OpenAD_Symbol_219)
      OpenAD_Symbol_221 = (OpenAD_Symbol_120 * OpenAD_Symbol_219)
      OpenAD_Symbol_222 = (OpenAD_Symbol_106 * OpenAD_Symbol_103)
      OpenAD_Symbol_223 = (OpenAD_Symbol_108 * OpenAD_Symbol_222)
      OpenAD_Symbol_224 = (OpenAD_Symbol_109 * OpenAD_Symbol_222)
      OpenAD_Symbol_225 = (OpenAD_Symbol_110 * OpenAD_Symbol_224)
      OpenAD_Symbol_226 = (OpenAD_Symbol_111 * OpenAD_Symbol_224)
      OpenAD_Symbol_227 = (OpenAD_Symbol_95 * OpenAD_Symbol_84)
      OpenAD_Symbol_228 = (OpenAD_Symbol_97 * OpenAD_Symbol_227)
      OpenAD_Symbol_229 = (OpenAD_Symbol_98 * OpenAD_Symbol_227)
      OpenAD_Symbol_230 = (OpenAD_Symbol_99 * OpenAD_Symbol_229)
      OpenAD_Symbol_231 = (OpenAD_Symbol_100 * OpenAD_Symbol_229)
      OpenAD_Symbol_232 = (OpenAD_Symbol_86 * OpenAD_Symbol_83)
      OpenAD_Symbol_233 = (OpenAD_Symbol_88 * OpenAD_Symbol_232)
      OpenAD_Symbol_234 = (OpenAD_Symbol_89 * OpenAD_Symbol_232)
      OpenAD_Symbol_235 = (OpenAD_Symbol_90 * OpenAD_Symbol_234)
      OpenAD_Symbol_236 = (OpenAD_Symbol_91 * OpenAD_Symbol_234)
      OpenAD_Symbol_237 = (OpenAD_Symbol_75 * OpenAD_Symbol_64)
      OpenAD_Symbol_238 = (OpenAD_Symbol_77 * OpenAD_Symbol_237)
      OpenAD_Symbol_239 = (OpenAD_Symbol_78 * OpenAD_Symbol_237)
      OpenAD_Symbol_240 = (OpenAD_Symbol_79 * OpenAD_Symbol_239)
      OpenAD_Symbol_241 = (OpenAD_Symbol_80 * OpenAD_Symbol_239)
      OpenAD_Symbol_242 = (OpenAD_Symbol_66 * OpenAD_Symbol_63)
      OpenAD_Symbol_243 = (OpenAD_Symbol_68 * OpenAD_Symbol_242)
      OpenAD_Symbol_244 = (OpenAD_Symbol_69 * OpenAD_Symbol_242)
      OpenAD_Symbol_245 = (OpenAD_Symbol_70 * OpenAD_Symbol_244)
      OpenAD_Symbol_246 = (OpenAD_Symbol_71 * OpenAD_Symbol_244)
      OpenAD_Symbol_247 = (OpenAD_Symbol_161 * OpenAD_Symbol_201)
      OpenAD_Symbol_248 = (OpenAD_Symbol_152 * OpenAD_Symbol_206)
      OpenAD_Symbol_249 = (OpenAD_Symbol_141 * OpenAD_Symbol_211)
      OpenAD_Symbol_250 = (OpenAD_Symbol_132 * OpenAD_Symbol_216)
      OpenAD_Symbol_251 = (OpenAD_Symbol_121 * OpenAD_Symbol_221)
      OpenAD_Symbol_252 = (OpenAD_Symbol_112 * OpenAD_Symbol_226)
      OpenAD_Symbol_253 = (OpenAD_Symbol_101 * OpenAD_Symbol_231)
      OpenAD_Symbol_254 = (OpenAD_Symbol_92 * OpenAD_Symbol_236)
      OpenAD_Symbol_255 = (OpenAD_Symbol_81 * OpenAD_Symbol_241)
      OpenAD_Symbol_256 = (OpenAD_Symbol_72 * OpenAD_Symbol_246)
      CALL sax(OpenAD_Symbol_198,PTL,PTLAP)
      CALL saxpy(OpenAD_Symbol_200,PTR,PTLAP)
      CALL saxpy(OpenAD_Symbol_203,P,PTLAP)
      CALL saxpy(OpenAD_Symbol_205,PTT,PTLAP)
      CALL sax(OpenAD_Symbol_208,P,PRLAP)
      CALL saxpy(OpenAD_Symbol_210,PRR,PRLAP)
      CALL saxpy(OpenAD_Symbol_213,PBR,PRLAP)
      CALL saxpy(OpenAD_Symbol_215,PTR,PRLAP)
      CALL sax(OpenAD_Symbol_218,PL,PLAP)
      CALL saxpy(OpenAD_Symbol_220,PR,PLAP)
      CALL saxpy(OpenAD_Symbol_223,PB,PLAP)
      CALL saxpy(OpenAD_Symbol_225,PT,PLAP)
      CALL sax(OpenAD_Symbol_228,PLL,PLLAP)
      CALL saxpy(OpenAD_Symbol_230,P,PLLAP)
      CALL saxpy(OpenAD_Symbol_233,PBL,PLLAP)
      CALL saxpy(OpenAD_Symbol_235,PTL,PLLAP)
      CALL sax(OpenAD_Symbol_238,PBL,PBLAP)
      CALL saxpy(OpenAD_Symbol_240,PBR,PBLAP)
      CALL saxpy(OpenAD_Symbol_243,PBB,PBLAP)
      CALL saxpy(OpenAD_Symbol_245,P,PBLAP)
      CALL saxpy(OpenAD_Symbol_247,PT,PTLAP)
      CALL saxpy(OpenAD_Symbol_248,PT,PTLAP)
      CALL saxpy(OpenAD_Symbol_249,PR,PRLAP)
      CALL saxpy(OpenAD_Symbol_250,PR,PRLAP)
      CALL saxpy(OpenAD_Symbol_251,P,PLAP)
      CALL saxpy(OpenAD_Symbol_252,P,PLAP)
      CALL saxpy(OpenAD_Symbol_253,PL,PLLAP)
      CALL saxpy(OpenAD_Symbol_254,PL,PLLAP)
      CALL saxpy(OpenAD_Symbol_255,PB,PBLAP)
      CALL saxpy(OpenAD_Symbol_256,PB,PBLAP)
      END SUBROUTINE
