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

        subroutine cp_arg_store_real_scalar(x)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision :: x
C $OpenAD$ END DECLS
          theArgStackoffset=theArgStackoffset+1
          theArgStack(theArgStackoffset)=x%v
        end subroutine 


        subroutine cp_arg_restore_real_scalar(x)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision :: x
C $OpenAD$ END DECLS
          x%v=theArgStack(theArgStackoffset)
          theArgStackoffset=theArgStackoffset-1
        end subroutine 


        subroutine cp_res_store_real_scalar(x)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision :: x
C $OpenAD$ END DECLS
          theResStackoffset=theResStackoffset+1
          theResStack(theResStackoffset)=x%v
        end subroutine 


        subroutine cp_res_restore_real_scalar(x)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision :: x
C $OpenAD$ END DECLS
          x%v=theResStack(theResStackoffset)
          theResStackoffset=theResStackoffset-1
        end subroutine 


        subroutine cp_arg_store_real_vector(x,cp_loop_variable_1)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision, dimension(:) :: x
C $OpenAD$ END DECLS
          do cp_loop_variable_1=lbound(x,1),ubound(x,1)
             theArgStackoffset=theArgStackoffset+1
             theArgStack(theArgStackoffset)=x(cp_loop_variable_1)%v
          end do
        end subroutine 


        subroutine cp_arg_restore_real_vector(x,cp_loop_variable_1)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision, dimension(:) :: x
C $OpenAD$ END DECLS
          do cp_loop_variable_1=ubound(x,1),lbound(x,1),-1
             x(cp_loop_variable_1)%v=theArgStack(theArgStackoffset)
             theArgStackoffset=theArgStackoffset-1
          end do
        end subroutine 


        subroutine cp_res_store_real_vector(x,cp_loop_variable_1)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision, dimension(:) :: x
C $OpenAD$ END DECLS
          do cp_loop_variable_1=lbound(x,1),ubound(x,1)
             theResStackoffset=theResStackoffset+1
             theResStack(theResStackoffset)=x(cp_loop_variable_1)%v
          end do
        end subroutine 


        subroutine cp_res_restore_real_vector(x,cp_loop_variable_1)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision, dimension(:) :: x
C $OpenAD$ END DECLS
          do cp_loop_variable_1=ubound(x,1),lbound(x,1),-1
             x(cp_loop_variable_1)%v=theResStack(theResStackoffset)
             theResStackoffset=theResStackoffset-1
          end do
        end subroutine 


        subroutine cp_arg_store_real_matrix(x,cp_loop_variable_1,cp_loop_variable_2)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision, dimension(::) :: x
C $OpenAD$ END DECLS
          do cp_loop_variable_1=lbound(x,1),ubound(x,1)
             do cp_loop_variable_2=lbound(x,2),ubound(x,2)
                theArgStackoffset=theArgStackoffset+1
                theArgStack(theArgStackoffset)=x(cp_loop_variable_1,cp_loop_variable_2)%v
             end do
          end do
        end subroutine 


        subroutine cp_arg_restore_real_matrix(x,cp_loop_variable_1,cp_loop_variable_2)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision, dimension(::) :: x
C $OpenAD$ END DECLS
          do cp_loop_variable_1=ubound(x,1),lbound(x,1),-1
             do cp_loop_variable_2=ubound(x,2),lbound(x,2),-1
                x(cp_loop_variable_1,cp_loop_variable_2)%v=theArgStack(theArgStackoffset)
                theArgStackoffset=theArgStackoffset-1
             end do
          end do
        end subroutine 


        subroutine cp_res_store_real_matrix(x,cp_loop_variable_1,cp_loop_variable_2)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision, dimension(::) :: x
C $OpenAD$ END DECLS
          do cp_loop_variable_1=lbound(x,1),ubound(x,1)
             do cp_loop_variable_2=lbound(x,2),ubound(x,2)
                theResStackoffset=theResStackoffset+1
                theResStack(theResStackoffset)=x(cp_loop_variable_1,cp_loop_variable_2)%v
             end do
          end do
        end subroutine 


        subroutine cp_res_restore_real_matrix(x,cp_loop_variable_1,cp_loop_variable_2)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision, dimension(:) :: x
C $OpenAD$ END DECLS
          do cp_loop_variable_1=ubound(x,1),lbound(x,1),-1
             do cp_loop_variable_2=ubound(x,2),lbound(x,2),-1
                x(cp_loop_variable_1,cp_loop_variable_2)%v=theResStack(theResStackoffset)
                theResStackoffset=theResStackoffset-1
             end do
          end do
        end subroutine 


        subroutine cp_arg_store_real_four_tensor(x,cp_loop_variable_1,cp_loop_variable_2,cp_loop_variable_3,cp_loop_variable_4)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision, dimension(::) :: x
C $OpenAD$ END DECLS
          do cp_loop_variable_1=lbound(x,1),ubound(x,1)
             do cp_loop_variable_2=lbound(x,2),ubound(x,2)
                do cp_loop_variable_3=lbound(x,3),ubound(x,3)
                   do cp_loop_variable_4=lbound(x,4),ubound(x,4)
                      theArgStackoffset=theArgStackoffset+1
                      theArgStack(theArgStackoffset)=x(cp_loop_variable_1,cp_loop_variable_2,cp_loop_variable_3,cp_loop_variable_4)%v
                   end do
                end do
             end do
          end do
        end subroutine 


        subroutine cp_arg_restore_real_four_tensor(x,cp_loop_variable_1,cp_loop_variable_2,cp_loop_variable_3,cp_loop_variable_4)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision, dimension(::) :: x
C $OpenAD$ END DECLS
          do cp_loop_variable_1=ubound(x,1),lbound(x,1),-1
             do cp_loop_variable_2=ubound(x,2),lbound(x,2),-1
                do cp_loop_variable_3=ubound(x,3),lbound(x,3),-1
                   do cp_loop_variable_4=ubound(x,4),lbound(x,4),-1
                      x(cp_loop_variable_1,cp_loop_variable_2,cp_loop_variable_3,cp_loop_variable_4)%v=theArgStack(theArgStackoffset)
                      theArgStackoffset=theArgStackoffset-1
                   end do
                end do
             end do
          end do
          end subroutine 


        subroutine cp_res_store_real_four_tensor(x,cp_loop_variable_1,cp_loop_variable_2,cp_loop_variable_3,cp_loop_variable_4)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision, dimension(::) :: x
C $OpenAD$ END DECLS
          do cp_loop_variable_1=lbound(x,1),ubound(x,1)
             do cp_loop_variable_2=lbound(x,2),ubound(x,2)
                do cp_loop_variable_3=lbound(x,3),ubound(x,3)
                   do cp_loop_variable_4=lbound(x,4),ubound(x,4)
                      theResStackoffset=theResStackoffset+1
                      theResStack(theResStackoffset)=x(cp_loop_variable_1,cp_loop_variable_2,cp_loop_variable_3,cp_loop_variable_4)%v
                   end do
                end do
             end do
          end do
        end subroutine 


        subroutine cp_res_restore_real_four_tensor(x,cp_loop_variable_1,cp_loop_variable_2,cp_loop_variable_3,cp_loop_variable_4)
C $OpenAD$ INLINE DECLS
          implicit none
          double precision, dimension(:) :: x
C $OpenAD$ END DECLS
          do cp_loop_variable_1=ubound(x,1),lbound(x,1),-1
             do cp_loop_variable_2=lbound(x,2),ubound(x,2)
                do cp_loop_variable_3=ubound(x,3),lbound(x,3),-1
                   do cp_loop_variable_4=ubound(x,4),lbound(x,4),-1
                      x(cp_loop_variable_1,cp_loop_variable_2,cp_loop_variable_3,cp_loop_variable_4)%v=theResStack(theResStackoffset)
                      theResStackoffset=theResStackoffset-1
                   end do
                end do
             end do
          end do
        end subroutine 


        subroutine cp_arg_store_integer_scalar(i)
C $OpenAD$ INLINE DECLS
          implicit none
          integer :: i
C $OpenAD$ END DECLS
          theArgIStackoffset=theArgIStackoffset+1
          theArgIStack(theArgIStackoffset)=i
        end subroutine 


        subroutine cp_arg_restore_integer_scalar(i)
C $OpenAD$ INLINE DECLS
          implicit none
          integer :: i
C $OpenAD$ END DECLS
          i=theArgIStack(theArgIStackoffset)
          theArgIStackoffset=theArgIStackoffset-1
        end subroutine 


        subroutine cp_res_store_integer_scalar(i)
C $OpenAD$ INLINE DECLS
          implicit none
          integer :: i
C $OpenAD$ END DECLS
          theResIStackoffset=theResIStackoffset+1
          theResIStack(theResIStackoffset)=i
        end subroutine 


        subroutine cp_res_restore_integer_scalar(i)
C $OpenAD$ INLINE DECLS
          implicit none
          integer :: i
C $OpenAD$ END DECLS
          i=theResIStack(theResIStackoffset)
          theResIStackoffset=theResIStackoffset-1
        end subroutine 


        subroutine cp_arg_store_string_scalar(s)
C $OpenAD$ INLINE DECLS
          implicit none
          character*(80) :: s
C $OpenAD$ END DECLS
          theArgSStackoffset=theArgSStackoffset+1
          theArgSStack(theArgSStackoffset)=s
        end subroutine 


        subroutine cp_arg_restore_string_scalar(s)
C $OpenAD$ INLINE DECLS
          implicit none
          character*(80) :: s
C $OpenAD$ END DECLS
          s=theArgSStack(theArgSStackoffset)
          theArgSStackoffset=theArgSStackoffset-1
        end subroutine 


        subroutine cp_res_store_string_scalar(s)
C $OpenAD$ INLINE DECLS
          implicit none
          character*(80) :: s
C $OpenAD$ END DECLS
          theResSStackoffset=theResSStackoffset+1
          theResSStack(theResSStackoffset)=s
        end subroutine 


        subroutine cp_res_restore_string_scalar(s)
C $OpenAD$ INLINE DECLS
          implicit none
          character*(80) :: s
C $OpenAD$ END DECLS
          s=theResSStack(theResSStackoffset)
          theResSStackoffset=theResSStackoffset-1
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


        subroutine restore_mode()
C $OpenAD$ INLINE DECLS
          use OpenAD_rev
          implicit none
C $OpenAD$ END DECLS
          our_rev_mode=our_orig_mode
        end subroutine 

