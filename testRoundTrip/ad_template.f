        subroutine template(version)
          use OpenAD_dct
          use OpenAD_tape
          use OpenAD_checkpoints

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

!$TEMPLATE_PRAGMA_DECLARATIONS

          integer, intent(in), optional :: version

          call tape_init

          select case (version)
            case (1) 
! original function
!$PLACEHOLDER_PRAGMA$ id=1
! store results
!$PLACEHOLDER_PRAGMA$ id=6
            case (2) 
! store arguments
!$PLACEHOLDER_PRAGMA$ id=4
            case (3) 
! restore arguments
!$PLACEHOLDER_PRAGMA$ id=5
! tape
!$PLACEHOLDER_PRAGMA$ id=2
! adjoint
!$PLACEHOLDER_PRAGMA$ id=3
            case (4) 
! restore results
!$PLACEHOLDER_PRAGMA$ id=7
          end select

        end subroutine template
