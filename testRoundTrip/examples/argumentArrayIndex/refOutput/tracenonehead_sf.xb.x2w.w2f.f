
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
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X
      TYPE (OpenADTy_active) Y
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      __value__(Y) = (__value__(X) * 2.0D00)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      __value__(Y) = (__value__(X) * 2.0D00)
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y
C
C     **** Local Variables and Functions ****
C
      EXTERNAL foo
      INTEGER(w2f__i4) K
      INTEGER(w2f__i8) OpenAD_Symbol_0
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      K = 1
C     $OpenAD$ INLINE oad_trace_call(subst,subst)
      CALL oad_trace_call('foo', 71_w2f__i8)
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('X')
C     $OpenAD$ INLINE oad_trace_index(subst)
      CALL oad_trace_index(K)
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('X')
C     $OpenAD$ INLINE oad_trace_index(subst)
      CALL oad_trace_index(OpenAD_Symbol_0)
      OpenAD_Symbol_0 = (K + 1)
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
      CALL foo(__deriv__(X(K)), __deriv__(X(K + 1)))
C     $OpenAD$ INLINE oad_trace_ecall()
      CALL oad_trace_ecall()
C     $OpenAD$ INLINE oad_trace_call(subst,subst)
      CALL oad_trace_call('foo', 72_w2f__i8)
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('X')
C     $OpenAD$ INLINE oad_trace_index(subst)
      CALL oad_trace_index(K)
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('Y')
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
      CALL foo(__deriv__(X(K)), __deriv__(Y))
C     $OpenAD$ INLINE oad_trace_ecall()
      CALL oad_trace_ecall()
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      K = 1
C     $OpenAD$ INLINE oad_trace_call(subst,subst)
      CALL oad_trace_call('foo', 71_w2f__i8)
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('X')
C     $OpenAD$ INLINE oad_trace_index(subst)
      CALL oad_trace_index(K)
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('X')
C     $OpenAD$ INLINE oad_trace_index(subst)
      CALL oad_trace_index(OpenAD_Symbol_0)
      OpenAD_Symbol_0 = (K + 1)
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
      CALL foo(__deriv__(X(K)), __deriv__(X(K + 1)))
C     $OpenAD$ INLINE oad_trace_ecall()
      CALL oad_trace_ecall()
C     $OpenAD$ INLINE oad_trace_call(subst,subst)
      CALL oad_trace_call('foo', 72_w2f__i8)
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('X')
C     $OpenAD$ INLINE oad_trace_index(subst)
      CALL oad_trace_index(K)
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('Y')
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
      CALL foo(__deriv__(X(K)), __deriv__(Y))
C     $OpenAD$ INLINE oad_trace_ecall()
      CALL oad_trace_ecall()
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
