C ***********************************************************
C Fortran file translated from WHIRL Fri Jul 21 15:13:03 2006
C ***********************************************************
C ***********************************************************


      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_2
      type(active) :: OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      type(active) :: OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      type(active) :: OpenAD_Symbol_7
      type(active) :: OpenAD_Symbol_8
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 1)
      type(active) :: Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      CHARACTER(10) ASTRING
      INTEGER(w2f__i4) I
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_9
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
      Y(1)%v = X(1)%v
      ASTRING = 'blah'
C$OPENAD XXX Simple loop
      DO I = 1, 3, 1
        IF(ASTRING .EQ. 'blah') THEN
          Y(1)%v = (X(1)%v*Y(1)%v)
        ENDIF
      END DO
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      Y(1)%v = X(1)%v
      ASTRING = 'blah'
C$OPENAD XXX Simple loop
      DO I = 1, 3, 1
        IF(ASTRING .EQ. 'blah') THEN
          OpenAD_Symbol_2 = (X(1)%v*Y(1)%v)
          OpenAD_Symbol_0 = Y(1)%v
          OpenAD_Symbol_1 = X(1)%v
          Y(1)%v = OpenAD_Symbol_2
          OpenAD_Symbol_4 = OpenAD_Symbol_0
          OpenAD_Symbol_6 = OpenAD_Symbol_1
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_4)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_6)
        ENDIF
      END DO
C     $OpenAD$ INLINE push_s(subst)
      CALL push_s(ASTRING)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
      CALL CondIncZeroDeriv(Y(1),OpenAD_Symbol_8)
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(OpenAD_Symbol_8,Y(1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(OpenAD_Symbol_8)
C     $OpenAD$ INLINE pop_s(subst)
      CALL pop_s(ASTRING)
      I = 1 + 1 *((3 - 1) / 1)
      DO WHILE(I .GE. 1)
        IF(ASTRING .EQ. 'blah') THEN
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_9)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_9,Y(1),OpenAD_Symbol_7)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_10)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_10,Y(1),OpenAD_Symbol_5)
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(Y(1))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(OpenAD_Symbol_5,X(1))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(OpenAD_Symbol_5)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(OpenAD_Symbol_7,Y(1))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(OpenAD_Symbol_7)
        ENDIF
        I = I - 1
      END DO
C     $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
      CALL CondIncZeroDeriv(Y(1),OpenAD_Symbol_3)
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(OpenAD_Symbol_3,X(1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(OpenAD_Symbol_3)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(X)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(Y)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ INLINE cp_res_store_real_vector_a(subst)
      CALL cp_res_store_real_vector_a(Y)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(Y)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(X)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ INLINE cp_res_restore_real_vector_a(subst)
      CALL cp_res_restore_real_vector_a(Y)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_tsarg_store_real_vector_a(subst)
      CALL cp_tsarg_store_real_vector_a(Y)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(X)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(Y)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_tsarg_restore_real_vector_a(subst)
      CALL cp_tsarg_restore_real_vector_a(Y)
C     $OpenAD$ INLINE cp_tsarg_restore_real_vector_a(subst)
      CALL cp_tsarg_restore_real_vector_a(X)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(Y)
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
