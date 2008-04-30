
      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(X, OBJ)
      use w2f__types
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
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 6)
      TYPE (OpenADTy_active) OBJ(1 : 1)
C
C     **** Local Variables and Functions ****
C
      REAL(w2f__8) A
      REAL(w2f__8) D00
      TYPE (OpenADTy_active) D03
      REAL(w2f__8) D11
      TYPE (OpenADTy_active) D12
      TYPE (OpenADTy_active) F
      TYPE (OpenADTy_active) G
      TYPE (OpenADTy_active) LOC1
      TYPE (OpenADTy_active) M00
      TYPE (OpenADTy_active) M03
      TYPE (OpenADTy_active) M11
      TYPE (OpenADTy_active) M12
      TYPE (OpenADTy_active) M22
      TYPE (OpenADTy_active) M33
      TYPE (OpenADTy_active) MATR(0 : 3)
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
      __value__(MATR(0)) = (__value__(X(2)) - __value__(X(1)))
      OpenAD_Symbol_0 = 1_w2f__i8
      OpenAD_Symbol_1 = (-1_w2f__i8)
      CALL sax(1_w2f__i8, __deriv__(X(2)), __deriv__(MATR(0)))
      CALL saxpy(-1_w2f__i8, __deriv__(X(1)), __deriv__(MATR(0)))
      OpenAD_Symbol_2 = (__value__(X(3)) * 2.0D00 - __value__(X(2)) -
     >  __value__(X(1)))
      __value__(MATR(1)) = (SQRT3 * OpenAD_Symbol_2)
      OpenAD_Symbol_9 = 2.0D00
      OpenAD_Symbol_7 = 1_w2f__i8
      OpenAD_Symbol_8 = (-1_w2f__i8)
      OpenAD_Symbol_5 = 1_w2f__i8
      OpenAD_Symbol_6 = (-1_w2f__i8)
      OpenAD_Symbol_4 = SQRT3
      OpenAD_Symbol_49 = (INT((-1_w2f__i8)) * OpenAD_Symbol_4)
      OpenAD_Symbol_50 = (INT((-1_w2f__i8)) * OpenAD_Symbol_4)
      OpenAD_Symbol_51 = (2.0D00 * OpenAD_Symbol_4)
      CALL sax(OpenAD_Symbol_49, __deriv__(X(1)), __deriv__(MATR(1)))
      CALL saxpy(OpenAD_Symbol_50, __deriv__(X(2)), __deriv__(MATR(1)))
      CALL saxpy(OpenAD_Symbol_51, __deriv__(X(3)), __deriv__(MATR(1)))
      __value__(MATR(2)) = (__value__(X(5)) - __value__(X(4)))
      OpenAD_Symbol_11 = 1_w2f__i8
      OpenAD_Symbol_12 = (-1_w2f__i8)
      CALL sax(1_w2f__i8, __deriv__(X(5)), __deriv__(MATR(2)))
      CALL saxpy(-1_w2f__i8, __deriv__(X(4)), __deriv__(MATR(2)))
      OpenAD_Symbol_13 = (__value__(X(6)) * 2.0D00 - __value__(X(5)) -
     >  __value__(X(4)))
      __value__(MATR(3)) = (SQRT3 * OpenAD_Symbol_13)
      OpenAD_Symbol_20 = 2.0D00
      OpenAD_Symbol_18 = 1_w2f__i8
      OpenAD_Symbol_19 = (-1_w2f__i8)
      OpenAD_Symbol_16 = 1_w2f__i8
      OpenAD_Symbol_17 = (-1_w2f__i8)
      OpenAD_Symbol_15 = SQRT3
      OpenAD_Symbol_52 = (INT((-1_w2f__i8)) * OpenAD_Symbol_15)
      OpenAD_Symbol_53 = (INT((-1_w2f__i8)) * OpenAD_Symbol_15)
      OpenAD_Symbol_54 = (2.0D00 * OpenAD_Symbol_15)
      CALL sax(OpenAD_Symbol_52, __deriv__(X(4)), __deriv__(MATR(3)))
      CALL saxpy(OpenAD_Symbol_53, __deriv__(X(5)), __deriv__(MATR(3)))
      CALL saxpy(OpenAD_Symbol_54, __deriv__(X(6)), __deriv__(MATR(3)))
      __value__(M03) = (__value__(MATR(0)) * __value__(MATR(3)))
      OpenAD_Symbol_22 = __value__(MATR(3))
      OpenAD_Symbol_23 = __value__(MATR(0))
      __value__(M12) = (__value__(MATR(1)) * __value__(MATR(2)))
      OpenAD_Symbol_24 = __value__(MATR(2))
      OpenAD_Symbol_25 = __value__(MATR(1))
      __value__(G) = (__value__(M03) - __value__(M12))
      OpenAD_Symbol_26 = 1_w2f__i8
      OpenAD_Symbol_27 = (-1_w2f__i8)
      D00 = (__value__(M03) * 2.0D00)
      D11 = (__value__(M12) * 2.0D00)
      __value__(M00) = (__value__(MATR(0)) * __value__(MATR(0)))
      OpenAD_Symbol_28 = __value__(MATR(0))
      OpenAD_Symbol_29 = __value__(MATR(0))
      __value__(M11) = (__value__(MATR(1)) * __value__(MATR(1)))
      OpenAD_Symbol_30 = __value__(MATR(1))
      OpenAD_Symbol_31 = __value__(MATR(1))
      __value__(M22) = (__value__(MATR(2)) * __value__(MATR(2)))
      OpenAD_Symbol_32 = __value__(MATR(2))
      OpenAD_Symbol_33 = __value__(MATR(2))
      __value__(M33) = (__value__(MATR(3)) * __value__(MATR(3)))
      OpenAD_Symbol_34 = __value__(MATR(3))
      OpenAD_Symbol_35 = __value__(MATR(3))
      __value__(D12) = (__value__(M00) * __value__(M33))
      OpenAD_Symbol_36 = __value__(M33)
      OpenAD_Symbol_37 = __value__(M00)
      __value__(D03) = (__value__(M11) * __value__(M22))
      OpenAD_Symbol_38 = __value__(M22)
      OpenAD_Symbol_39 = __value__(M11)
      __value__(F) = (__value__(D03) + __value__(D12))
      OpenAD_Symbol_40 = 1_w2f__i8
      OpenAD_Symbol_41 = 1_w2f__i8
      OpenAD_Symbol_42 = (1.0D00 / __value__(G))
      __value__(LOC1) = (A * OpenAD_Symbol_42)
      OpenAD_Symbol_46 = (-(1.0D00 /(__value__(G) * __value__(G))))
      OpenAD_Symbol_44 = A
      __value__(OBJ(1)) = (__value__(F) * __value__(LOC1))
      OpenAD_Symbol_47 = __value__(LOC1)
      OpenAD_Symbol_48 = __value__(F)
      OpenAD_Symbol_55 = (OpenAD_Symbol_38 * OpenAD_Symbol_47)
      OpenAD_Symbol_56 = (OpenAD_Symbol_30 * OpenAD_Symbol_55)
      OpenAD_Symbol_57 = (OpenAD_Symbol_46 * OpenAD_Symbol_44 *
     >  OpenAD_Symbol_48)
      OpenAD_Symbol_58 = (OpenAD_Symbol_22 * OpenAD_Symbol_57)
      OpenAD_Symbol_59 = (OpenAD_Symbol_23 * OpenAD_Symbol_57)
      OpenAD_Symbol_60 = (OpenAD_Symbol_36 * OpenAD_Symbol_47)
      OpenAD_Symbol_61 = (OpenAD_Symbol_28 * OpenAD_Symbol_60)
      OpenAD_Symbol_62 = (OpenAD_Symbol_39 * OpenAD_Symbol_47)
      OpenAD_Symbol_63 = (OpenAD_Symbol_32 * OpenAD_Symbol_62)
      OpenAD_Symbol_64 = (OpenAD_Symbol_37 * OpenAD_Symbol_47)
      OpenAD_Symbol_65 = (OpenAD_Symbol_34 * OpenAD_Symbol_64)
      OpenAD_Symbol_66 = (OpenAD_Symbol_35 * OpenAD_Symbol_64)
      OpenAD_Symbol_67 = (OpenAD_Symbol_33 * OpenAD_Symbol_62)
      OpenAD_Symbol_68 = (OpenAD_Symbol_31 * OpenAD_Symbol_55)
      OpenAD_Symbol_69 = (OpenAD_Symbol_29 * OpenAD_Symbol_60)
      OpenAD_Symbol_70 = (INT((-1_w2f__i8)) * OpenAD_Symbol_57)
      OpenAD_Symbol_71 = (OpenAD_Symbol_24 * OpenAD_Symbol_70)
      OpenAD_Symbol_72 = (OpenAD_Symbol_25 * OpenAD_Symbol_70)
      CALL sax(OpenAD_Symbol_22, __deriv__(MATR(0)), __deriv__(M03))
      CALL saxpy(OpenAD_Symbol_23, __deriv__(MATR(3)), __deriv__(M03))
      CALL sax(OpenAD_Symbol_24, __deriv__(MATR(1)), __deriv__(M12))
      CALL saxpy(OpenAD_Symbol_25, __deriv__(MATR(2)), __deriv__(M12))
      CALL sax(OpenAD_Symbol_56, __deriv__(MATR(1)), __deriv__(OBJ(1)))
      CALL saxpy(OpenAD_Symbol_58, __deriv__(MATR(0)), __deriv__(OBJ(1)
     > ))
      CALL saxpy(OpenAD_Symbol_59, __deriv__(MATR(3)), __deriv__(OBJ(1)
     > ))
      CALL saxpy(OpenAD_Symbol_61, __deriv__(MATR(0)), __deriv__(OBJ(1)
     > ))
      CALL saxpy(OpenAD_Symbol_63, __deriv__(MATR(2)), __deriv__(OBJ(1)
     > ))
      CALL saxpy(OpenAD_Symbol_65, __deriv__(MATR(3)), __deriv__(OBJ(1)
     > ))
      CALL saxpy(OpenAD_Symbol_66, __deriv__(MATR(3)), __deriv__(OBJ(1)
     > ))
      CALL saxpy(OpenAD_Symbol_67, __deriv__(MATR(2)), __deriv__(OBJ(1)
     > ))
      CALL saxpy(OpenAD_Symbol_68, __deriv__(MATR(1)), __deriv__(OBJ(1)
     > ))
      CALL saxpy(OpenAD_Symbol_69, __deriv__(MATR(0)), __deriv__(OBJ(1)
     > ))
      CALL saxpy(OpenAD_Symbol_71, __deriv__(MATR(1)), __deriv__(OBJ(1)
     > ))
      CALL saxpy(OpenAD_Symbol_72, __deriv__(MATR(2)), __deriv__(OBJ(1)
     > ))
      END SUBROUTINE
