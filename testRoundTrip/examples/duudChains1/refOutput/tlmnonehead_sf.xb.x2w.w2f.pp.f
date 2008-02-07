
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
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      type(active) :: Y(1 : 2)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      type(active) :: T(1 : 2)
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      DO I = 1, 2, 1
        T(INT(I))%v = (X(I)%v*2.0D00)
        OpenAD_Symbol_0 = 2.0D00
        OpenAD_Symbol_4 = OpenAD_Symbol_0
        CALL sax(OpenAD_Symbol_4,X(I),T(I))
        Y(INT(I))%v = (T(I)%v*4.0D00)
        OpenAD_Symbol_2 = 4.0D00
        OpenAD_Symbol_5 = OpenAD_Symbol_2
        CALL sax(OpenAD_Symbol_5,T(I),Y(I))
      END DO
      END SUBROUTINE
