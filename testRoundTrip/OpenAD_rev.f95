module OpenAD_rev
implicit none

public 

integer plainforward, taping, reverse, arg_store, res_store, arg_restore, res_restore

parameter (plainforward=0, taping=1, reverse=2, arg_store=3, res_store=4, arg_restore=5, res_restore=6)
	
integer :: OpenAD_rev_mode=plainforward, OpenAD_rev_orig_mode=plainforward
	
end module OpenAD_rev
