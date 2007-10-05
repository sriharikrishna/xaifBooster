C ***********************************************************
C Fortran file translated from WHIRL Thu Oct  4 23:46:55 2007
C ***********************************************************
C ***********************************************************


      SUBROUTINE head(X, FVEC)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_22
      REAL(w2f__8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_24
      type(active) :: OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_27
      type(active) :: OpenAD_Symbol_28
      REAL(w2f__8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_31
      REAL(w2f__8) OpenAD_Symbol_32
      type(active) :: OpenAD_Symbol_33
      REAL(w2f__8) OpenAD_Symbol_34
      type(active) :: OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 4)
      type(active) :: FVEC(1 : 11)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      type(active) :: TEMP1
      type(active) :: TEMP2
      REAL(w2f__8) V(1 : 11)
      REAL(w2f__8) Y(1 : 11)
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(FVEC)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      V(1) = 4.0D00
      V(2) = 2.0D00
      V(3) = 1.0D00
      V(4) = 5.0D-01
      V(5) = 2.5D-01
      V(6) = 1.67000000000000009548D-01
      V(7) = 1.25D-01
      V(8) = 1.00000000000000005551D-01
      V(9) = 8.32999999999999990452D-02
      V(10) = 7.14000000000000051292D-02
      V(11) = 6.25D-02
      Y(1) = 1.95700000000000012834D-01
      Y(2) = 1.94700000000000011946D-01
      Y(3) = 1.73499999999999987566D-01
      Y(4) = 1.60000000000000003331D-01
      Y(5) = 8.44000000000000027978D-02
      Y(6) = 6.27000000000000057288D-02
      Y(7) = 4.56000000000000016431D-02
      Y(8) = 3.42000000000000012323D-02
      Y(9) = 3.23000000000000023204D-02
      Y(10) = 2.35000000000000000555D-02
      Y(11) = 2.46000000000000003386D-02
      DO I = 1, 11, 1
        OpenAD_Symbol_0 = (X(2)%v+V(I))
        OpenAD_Symbol_5 = (V(I) * OpenAD_Symbol_0)
        OpenAD_Symbol_3 = 1_w2f__i8
        OpenAD_Symbol_2 = V(I)
        TEMP1%v = OpenAD_Symbol_5
        OpenAD_Symbol_8 = (X(3)%v+V(I))
        OpenAD_Symbol_13 = (X(4)%v+V(I)*OpenAD_Symbol_8)
        OpenAD_Symbol_6 = 1_w2f__i8
        OpenAD_Symbol_11 = 1_w2f__i8
        OpenAD_Symbol_10 = V(I)
        OpenAD_Symbol_7 = 1_w2f__i8
        TEMP2%v = OpenAD_Symbol_13
        OpenAD_Symbol_16 = (X(1)%v*TEMP1%v)
        OpenAD_Symbol_21 = (Y(I)-(OpenAD_Symbol_16/TEMP2%v))
        OpenAD_Symbol_19 = TEMP1%v
        OpenAD_Symbol_20 = X(1)%v
        OpenAD_Symbol_17 = (INT(1 _w2f__i8)/TEMP2%v)
        OpenAD_Symbol_18 = (-(OpenAD_Symbol_16/(TEMP2%v*TEMP2%v)))
        OpenAD_Symbol_15 = (-1_w2f__i8)
        FVEC(INT(I))%v = OpenAD_Symbol_21
        OpenAD_Symbol_22 = (OpenAD_Symbol_17 * OpenAD_Symbol_15)
        OpenAD_Symbol_23 = (OpenAD_Symbol_18 * OpenAD_Symbol_15)
        OpenAD_Symbol_24 = (OpenAD_Symbol_6 * OpenAD_Symbol_23)
        OpenAD_Symbol_26 = (OpenAD_Symbol_7 * OpenAD_Symbol_23)
        OpenAD_Symbol_27 = (OpenAD_Symbol_19 * OpenAD_Symbol_22)
        OpenAD_Symbol_29 = (OpenAD_Symbol_20 * OpenAD_Symbol_22)
        OpenAD_Symbol_30 = (OpenAD_Symbol_10 * OpenAD_Symbol_26)
        OpenAD_Symbol_31 = (OpenAD_Symbol_2 * OpenAD_Symbol_29)
        OpenAD_Symbol_32 = (OpenAD_Symbol_11 * OpenAD_Symbol_30)
        OpenAD_Symbol_34 = (OpenAD_Symbol_3 * OpenAD_Symbol_31)
        CALL setderiv(OpenAD_Symbol_35,X(2))
        CALL setderiv(OpenAD_Symbol_33,X(3))
        CALL setderiv(OpenAD_Symbol_28,X(1))
        CALL setderiv(OpenAD_Symbol_25,X(4))
        CALL sax(OpenAD_Symbol_24,OpenAD_Symbol_25,FVEC(I))
        CALL saxpy(OpenAD_Symbol_27,OpenAD_Symbol_28,FVEC(I))
        CALL saxpy(OpenAD_Symbol_32,OpenAD_Symbol_33,FVEC(I))
        CALL saxpy(OpenAD_Symbol_34,OpenAD_Symbol_35,FVEC(I))
      END DO
      END SUBROUTINE
