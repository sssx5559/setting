function miya_clipboard --description 'Copy/Paste on clipboard'
	if which xsel > /dev/null 2>&1
		# Linux
		alias C "xsel --clipboard"
		alias P "xsel -o --clipboard"
	else if which pbcopy > /dev/null 2>&1
		# Mac
		alias C "pbcopy"
		alias P "pbpaste"
	else if ls /dev/clipboard > /dev/null 2>&1
		# Cygwin
		alias C "> /dev/clipboard"
		alias P "cat /dev/clipboard"
	end
end
