        subroutine template(version)
          use OpenAD_dct
          use OpenAD_tape
          use OpenAD_checkpoints

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

!$TEMPLATE_PRAGMA_DECLARATIONS

          integer, intent(in), optional :: version

          ! checkpointing stacks and offsets
          integer, parameter :: theMaxStackSize=100
          integer :: cp_loop_variable
          double precision, dimension(theMaxStackSize), save :: 
     +theArgStack
          integer, save :: theArgStackoffset=0
          double precision, dimension(theMaxStackSize), save :: 
     +theResStack
          integer, save :: theResStackoffset=0
          integer, dimension(theMaxStackSize), save :: 
     +theArgIStack
          integer, save :: theArgIStackoffset=0
          integer, dimension(theMaxStackSize), save :: 
     +theResIStack
          integer, save :: theResIStackoffset=0

          call tape_init

          select case (version)
            case (1) 
! original function
!$PLACEHOLDER_PRAGMA$ id=1
            case (2) 
! store arguments
!$PLACEHOLDER_PRAGMA$ id=4
! original function
!$PLACEHOLDER_PRAGMA$ id=1
            case (3) 
! restore arguments
!$PLACEHOLDER_PRAGMA$ id=6
! tape
!$PLACEHOLDER_PRAGMA$ id=2
! adjoint
!$PLACEHOLDER_PRAGMA$ id=3
            case (4) 
! store results
!$PLACEHOLDER_PRAGMA$ id=5
! restore results
!$PLACEHOLDER_PRAGMA$ id=7
          end select

        end subroutine template
