# 1 "forward_model.F"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "forward_model.F"
cadj subroutine ini_io
cadj subroutine ini_io input =
cadj subroutine ini_io output =
cadj subroutine pfields_io
cadj subroutine pfields_io input =
cadj subroutine pfields_io output =
cadj subroutine state_io
cadj subroutine state_io input = 1, 2
cadj subroutine state_io output =
cadj subroutine determine_data_time
cadj subroutine determine_data_time input = 1
cadj subroutine determine_data_time output =
cadj function is_eta_data_time
cadj function is_eta_data_time input = 1
cadj subroutine read_eta_data
cadj subroutine read_eta_data input = 1
cadj subroutine read_eta_data output = 1
!cadj subroutine read_eta_data adname = read_eta_data
!cadj subroutine read_eta_data ftlname = read_eta_data

       subroutine forward_model( nctrl, xc, cost_final )

      implicit none

# 1 "includes/size.inc" 1
c
c size of the domain
c
      integer nx, ny
      parameter ( nx = 20, ny = 20 )
# 26 "forward_model.F" 2
# 1 "includes/parms.inc" 1
c
c basic parameters
c
      real g, earth, pi, deg2rad, rho0, invrho0
      parameter ( g = 9.81, earth = 6371000 )
      parameter ( pi = 3.14159265358979323844, deg2rad = pi/180. )
      parameter ( rho0 = 1028., invrho0 = 1./rho0 )
c
c ``variable'' parameters
c
      common /timeparameter/ dt, start_time, dt_dump, nt, ntspinup
      real dt, start_time, dt_dump
      integer nt, ntspinup
c
      common /iterpar/ iteration
      integer iteration
c
      common /parms/ om, f0, beta, rini, ah, xstart, ystart
      real om
      real f0, beta
      real rini
      real ah
      real xstart, ystart
c
c flags
c
      common /flags/ xperiodic, yperiodic, spherical, cartesian,
     & quadfric, suppressio, fullio,
     & initial_grad, grad_check, optimize, calc_hess
      logical xperiodic, yperiodic, spherical, cartesian, quadfric
      logical suppressio, fullio
      logical initial_grad, grad_check, optimize, calc_hess
c
c names
c
      common /names/ foutname, runname, depthfile, forcingfile,
     & uinifile, vinifile, etainifile, ncdatafile, ncrestartfile
      character*(80) foutname
      character*(80) runname
      character*(80) depthfile, forcingfile
      character*(80) uinifile, vinifile, etainifile
      character*(80) ncdatafile, ncrestartfile
c
# 27 "forward_model.F" 2
# 1 "includes/vars.inc" 1
c dynamic variables velocity and sea-surface height
      common /vars/ u, v, eta
      real u(0:nx+1,0:ny+1)
      real v(0:nx+1,0:ny+1)
      real eta(0:nx+1,0:ny+1)
c
# 28 "forward_model.F" 2
cph(
# 1 "includes/pfields.inc" 1
c parameter fields, like depth, grid etc.
      common /pfields/ fcoriu, fcoriv, depth, frict,
     & hu, hv, invhu, invhv
c coriolis parameter, depth, and friction coefficient
c defined at eta grid point
      real fcoriu(nx,ny)
      real fcoriv(nx,ny)
      real depth(0:nx+1,0:ny+1)
      real hu(0:nx+1,0:ny+1), hv(0:nx+1,0:ny+1)
      real invhu(0:nx+1,0:ny+1), invhv(0:nx+1,0:ny+1)
      real frict(0:nx+1,0:ny+1)
c
      common /geom/ x, y, dx, dy, rx, ry, hy
      real x(0:nx+1), y(0:ny+1)
      real dx(0:nx), dy(0:ny)
      real rx(0:ny+1), ry, hy(0:ny+1)
c
      common /mask/ umask, vmask, etamask
      real umask(0:nx+1,0:ny+1)
      real vmask(0:nx+1,0:ny+1)
      real etamask(0:nx+1,0:ny+1)
c
      common /ini/ inidepth, uini, vini, etaini
      real inidepth(nx,ny)
      real uini(nx,ny)
      real vini(nx,ny)
      real etaini(nx,ny)
c
      common /scales/ scaledepth, scaleu, scalev, scaleeta
      real scaledepth(nx,ny)
      real scaleu(nx,ny), scalev(nx,ny), scaleeta(nx,ny)
# 30 "forward_model.F" 2
# 1 "includes/weights.inc" 1
c
c weight matices are all diagonal for now
c
      common /weight_factors/ wf_depth, wf_eta, wf_u, wf_v,
     & wf_zonal_transport, wf_lapldepth, wf_graddepth
      real wf_depth, wf_eta, wf_u, wf_v, wf_lapldepth, wf_graddepth
      real wf_zonal_transport
c
      common /weights/ weight_depth, weight_eta, weight_u, weight_v,
     & weight_lapldepth, weight_graddepth, weight_zonal_transport
      real weight_depth(nx,nx,ny,ny)
      real weight_eta(nx,ny)
      real weight_u(nx,ny)
      real weight_v(nx,ny)
      real weight_lapldepth(nx,ny)
      real weight_graddepth(nx,ny)
      real weight_zonal_transport
c
# 31 "forward_model.F" 2
# 1 "includes/data.inc" 1
c
c data arrays
c
      common /data/ eta_data, u_data, v_data, depth_data,
     & eta_data_time, zonal_transport_data, nedt
      integer nedt, nedtmax
      parameter ( nedtmax = 1000 )
      real eta_data(nx,ny), u_data(nx,ny), v_data(nx,ny)
      real depth_data(nx,ny)
      real eta_data_time(nedtmax)
      real zonal_transport_data
c
# 32 "forward_model.F" 2
# 1 "includes/force.inc" 1
c forcing fields for momentum equations
      common /force/ uforce, vforce
      real uforce(nx,ny)
      real vforce(nx,ny)
c
# 33 "forward_model.F" 2
cph)

c interface
      integer nctrl
      real xc(nctrl)
      real cost_final
c end interface

c locals
      integer time_index, ntotal
      integer it, jt, nio
      logical calc_cost
      real cost_d, cost_sd, cost_gd, cost, time
c zonal volume transport
      real zonal_transport
c checkpoint frequency for tamc code
      integer nouter, ninner
      parameter ( ninner = 1000 )
      real routin
cph new from inlining
      integer ix, iy, jx, jy
      integer k
      real frictu, frictv
      real gradetau, gradetav
      real fv, fu
      logical is_eta_data_time
      external is_eta_data_time
      real one
      parameter ( one = 1. )
c
c we will need to store the dynamic variables u, v, and eta, so they
c do not have to be recomputed during the adjoint calculations, so far
c use two level checkpointing, intialize the outer tape (first tape
c level) here to avoid unecessary recomputation of the forward model.
c
cadj init tape_level_1 = 'state'
c
c determine whether to calculate cost function ( can save some time )
c
      if ( initial_grad .or. grad_check .or. optimize
     & .or. calc_hess ) then
         calc_cost = .true.
      else
         calc_cost = .false.
      end if
c
c initial local variables
c
      cost_d = 0.
      cost_sd = 0.
      cost_gd = 0.
      cost = 0.
c
cph(
cph call map_from_control_vector( nctrl, xc )
      k = 0
      do iy = 1, ny
         do ix = 1, nx
            if ( etamask(ix,iy) .ne. 0 ) then
               k = k+1
               depth(ix,iy) = scaledepth(ix,iy)*( one + xc(k) )
c print *, ix, iy, xc(k), depth(ix,iy)
c depth(ix,iy) = scaledepth(ix,iy) + xc(k)
c depth(ix,iy) = xc(k)
            end if
         end do
      end do
      if ( k .ne. nctrl ) then
         print *, 'map_from_control_vector: ',
     & 'dimensions of control vector are wrong'
         print *, k, ' should be ', nctrl
cun         stop
      end if
cph)
c
c calculate depth at the faces of the grid points ( u and v points )
c
cph(
cph call calc_depth_uv
c create depth at u and v points
      do iy = 1, ny+1
         do ix = 1, nx+1

            hu(ix,iy) = depth(ix,iy)*umask(ix,iy)
            hv(ix,iy) = depth(ix,iy)*vmask(ix,iy)

            if ( hu(ix,iy) .ne. 0. ) then
               invhu(ix,iy) = 1./hu(ix,iy)
            end if
            if ( hv(ix,iy) .ne. 0. ) then
               invhv(ix,iy) = 1./hv(ix,iy)
            end if
         end do
      end do

c$$$ open(20,file='huhv.dat',form='formatted',recl=102*20)
c$$$ write(20,'(102E20.12)') ((hu(ix,iy),ix=0,nx+1),iy=ny+1,0,-1)
c$$$ write(20,'(102E20.12)') ((hu(ix,iy),ix=0,nx+1),iy=ny+1,0,-1)
c$$$ close(20)
cph)
c
c initialize dynamic variables
c
cph(
cph call initial_values
      do iy = 1, ny
         do ix = 1, nx
            u(ix,iy) = uini(ix,iy)*umask(ix,iy)
            v(ix,iy) = vini(ix,iy)*vmask(ix,iy)
            eta(ix,iy) = etaini(ix,iy)*etamask(ix,iy)
         end do
      end do
c handle domain boundaries
      if ( xperiodic ) then
         do iy = 0, ny+1
            u(nx+1,iy) = u(1,iy)
            v(0,iy) = v(nx,iy)
            eta(0,iy) = eta(nx,iy)
         end do
      end if
      if ( yperiodic ) then
         do ix = 0, nx+1
            u(ix,0) = u(ix,ny)
            v(ix,ny+1) = v(ix,1)
            eta(ix,0) = eta(ix,0)
         end do
      end if
cph)
c
c initialize I/O
      if ( .not. suppressio ) then
cph(
cph these contains netcdf stuff. Can be avoided for OpenAD???
         call ini_io
         call pfields_io
cph)
      end if
c first cost function contribution is the time independend variable
c depth
      if ( calc_cost ) then
cph(
cph call cost_depth( cost_d )
      do iy = 1, ny
         do jy = 1, ny
            do ix = 1, nx
               do jx = 1, nx
                  cost_d = cost_d
     & + .5*(depth(ix,iy)-depth_data(ix,iy))
     & *weight_depth(ix,jx,iy,jy)
     & *(depth(jx,jy)-depth_data(jx,jy))
               end do
            end do
         end do
      end do
cph)
c call smoothness_lapldepth( cost_sd )
c call smoothness_graddepth( cost_gd )
      end if
c
c start time stepping
c
      nio = 0
      time_index = 0
      time = 0.
c
c total number of time steps include spin up
c
      ntotal = nt+ntspinup
c$$$c
c$$$c store the dynamic variables u, v, and eta, so they do not have
c$$$c to be recomputed during the adjoint calculations, so far use
c$$$c two level checkpointing
c$$$c
c$$$cadj init tape_level_1 = 'state'
c
c start integration over assimilation interval, determine the number
c of cycles for the outer loop of check pointing, round to the nearest
c integer larger than routin (ratio of total to inner loop cycles)
c
      routin = real(ntotal)/real(ninner)
      if ( routin .ne. ntotal/ninner ) then
         nouter = int( routin ) + 1
      else
         nouter = int( routin )
      end if
      if ( fullio .and. .not. suppressio ) then
         print *, 'number of outer loops',
     & ' = number of tape records = ', nouter
      end if
      time_index = 0
      time = start_time+time_index*dt
      if ( .not. suppressio ) then
         nio = nio + 1
         print *, 'Writing Time Step ', time_index
cph(
cph this contains netcdf stuff
cph call state_io( time, nio )
cph)
      end if
      do it = 1, nouter
c
cadj store u,v,eta = tape_level_1, key=it
cadj init tape_level_2 = common, ninner
c
         do jt = 1, ninner
            time_index = (it-1)*ninner+jt
            time = start_time+time_index*dt
            if ( time_index .le. ntotal ) then
c
cadj store u,v,eta = tape_level_2

cph(
cph call time_step( time_index )
!cadj init tape_level_aux = common, 1
c alternate evaluation of momentum equations, because coriolis is
c treated explicitly
               if ( mod(time_index,2) .ne. 0 ) then
!cadj store u = tape_level_aux
cph(
cph 2nd level inlining
cph call umomentum
      do iy = 1, ny
         do ix = 1, nx
            frictu = .5*(frict(ix,iy)+frict(ix-1,iy))*invhu(ix,iy)
            gradetau = (eta(ix,iy)-eta(ix-1,iy))
     & /(rx(iy)*.5*(dx(ix)+dx(ix-1)))
c factor .25 is contained in fcoriu
            fv = fcoriu(ix,iy)*( v(ix,iy) + v(ix-1,iy)
     & + v(ix,iy+1)+ v(ix-1,iy+1))
            u(ix,iy) = umask(ix,iy)/(1+0.5*frictu*dt)*(
     & (1-.5*frictu*dt)*u(ix,iy) - g*dt*gradetau + dt*fv
     & + dt*uforce(ix,iy)*invhu(ix,iy)
     & )
         end do
      end do
c handle domain boundaries
      if ( xperiodic ) then
         do iy = 0, ny+1
            u(nx+1,iy) = u(1,iy)
         end do
      end if
      if ( yperiodic ) then
c for coriolis term in v equation
         do ix = 0, nx+1
            u(ix,0) = u(ix,ny)
         end do
      end if
cph)
cph(
cph 2nd level inlining
cph call vmomentum
      do iy = 1, ny
         do ix = 1, nx
            frictv = .5*(frict(ix,iy)+frict(ix,iy-1))*invhv(ix,iy)
            gradetav = (eta(ix,iy)-eta(ix,iy-1))
     & /(ry*.5*(dy(iy)+dy(iy-1)))
c factor .25 is contained in fcoriv
            fu = fcoriv(ix,iy)*( u(ix,iy) + u(ix+1,iy)
     & + u(ix,iy-1)+ u(ix+1,iy-1))
            v(ix,iy) = vmask(ix,iy)/(1+0.5*frictv*dt)*(
     & (1-.5*frictv*dt)*v(ix,iy) - g*dt*gradetav - dt*fu
     & + dt*vforce(ix,iy)*invhv(ix,iy)
     & )
         end do
      end do
c handle domain boundaries
      if ( xperiodic ) then
         do iy = 0, ny+1
c for coriolis term in u equation
            v(0,iy) = v(nx,iy)
         end do
      end if
      if ( yperiodic ) then
         do ix = 0, nx+1
            v(ix,ny+1) = v(ix,1)
         end do
      end if
cph)
               else
!cadj store v = tape_level_aux
cph(
cph 2nd level inlining
cph call vmomentum
      do iy = 1, ny
         do ix = 1, nx
            frictv = .5*(frict(ix,iy)+frict(ix,iy-1))*invhv(ix,iy)
            gradetav = (eta(ix,iy)-eta(ix,iy-1))
     & /(ry*.5*(dy(iy)+dy(iy-1)))
c factor .25 is contained in fcoriv
            fu = fcoriv(ix,iy)*( u(ix,iy) + u(ix+1,iy)
     & + u(ix,iy-1)+ u(ix+1,iy-1))
            v(ix,iy) = vmask(ix,iy)/(1+0.5*frictv*dt)*(
     & (1-.5*frictv*dt)*v(ix,iy) - g*dt*gradetav - dt*fu
     & + dt*vforce(ix,iy)*invhv(ix,iy)
     & )
         end do
      end do
c handle domain boundaries
      if ( xperiodic ) then
         do iy = 0, ny+1
c for coriolis term in u equation
            v(0,iy) = v(nx,iy)
         end do
      end if
      if ( yperiodic ) then
         do ix = 0, nx+1
            v(ix,ny+1) = v(ix,1)
         end do
      end if
cph)
cph(
cph 2nd level inlining
cph call umomentum
      do iy = 1, ny
         do ix = 1, nx
            frictu = .5*(frict(ix,iy)+frict(ix-1,iy))*invhu(ix,iy)
            gradetau = (eta(ix,iy)-eta(ix-1,iy))
     & /(rx(iy)*.5*(dx(ix)+dx(ix-1)))
c factor .25 is contained in fcoriu
            fv = fcoriu(ix,iy)*( v(ix,iy) + v(ix-1,iy)
     & + v(ix,iy+1)+ v(ix-1,iy+1))
            u(ix,iy) = umask(ix,iy)/(1+0.5*frictu*dt)*(
     & (1-.5*frictu*dt)*u(ix,iy) - g*dt*gradetau + dt*fv
     & + dt*uforce(ix,iy)*invhu(ix,iy)
     & )
         end do
      end do
c handle domain boundaries
      if ( xperiodic ) then
         do iy = 0, ny+1
            u(nx+1,iy) = u(1,iy)
         end do
      end if
      if ( yperiodic ) then
c for coriolis term in v equation
         do ix = 0, nx+1
            u(ix,0) = u(ix,ny)
         end do
      end if
cph)
               end if
c
c continuity equation calculates eta
c
cph(
cph 2nd level inlining
cph call continuity
c eta equation
      do iy = 1, ny
         do ix = 1, nx
            eta(ix,iy) = eta(ix,iy) - etamask(ix,iy)*dt*(
     & (hu(ix+1,iy)*u(ix+1,iy) - hu(ix,iy)*u(ix,iy))
     & /(rx(iy)*dx(ix))
     & + ( hy(iy+1)* hv(ix,iy+1)*v(ix,iy+1)
     & - hy(iy) * hv(ix,iy) *v(ix,iy) )
     & /(ry*dy(iy))
     & )
         end do
      end do
c handle domain boundaries
      if ( xperiodic ) then
         do iy = 0, ny+1
            eta(0,iy) = eta(nx,iy)
         end do
      end if
      if ( yperiodic ) then
         do ix = 0, nx+1
            eta(ix,0) = eta(ix,ny)
         end do
      end if
cph)

               if ( ( time_index .gt. ntspinup ) .and. calc_cost ) then
cph(
cph call cost_function( time , cost )
c
c load the data
c
cun      if ( is_eta_data_time( time ) ) then
cph(
cph no observed eta are used for this experiment
cph i.e. simplified cost function!
cph call read_eta_data( time )
cph)
cun      end if
c
c calculate cost function, if there is only one data slab, or if
c the time step matches a data time
c
cun      if ( nedt .eq. -1 .or. is_eta_data_time( time ) ) then
      if ( nedt .eq. -1) then
c
c calculate cost function terms
c
c zonal transport
cph(
cph 2nd level inlining
cph call calc_zonal_transport( zonal_transport )
      ix = 6
      zonal_transport = 0.
      do iy = 1, ny
         zonal_transport = zonal_transport
     & + u(ix,iy)*dy(iy)*hu(ix,iy)
c & + u(ix,iy)*dy(iy)*( eta(ix-1,iy)+eta(ix,iy) )
      end do
cph)
c$$$ cf = cf + zonal_transport*wf_zonal_transport
         cost = cost + .5*(zonal_transport-zonal_transport_data)**2
     & *weight_zonal_transport
c
cun         do iy = 1, ny
cun            do ix = 1, nx
c sea surface height
cph cost = cost + .5*(eta(ix,iy)-eta_data(ix,iy))**2
cph & *weight_eta(ix,iy)
c velocity
cph cost = cost + .5*(u(ix,iy)-u_data(ix,iy))**2
cph & *weight_u(ix,iy)
cph cost = cost + .5*(v(ix,iy)-v_data(ix,iy))**2
cph & *weight_v(ix,iy)
cun            end do
cun         end do
      end if
cph)
               end if
c
c after stepping the model forward, store the dynamic variables
c
               if ( fullio .and. .not. suppressio .and.
     & ( mod(real(time_index)*dt,dt_dump) .eq. 0. ) ) then
                  nio = nio + 1
                  print *, 'Writing Time Step ', time_index
cph(
cph this contains netcdf stuff
cph call state_io( time, nio )
cph)
               end if
            end if
         end do
c
      end do
c$$$c overturning
c$$$ zonal_transport = 0.
c$$$ call calc_overturning( zonal_transport )
c$$$ print *, 'overturning transport = ', zonal_transport*1e-6, ' Sv'
c$$$ cost = zonal_transport
c zonal transport
      zonal_transport = 0.
cph(
cph call calc_zonal_transport( zonal_transport )
      ix = 6
      zonal_transport = 0.
      do iy = 1, ny
         zonal_transport = zonal_transport
     & + u(ix,iy)*dy(iy)*hu(ix,iy)
c & + u(ix,iy)*dy(iy)*( eta(ix-1,iy)+eta(ix,iy) )
      end do
cph)
      print *, 'zonal volume transport = ', zonal_transport*1e-6, ' Sv'
c
c save cost function value (to trick TAMC)
c
      cost_final = cost + cost_d + cost_sd + cost_gd

      if ( iteration .ge. 0 ) then
         open(10,file='cost.txt',form='formatted',position='append')
         write(10,'(I5,5E15.8)') iteration, cost_d, cost_sd, cost_gd,
     & cost, cost_final
         close(10)
         iteration = iteration + 1
      end if

      return
      end !subroutine forward_model
