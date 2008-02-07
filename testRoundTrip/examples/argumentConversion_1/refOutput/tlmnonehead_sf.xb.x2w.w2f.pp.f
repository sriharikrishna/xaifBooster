
      MODULE all_globals_mod
      use w2f__types
      use active_module
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE foo(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      type(active) :: Y
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      Y%v = (X(1)%v*X(2)%v)
      OpenAD_Symbol_4 = X(2)%v
      OpenAD_Symbol_5 = X(1)%v
      OpenAD_Symbol_6 = OpenAD_Symbol_4
      OpenAD_Symbol_7 = OpenAD_Symbol_5
      CALL sax(OpenAD_Symbol_6,X(1),Y)
      CALL saxpy(OpenAD_Symbol_7,X(2),Y)
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      type(active) :: OpenAD_Symbol_0(1 : 2)
      type(active) :: OpenAD_Symbol_1
      type(active) :: OpenAD_Symbol_2(1 : 2)
      type(active) :: OpenAD_Symbol_3
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      type(active) :: Y
C
C     **** Local Variables and Functions ****
C
      EXTERNAL foo
      REAL(w2f__8) PX(1 : 2)
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
      PX(1) = 1.0
      PX(2) = 2.0
      CALL foo(X,Y)
C     $OpenAD$ INLINE convert_p2a_vector(subst,subst)
      CALL convert_p2a_vector(OpenAD_Symbol_0,PX)
C     $OpenAD$ INLINE convert_p2a_scalar(subst,subst)
      CALL convert_p2a_scalar(OpenAD_Symbol_1,PY)
      CALL foo(OpenAD_Symbol_0,OpenAD_Symbol_1)
C     $OpenAD$ INLINE convert_a2p_vector(subst,subst)
      CALL convert_a2p_vector(PX,OpenAD_Symbol_0)
C     $OpenAD$ INLINE convert_a2p_scalar(subst,subst)
      CALL convert_a2p_scalar(PY,OpenAD_Symbol_1)
C     $OpenAD$ INLINE convert_p2a_vector(subst,subst)
      CALL convert_p2a_vector(OpenAD_Symbol_2,PX)
C     $OpenAD$ INLINE convert_p2a_scalar(subst,subst)
      CALL convert_p2a_scalar(OpenAD_Symbol_3,PY)
      CALL foo(OpenAD_Symbol_2,OpenAD_Symbol_3)
C     $OpenAD$ INLINE convert_a2p_vector(subst,subst)
      CALL convert_a2p_vector(PX,OpenAD_Symbol_2)
C     $OpenAD$ INLINE convert_a2p_scalar(subst,subst)
      CALL convert_a2p_scalar(PY,OpenAD_Symbol_3)
      END SUBROUTINE
