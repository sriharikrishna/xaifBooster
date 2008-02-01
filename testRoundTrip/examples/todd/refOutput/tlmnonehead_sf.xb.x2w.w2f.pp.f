
      MODULE all_globals_mod
      use w2f__types
      use active_module
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(X, OBJ)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_22
      REAL(w2f__8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_27
      REAL(w2f__8) OpenAD_Symbol_28
      REAL(w2f__8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_31
      REAL(w2f__8) OpenAD_Symbol_32
      REAL(w2f__8) OpenAD_Symbol_33
      REAL(w2f__8) OpenAD_Symbol_34
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_36
      REAL(w2f__8) OpenAD_Symbol_37
      REAL(w2f__8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_42
      REAL(w2f__8) OpenAD_Symbol_44
      REAL(w2f__8) OpenAD_Symbol_46
      REAL(w2f__8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_50
      REAL(w2f__8) OpenAD_Symbol_51
      REAL(w2f__8) OpenAD_Symbol_52
      REAL(w2f__8) OpenAD_Symbol_53
      REAL(w2f__8) OpenAD_Symbol_54
      REAL(w2f__8) OpenAD_Symbol_55
      REAL(w2f__8) OpenAD_Symbol_56
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
      REAL(w2f__8) OpenAD_Symbol_73
      REAL(w2f__8) OpenAD_Symbol_74
      REAL(w2f__8) OpenAD_Symbol_75
      REAL(w2f__8) OpenAD_Symbol_76
      REAL(w2f__8) OpenAD_Symbol_77
      REAL(w2f__8) OpenAD_Symbol_78
      REAL(w2f__8) OpenAD_Symbol_79
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
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 6)
      type(active) :: OBJ(1 : 1)
C
C     **** Local Variables and Functions ****
C
      REAL(w2f__8) A
      REAL(w2f__8) D00
      type(active) :: D03
      REAL(w2f__8) D11
      type(active) :: D12
      type(active) :: F
      type(active) :: G
      type(active) :: LOC1
      type(active) :: M00
      type(active) :: M03
      type(active) :: M11
      type(active) :: M12
      type(active) :: M22
      type(active) :: M33
      type(active) :: MATR(0 : 3)
      REAL(w2f__8) SQRT3
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(OBJ)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      A = 5.0D-01
      SQRT3 = 5.77350258827209472656D-01
      MATR(0)%v = (X(2)%v-X(1)%v)
      OpenAD_Symbol_0 = 1_w2f__i8
      OpenAD_Symbol_1 = (-1_w2f__i8)
      OpenAD_Symbol_2 = (X(3)%v*2.0D00-X(2)%v-X(1)%v)
      MATR(1)%v = (SQRT3*OpenAD_Symbol_2)
      OpenAD_Symbol_9 = 2.0D00
      OpenAD_Symbol_7 = 1_w2f__i8
      OpenAD_Symbol_8 = (-1_w2f__i8)
      OpenAD_Symbol_5 = 1_w2f__i8
      OpenAD_Symbol_6 = (-1_w2f__i8)
      OpenAD_Symbol_4 = SQRT3
      MATR(2)%v = (X(5)%v-X(4)%v)
      OpenAD_Symbol_11 = 1_w2f__i8
      OpenAD_Symbol_12 = (-1_w2f__i8)
      OpenAD_Symbol_13 = (X(6)%v*2.0D00-X(5)%v-X(4)%v)
      MATR(3)%v = (SQRT3*OpenAD_Symbol_13)
      OpenAD_Symbol_20 = 2.0D00
      OpenAD_Symbol_18 = 1_w2f__i8
      OpenAD_Symbol_19 = (-1_w2f__i8)
      OpenAD_Symbol_16 = 1_w2f__i8
      OpenAD_Symbol_17 = (-1_w2f__i8)
      OpenAD_Symbol_15 = SQRT3
      OpenAD_Symbol_49 = (OpenAD_Symbol_16 * OpenAD_Symbol_15)
      OpenAD_Symbol_50 = (OpenAD_Symbol_17 * OpenAD_Symbol_15)
      OpenAD_Symbol_51 = (OpenAD_Symbol_5 * OpenAD_Symbol_4)
      OpenAD_Symbol_52 = (OpenAD_Symbol_6 * OpenAD_Symbol_4)
      OpenAD_Symbol_53 = (OpenAD_Symbol_18 * OpenAD_Symbol_49)
      OpenAD_Symbol_54 = (OpenAD_Symbol_19 * OpenAD_Symbol_49)
      OpenAD_Symbol_55 = (OpenAD_Symbol_7 * OpenAD_Symbol_51)
      OpenAD_Symbol_56 = (OpenAD_Symbol_8 * OpenAD_Symbol_51)
      OpenAD_Symbol_57 = (OpenAD_Symbol_20 * OpenAD_Symbol_53)
      OpenAD_Symbol_58 = (OpenAD_Symbol_9 * OpenAD_Symbol_55)
      OpenAD_Symbol_59 = OpenAD_Symbol_0
      OpenAD_Symbol_60 = OpenAD_Symbol_1
      OpenAD_Symbol_61 = OpenAD_Symbol_11
      OpenAD_Symbol_62 = OpenAD_Symbol_12
      CALL sax(OpenAD_Symbol_50,X(4),MATR(3))
      CALL sax(OpenAD_Symbol_52,X(1),MATR(1))
      CALL saxpy(OpenAD_Symbol_54,X(5),MATR(3))
      CALL saxpy(OpenAD_Symbol_56,X(2),MATR(1))
      CALL saxpy(OpenAD_Symbol_57,X(6),MATR(3))
      CALL saxpy(OpenAD_Symbol_58,X(3),MATR(1))
      CALL sax(OpenAD_Symbol_59,X(2),MATR(0))
      CALL saxpy(OpenAD_Symbol_60,X(1),MATR(0))
      CALL sax(OpenAD_Symbol_61,X(5),MATR(2))
      CALL saxpy(OpenAD_Symbol_62,X(4),MATR(2))
      M03%v = (MATR(0)%v*MATR(3)%v)
      OpenAD_Symbol_22 = MATR(3)%v
      OpenAD_Symbol_23 = MATR(0)%v
      M12%v = (MATR(1)%v*MATR(2)%v)
      OpenAD_Symbol_24 = MATR(2)%v
      OpenAD_Symbol_25 = MATR(1)%v
      G%v = (M03%v-M12%v)
      OpenAD_Symbol_26 = 1_w2f__i8
      OpenAD_Symbol_27 = (-1_w2f__i8)
      D00 = (M03%v*2.0D00)
      D11 = (M12%v*2.0D00)
      M00%v = (MATR(0)%v*MATR(0)%v)
      OpenAD_Symbol_28 = MATR(0)%v
      OpenAD_Symbol_29 = MATR(0)%v
      M11%v = (MATR(1)%v*MATR(1)%v)
      OpenAD_Symbol_30 = MATR(1)%v
      OpenAD_Symbol_31 = MATR(1)%v
      M22%v = (MATR(2)%v*MATR(2)%v)
      OpenAD_Symbol_32 = MATR(2)%v
      OpenAD_Symbol_33 = MATR(2)%v
      M33%v = (MATR(3)%v*MATR(3)%v)
      OpenAD_Symbol_34 = MATR(3)%v
      OpenAD_Symbol_35 = MATR(3)%v
      D12%v = (M00%v*M33%v)
      OpenAD_Symbol_36 = M33%v
      OpenAD_Symbol_37 = M00%v
      D03%v = (M11%v*M22%v)
      OpenAD_Symbol_38 = M22%v
      OpenAD_Symbol_39 = M11%v
      F%v = (D03%v+D12%v)
      OpenAD_Symbol_40 = 1_w2f__i8
      OpenAD_Symbol_41 = 1_w2f__i8
      OpenAD_Symbol_42 = (1.0D00/G%v)
      LOC1%v = (A*OpenAD_Symbol_42)
      OpenAD_Symbol_46 = (-(1.0D00/(G%v*G%v)))
      OpenAD_Symbol_44 = A
      OBJ(1)%v = (F%v*LOC1%v)
      OpenAD_Symbol_47 = LOC1%v
      OpenAD_Symbol_48 = F%v
      OpenAD_Symbol_63 = (OpenAD_Symbol_40 * OpenAD_Symbol_47)
      OpenAD_Symbol_64 = (OpenAD_Symbol_38 * OpenAD_Symbol_63)
      OpenAD_Symbol_65 = (OpenAD_Symbol_30 * OpenAD_Symbol_64)
      OpenAD_Symbol_66 = (OpenAD_Symbol_44 * OpenAD_Symbol_48)
      OpenAD_Symbol_67 = (OpenAD_Symbol_46 * OpenAD_Symbol_66)
      OpenAD_Symbol_68 = (OpenAD_Symbol_26 * OpenAD_Symbol_67)
      OpenAD_Symbol_69 = (OpenAD_Symbol_22 * OpenAD_Symbol_68)
      OpenAD_Symbol_70 = (OpenAD_Symbol_23 * OpenAD_Symbol_68)
      OpenAD_Symbol_71 = (OpenAD_Symbol_41 * OpenAD_Symbol_47)
      OpenAD_Symbol_72 = (OpenAD_Symbol_36 * OpenAD_Symbol_71)
      OpenAD_Symbol_73 = (OpenAD_Symbol_28 * OpenAD_Symbol_72)
      OpenAD_Symbol_74 = (OpenAD_Symbol_39 * OpenAD_Symbol_63)
      OpenAD_Symbol_75 = (OpenAD_Symbol_32 * OpenAD_Symbol_74)
      OpenAD_Symbol_76 = (OpenAD_Symbol_37 * OpenAD_Symbol_71)
      OpenAD_Symbol_77 = (OpenAD_Symbol_34 * OpenAD_Symbol_76)
      OpenAD_Symbol_78 = (OpenAD_Symbol_35 * OpenAD_Symbol_76)
      OpenAD_Symbol_79 = (OpenAD_Symbol_33 * OpenAD_Symbol_74)
      OpenAD_Symbol_80 = (OpenAD_Symbol_31 * OpenAD_Symbol_64)
      OpenAD_Symbol_81 = (OpenAD_Symbol_29 * OpenAD_Symbol_72)
      OpenAD_Symbol_82 = (OpenAD_Symbol_27 * OpenAD_Symbol_67)
      OpenAD_Symbol_83 = (OpenAD_Symbol_24 * OpenAD_Symbol_82)
      OpenAD_Symbol_84 = (OpenAD_Symbol_25 * OpenAD_Symbol_82)
      OpenAD_Symbol_85 = OpenAD_Symbol_22
      OpenAD_Symbol_86 = OpenAD_Symbol_23
      OpenAD_Symbol_87 = OpenAD_Symbol_24
      OpenAD_Symbol_88 = OpenAD_Symbol_25
      CALL sax(OpenAD_Symbol_65,MATR(1),OBJ(1))
      CALL saxpy(OpenAD_Symbol_69,MATR(0),OBJ(1))
      CALL saxpy(OpenAD_Symbol_70,MATR(3),OBJ(1))
      CALL saxpy(OpenAD_Symbol_73,MATR(0),OBJ(1))
      CALL saxpy(OpenAD_Symbol_75,MATR(2),OBJ(1))
      CALL saxpy(OpenAD_Symbol_77,MATR(3),OBJ(1))
      CALL saxpy(OpenAD_Symbol_78,MATR(3),OBJ(1))
      CALL saxpy(OpenAD_Symbol_79,MATR(2),OBJ(1))
      CALL saxpy(OpenAD_Symbol_80,MATR(1),OBJ(1))
      CALL saxpy(OpenAD_Symbol_81,MATR(0),OBJ(1))
      CALL saxpy(OpenAD_Symbol_83,MATR(1),OBJ(1))
      CALL saxpy(OpenAD_Symbol_84,MATR(2),OBJ(1))
      CALL sax(OpenAD_Symbol_85,MATR(0),M03)
      CALL saxpy(OpenAD_Symbol_86,MATR(3),M03)
      CALL sax(OpenAD_Symbol_87,MATR(1),M12)
      CALL saxpy(OpenAD_Symbol_88,MATR(2),M12)
      END SUBROUTINE
