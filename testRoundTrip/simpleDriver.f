	program driver

	  use active_module

	  external bat

	  type(active) :: x1,x2,x3,x4
	  type(active) :: x1ph,x2ph,x3ph,x4ph
          real :: h=0.0001

	  do i=1,4   
	    select case (i) 
              case(1)  
                x1ph%v=1.0+h; x2ph%v=1.0; x3ph%v=1.0; x4ph%v=1.0
              case(2)  
                x1ph%v=1.0; x2ph%v=1.0+h; x3ph%v=1.0; x4ph%v=1.0
              case(3)  
                x1ph%v=1.0; x2ph%v=1.0; x3ph%v=1.0+h; x4ph%v=1.0
              case(4)  
                x1ph%v=1.0; x2ph%v=1.0; x3ph%v=1.0; x4ph%v=1.0+h
            end select
	    call head(x1ph,x2ph,x3ph,x4ph)
            write(*,'(A10,4F15.5)') "values: ", x1ph%v, x2ph%v, x3ph%v, x4ph%v
	    x1%v=1.; x2%v=1.; x3%v=1.; x4%v=1.
	    call head(x1,x2,x3,x4)
            write(*,'(A10,4F15.5)') "values: ", x1%v, x2%v, x3%v, x4%v
            write(*,'(A2,I1,A5,4F15.5)') "F(", i , ",:)= ", (x1ph%v-x1%v)/h, (x2ph%v-x2%v)/h, (x3ph%v-x3%v)/h, (x4ph%v-x4%v)/h
          end do


	  do i=1,4   
	    select case (i) 
              case(1)  
                x1%d=1.0; x2%d=0.0; x3%d=0.0; x4%d=0.0
              case(2)  
                x1%d=0.0; x2%d=1.0; x3%d=0.0; x4%d=0.0
              case(3)  
                x1%d=0.0; x2%d=0.0; x3%d=1.0; x4%d=0.0
              case(4)  
                x1%d=0.0; x2%d=0.0; x3%d=0.0; x4%d=1.0
            end select
	    x1%v=1.; x2%v=1.; x3%v=1.; x4%v=1.
	    call head(x1,x2,x3,x4)
            write(*,'(A10,4F15.5)') "values: ", x1%v, x2%v, x3%v, x4%v
            write(*,'(A2,I1,A5,4F15.5)') "F(", i , ",:)= ", x1%d, x2%d, x3%d, x4%d
          end do
        end


