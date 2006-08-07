C ***********************************************************
C Fortran file translated from WHIRL Thu Jul 20 14:57:57 2006
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

      SUBROUTINE foo(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      type(active) :: OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      type(active) :: OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      type(active) :: OpenAD_Symbol_8
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      type(active) :: Y
C
C     **** Local Variables and Functions ****
C
      EXTERNAL barext
      type(active) :: T
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      T%v = X(1)%v
      CALL setderiv(OpenAD_Symbol_4,X(1))
      CALL setderiv(T,OpenAD_Symbol_4)
C     $OpenAD$ INLINE convert_a2p_scalar(subst,subst)
      CALL convert_a2p_scalar(OpenAD_Symbol_0,T)
      CALL barext(OpenAD_Symbol_0)
C     $OpenAD$ INLINE convert_p2a_scalar(subst,subst)
      CALL convert_p2a_scalar(T,OpenAD_Symbol_0)
      OpenAD_Symbol_3 = (X(2)%v*T%v)
      OpenAD_Symbol_1 = T%v
      OpenAD_Symbol_2 = X(2)%v
      Y%v = OpenAD_Symbol_3
      OpenAD_Symbol_5 = OpenAD_Symbol_1
      OpenAD_Symbol_7 = OpenAD_Symbol_2
      CALL setderiv(OpenAD_Symbol_8,T)
      CALL setderiv(OpenAD_Symbol_6,X(2))
      CALL sax(OpenAD_Symbol_5,OpenAD_Symbol_6,Y)
      CALL saxpy(OpenAD_Symbol_7,OpenAD_Symbol_8,Y)
      RETURN
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      type(active) :: Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      EXTERNAL barext
      EXTERNAL foo
      REAL(w2f__8) T
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      CALL barext(T)
      CALL foo(X,Y)
      RETURN
      END SUBROUTINE