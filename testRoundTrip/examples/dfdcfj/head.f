      subroutine head(x,fvec)
      double precision r
      double precision x(4), fvec(4)
c     **********
c
c     Subroutine dfdcfj
c
c     This subroutine computes the function and Jacobian matrix of the
c     flow in a driven cavity problem.
c
c     **********
      double precision four, one, three, two, zero
      integer i, j, k, n
      double precision dpdx, dpdy, hx, hx2, hx4, hx2hy2, hy, hy2, hy4,
     +                 p, pb, pbb, pbl, pblap, pbr, pl, plap, pll,
     +                 pllap, pr, prlap, prr, pt, ptl, ptlap, ptr, ptt,
     +                 xx, yy

      zero=0.0d0
      one=1.0d0
      two=2.0d0
      three=3.0d0
      four=4.0d0
      n = 4
      hx = one/three
      hy = one/three
      hx2 = hx*hx
      hy2 = hy*hy
      hx4 = hx2*hx2
      hy4 = hy2*hy2
      hx2hy2 = hx2*hy2

      do 60 i = 1, 2
         do 50 j = 1, 2
            k = (i-1)*2 + j
            if (i .eq. 1 .or. j .eq. 1) then
               pbl = zero
            else
               pbl = x(k-2-1)
            end if
            if (i .eq. 1) then
               pb = zero
               pbb = x(k)
            else if (i .eq. 2) then
               pb = x(k-2)
               pbb = zero
            else
               pb = x(k-2)
               pbb = x(k-2*2)
            end if
            if (i .eq. 1 .or. j .eq. 2) then
               pbr = zero
            else
               pbr = x(k-2+1)
            end if
            if (j .eq. 1) then
               pl = zero
               pll = x(k)
            else if (j .eq. 2) then
               pl = x(k-1)
               pll = zero
            else
               pl = x(k-1)
               pll = x(k-2)
            end if
            p = x(k)
            if (j .eq. 2-1) then
               pr = x(k+1)
               prr = zero
            else if (j .eq. 2) then
               pr = zero
               prr = x(k)
            else
               pr = x(k+1)
               prr = x(k+2)
            end if
            if (i .eq. 2 .or. j .eq. 1) then
               ptl = zero
            else
               ptl = x(k+2-1)
            end if
            if (i .eq. 2-1) then
               pt = x(k+2)
               ptt = zero
            else if (i .eq. 2) then
               pt = zero
               ptt = x(k) + two*hy
            else
               pt = x(k+2)
               ptt = x(k+2*2)
            end if
            if (i .eq. 2 .or. j .eq. 2) then
               ptr = zero
            else
               ptr = x(k+2+1)
            end if

            dpdy = (pt-pb)/(two*hy)
            dpdx = (pr-pl)/(two*hx)

c           Laplacians at each point in the 5 point stencil.

            pblap = (pbr-two*pb+pbl)/hx2 + (p-two*pb+pbb)/hy2
            pllap = (p-two*pl+pll)/hx2 + (ptl-two*pl+pbl)/hy2
            plap = (pr-two*p+pl)/hx2 + (pt-two*p+pb)/hy2
            prlap = (prr-two*pr+p)/hx2 + (ptr-two*pr+pbr)/hy2
            ptlap = (ptr-two*pt+ptl)/hx2 + (ptt-two*pt+p)/hy2

               fvec(k) = (prlap-two*plap+pllap)/hx2 +
     +                   (ptlap-two*plap+pblap)/hy2 -
     +                   r*(dpdy*(prlap-pllap)/(two*hx)-
     +                   dpdx*(ptlap-pblap)/(two*hy))

   50    continue
   60 continue

         do 70 k = 1, 4
            fvec(k) = hx2hy2*fvec(k)
   70    continue

      end subroutine
