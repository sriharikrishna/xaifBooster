
      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 4)
      TYPE (OpenADTy_active) Y(1 : 4)
C
C     **** Local Variables and Functions ****
C
      EXTERNAL foo
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
      CALL foo(__deriv__(X(1)), __deriv__(X(2)), __deriv__(Y(1)))
      __value__(Y(2)) = SIN(__value__(X(1)) * __value__(X(2)))
      __value__(Y(3)) = SIN(__value__(X(3)))
      __value__(Y(4)) = COS(__value__(X(4)))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
C     $OpenAD$ INLINE oad_trace_call(subst,subst)
      CALL oad_trace_call('foo', 61_w2f__i8)
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('X')
C     $OpenAD$ INLINE oad_trace_index(subst)
      CALL oad_trace_index(1_w2f__i8)
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('X')
C     $OpenAD$ INLINE oad_trace_index(subst)
      CALL oad_trace_index(2_w2f__i8)
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('Y')
C     $OpenAD$ INLINE oad_trace_index(subst)
      CALL oad_trace_index(1_w2f__i8)
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
      CALL foo(__deriv__(X(1)), __deriv__(X(2)), __deriv__(Y(1)))
C     $OpenAD$ INLINE oad_trace_ecall()
      CALL oad_trace_ecall()
      __value__(Y(2)) = SIN(__value__(X(1)) * __value__(X(2)))
      __value__(Y(3)) = SIN(__value__(X(3)))
      __value__(Y(4)) = COS(__value__(X(4)))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE foo(A, B, C)
      use w2f__types
      IMPLICIT NONE
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) A
      TYPE (OpenADTy_active) B
      TYPE (OpenADTy_active) C
C
C     **** Local Variables and Functions ****
C
      EXTERNAL bar
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      CALL bar(__deriv__(B))
      __value__(C) = (__value__(B) + __value__(A) * __value__(A))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
C     $OpenAD$ INLINE oad_trace_call(subst,subst)
      CALL oad_trace_call('bar', 72_w2f__i8)
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('B')
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
      CALL bar(__deriv__(B))
C     $OpenAD$ INLINE oad_trace_ecall()
      CALL oad_trace_ecall()
      __value__(C) = (__value__(B) + __value__(A) * __value__(A))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE bar(A)
      use w2f__types
      IMPLICIT NONE
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) A
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      __value__(A) = COS(__value__(A) * __value__(A))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      __value__(A) = COS(__value__(A) * __value__(A))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
