
        module active_module
        implicit none
        private
        public :: active, saxpy, sax, setderiv, zero_deriv, &
     &            assignment(=)
        
        !
        ! active needs to be a sequence type
        !  with no initialization
        !
        type active
          sequence
          ! double precision :: v = 0
          ! double precision :: d = 0
          double precision :: v 
          double precision :: d
        end type active
        
        interface assignment
          module procedure active_assign_active
        end interface
        
        interface saxpy
          module procedure saxpy_a_a
        end interface
        
        interface setderiv
          module procedure setderiv_a_a
        end interface

        interface zero_deriv
          module procedure zero_deriv_a
        end interface
        
        interface sax
          module procedure sax_a_a
        end interface
        
        contains
        
        !
        ! assignment of active variables
        !
        
        elemental subroutine active_assign_active(a1,a2)
          type(active), intent(out) :: a1
          type(active), intent(in) :: a2
        
          a1%v=a2%v
          a1%d=a2%d
        end subroutine
        
        !
        ! chain rule saxpy to be used in forward and reverse modes
        !
        
        subroutine saxpy_a_a(a,x,y)
          double precision, intent(in) :: a
          type(active), intent(in) :: x
          type(active), intent(inout) :: y
        
          y%d=y%d+x%d*a
        end subroutine saxpy_a_a
        
        !
        ! chain rule saxpy to be used in forward and reverse modes
        ! derivative component of y is equal to zero initially
        ! note: y needs to be inout as otherwise value component gets
        ! zeroed out
        !
        
        subroutine sax_a_a(a,x,y)
          double precision, intent(in) :: a
          type(active), intent(in) :: x
          type(active), intent(inout) :: y
        
          y%d=x%d*a
        end subroutine sax_a_a
        
        !
        ! set derivative of y to be equal to derivative of x
        ! note: making y inout allows for already existing active
        ! variables to become the target of a derivative assignment
        !
        
        subroutine setderiv_a_a(y,x)
          type(active), intent(inout) :: y
          type(active), intent(in) :: x
        
          y%d=x%d
        end subroutine setderiv_a_a

        !
        ! set derivative components to 0.0
        !
        subroutine zero_deriv_a(x)
          type(active), intent(out) :: x

          x%d=0.0d0
        end subroutine zero_deriv_a
        
        end module

