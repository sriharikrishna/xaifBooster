        subroutine push(x)
C $OpenAD$ INLINE DECLS
          use OpenAD_tape
          implicit none
          double precision :: x
C $OpenAD$ END DECLS
          double_tape(double_tape_pointer)=x
          double_tape_pointer=double_tape_pointer+1
        end subroutine 


        subroutine pop(x)
C $OpenAD$ INLINE DECLS
          use OpenAD_tape
          implicit none
          double precision :: x
C $OpenAD$ END DECLS
          double_tape_pointer=double_tape_pointer-1
          x=double_tape(double_tape_pointer)
        end subroutine


        subroutine push_i(x)
C $OpenAD$ INLINE DECLS
          use OpenAD_tape
          implicit none
          integer :: x
C $OpenAD$ END DECLS
          integer_tape(integer_tape_pointer)=x
          integer_tape_pointer=integer_tape_pointer+1
        end subroutine 


        subroutine pop_i(x)
C $OpenAD$ INLINE DECLS
          use OpenAD_tape
          implicit none
          integer :: x
C $OpenAD$ END DECLS
          integer_tape_pointer=integer_tape_pointer-1
          x=integer_tape(integer_tape_pointer)
        end subroutine


        subroutine saxpy(a,x,y)
C $OpenAD$ INLINE DECLS
          double precision, intent(in) :: a
          type(active), intent(in) :: x
          type(active), intent(inout) :: y
C $OpenAD$ END DECLS
          y%d=y%d+x%d*a
        end subroutine


        subroutine zeroderiv(x)
C $OpenAD$ INLINE DECLS
          type(active), intent(out) :: x
C $OpenAD$ END DECLS
          x%d=0.0d0
        end subroutine


        subroutine setderiv(y,x)
C $OpenAD$ INLINE DECLS
          type(active), intent(out) :: x
          type(active), intent(in) :: y
C $OpenAD$ END DECLS
          x%d=y%d
        end subroutine


        subroutine incderiv(y,x)
C $OpenAD$ INLINE DECLS
          type(active), intent(out) :: x
          type(active), intent(in) :: y
C $OpenAD$ END DECLS
          x%d=x%d+y%d
        end subroutine

        subroutine condinczeroderiv(y,x)
C $OpenAD$ INLINE DECLS
          type(active), intent(out) :: x
          type(active), intent(in) :: y
C $OpenAD$ END DECLS
          if (iaddr(y).ne.iaddr(x)) then
            x%d=x%d+y%d
            y%d=0
          end if
        end subroutine

C Checkpointing stuff ---------------------------------------

        subroutine cp_arg_store(x)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision :: x
C $OpenAD$ END DECLS
          theArgStackoffset=theArgStackoffset+1
          theArgStack(theArgStackoffset)=x%v
        end subroutine 


        subroutine cp_arg_restore(x)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision :: x
C $OpenAD$ END DECLS
          x%v=theArgStack(theArgStackoffset)
          theArgStackoffset=theArgStackoffset-1
        end subroutine 


        subroutine cp_arg_store_v(x,cp_loop_variable)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision, dimension(:) :: x
C $OpenAD$ END DECLS
          do cp_loop_variable=lbound(x,1),ubound(x,1)
             theArgStackoffset=theArgStackoffset+1
             theArgStack(theArgStackoffset)=x(cp_loop_variable)%v
          end do
        end subroutine 


        subroutine cp_arg_restore_v(x,cp_loop_variable)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision, dimension(:) :: x
C $OpenAD$ END DECLS
          do cp_loop_variable=ubound(x,1),lbound(x,1),-1
             x(cp_loop_variable)%v=theArgStack(theArgStackoffset)
             theArgStackoffset=theArgStackoffset-1
          end do
        end subroutine 


        subroutine cp_res_store(x)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision :: x
C $OpenAD$ END DECLS
          theResStackoffset=theResStackoffset+1
          theResStack(theResStackoffset)=x%v
        end subroutine 


        subroutine cp_res_restore(x)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision :: x
C $OpenAD$ END DECLS
          x%v=theResStack(theResStackoffset)
          theResStackoffset=theResStackoffset-1
        end subroutine 


        subroutine cp_res_store_v(x,cp_loop_variable)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision, dimension(:) :: x
C $OpenAD$ END DECLS
          do cp_loop_variable=lbound(x,1),ubound(x,1)
             theResStackoffset=theResStackoffset+1
             theResStack(theResStackoffset)=x(cp_loop_variable)%v
          end do
        end subroutine 


        subroutine cp_res_restore_v(x,cp_loop_variable)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision, dimension(:) :: x
C $OpenAD$ END DECLS
          do cp_loop_variable=ubound(x,1),lbound(x,1),-1
             x(cp_loop_variable)%v=theResStack(theResStackoffset)
             theResStackoffset=theResStackoffset-1
          end do
        end subroutine 


        subroutine forward_mode()
C $OpenAD$ INLINE DECLS
          use OpenAD_rev
          implicit none
C $OpenAD$ END DECLS
          our_orig_mode=our_rev_mode

          our_rev_mode%arg_store=.FALSE.
          our_rev_mode%arg_restore=.FALSE.
          our_rev_mode%res_store=.FALSE.
          our_rev_mode%res_restore=.FALSE.
          our_rev_mode%plain=.TRUE.
          our_rev_mode%tape=.FALSE.
          our_rev_mode%adjoint=.FALSE.
        end subroutine 

        subroutine forward_arg_store_mode()
C $OpenAD$ INLINE DECLS
          use OpenAD_rev
          implicit none
C $OpenAD$ END DECLS
          our_orig_mode=our_rev_mode

          our_rev_mode%arg_store=.TRUE.
          our_rev_mode%arg_restore=.FALSE.
          our_rev_mode%res_store=.FALSE.
          our_rev_mode%res_restore=.FALSE.
          our_rev_mode%plain=.TRUE.
          our_rev_mode%tape=.FALSE.
          our_rev_mode%adjoint=.FALSE.
        end subroutine 

        subroutine reverse_mode()
C $OpenAD$ INLINE DECLS
          use OpenAD_rev
          implicit none
C $OpenAD$ END DECLS
          our_orig_mode=our_rev_mode

          our_rev_mode%arg_store=.FALSE.
          our_rev_mode%arg_restore=.TRUE.
          our_rev_mode%res_store=.FALSE.
          our_rev_mode%res_restore=.FALSE.
          our_rev_mode%plain=.FALSE.
          our_rev_mode%tape=.TRUE.
          our_rev_mode%adjoint=.TRUE.
        end subroutine 


        subroutine reset_mode()
C $OpenAD$ INLINE DECLS
          use OpenAD_rev
          implicit none
C $OpenAD$ END DECLS
          our_rev_mode=our_orig_mode
        end subroutine 

