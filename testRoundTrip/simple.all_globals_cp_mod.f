      module all_globals_cp_mod
      
      implicit none
      public :: cp_store_globals, cp_restore_globals

      interface cp_store_globals
        module procedure cp_store_globals_impl
      end interface cp_store_globals

      interface cp_restore_globals
        module procedure cp_restore_globals_impl
      end interface cp_restore_globals

      contains 

      subroutine cp_store_globals_impl(
     & sd,cd,ad,
     & si,ci,ai,
     & ss,cs,as,
     & sb,cb,ab)
      implicit none
      integer :: cd,ad,ci,ai,cs,as,cb,ab
      double precision, dimension(*) :: sd
      integer, dimension(*) :: si
      character(80), dimension(*) :: ss
      logical, dimension(*) :: sb
      end subroutine

      subroutine cp_restore_globals_impl(
     & sd,cd,
     & si,ci,
     & ss,cs,
     & sb,cb)
      implicit none
      integer :: cd,ad,ci,ai,cs,as,cb,ab
      double precision, dimension(*) :: sd
      integer, dimension(*) :: si
      character(80), dimension(*) :: ss
      logical, dimension(*) :: sb
      end subroutine

      end module

