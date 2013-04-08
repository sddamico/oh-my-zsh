fastboot
#autoload

# in order to make this work, you will need to have the android fastboot tools

# fastboot zsh completion, based on adb completion

local -a _1st_arguments
_1st_arguments=(
'update:reflash device from update.zip'
'flashall:flash boot + recovery + system'
'flash:write a file to a flash partition'
'erase:erase a flash partition'
'getvar:display a bootloader variable'
'boot:download and boot kernel'
'flash\:r\ boot:create bootimage and flash it'
'devices:list all connected devices'
'reboot:reboot device normally'
'reboot-bootloader:reboot device into bootloader'
'setserial:set the device serial number'
'setrev:set the device hardware revision'
)

local expl
local -a pkgs installed_pkgs

_arguments \
	'*:: :->subcmds' && return 0

if (( CURRENT == 1 )); then
	_describe -t commands "fastboot subcommand" _1st_arguments
	return
fi

_files
