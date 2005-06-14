	program driver

	  use active_module
          implicit none 

          external ad_roehf5

          ! inputs
          type(active) nrm1, nrm2, nrm3, priml1, priml2, priml3, priml4, priml5, primr1, primr2, primr3, primr4, primr5 
          type(active) gamma, gm1, gm1inv, nlefix
          type(active) lefix, mcheps

          type(active) nrm_ph1, nrm_ph2, nrm_ph3, priml_ph1, priml_ph2, priml_ph3, priml_ph4, priml_ph5, primr_ph1, primr_ph2, primr_ph3, primr_ph4, primr_ph5
          type(active) gamma_ph, gm1_ph, gm1inv_ph, nlefix_ph
          type(active) lefix_ph, mcheps_ph

          ! outputs
          type(active) flux1, flux2, flux3, flux4, flux5
          type(active) flux_ph1, flux_ph2, flux_ph3, flux_ph4, flux_ph5
          
	  double precision, dimension(19) :: x0
          real :: h=0.00001
          integer, parameter :: n=19, m=5
          integer i,j,k

	  do i=1,n   
            x0(i)=sqrt(1.*i)
          end do

          open(2,file='tmpOutput/dd.out')
          write(2,*) "DD"
          nrm1%v=x0(1)
          nrm2%v=x0(2)
          nrm3%v=x0(3)
          priml1%v=x0(4)
          priml2%v=x0(5)
          priml3%v=x0(6)
          priml4%v=x0(7)
          priml5%v=x0(8)
          primr1%v=x0(9)
          primr2%v=x0(10)
          primr3%v=x0(11)
          primr4%v=x0(12)
          primr5%v=x0(13)
          gamma%v=x0(14) 
          gm1%v=x0(15) 
          gm1inv%v=x0(16) 
          nlefix%v=x0(17)
          lefix%v=x0(18)
          mcheps%v=x0(19)

          call ad_roehf5 (nrm1, nrm2, nrm3, priml1, priml2, priml3, priml4, priml5, primr1, primr2, primr3, primr4, primr5, gamma, gm1, gm1inv, nlefix, lefix, mcheps, flux1, flux2, flux3, flux4, flux5)
          
	  do i=1,n   
              nrm_ph1%v=x0(1)
              nrm_ph2%v=x0(2)
              nrm_ph3%v=x0(3)
              priml_ph1%v=x0(4)
              priml_ph2%v=x0(5)
              priml_ph3%v=x0(6)
              priml_ph4%v=x0(7)
              priml_ph5%v=x0(8)
              primr_ph1%v=x0(9)
              primr_ph2%v=x0(10)
              primr_ph3%v=x0(11)
              primr_ph4%v=x0(12)
              primr_ph5%v=x0(13)
              gamma_ph%v=x0(14) 
              gm1_ph%v=x0(15) 
              gm1inv_ph%v=x0(16) 
              nlefix_ph%v=x0(17)
              lefix_ph%v=x0(18)
              mcheps_ph%v=x0(19)


              if (i==1) nrm_ph1%v=nrm_ph1%v+h
              if (i==2) nrm_ph2%v=nrm_ph2%v+h
              if (i==3) nrm_ph3%v=nrm_ph3%v+h
              if (i==4) priml_ph1%v=priml_ph1%v+h
              if (i==5) priml_ph2%v=priml_ph2%v+h
              if (i==6) priml_ph3%v=priml_ph3%v+h
              if (i==7) priml_ph4%v=priml_ph4%v+h
              if (i==8) priml_ph5%v=priml_ph5%v+h
              if (i==9) primr_ph1%v=primr_ph1%v+h
              if (i==10) primr_ph2%v=primr_ph2%v+h
              if (i==11) primr_ph3%v=primr_ph3%v+h
              if (i==12) primr_ph4%v=primr_ph4%v+h
              if (i==13) primr_ph5%v=primr_ph5%v+h
              if (i==14) gamma_ph%v=gamma_ph%v+h
              if (i==15) gm1_ph%v=gm1_ph%v+h
              if (i==16) gm1inv_ph%v=gm1inv_ph%v+h
              if (i==17) nlefix_ph%v=nlefix_ph%v+h
              if (i==18) lefix_ph%v=lefix_ph%v+h
              if (i==19) mcheps_ph%v=mcheps_ph%v+h
              call ad_roehf5 (nrm_ph1, nrm_ph2, nrm_ph3, priml_ph1, priml_ph2, priml_ph3, priml_ph4, priml_ph5, primr_ph1, primr_ph2, primr_ph3, primr_ph4, primr_ph5, gamma_ph, gm1_ph, gm1inv_ph, nlefix_ph, lefix_ph, mcheps_ph, flux_ph1, flux_ph2, flux_ph3, flux_ph4, flux_ph5)
              write(2,*) "F(",1,",",i,")=",(flux_ph1%v-flux1%v)/h
              write(2,*) "F(",2,",",i,")=",(flux_ph2%v-flux2%v)/h
              write(2,*) "F(",3,",",i,")=",(flux_ph3%v-flux3%v)/h
              write(2,*) "F(",4,",",i,")=",(flux_ph4%v-flux4%v)/h
              write(2,*) "F(",5,",",i,")=",(flux_ph5%v-flux5%v)/h
          end do
          close(2)

          open(2,file='tmpOutput/ad.out')
          write(2,*) "AD"
	  do i=1,n   
              nrm1%v=x0(1)
              nrm2%v=x0(2)
              nrm3%v=x0(3)
              priml1%v=x0(4)
              priml2%v=x0(5)
              priml3%v=x0(6)
              priml4%v=x0(7)
              priml5%v=x0(8)
              primr1%v=x0(9)
              primr2%v=x0(10)
              primr3%v=x0(11)
              primr4%v=x0(12)
              primr5%v=x0(13)
              gamma%v=x0(14) 
              gm1%v=x0(15) 
              gm1inv%v=x0(16) 
              nlefix%v=x0(17)
              lefix%v=x0(18)
              mcheps%v=x0(19)

              nrm1%d=0.
              nrm2%d=0.
              nrm3%d=0.
              priml1%d=0.
              priml2%d=0.
              priml3%d=0.
              priml4%d=0.
              priml5%d=0.
              primr1%d=0.
              primr2%d=0.
              primr3%d=0.
              primr4%d=0.
              primr5%d=0.
              gamma%d=0.
              gm1%d=0.
              gm1inv%d=0.
              nlefix%d=0.
              lefix%d=0.
              mcheps%d=0.
                if (i==1) nrm1%d=1.
                if (i==2) nrm2%d=1.
                if (i==3) nrm3%d=1.
                if (i==4) priml1%d=1.
                if (i==5) priml2%d=1.
                if (i==6) priml3%d=1.
                if (i==7) priml4%d=1.
                if (i==8) priml5%d=1.
                if (i==9) primr1%d=1.
                if (i==10) primr2%d=1.
                if (i==11) primr3%d=1.
                if (i==12) primr4%d=1.
                if (i==13) primr5%d=1.
                if (i==14) gamma%d=1.
                if (i==15) gm1%d=1.
                if (i==16) gm1inv%d=1.
                if (i==17) nlefix%d=1.
                if (i==18) lefix%d=1.
                if (i==19) mcheps%d=1.
            call ad_roehf5 (nrm1, nrm2, nrm3, priml1, priml2, priml3, priml4, priml5, primr1, primr2, primr3, primr4, primr5, gamma, gm1, gm1inv, nlefix, lefix, mcheps, flux1, flux2, flux3, flux4, flux5)
            write(2,*) "F(",1,",",i,")=",flux1%d
            write(2,*) "F(",2,",",i,")=",flux2%d
            write(2,*) "F(",3,",",i,")=",flux3%d
            write(2,*) "F(",4,",",i,")=",flux4%d
            write(2,*) "F(",5,",",i,")=",flux5%d
          end do
          close(2)

        end program driver
