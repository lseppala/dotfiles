function http-proxy
	if test (count $argv) -ne 1
		echo "Usage: http-proxy <on | off>"
		return 1
	end

	set mode $argv[1]
	networksetup -setwebproxystate 'Thunderbolt Ethernet Slot 1' $mode
	networksetup -setsecurewebproxystate 'Thunderbolt Ethernet Slot 1' $mode
end
