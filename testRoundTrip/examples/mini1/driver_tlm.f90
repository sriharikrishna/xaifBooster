	program driver

	use active_module
	implicit none 

	external head

	type(active):: x, y
	real h

	type(active):: xph, yph

	x%v=.5D0
	h=0.0001

	open(2,file='tmpOutput/dd.out')
	write(2,*) "DD"
	xph%v=x%v+h
	call head(xph,yph)
	call head(x,y)
	write(2,*) "F(1,1)=",(yph%v-y%v)/h
	close(2)

	open(2,file='tmpOutput/ad.out')
	write(2,*) "AD"
	x%d=1.0
	call head(x,y)
        write(2,*) "F(1,1)=",y%d
	close(2)
        end


