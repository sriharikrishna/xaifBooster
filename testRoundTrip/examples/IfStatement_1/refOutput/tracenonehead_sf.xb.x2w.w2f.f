
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
      TYPE (OpenADTy_active) X(1 : 1)
      INTENT(IN)  X
      TYPE (OpenADTy_active) Y(1 : 1)
      INTENT(OUT)  Y
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
      __value__(Y(1)) = 2.0
      IF(__value__(X(1)) .GT. 0.0D00) THEN
        __value__(Y(1)) = __value__(X(1))
      ENDIF
      __value__(Y(1)) = (__value__(Y(1)) * __value__(Y(1)))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      __value__(Y(1)) = 2.0
C     $OpenAD$ INLINE oad_trace_branch(subst)
      CALL oad_trace_branch(0_w2f__i8)
C     $OpenAD$ INLINE oad_trace_condition()
      CALL oad_trace_condition()
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('X')
C     $OpenAD$ INLINE oad_trace_index(subst)
      CALL oad_trace_index(1_w2f__i8)
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
C     $OpenAD$ INLINE oad_trace_econdition()
      CALL oad_trace_econdition()
      IF(__value__(X(1)) .GT. 0.0D00) THEN
        __value__(Y(1)) = __value__(X(1))
C       $OpenAD$ INLINE oad_trace_CFval(subst)
        CALL oad_trace_CFval(1_w2f__i8)
C       $OpenAD$ INLINE oad_trace_ebranch()
        CALL oad_trace_ebranch()
      ELSE
C       $OpenAD$ INLINE oad_trace_CFval(subst)
        CALL oad_trace_CFval(0_w2f__i8)
C       $OpenAD$ INLINE oad_trace_ebranch()
        CALL oad_trace_ebranch()
      ENDIF
      __value__(Y(1)) = (__value__(Y(1)) * __value__(Y(1)))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
