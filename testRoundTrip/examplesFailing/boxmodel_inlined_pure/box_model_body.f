
c-----------------------------------------------------------------------
      subroutine head(xx,tsvec)
c-----------------------------------------------------------------------

      implicit none

      integer ndim
      parameter ( ndim = 3 )

c-- removed from common blocks:
c-- independent
      double precision xx(2*ndim)
c-- dependent
      double precision tsvec(2*ndim)

c -- local arguments removed from common blocks:
      double precision 
     &                 told(ndim)
     &               , tnow(ndim)
     &               , tnew(ndim)
     &               , sold(ndim)
     &               , snow(ndim)
     &               , snew(ndim)
      double precision t(ndim), s(ndim)
      double precision rho(ndim)
      double precision nullForce(ndim-1)
      double precision fw(ndim-1)
      double precision tStar(ndim-1)
      double precision sStar(ndim-1)
      double precision ubar
      double precision uvel

c-- declaring parameter and constants
      integer l, i, j
      integer iloop
      integer n_max

      double precision blength(ndim)
      double precision bheight(ndim)
      double precision bwidth
      double precision area(ndim)
      double precision vol(ndim)

      double precision y(2*ndim) 
      double precision r(2*ndim) 
      double precision r1(2*ndim) 
      double precision r_t(2*ndim) 
      double precision r_s(2*ndim) 
      double precision proj_t(2*ndim) 
      double precision proj_s(2*ndim) 
      double precision x(2*ndim,2*ndim)


      double precision alpha
      double precision beta

      double precision u0
      double precision delta

      double precision robert_filter_coeff

      double precision delta_t

      double precision hundred
      double precision thousand
      double precision day
      double precision year
      double precision Sv
      double precision days_per_50m_mixed_layer
      double precision gamma_T
      double precision gamma_S
      double precision epsilon_ic
      double precision noise_correlation_time
      double precision integration_time
      double precision epsilon_regularize
      double precision fdeps

      logical verbmode

      integer nlev1
      integer nlev2
      integer isbyte
      parameter ( nlev1  =  73 )
      parameter ( nlev2  =  50 )
      parameter ( isbyte =   8 )
      
c-- local variables:
      double precision dFldDt(ndim)

      integer ikey
      integer ilev1
      integer ilev2
      integer maxlev2

c-- routine body

c-- inititialise this before loop to avoid additional forward run!
CADJ INIT tapelev2    = USER
CADJ INIT comlevfinal = COMMON, 1

c-- initialise parameters
cph( 
cph INLINE START  ********************************************
      print *, 'box_ini_params START'

c-- set switches
      verbmode = .FALSE.

c-- box geometry:

c-- north-south size:
      blength(1)=5000.0D5
      blength(2)=1000.0D5
      blength(3)=blength(1)
c-- depth:
      bheight(1)=1.0D5
      bheight(3)=4.0D5
      bheight(2)=bheight(1)+bheight(3)
      delta= bheight(1)/(bheight(1)+bheight(3))
c-- bwidth:
      bwidth=4000.0D5
c-- areas:
      area(1)=blength(1)*bwidth
      area(2)=blength(2)*bwidth
      area(3)=blength(3)*bwidth
c-- volumes:
      vol(1)=area(1)*bheight(1)
      vol(2)=area(2)*(bheight(1)+bheight(3))
      vol(3)=area(3)*bheight(3)

c-- Robert filter
      robert_filter_coeff=0.25D0

c-- parameters for linearized model matrix:

      hundred  = 1.0D2
      thousand = 1.0D3
      day      = 3600.D0*24.D0
      year     = day*365.D0
      Sv       = 1.D12
      u0       = 16.D0*Sv/0.0004D0
      alpha    = 1668.D-7
      beta     = 0.781D-3

c-- set SST restoring time in days per 50 meters upper layer thickness:

      days_per_50m_mixed_layer = 50.D0
      gamma_T = 1./(300.D0*day)
      gamma_S = 0./((days_per_50m_mixed_layer*day)*
     &               (bheight(1)/50.D2))

c-- epsilon_ic multiplies the eigenvector of fastest growing mode,
c-- before using it as initial conditions in the short mode runs
      epsilon_ic = -1.D-4

c-- parameters for numerically solving the steady state problem:

      noise_correlation_time = day*15.D0
c-- time step:
      delta_t=5.D0*day
      print *, 'delta_t = ', delta_t
c-- integration time:
cph time to stable solution:
cph      integration_time=5000.D0*year
cph time for the optimization
      integration_time=50.D0*year
      print *, 'integration_time = ', integration_time
c-- number of time steps:
      n_max = INT((integration_time/delta_t))
      print *, 'n_max = ', n_max

      fdeps = 1.D-6

c-- a norm kernel that is just an energy norm (sum of squares)
c-- weighted by the respective variance during a model run under
c-- stochastic forcing.  each element here is 1/variance:
      Y(1) = thousand*1./0.03268D0
      Y(2) = thousand*1./0.00794D0
      Y(3) = thousand*1./0.00140D0
      Y(4) = thousand*1./0.1417D0
      Y(5) = thousand*1./0.1286D0
      Y(6) = thousand*1./0.0878D0

c-- A vector used to form a norm Kernel that measures amplitude of THC
c-- (the transport in the model, in Sv):
      R(1) =       delta*alpha
      R(2) =            -alpha
      R(3) =  (1.-delta)*alpha
      R(4) =       -delta*beta
      R(5) =              beta 
      R(6) =  -(1.-delta)*beta

      do l = 1, 2*ndim
         R(l) = R(l)*u0/Sv
      end do

c-- The thermohaline circulation due to the Salinity/ temperature
c-- effects alone is given by R_S*P, R_T*P:
      do l = 1, 2*ndim
         if ( l. LE. ndim ) then
            proj_t(l) = 1.
            proj_s(l) = 0.
         else
            proj_t(l) = 0.
            proj_s(l) = 1.
         endif
      enddo

      do  l = 1, 2*ndim
         R_T(l) = proj_t(l)*R(l)
         R_S(l) = proj_s(l)*R(l)
      enddo

c-- A vector that measures the temperature gradient (T_1-T_2).
c-- in conjunction with R above, this is used to form a Kernel that
c-- measures the meridional heat transport = U*(T_1-T_2):
      R1(1) =  1.D0
      R1(2) = -1.D0
      R1(3) =  0.D0
      R1(4) =  0.D0
      R1(5) =  0.D0
      R1(6) =  0.D0

      do j = 1, 2*ndim
         do i = 1, 2*ndim
            X(i,j) = R(i)*R(j)
c--            X1(i,j) = R(i)*R1(j)
         enddo
      enddo

c-- regularize the norm kernel using Petros' suggestion:
      epsilon_regularize=1.0D-8

      do j = 1, 2*ndim
         do i = 1, 2*ndim
            X(i,j) = X(i,j) + epsilon_regularize
         enddo
      enddo

cph INLINE END ********************************************
cph)


      print *, 'box_ini_fields START'
cph( 
cph INLINE START  ********************************************
cph      call box_ini_fields ( xx, tsvec )
c-- forcing initial conditions
      nullforce(1) = 0.D0
      nullforce(2) = 0.D0
      FW(1)=(hundred/year)*35.D0*Area(1)
      FW(2)=-FW(1)
      tStar(1) = 22.D0
      tStar(2) =  0.D0
      sStar(1) = 36.D0
      sStar(2) = 34.D0
c-- steady state initial conditions:
      ubar= 20.D0*Sv
      T(1)= 20.D0
      T(2)= 1.D0
      T(3)= 1.D0
      S(1)= 35.5D0
      S(2)= 34.5D0
      S(3)= 34.5D0
c-- initialise final state
      do l = 1, 2*ndim
         tsvec(l) = 0.
      end do
c-- apply perturbations
      do l = 1, ndim
         t(l) = t(l) + xx(l)
         s(l) = s(l) + xx(l+ndim)
      end do
c-- map onto model state
      do l = 1, ndim
         tNew(l) = t(l)
         sNew(l) = s(l)
         tOld(l) = t(l)
         sOld(l) = s(l)
         tNow(l) = t(l)
         sNow(l) = s(l)
      end do
      uvel = ubar
cph INLINE END ********************************************
cph)

      maxlev2 = n_max/nlev1 + 1
c      if ( nlev1*nlev2 .LT. n_max )
c     &     STOP 'NEED TO SET nlev1*nlev2 >= n_max '

      do ilev2 = 1, nlev2
       if ( ilev2 .LE. maxlev2 ) then

CADJ STORE tnow = tapelev2, key = ilev2
CADJ STORE told = tapelev2, key = ilev2
CADJ STORE snow = tapelev2, key = ilev2
CADJ STORE sold = tapelev2, key = ilev2

CADJ INIT comlev1 = COMMON, nlev1
        do ilev1 = 1, nlev1
         iloop = ( ilev2 - 1 )*nlev1 + ilev1
         if ( iloop .LE. n_max ) then

            ikey = ilev1
CADJ STORE tnow = comlev1, key = ikey, byte = isbyte
CADJ STORE snow = comlev1, key = ikey, byte = isbyte

c-- calculate densities:
cph( 
cph INLINE START  ********************************************
cph            call box_density( tNow, sNow, rho )
      do l = 1, ndim
         rho(l) = -alpha*tNow(l) + beta*sNow(l)
      end do
cph INLINE END ********************************************
cph)

c-- calculate transport:
cph( 
cph INLINE START  ********************************************
cph            call box_transport( rho, uVel )
      uVel = -u0*
     &     ( rho(1)*delta + rho(3)*(1.D0-delta) - rho(2) )
cph INLINE END ********************************************
cph)

CADJ STORE uvel = comlev1, key = ikey, byte = isbyte

c-- leap frog time stepping:
cph( 
cph INLINE START  ********************************************
cph            call box_timestep(
cph     &           'T', gamma_t, tStar, nullforce, 
cph     &           uVel, tNow, tOld, tNew )
      if ( uVel .GE. 0. ) then
         dFldDt(1) = 
     &        ( nullforce(1)
     &        + gamma_t*( tStar(1) - tNow(1) )*vol(1)
     &        + uVel* ( tNow(3)  - tNow(1) ) ) / vol(1)
         dFldDt(2) = 
     &        ( nullforce(2)
     &        + gamma_t*( tStar(2) - tNow(2) )*vol(2)
     &        + uVel* ( tNow(1)  - tNow(2) ) ) / vol(2)
         dFldDt(3) = 
     &        uVel*( tNow(2) - tNow(3) ) / vol(3)
      else
         dFldDt(1) = 
     &        ( nullforce(1)
     &        + gamma_t*( tStar(1) - tNow(1) )*vol(1)
     &        - uVel* ( tNow(2) -  tNow(1) ) ) / vol(1)
         dFldDt(2) = 
     &        ( nullforce(2)
     &        + gamma_t*( tStar(2) - tNow(2) )*vol(2)
     &        - uVel* ( tNow(3) -  tNow(2) ) ) / vol(2)
         dFldDt(3) = 
     &        -uVel*( tNow(1) - tNow(3) ) / vol(3)
      end if
      do l = 1, ndim
         tNew(l) = tOld(l) + 2.D0*delta_t*dFldDt(l)
      enddo
cph            call box_timestep (
cph     &           'S', gamma_s, sStar,        FW, 
cph     &           uVel, sNow, sOld, sNew )
      if ( uVel .GE. 0. ) then
         dFldDt(1) = 
     &        ( nullforce(1)
     &        + gamma_s*( sStar(1) - sNow(1) )*vol(1)
     &        + uVel* ( sNow(3)  - sNow(1) ) ) / vol(1)
         dFldDt(2) = 
     &        ( nullforce(2)
     &        + gamma_s*( sStar(2) - sNow(2) )*vol(2)
     &        + uVel* ( sNow(1)  - sNow(2) ) ) / vol(2)
         dFldDt(3) = 
     &        uVel*( sNow(2) - sNow(3) ) / vol(3)
      else
         dFldDt(1) = 
     &        ( nullforce(1)
     &        + gamma_s*( sStar(1) - sNow(1) )*vol(1)
     &        - uVel* ( sNow(2) -  sNow(1) ) ) / vol(1)
         dFldDt(2) = 
     &        ( nullforce(2)
     &        + gamma_s*( sStar(2) - sNow(2) )*vol(2)
     &        - uVel* ( sNow(3) -  sNow(2) ) ) / vol(2)
         dFldDt(3) = 
     &        -uVel*( sNow(1) - sNow(3) ) / vol(3)
      end if

      do l = 1, ndim
         sNew(l) = sOld(l) + 2.D0*delta_t*dFldDt(l)
      enddo
cph INLINE END ********************************************
cph)

c-- Robert filter:
cph( 
cph INLINE START  ********************************************
cph            call box_robert_filter( tNow, tOld, tNew )
cph            call box_robert_filter( sNow, sOld, sNew )
      do l = 1, ndim
         tNow(l) = tNow(l) + robert_filter_coeff*
     &               ( tNew(l) - 2.D0*tNow(l) + tOld(l) )
         sNow(l) = sNow(l) + robert_filter_coeff*
     &               ( sNew(l) - 2.D0*sNow(l) + sOld(l) )
      end do
cph INLINE END ********************************************
cph)

c-- cycle fields
cph( 
cph INLINE START  ********************************************
cph            call box_cycle_fields
      do l = 1, ndim
         tOld(l) = tNow(l)
         tNow(l) = tNew(l)
         sOld(l) = sNow(l)
         sNow(l) = sNew(l)
      enddo
cph INLINE END ********************************************
cph)

c-- end of if ( iloop .LE. n_max ) then
         endif
c-- end of ilev1 loop
        enddo
c-- end of if ( ilev2 .LE. maxlev2 ) then
       endif
c-- end of ilev2 loop
      enddo

      print *, 'box_final START'
cph( 
cph INLINE START  ********************************************
cph      call box_final_state(tsvec)
c-- re-initialise
      do i = 1, 2*ndim
         tsvec(i) = 0.
      end do
c-- move T,S into T-S-space

      do l = 1, ndim
         tsvec(l)      = tnow(l)
         tsvec(l+ndim) = snow(l)
      end do
cph INLINE END ********************************************
cph)

cph(
c-- taf seems to be confused by this
c-- It should recognize that there is no more dependency of
c-- tsvec on xx beyond box_final_state, shouldn't it?
c-- So, when tsvec rather than metric is the dependent variable,
c-- move this call to box_main, in order to hide it from TAF.
c-- Alternatively, I move box_metric before cost_finale_state:
c-- Now, taf correctly recognizes that metric isn't needed
c-- and kicks it out. That's good, but of course now it's missing.
cph      print *, 'box_metric START'
cph      call box_metric(tsvec)
cph)

      end
