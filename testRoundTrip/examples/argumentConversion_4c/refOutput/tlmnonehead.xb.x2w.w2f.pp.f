

      SUBROUTINE foo(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
C
C     **** Parameters and Result ****
C
      type(active) :: X
      type(active) :: Y
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      Y%v = (X%v*X%v)
      OpenAD_Symbol_2 = X%v
      OpenAD_Symbol_3 = X%v
      OpenAD_Symbol_4 = OpenAD_Symbol_2
      OpenAD_Symbol_5 = OpenAD_Symbol_3
      CALL sax(OpenAD_Symbol_4,X,Y)
      CALL saxpy(OpenAD_Symbol_5,X,Y)
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      type(active) :: OpenAD_Symbol_0
      type(active) :: OpenAD_Symbol_1
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      type(active) :: Y
C
C     **** Local Variables and Functions ****
C
      REAL(w2f__8) APX(1 : 2, 1 : 2)
      type(active) :: AX(1 : 2, 1 : 2)
      EXTERNAL foo
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) J
      REAL(w2f__8) PY
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        DO J = 1, 2, 1
          AX(INT(I),INT(J))%v = X(I)%v
          APX(INT(I), INT(J)) = (I * DBLE(4.0))
          CALL setderiv(AX(I,J),X(I))
        END DO
      END DO
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        DO J = 1, 2, 1
          CALL foo(AX(I,J),Y)
C         $OpenAD$ INLINE convert_p2a_scalar(subst,subst)
          CALL convert_p2a_scalar(OpenAD_Symbol_0,APX(I,J))
C         $OpenAD$ INLINE convert_p2a_scalar(subst,subst)
          CALL convert_p2a_scalar(OpenAD_Symbol_1,PY)
          CALL foo(OpenAD_Symbol_0,OpenAD_Symbol_1)
C         $OpenAD$ INLINE convert_a2p_scalar(subst,subst)
          CALL convert_a2p_scalar(APX(I,J),OpenAD_Symbol_0)
C         $OpenAD$ INLINE convert_a2p_scalar(subst,subst)
          CALL convert_a2p_scalar(PY,OpenAD_Symbol_1)
        END DO
      END DO
      END SUBROUTINE
