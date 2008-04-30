

      SUBROUTINE head(NX, NY, X, FVEC, R)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      type(active) :: OpenAD_Symbol_163
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
        CALL setderiv(OpenAD_Symbol_163,FVEC(K))
        CALL sax(OpenAD_Symbol_1,OpenAD_Symbol_163,FVEC(K))
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
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
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
            CALL zero_deriv(PB)
            CALL setderiv(PBB,X(K))
          ELSE
            IF(I .eq. 2) THEN
              PB%v = X(K-NX)%v
              PBB%v = 0.0D00
              CALL zero_deriv(PBB)
              CALL setderiv(PB,X(K-NX))
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
            CALL zero_deriv(PL)
            CALL setderiv(PLL,X(K))
          ELSE
            IF(J .eq. 2) THEN
              PL%v = X(K+(-1))%v
              PLL%v = 0.0D00
              CALL zero_deriv(PLL)
              CALL setderiv(PL,X(K+(-1)))
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
            CALL zero_deriv(PRR)
            CALL setderiv(PR,X(K+1))
          ELSE
            IF(NX .eq. J) THEN
              PR%v = 0.0D00
              PRR%v = X(K)%v
              CALL zero_deriv(PR)
              CALL setderiv(PRR,X(K))
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
            CALL zero_deriv(PTT)
            CALL setderiv(PT,X(NX+K))
          ELSE
            IF(NY .eq. I) THEN
              PT%v = 0.0D00
              PTT%v = (X(K)%v+HY*2.0D00)
              OpenAD_Symbol_61 = 1_w2f__i8
              CALL zero_deriv(PT)
              CALL setderiv(PTT,X(K))
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
          OpenAD_Symbol_164 = (INT((-1_w2f__i8)) * OpenAD_Symbol_6)
          OpenAD_Symbol_165 = (INT((-1_w2f__i8)) * OpenAD_Symbol_12)
          CALL sax(OpenAD_Symbol_6,PT,DPDY)
          CALL saxpy(OpenAD_Symbol_164,PB,DPDY)
          CALL sax(OpenAD_Symbol_12,PR,DPDX)
          CALL saxpy(OpenAD_Symbol_165,PL,DPDX)
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
          OpenAD_Symbol_166 = (OpenAD_Symbol_40 * INT((-1_w2f__i8)))
          OpenAD_Symbol_167 = (OpenAD_Symbol_54 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_166)
          OpenAD_Symbol_168 = (OpenAD_Symbol_57 * OpenAD_Symbol_167)
          OpenAD_Symbol_169 = (OpenAD_Symbol_58 * OpenAD_Symbol_167)
          OpenAD_Symbol_170 = (INT((-1_w2f__i8)) * OpenAD_Symbol_169)
          OpenAD_Symbol_171 = (OpenAD_Symbol_45 * OpenAD_Symbol_166)
          OpenAD_Symbol_172 = (OpenAD_Symbol_48 * OpenAD_Symbol_171)
          OpenAD_Symbol_173 = (OpenAD_Symbol_49 * OpenAD_Symbol_171)
          OpenAD_Symbol_174 = (INT((-1_w2f__i8)) * OpenAD_Symbol_173)
          OpenAD_Symbol_175 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_30)
          OpenAD_Symbol_176 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_21)
          CALL sax(OpenAD_Symbol_30,PLLAP,FVEC(K))
          CALL saxpy(OpenAD_Symbol_30,PRLAP,FVEC(K))
          CALL saxpy(OpenAD_Symbol_21,PBLAP,FVEC(K))
          CALL saxpy(OpenAD_Symbol_21,PTLAP,FVEC(K))
          CALL saxpy(OpenAD_Symbol_168,DPDX,FVEC(K))
          CALL saxpy(OpenAD_Symbol_169,PTLAP,FVEC(K))
          CALL saxpy(OpenAD_Symbol_170,PBLAP,FVEC(K))
          CALL saxpy(OpenAD_Symbol_172,DPDY,FVEC(K))
          CALL saxpy(OpenAD_Symbol_173,PRLAP,FVEC(K))
          CALL saxpy(OpenAD_Symbol_174,PLLAP,FVEC(K))
          CALL saxpy(OpenAD_Symbol_175,PLAP,FVEC(K))
          CALL saxpy(OpenAD_Symbol_176,PLAP,FVEC(K))
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
      REAL(w2f__8) OpenAD_Symbol_177
      REAL(w2f__8) OpenAD_Symbol_178
      REAL(w2f__8) OpenAD_Symbol_179
      REAL(w2f__8) OpenAD_Symbol_180
      REAL(w2f__8) OpenAD_Symbol_181
      REAL(w2f__8) OpenAD_Symbol_182
      REAL(w2f__8) OpenAD_Symbol_183
      REAL(w2f__8) OpenAD_Symbol_184
      REAL(w2f__8) OpenAD_Symbol_185
      REAL(w2f__8) OpenAD_Symbol_186
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
      OpenAD_Symbol_177 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_155)
      OpenAD_Symbol_178 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_146)
      OpenAD_Symbol_179 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_135)
      OpenAD_Symbol_180 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_126)
      OpenAD_Symbol_181 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_115)
      OpenAD_Symbol_182 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_106)
      OpenAD_Symbol_183 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_95)
      OpenAD_Symbol_184 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_86)
      OpenAD_Symbol_185 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_75)
      OpenAD_Symbol_186 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_66)
      CALL sax(OpenAD_Symbol_75,PBL,PBLAP)
      CALL saxpy(OpenAD_Symbol_75,PBR,PBLAP)
      CALL saxpy(OpenAD_Symbol_66,PBB,PBLAP)
      CALL saxpy(OpenAD_Symbol_66,P,PBLAP)
      CALL saxpy(OpenAD_Symbol_185,PB,PBLAP)
      CALL saxpy(OpenAD_Symbol_186,PB,PBLAP)
      CALL sax(OpenAD_Symbol_95,PLL,PLLAP)
      CALL saxpy(OpenAD_Symbol_95,P,PLLAP)
      CALL saxpy(OpenAD_Symbol_86,PBL,PLLAP)
      CALL saxpy(OpenAD_Symbol_86,PTL,PLLAP)
      CALL saxpy(OpenAD_Symbol_183,PL,PLLAP)
      CALL saxpy(OpenAD_Symbol_184,PL,PLLAP)
      CALL sax(OpenAD_Symbol_115,PL,PLAP)
      CALL saxpy(OpenAD_Symbol_115,PR,PLAP)
      CALL saxpy(OpenAD_Symbol_106,PB,PLAP)
      CALL saxpy(OpenAD_Symbol_106,PT,PLAP)
      CALL saxpy(OpenAD_Symbol_181,P,PLAP)
      CALL saxpy(OpenAD_Symbol_182,P,PLAP)
      CALL sax(OpenAD_Symbol_135,P,PRLAP)
      CALL saxpy(OpenAD_Symbol_135,PRR,PRLAP)
      CALL saxpy(OpenAD_Symbol_126,PBR,PRLAP)
      CALL saxpy(OpenAD_Symbol_126,PTR,PRLAP)
      CALL saxpy(OpenAD_Symbol_179,PR,PRLAP)
      CALL saxpy(OpenAD_Symbol_180,PR,PRLAP)
      CALL sax(OpenAD_Symbol_155,PTL,PTLAP)
      CALL saxpy(OpenAD_Symbol_155,PTR,PTLAP)
      CALL saxpy(OpenAD_Symbol_146,P,PTLAP)
      CALL saxpy(OpenAD_Symbol_146,PTT,PTLAP)
      CALL saxpy(OpenAD_Symbol_177,PT,PTLAP)
      CALL saxpy(OpenAD_Symbol_178,PT,PTLAP)
      END SUBROUTINE
