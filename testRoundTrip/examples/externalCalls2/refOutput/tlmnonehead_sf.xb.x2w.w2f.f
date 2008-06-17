
      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE foo(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_2
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y
C
C     **** Local Variables and Functions ****
C
      EXTERNAL barext
      TYPE (OpenADTy_active) T
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      __value__(T) = __value__(X(1))
      CALL setderiv(__deriv__(T), __deriv__(X(1)))
C     $OpenAD$ INLINE convert_a2p_scalar(subst,subst)
      CALL convert_a2p_scalar(OpenAD_Symbol_0, __deriv__(T))
      CALL barext(OpenAD_Symbol_0)
C     $OpenAD$ INLINE convert_p2a_scalar(subst,subst)
      CALL convert_p2a_scalar(__deriv__(T), OpenAD_Symbol_0)
      __value__(Y) = (__value__(X(2)) * __value__(T))
      OpenAD_Symbol_1 = __value__(T)
      OpenAD_Symbol_2 = __value__(X(2))
      CALL sax(OpenAD_Symbol_1, __deriv__(X(2)), __deriv__(Y))
      CALL saxpy(OpenAD_Symbol_2, __deriv__(T), __deriv__(Y))
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      EXTERNAL barext
      EXTERNAL foo
      INTEGER(w2f__i4) I
      REAL(w2f__8) T(1 : 2)
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      I = 2
      CALL barext(T(I))
      I = 1
      CALL foo(__deriv__(X), __deriv__(Y(I)))
      END SUBROUTINE
