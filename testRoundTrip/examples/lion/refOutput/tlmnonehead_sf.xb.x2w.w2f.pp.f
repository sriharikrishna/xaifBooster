C ***********************************************************
C Fortran file translated from WHIRL Thu Nov  2 17:24:21 2006
C ***********************************************************
C ***********************************************************

      MODULE all_globals_mod
      use w2f__types
      use active_module
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_34
      type(active) :: OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_36
      type(active) :: OpenAD_Symbol_37
      REAL(w2f__8) OpenAD_Symbol_38
      type(active) :: OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_40
      type(active) :: OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_42
      type(active) :: OpenAD_Symbol_43
      REAL(w2f__8) OpenAD_Symbol_44
      type(active) :: OpenAD_Symbol_45
      REAL(w2f__8) OpenAD_Symbol_46
      type(active) :: OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_48
      type(active) :: OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_5
      type(active) :: OpenAD_Symbol_50
      type(active) :: OpenAD_Symbol_51
      type(active) :: OpenAD_Symbol_52
      type(active) :: OpenAD_Symbol_53
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      type(active) :: Y(1 : 4)
C
C     **** Local Variables and Functions ****
C
      type(active) :: T1
      type(active) :: T2
      type(active) :: Y1
      type(active) :: Y2
      type(active) :: Y3
      type(active) :: Y4
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
           count_mult = count_mult+17 _w2f__i8
           count_add = count_add+1 _w2f__i8
           count_mult = count_mult+0 _w2f__i8
           count_add = count_add+0 _w2f__i8
           count_mult = count_mult+0 _w2f__i8
           count_add = count_add+0 _w2f__i8
           count_mult = count_mult+0 _w2f__i8
           count_add = count_add+0 _w2f__i8
           count_mult = count_mult+0 _w2f__i8
           count_add = count_add+0 _w2f__i8
           count_mult = count_mult+0 _w2f__i8
           count_add = count_add+0 _w2f__i8
           count_mult = count_mult+0 _w2f__i8
           count_add = count_add+0 _w2f__i8
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_2 = (X(1)%v/X(2)%v)
      OpenAD_Symbol_0 = (INT(1 _w2f__i8)/X(2)%v)
      OpenAD_Symbol_1 = (-(X(1)%v/(X(2)%v*X(2)%v)))
      T1%v = OpenAD_Symbol_2
      OpenAD_Symbol_34 = OpenAD_Symbol_0
      OpenAD_Symbol_36 = OpenAD_Symbol_1
      CALL setderiv(OpenAD_Symbol_37,X(2))
      CALL setderiv(OpenAD_Symbol_35,X(1))
      CALL sax(OpenAD_Symbol_34,OpenAD_Symbol_35,T1)
      CALL saxpy(OpenAD_Symbol_36,OpenAD_Symbol_37,T1)
      OpenAD_Symbol_4 = COS(T1%v)
      OpenAD_Symbol_3 = (-SIN(T1%v))
      T2%v = OpenAD_Symbol_4
      OpenAD_Symbol_38 = OpenAD_Symbol_3
      CALL setderiv(OpenAD_Symbol_39,T1)
      CALL sax(OpenAD_Symbol_38,OpenAD_Symbol_39,T2)
      OpenAD_Symbol_6 = EXP(T2%v)
      OpenAD_Symbol_5 = EXP(T2%v)
      Y1%v = OpenAD_Symbol_6
      OpenAD_Symbol_40 = OpenAD_Symbol_5
      CALL setderiv(OpenAD_Symbol_41,T2)
      CALL sax(OpenAD_Symbol_40,OpenAD_Symbol_41,Y1)
      OpenAD_Symbol_9 = (T2%v*3.14000010490417480469D00)
      OpenAD_Symbol_7 = 3.14000010490417480469D00
      Y2%v = OpenAD_Symbol_9
      OpenAD_Symbol_42 = OpenAD_Symbol_7
      CALL setderiv(OpenAD_Symbol_43,T2)
      CALL sax(OpenAD_Symbol_42,OpenAD_Symbol_43,Y2)
      OpenAD_Symbol_11 = SIN(T2%v)
      OpenAD_Symbol_10 = COS(T2%v)
      Y3%v = OpenAD_Symbol_11
      OpenAD_Symbol_44 = OpenAD_Symbol_10
      CALL setderiv(OpenAD_Symbol_45,T2)
      CALL sax(OpenAD_Symbol_44,OpenAD_Symbol_45,Y3)
      OpenAD_Symbol_14 = (T1%v*T2%v)
      OpenAD_Symbol_12 = T2%v
      OpenAD_Symbol_13 = T1%v
      Y4%v = OpenAD_Symbol_14
      OpenAD_Symbol_46 = OpenAD_Symbol_12
      OpenAD_Symbol_48 = OpenAD_Symbol_13
      CALL setderiv(OpenAD_Symbol_49,T2)
      CALL setderiv(OpenAD_Symbol_47,T1)
      CALL sax(OpenAD_Symbol_46,OpenAD_Symbol_47,Y4)
      CALL saxpy(OpenAD_Symbol_48,OpenAD_Symbol_49,Y4)
      Y(1)%v = Y1%v
      CALL setderiv(OpenAD_Symbol_50,Y1)
      CALL setderiv(Y(1),OpenAD_Symbol_50)
      Y(2)%v = Y2%v
      CALL setderiv(OpenAD_Symbol_51,Y2)
      CALL setderiv(Y(2),OpenAD_Symbol_51)
      Y(3)%v = Y3%v
      CALL setderiv(OpenAD_Symbol_52,Y3)
      CALL setderiv(Y(3),OpenAD_Symbol_52)
      Y(4)%v = Y4%v
      CALL setderiv(OpenAD_Symbol_53,Y4)
      CALL setderiv(Y(4),OpenAD_Symbol_53)
      RETURN
      END SUBROUTINE
