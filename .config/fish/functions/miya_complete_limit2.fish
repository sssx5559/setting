function miya_complete_limit2
	set cmd (commandline -opc)
	if count $cmd -eq 2
		return 0
	else
		return 1
	end
end