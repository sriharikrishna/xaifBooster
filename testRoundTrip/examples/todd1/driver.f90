	program driver

	  use active_module
          implicit none 

          external head

          type(active) obj,g_obj0,g_obj1,g_obj2,g_obj3,g_obj4,g_obj5
          type(active) x1,x2,x3,x4,x5,x6
          type(active) h_obj0,h_obj1,h_obj2,h_obj3,h_obj4,h_obj5,h_obj6,&
      &h_obj7,h_obj8,h_obj9,h_obj10,h_obj11,h_obj12,h_obj13,h_obj14,&
      &h_obj15,h_obj16,h_obj17,h_obj18,h_obj19,h_obj20

          type(active) objph,g_obj0ph,g_obj1ph,g_obj2ph,g_obj3ph,&
      &g_obj4ph,g_obj5ph,x1ph,x2ph,x3ph,x4ph,x5ph,x6ph,&
      &h_obj0ph,h_obj1ph,h_obj2ph,h_obj3ph,h_obj4ph,h_obj5ph,&
      &h_obj6ph,h_obj7ph,h_obj8ph,&
      &h_obj9ph,h_obj10ph,h_obj11ph,h_obj12ph,h_obj13ph,h_obj14ph,&
      &h_obj15ph,h_obj16ph,&
      &h_obj17ph,h_obj18ph,h_obj19ph,h_obj20ph

	  double precision, dimension(:), allocatable :: res_dd, res_ad
          real h
          integer n,m
          integer i

          open(2,action='read',file='params.conf')
          read(2,'(I5,/,I5,/,F8.1)') n, m, h
          close(2)

          
          allocate(res_dd(m))
          allocate(res_ad(m))

          open(2,file='tmpOutput/dd.out')
          write(2,*) "DD"
	  do i=1,n   
            ! equilateral triangle coordinates (x1,x2,x3,y1,y2,y3)
            x1%v=0.
            x2%v=.5
            x3%v=1.
            x4%v=0.
            x5%v=0.523598776
            x6%v=0.
            if (i==1) then 
              x1ph%v=x1%v+h
            else if (i==2) then 
              x2ph%v=x2%v+h
            else if (i==3) then 
              x3ph%v=x3%v+h
            else if (i==4) then 
              x4ph%v=x4%v+h
            else if (i==5) then 
              x5ph%v=x5%v+h
            else if (i==6) then 
              x6ph%v=x6%v+h
            end if
            call head(objph,g_obj0ph,g_obj1ph,g_obj2ph,g_obj3ph,&
        &g_obj4ph,g_obj5ph,x1ph,x2ph,x3ph,x4ph,x5ph,x6ph,&
        &h_obj0ph,h_obj1ph,h_obj2ph,h_obj3ph,h_obj4ph,h_obj5ph,&
        &h_obj6ph,h_obj7ph,h_obj8ph,&
        &h_obj9ph,h_obj10ph,h_obj11ph,h_obj12ph,h_obj13ph,h_obj14ph,&
        &h_obj15ph,h_obj16ph,&
        &h_obj17ph,h_obj18ph,h_obj19ph,h_obj20ph)
            call head(obj,g_obj0,g_obj1,g_obj2,g_obj3,&
        &g_obj4,g_obj5,x1,x2,x3,x4,x5,x6,&
        &h_obj0,h_obj1,h_obj2,h_obj3,h_obj4,h_obj5,h_obj6,h_obj7,h_obj8,&
        &h_obj9,h_obj10,h_obj11,h_obj12,h_obj13,h_obj14,h_obj15,h_obj16,&
        &h_obj17,h_obj18,h_obj19,h_obj20)
            res_dd(1)=(objph%v-obj%v)/h
            res_dd(2)=(g_obj0ph%v-g_obj0%v)/h
            res_dd(3)=(g_obj1ph%v-g_obj1%v)/h
            res_dd(4)=(g_obj2ph%v-g_obj2%v)/h
            res_dd(5)=(g_obj3ph%v-g_obj3%v)/h
            res_dd(6)=(g_obj4ph%v-g_obj4%v)/h
            res_dd(7)=(g_obj5ph%v-g_obj5%v)/h
            res_dd(9)=(h_obj0ph%v-h_obj0%v)/h
            res_dd(10)=(h_obj1ph%v-h_obj1%v)/h
            res_dd(11)=(h_obj2ph%v-h_obj2%v)/h
            res_dd(12)=(h_obj3ph%v-h_obj3%v)/h
            res_dd(13)=(h_obj4ph%v-h_obj4%v)/h
            res_dd(14)=(h_obj5ph%v-h_obj5%v)/h
            res_dd(15)=(h_obj6ph%v-h_obj6%v)/h
            res_dd(16)=(h_obj7ph%v-h_obj7%v)/h
            res_dd(17)=(h_obj8ph%v-h_obj8%v)/h
            res_dd(18)=(h_obj9ph%v-h_obj9%v)/h
            res_dd(19)=(h_obj10ph%v-h_obj10%v)/h
            res_dd(20)=(h_obj11ph%v-h_obj11%v)/h
            res_dd(21)=(h_obj12ph%v-h_obj12%v)/h
            res_dd(22)=(h_obj13ph%v-h_obj13%v)/h
            res_dd(23)=(h_obj14ph%v-h_obj14%v)/h
            res_dd(24)=(h_obj15ph%v-h_obj15%v)/h
            res_dd(25)=(h_obj16ph%v-h_obj16%v)/h
            res_dd(26)=(h_obj17ph%v-h_obj17%v)/h
            res_dd(27)=(h_obj18ph%v-h_obj18%v)/h
            res_dd(28)=(h_obj19ph%v-h_obj19%v)/h
            res_dd(29)=(h_obj20ph%v-h_obj20%v)/h
            write(2,*) "F(", i , ",:)= ", res_dd
          end do
          close(2)

          open(2,file='tmpOutput/ad.out')
          write(2,*) "AD"
	  do i=1,n   
            x1%v=0.
            x2%v=.5
            x3%v=1.
            x4%v=0.
            x5%v=0.523598776
            x6%v=0.
            x1%d=0.
            x2%d=0.
            x3%d=0.
            x4%d=0.
            x5%d=0.
            x6%d=0.
            if (i==1) then 
              x1ph%d=1.
            else if (i==2) then 
              x2ph%d=1.
            else if (i==3) then 
              x3ph%d=1.
            else if (i==4) then 
              x4ph%d=1.
            else if (i==5) then 
              x5ph%d=1.
            else if (i==6) then 
              x6ph%d=1.
            end if
            call head(obj,g_obj0,g_obj1,g_obj2,g_obj3,&
        &g_obj4,g_obj5,x1,x2,x3,x4,x5,x6,&
        &h_obj0,h_obj1,h_obj2,h_obj3,h_obj4,h_obj5,h_obj6,h_obj7,h_obj8,&
        &h_obj9,h_obj10,h_obj11,h_obj12,h_obj13,h_obj14,h_obj15,h_obj16,&
        &h_obj17,h_obj18,h_obj19,h_obj20)
            res_ad(1)=obj%v
            res_ad(2)=g_obj0%d
            res_ad(3)=g_obj1%d
            res_ad(4)=g_obj2%d
            res_ad(5)=g_obj3%d
            res_ad(6)=g_obj4%d
            res_ad(7)=g_obj5%d
            res_ad(9)=h_obj0%d
            res_ad(10)=h_obj1%d
            res_ad(11)=h_obj2%d
            res_ad(12)=h_obj3%d
            res_ad(13)=h_obj4%d
            res_ad(14)=h_obj5%d
            res_ad(15)=h_obj6%d
            res_ad(16)=h_obj7%d
            res_ad(17)=h_obj8%d
            res_ad(18)=h_obj9%d
            res_ad(19)=h_obj10%d
            res_ad(20)=h_obj11%d
            res_ad(21)=h_obj12%d
            res_ad(22)=h_obj13%d
            res_ad(23)=h_obj14%d
            res_ad(24)=h_obj15%d
            res_ad(25)=h_obj16%d
            res_ad(26)=h_obj17%d
            res_ad(27)=h_obj18%d
            res_ad(28)=h_obj19%d
            res_ad(29)=h_obj20%d
            write(2,*) "F(", i , ",:)= ", res_ad
          end do
          close(2)

          deallocate(res_dd)
          deallocate(res_ad)

        end


