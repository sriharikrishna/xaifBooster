      module all_globals_cp_mod
      
      use all_globals_mod
      use OpenAD_checkpoints

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
      double precision, dimension(:), allocatable :: sd
      integer, dimension(:), allocatable :: si
      character(80), dimension(:), allocatable :: ss
      logical, dimension(:), allocatable :: sb
      integer i

        call cp_store_int_scalar(n_max,si,ci,ai)

        call cp_store_real_vector(blength,ndim,sd,cd,ad)
        call cp_store_real_vector(bheight,ndim,sd,cd,ad)
        call cp_store_real_scalar(bwidth%v,sd,cd,ad)
        call cp_store_real_vector(area,ndim,sd,cd,ad)
        call cp_store_real_vector(vol,ndim,sd,cd,ad)

        call cp_store_real_vector(y,2*ndim,sd,cd,ad)
        call cp_store_real_vector(r,2*ndim,sd,cd,ad)
        call cp_store_real_vector(r1,2*ndim,sd,cd,ad)
        call cp_store_real_vector(r_t,2*ndim,sd,cd,ad)
        call cp_store_real_vector(r_s,2*ndim,sd,cd,ad)
        call cp_store_real_vector(proj_t,2*ndim,sd,cd,ad)
        call cp_store_real_vector(proj_s,2*ndim,sd,cd,ad)

        do i=lbound(x,1),ubound(x,1)
           call cp_store_real_vector(x(i,:),size(x(i,:)),sd,cd,ad)
        end do

        call cp_store_real_scalar(alpha%v,sd,cd,ad)
        call cp_store_real_scalar(beta%v,sd,cd,ad)

        call cp_store_real_scalar(u0%v,sd,cd,ad)
        call cp_store_real_scalar(delta%v,sd,cd,ad)

        call cp_store_real_scalar(robert_filter_coeff%v,sd,cd,ad)

        call cp_store_real_scalar(delta_t%v,sd,cd,ad)

        call cp_store_real_scalar(hundred%v,sd,cd,ad)
        call cp_store_real_scalar(thousand%v,sd,cd,ad)
        call cp_store_real_scalar(day%v,sd,cd,ad)
        call cp_store_real_scalar(year%v,sd,cd,ad)
        call cp_store_real_scalar(Sv%v,sd,cd,ad)
        call cp_store_real_scalar(days_per_50m_mixed_layer%v,sd,cd,ad)
        call cp_store_real_scalar(gamma_T%v,sd,cd,ad)
        call cp_store_real_scalar(gamma_S%v,sd,cd,ad)
        call cp_store_real_scalar(epsilon_ic%v,sd,cd,ad)
        call cp_store_real_scalar(noise_correlation_time%v,sd,cd,ad)
        call cp_store_real_scalar(integration_time%v,sd,cd,ad)
        call cp_store_real_scalar(epsilon_regularize%v,sd,cd,ad)
        call cp_store_real_scalar(fdeps%v,sd,cd,ad)

        call cp_store_bool_scalar(verbmode,sb,cb,ab)

        call cp_store_real_scalar(thc_tot%v,sd,cd,ad)
        call cp_store_real_scalar(thc_t%v,sd,cd,ad)
        call cp_store_real_scalar(thc_s%v,sd,cd,ad)

        call cp_store_real_vector(told,ndim,sd,cd,ad)
        call cp_store_real_vector(tnow,ndim,sd,cd,ad)
        call cp_store_real_vector(tnew,ndim,sd,cd,ad)
        call cp_store_real_vector(sold,ndim,sd,cd,ad)
        call cp_store_real_vector(snow,ndim,sd,cd,ad)
        call cp_store_real_vector(snew,ndim,sd,cd,ad)

        call cp_store_real_scalar(uvel%v,sd,cd,ad)

        call cp_store_real_vector(rho,ndim,sd,cd,ad)

        call cp_store_real_vector(nullForce,ndim-1,sd,cd,ad)
        call cp_store_real_vector(fw,ndim-1,sd,cd,ad)
        call cp_store_real_vector(tStar,ndim-1,sd,cd,ad)
        call cp_store_real_vector(sStar,ndim-1,sd,cd,ad)

        call cp_store_real_scalar(ubar%v,sd,cd,ad)

        call cp_store_real_vector(t,ndim,sd,cd,ad)
        call cp_store_real_vector(s,ndim,sd,cd,ad)

        call cp_store_real_scalar(metric1%v,sd,cd,ad)
        call cp_store_real_scalar(metric2%v,sd,cd,ad)
        call cp_store_real_scalar(metric%v,sd,cd,ad)

        call cp_store_real_vector(xx,2*ndim,sd,cd,ad)
        call cp_store_real_vector(tsvec,2*ndim,sd,cd,ad)

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
      integer i,j

        do i=ubound(tsvec,1),lbound(tsvec,1),-1
           tsvec(i)%v=sd(cd); cd=cd-1
        end do
        do i=ubound(xx,1),lbound(xx,1),-1
           xx(i)%v=sd(cd); cd=cd-1
        end do

        metric%v=sd(cd); cd=cd-1
        metric2%v=sd(cd); cd=cd-1
        metric1%v=sd(cd); cd=cd-1

        do i=ubound(s,1),lbound(s,1),-1
           s(i)%v=sd(cd); cd=cd-1
        end do
        do i=ubound(t,1),lbound(t,1),-1
           t(i)%v=sd(cd); cd=cd-1
        end do

        ubar%v=sd(cd); cd=cd-1

        do i=ubound(sStar,1),lbound(sStar,1),-1
           sStar(i)%v=sd(cd); cd=cd-1
        end do
        do i=ubound(tStar,1),lbound(tStar,1),-1
           tStar(i)%v=sd(cd); cd=cd-1
        end do
        do i=ubound(fw,1),lbound(fw,1),-1
           fw(i)%v=sd(cd); cd=cd-1
        end do
        do i=ubound(nullForce,1),lbound(nullForce,1),-1
           nullForce(i)%v=sd(cd); cd=cd-1
        end do

        do i=ubound(rho,1),lbound(rho,1),-1
           rho(i)%v=sd(cd); cd=cd-1
        end do

        uvel%v=sd(cd); cd=cd-1

        do i=ubound(snew,1),lbound(snew,1),-1
           snew(i)%v=sd(cd); cd=cd-1
        end do
        do i=ubound(snow,1),lbound(snow,1),-1
           snow(i)%v=sd(cd); cd=cd-1
        end do
        do i=ubound(sold,1),lbound(sold,1),-1
           sold(i)%v=sd(cd); cd=cd-1
        end do
        do i=ubound(tnew,1),lbound(tnew,1),-1
           tnew(i)%v=sd(cd); cd=cd-1
        end do
        do i=ubound(tnow,1),lbound(tnow,1),-1
           tnow(i)%v=sd(cd); cd=cd-1
        end do
        do i=ubound(told,1),lbound(told,1),-1
           told(i)%v=sd(cd); cd=cd-1
        end do

        thc_s%v=sd(cd); cd=cd-1
        thc_t%v=sd(cd); cd=cd-1
        thc_tot%v=sd(cd); cd=cd-1

        verbmode=sb(cb); cb=cb-1

        fdeps%v=sd(cd); cd=cd-1
        epsilon_regularize%v=sd(cd); cd=cd-1
        integration_time%v=sd(cd); cd=cd-1
        noise_correlation_time%v=sd(cd); cd=cd-1
        epsilon_ic%v=sd(cd); cd=cd-1
        gamma_S%v=sd(cd); cd=cd-1
        gamma_T%v=sd(cd); cd=cd-1
        days_per_50m_mixed_layer%v=sd(cd); cd=cd-1
        Sv%v=sd(cd); cd=cd-1
        year%v=sd(cd); cd=cd-1
        day%v=sd(cd); cd=cd-1
        thousand%v=sd(cd); cd=cd-1
        hundred%v=sd(cd); cd=cd-1

        delta_t%v=sd(cd); cd=cd-1

        robert_filter_coeff%v=sd(cd); cd=cd-1

        delta%v=sd(cd); cd=cd-1
        u0%v=sd(cd); cd=cd-1

        beta%v=sd(cd); cd=cd-1
        alpha%v=sd(cd); cd=cd-1

        do i=ubound(x,1),lbound(x,1),-1
           do j=ubound(x,2),lbound(x,2),-1
              x(i,j)%v=sd(cd); cd=cd-1
           end do
        end do

        do i=ubound(proj_s,1),lbound(proj_s,1),-1
           proj_s(i)%v=sd(cd); cd=cd-1
        end do
        do i=ubound(proj_t,1),lbound(proj_t,1),-1
           proj_t(i)%v=sd(cd); cd=cd-1
        end do
        do i=ubound(r_s,1),lbound(r_s,1),-1
           r_s(i)%v=sd(cd); cd=cd-1
        end do
        do i=ubound(r_t,1),lbound(r_t,1),-1
           r_t(i)%v=sd(cd); cd=cd-1
        end do
        do i=ubound(r1,1),lbound(r1,1),-1
           r1(i)%v=sd(cd); cd=cd-1
        end do
        do i=ubound(r,1),lbound(r,1),-1
           r(i)%v=sd(cd); cd=cd-1
        end do
        do i=ubound(y,1),lbound(y,1),-1
           y(i)%v=sd(cd); cd=cd-1
        end do

        do i=ubound(vol,1),lbound(vol,1),-1
           vol(i)%v=sd(cd); cd=cd-1
        end do
        do i=ubound(area,1),lbound(area,1),-1
           area(i)%v=sd(cd); cd=cd-1
        end do

        bwidth%v=sd(cd); cd=cd-1

        do i=ubound(bheight,1),lbound(bheight,1),-1
           bheight(i)%v=sd(cd); cd=cd-1
        end do
        do i=ubound(blength,1),lbound(blength,1),-1
           blength(i)%v=sd(cd); cd=cd-1
        end do

        n_max=si(ci); ci=ci-1

      end subroutine

      end module

