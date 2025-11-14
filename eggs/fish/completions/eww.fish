# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_eww_global_optspecs
	string join \n debug force-wayland c/config= logs no-daemonize restart h/help V/version
end

function __fish_eww_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_eww_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_eww_using_subcommand
	set -l cmd (__fish_eww_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c eww -n "__fish_eww_needs_command" -s c -l config -d 'override path to configuration directory (directory that contains eww.yuck and eww.(s)css)' -r -F
complete -c eww -n "__fish_eww_needs_command" -l debug -d 'Write out debug logs. (To read the logs, run `eww logs`)'
complete -c eww -n "__fish_eww_needs_command" -l force-wayland -d 'Force eww to use wayland. This is a no-op if eww was compiled without wayland support'
complete -c eww -n "__fish_eww_needs_command" -l logs -d 'Watch the log output after executing the command'
complete -c eww -n "__fish_eww_needs_command" -l no-daemonize -d 'Avoid daemonizing eww'
complete -c eww -n "__fish_eww_needs_command" -l restart -d 'Restart the daemon completely before running the command'
complete -c eww -n "__fish_eww_needs_command" -s h -l help -d 'Print help'
complete -c eww -n "__fish_eww_needs_command" -s V -l version -d 'Print version'
complete -c eww -n "__fish_eww_needs_command" -f -a "shell-completions" -d 'Generate a shell completion script'
complete -c eww -n "__fish_eww_needs_command" -f -a "daemon" -d 'Start the Eww daemon'
complete -c eww -n "__fish_eww_needs_command" -f -a "logs" -d 'Print and watch the eww logs'
complete -c eww -n "__fish_eww_needs_command" -f -a "ping" -d 'Ping the eww server, checking if it is reachable'
complete -c eww -n "__fish_eww_needs_command" -f -a "update" -d 'Update the value of a variable, in a running eww instance'
complete -c eww -n "__fish_eww_needs_command" -f -a "poll" -d 'Update a polling variable using its script'
complete -c eww -n "__fish_eww_needs_command" -f -a "inspector" -d 'Open the GTK debugger'
complete -c eww -n "__fish_eww_needs_command" -f -a "open" -d 'Open a window'
complete -c eww -n "__fish_eww_needs_command" -f -a "open-many" -d 'Open multiple windows at once. NOTE: This will in the future be part of eww open, and will then be removed'
complete -c eww -n "__fish_eww_needs_command" -f -a "close" -d 'Close the given windows'
complete -c eww -n "__fish_eww_needs_command" -f -a "reload" -d 'Reload the configuration'
complete -c eww -n "__fish_eww_needs_command" -f -a "kill" -d 'Kill the eww daemon'
complete -c eww -n "__fish_eww_needs_command" -f -a "close-all" -d 'Close all windows, without killing the daemon'
complete -c eww -n "__fish_eww_needs_command" -f -a "state" -d 'Prints the variables used in all currently open window'
complete -c eww -n "__fish_eww_needs_command" -f -a "get" -d 'Get the value of a variable if defined'
complete -c eww -n "__fish_eww_needs_command" -f -a "list-windows" -d 'List the names of active windows'
complete -c eww -n "__fish_eww_needs_command" -f -a "active-windows" -d 'Show active window IDs, formatted linewise `<window_id>: <window_name>`'
complete -c eww -n "__fish_eww_needs_command" -f -a "debug" -d 'Print out the widget structure as seen by eww'
complete -c eww -n "__fish_eww_needs_command" -f -a "graph" -d 'Print out the scope graph structure in graphviz dot format'
complete -c eww -n "__fish_eww_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c eww -n "__fish_eww_using_subcommand shell-completions" -s s -l shell -r -f -a "{bash\t'',elvish\t'',fish\t'',powershell\t'',zsh\t''}"
complete -c eww -n "__fish_eww_using_subcommand shell-completions" -s c -l config -d 'override path to configuration directory (directory that contains eww.yuck and eww.(s)css)' -r -F
complete -c eww -n "__fish_eww_using_subcommand shell-completions" -l debug -d 'Write out debug logs. (To read the logs, run `eww logs`)'
complete -c eww -n "__fish_eww_using_subcommand shell-completions" -l force-wayland -d 'Force eww to use wayland. This is a no-op if eww was compiled without wayland support'
complete -c eww -n "__fish_eww_using_subcommand shell-completions" -l logs -d 'Watch the log output after executing the command'
complete -c eww -n "__fish_eww_using_subcommand shell-completions" -l no-daemonize -d 'Avoid daemonizing eww'
complete -c eww -n "__fish_eww_using_subcommand shell-completions" -l restart -d 'Restart the daemon completely before running the command'
complete -c eww -n "__fish_eww_using_subcommand shell-completions" -s h -l help -d 'Print help'
complete -c eww -n "__fish_eww_using_subcommand daemon" -s c -l config -d 'override path to configuration directory (directory that contains eww.yuck and eww.(s)css)' -r -F
complete -c eww -n "__fish_eww_using_subcommand daemon" -l debug -d 'Write out debug logs. (To read the logs, run `eww logs`)'
complete -c eww -n "__fish_eww_using_subcommand daemon" -l force-wayland -d 'Force eww to use wayland. This is a no-op if eww was compiled without wayland support'
complete -c eww -n "__fish_eww_using_subcommand daemon" -l logs -d 'Watch the log output after executing the command'
complete -c eww -n "__fish_eww_using_subcommand daemon" -l no-daemonize -d 'Avoid daemonizing eww'
complete -c eww -n "__fish_eww_using_subcommand daemon" -l restart -d 'Restart the daemon completely before running the command'
complete -c eww -n "__fish_eww_using_subcommand daemon" -s h -l help -d 'Print help'
complete -c eww -n "__fish_eww_using_subcommand logs" -s c -l config -d 'override path to configuration directory (directory that contains eww.yuck and eww.(s)css)' -r -F
complete -c eww -n "__fish_eww_using_subcommand logs" -l debug -d 'Write out debug logs. (To read the logs, run `eww logs`)'
complete -c eww -n "__fish_eww_using_subcommand logs" -l force-wayland -d 'Force eww to use wayland. This is a no-op if eww was compiled without wayland support'
complete -c eww -n "__fish_eww_using_subcommand logs" -l logs -d 'Watch the log output after executing the command'
complete -c eww -n "__fish_eww_using_subcommand logs" -l no-daemonize -d 'Avoid daemonizing eww'
complete -c eww -n "__fish_eww_using_subcommand logs" -l restart -d 'Restart the daemon completely before running the command'
complete -c eww -n "__fish_eww_using_subcommand logs" -s h -l help -d 'Print help'
complete -c eww -n "__fish_eww_using_subcommand ping" -s c -l config -d 'override path to configuration directory (directory that contains eww.yuck and eww.(s)css)' -r -F
complete -c eww -n "__fish_eww_using_subcommand ping" -l debug -d 'Write out debug logs. (To read the logs, run `eww logs`)'
complete -c eww -n "__fish_eww_using_subcommand ping" -l force-wayland -d 'Force eww to use wayland. This is a no-op if eww was compiled without wayland support'
complete -c eww -n "__fish_eww_using_subcommand ping" -l logs -d 'Watch the log output after executing the command'
complete -c eww -n "__fish_eww_using_subcommand ping" -l no-daemonize -d 'Avoid daemonizing eww'
complete -c eww -n "__fish_eww_using_subcommand ping" -l restart -d 'Restart the daemon completely before running the command'
complete -c eww -n "__fish_eww_using_subcommand ping" -s h -l help -d 'Print help'
complete -c eww -n "__fish_eww_using_subcommand update" -s c -l config -d 'override path to configuration directory (directory that contains eww.yuck and eww.(s)css)' -r -F
complete -c eww -n "__fish_eww_using_subcommand update" -l debug -d 'Write out debug logs. (To read the logs, run `eww logs`)'
complete -c eww -n "__fish_eww_using_subcommand update" -l force-wayland -d 'Force eww to use wayland. This is a no-op if eww was compiled without wayland support'
complete -c eww -n "__fish_eww_using_subcommand update" -l logs -d 'Watch the log output after executing the command'
complete -c eww -n "__fish_eww_using_subcommand update" -l no-daemonize -d 'Avoid daemonizing eww'
complete -c eww -n "__fish_eww_using_subcommand update" -l restart -d 'Restart the daemon completely before running the command'
complete -c eww -n "__fish_eww_using_subcommand update" -s h -l help -d 'Print help'
complete -c eww -n "__fish_eww_using_subcommand poll" -s c -l config -d 'override path to configuration directory (directory that contains eww.yuck and eww.(s)css)' -r -F
complete -c eww -n "__fish_eww_using_subcommand poll" -l debug -d 'Write out debug logs. (To read the logs, run `eww logs`)'
complete -c eww -n "__fish_eww_using_subcommand poll" -l force-wayland -d 'Force eww to use wayland. This is a no-op if eww was compiled without wayland support'
complete -c eww -n "__fish_eww_using_subcommand poll" -l logs -d 'Watch the log output after executing the command'
complete -c eww -n "__fish_eww_using_subcommand poll" -l no-daemonize -d 'Avoid daemonizing eww'
complete -c eww -n "__fish_eww_using_subcommand poll" -l restart -d 'Restart the daemon completely before running the command'
complete -c eww -n "__fish_eww_using_subcommand poll" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c eww -n "__fish_eww_using_subcommand inspector" -s c -l config -d 'override path to configuration directory (directory that contains eww.yuck and eww.(s)css)' -r -F
complete -c eww -n "__fish_eww_using_subcommand inspector" -l debug -d 'Write out debug logs. (To read the logs, run `eww logs`)'
complete -c eww -n "__fish_eww_using_subcommand inspector" -l force-wayland -d 'Force eww to use wayland. This is a no-op if eww was compiled without wayland support'
complete -c eww -n "__fish_eww_using_subcommand inspector" -l logs -d 'Watch the log output after executing the command'
complete -c eww -n "__fish_eww_using_subcommand inspector" -l no-daemonize -d 'Avoid daemonizing eww'
complete -c eww -n "__fish_eww_using_subcommand inspector" -l restart -d 'Restart the daemon completely before running the command'
complete -c eww -n "__fish_eww_using_subcommand inspector" -s h -l help -d 'Print help'
complete -c eww -n "__fish_eww_using_subcommand open" -l id -r
complete -c eww -n "__fish_eww_using_subcommand open" -l screen -d 'The identifier of the monitor the window should open on' -r
complete -c eww -n "__fish_eww_using_subcommand open" -s p -l pos -d 'The position of the window, where it should open. (i.e.: 200x100)' -r
complete -c eww -n "__fish_eww_using_subcommand open" -s s -l size -d 'The size of the window to open (i.e.: 200x100)' -r
complete -c eww -n "__fish_eww_using_subcommand open" -s a -l anchor -d 'Sidepoint of the window, formatted like "top right"' -r
complete -c eww -n "__fish_eww_using_subcommand open" -l duration -d 'Automatically close the window after a specified amount of time, i.e.: 1s' -r
complete -c eww -n "__fish_eww_using_subcommand open" -l arg -d 'Define a variable for the window, i.e.: `--arg "var_name=value"`' -r
complete -c eww -n "__fish_eww_using_subcommand open" -s c -l config -d 'override path to configuration directory (directory that contains eww.yuck and eww.(s)css)' -r -F
complete -c eww -n "__fish_eww_using_subcommand open" -l toggle -d 'If the window is already open, close it instead'
complete -c eww -n "__fish_eww_using_subcommand open" -l debug -d 'Write out debug logs. (To read the logs, run `eww logs`)'
complete -c eww -n "__fish_eww_using_subcommand open" -l force-wayland -d 'Force eww to use wayland. This is a no-op if eww was compiled without wayland support'
complete -c eww -n "__fish_eww_using_subcommand open" -l logs -d 'Watch the log output after executing the command'
complete -c eww -n "__fish_eww_using_subcommand open" -l no-daemonize -d 'Avoid daemonizing eww'
complete -c eww -n "__fish_eww_using_subcommand open" -l restart -d 'Restart the daemon completely before running the command'
complete -c eww -n "__fish_eww_using_subcommand open" -s h -l help -d 'Print help'
complete -c eww -n "__fish_eww_using_subcommand open-many" -l arg -d 'Define a variable for the window, i.e.: `--arg "window_id:var_name=value"`' -r
complete -c eww -n "__fish_eww_using_subcommand open-many" -s c -l config -d 'override path to configuration directory (directory that contains eww.yuck and eww.(s)css)' -r -F
complete -c eww -n "__fish_eww_using_subcommand open-many" -l toggle -d 'If a window is already open, close it instead'
complete -c eww -n "__fish_eww_using_subcommand open-many" -l debug -d 'Write out debug logs. (To read the logs, run `eww logs`)'
complete -c eww -n "__fish_eww_using_subcommand open-many" -l force-wayland -d 'Force eww to use wayland. This is a no-op if eww was compiled without wayland support'
complete -c eww -n "__fish_eww_using_subcommand open-many" -l logs -d 'Watch the log output after executing the command'
complete -c eww -n "__fish_eww_using_subcommand open-many" -l no-daemonize -d 'Avoid daemonizing eww'
complete -c eww -n "__fish_eww_using_subcommand open-many" -l restart -d 'Restart the daemon completely before running the command'
complete -c eww -n "__fish_eww_using_subcommand open-many" -s h -l help -d 'Print help'
complete -c eww -n "__fish_eww_using_subcommand close" -s c -l config -d 'override path to configuration directory (directory that contains eww.yuck and eww.(s)css)' -r -F
complete -c eww -n "__fish_eww_using_subcommand close" -l debug -d 'Write out debug logs. (To read the logs, run `eww logs`)'
complete -c eww -n "__fish_eww_using_subcommand close" -l force-wayland -d 'Force eww to use wayland. This is a no-op if eww was compiled without wayland support'
complete -c eww -n "__fish_eww_using_subcommand close" -l logs -d 'Watch the log output after executing the command'
complete -c eww -n "__fish_eww_using_subcommand close" -l no-daemonize -d 'Avoid daemonizing eww'
complete -c eww -n "__fish_eww_using_subcommand close" -l restart -d 'Restart the daemon completely before running the command'
complete -c eww -n "__fish_eww_using_subcommand close" -s h -l help -d 'Print help'
complete -c eww -n "__fish_eww_using_subcommand reload" -s c -l config -d 'override path to configuration directory (directory that contains eww.yuck and eww.(s)css)' -r -F
complete -c eww -n "__fish_eww_using_subcommand reload" -l debug -d 'Write out debug logs. (To read the logs, run `eww logs`)'
complete -c eww -n "__fish_eww_using_subcommand reload" -l force-wayland -d 'Force eww to use wayland. This is a no-op if eww was compiled without wayland support'
complete -c eww -n "__fish_eww_using_subcommand reload" -l logs -d 'Watch the log output after executing the command'
complete -c eww -n "__fish_eww_using_subcommand reload" -l no-daemonize -d 'Avoid daemonizing eww'
complete -c eww -n "__fish_eww_using_subcommand reload" -l restart -d 'Restart the daemon completely before running the command'
complete -c eww -n "__fish_eww_using_subcommand reload" -s h -l help -d 'Print help'
complete -c eww -n "__fish_eww_using_subcommand kill" -s c -l config -d 'override path to configuration directory (directory that contains eww.yuck and eww.(s)css)' -r -F
complete -c eww -n "__fish_eww_using_subcommand kill" -l debug -d 'Write out debug logs. (To read the logs, run `eww logs`)'
complete -c eww -n "__fish_eww_using_subcommand kill" -l force-wayland -d 'Force eww to use wayland. This is a no-op if eww was compiled without wayland support'
complete -c eww -n "__fish_eww_using_subcommand kill" -l logs -d 'Watch the log output after executing the command'
complete -c eww -n "__fish_eww_using_subcommand kill" -l no-daemonize -d 'Avoid daemonizing eww'
complete -c eww -n "__fish_eww_using_subcommand kill" -l restart -d 'Restart the daemon completely before running the command'
complete -c eww -n "__fish_eww_using_subcommand kill" -s h -l help -d 'Print help'
complete -c eww -n "__fish_eww_using_subcommand close-all" -s c -l config -d 'override path to configuration directory (directory that contains eww.yuck and eww.(s)css)' -r -F
complete -c eww -n "__fish_eww_using_subcommand close-all" -l debug -d 'Write out debug logs. (To read the logs, run `eww logs`)'
complete -c eww -n "__fish_eww_using_subcommand close-all" -l force-wayland -d 'Force eww to use wayland. This is a no-op if eww was compiled without wayland support'
complete -c eww -n "__fish_eww_using_subcommand close-all" -l logs -d 'Watch the log output after executing the command'
complete -c eww -n "__fish_eww_using_subcommand close-all" -l no-daemonize -d 'Avoid daemonizing eww'
complete -c eww -n "__fish_eww_using_subcommand close-all" -l restart -d 'Restart the daemon completely before running the command'
complete -c eww -n "__fish_eww_using_subcommand close-all" -s h -l help -d 'Print help'
complete -c eww -n "__fish_eww_using_subcommand state" -s c -l config -d 'override path to configuration directory (directory that contains eww.yuck and eww.(s)css)' -r -F
complete -c eww -n "__fish_eww_using_subcommand state" -s a -l all -d 'Shows all variables, including not currently used ones'
complete -c eww -n "__fish_eww_using_subcommand state" -l debug -d 'Write out debug logs. (To read the logs, run `eww logs`)'
complete -c eww -n "__fish_eww_using_subcommand state" -l force-wayland -d 'Force eww to use wayland. This is a no-op if eww was compiled without wayland support'
complete -c eww -n "__fish_eww_using_subcommand state" -l logs -d 'Watch the log output after executing the command'
complete -c eww -n "__fish_eww_using_subcommand state" -l no-daemonize -d 'Avoid daemonizing eww'
complete -c eww -n "__fish_eww_using_subcommand state" -l restart -d 'Restart the daemon completely before running the command'
complete -c eww -n "__fish_eww_using_subcommand state" -s h -l help -d 'Print help'
complete -c eww -n "__fish_eww_using_subcommand get" -s c -l config -d 'override path to configuration directory (directory that contains eww.yuck and eww.(s)css)' -r -F
complete -c eww -n "__fish_eww_using_subcommand get" -l debug -d 'Write out debug logs. (To read the logs, run `eww logs`)'
complete -c eww -n "__fish_eww_using_subcommand get" -l force-wayland -d 'Force eww to use wayland. This is a no-op if eww was compiled without wayland support'
complete -c eww -n "__fish_eww_using_subcommand get" -l logs -d 'Watch the log output after executing the command'
complete -c eww -n "__fish_eww_using_subcommand get" -l no-daemonize -d 'Avoid daemonizing eww'
complete -c eww -n "__fish_eww_using_subcommand get" -l restart -d 'Restart the daemon completely before running the command'
complete -c eww -n "__fish_eww_using_subcommand get" -s h -l help -d 'Print help'
complete -c eww -n "__fish_eww_using_subcommand list-windows" -s c -l config -d 'override path to configuration directory (directory that contains eww.yuck and eww.(s)css)' -r -F
complete -c eww -n "__fish_eww_using_subcommand list-windows" -l debug -d 'Write out debug logs. (To read the logs, run `eww logs`)'
complete -c eww -n "__fish_eww_using_subcommand list-windows" -l force-wayland -d 'Force eww to use wayland. This is a no-op if eww was compiled without wayland support'
complete -c eww -n "__fish_eww_using_subcommand list-windows" -l logs -d 'Watch the log output after executing the command'
complete -c eww -n "__fish_eww_using_subcommand list-windows" -l no-daemonize -d 'Avoid daemonizing eww'
complete -c eww -n "__fish_eww_using_subcommand list-windows" -l restart -d 'Restart the daemon completely before running the command'
complete -c eww -n "__fish_eww_using_subcommand list-windows" -s h -l help -d 'Print help'
complete -c eww -n "__fish_eww_using_subcommand active-windows" -s c -l config -d 'override path to configuration directory (directory that contains eww.yuck and eww.(s)css)' -r -F
complete -c eww -n "__fish_eww_using_subcommand active-windows" -l debug -d 'Write out debug logs. (To read the logs, run `eww logs`)'
complete -c eww -n "__fish_eww_using_subcommand active-windows" -l force-wayland -d 'Force eww to use wayland. This is a no-op if eww was compiled without wayland support'
complete -c eww -n "__fish_eww_using_subcommand active-windows" -l logs -d 'Watch the log output after executing the command'
complete -c eww -n "__fish_eww_using_subcommand active-windows" -l no-daemonize -d 'Avoid daemonizing eww'
complete -c eww -n "__fish_eww_using_subcommand active-windows" -l restart -d 'Restart the daemon completely before running the command'
complete -c eww -n "__fish_eww_using_subcommand active-windows" -s h -l help -d 'Print help'
complete -c eww -n "__fish_eww_using_subcommand debug" -s c -l config -d 'override path to configuration directory (directory that contains eww.yuck and eww.(s)css)' -r -F
complete -c eww -n "__fish_eww_using_subcommand debug" -l debug -d 'Write out debug logs. (To read the logs, run `eww logs`)'
complete -c eww -n "__fish_eww_using_subcommand debug" -l force-wayland -d 'Force eww to use wayland. This is a no-op if eww was compiled without wayland support'
complete -c eww -n "__fish_eww_using_subcommand debug" -l logs -d 'Watch the log output after executing the command'
complete -c eww -n "__fish_eww_using_subcommand debug" -l no-daemonize -d 'Avoid daemonizing eww'
complete -c eww -n "__fish_eww_using_subcommand debug" -l restart -d 'Restart the daemon completely before running the command'
complete -c eww -n "__fish_eww_using_subcommand debug" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c eww -n "__fish_eww_using_subcommand graph" -s c -l config -d 'override path to configuration directory (directory that contains eww.yuck and eww.(s)css)' -r -F
complete -c eww -n "__fish_eww_using_subcommand graph" -l debug -d 'Write out debug logs. (To read the logs, run `eww logs`)'
complete -c eww -n "__fish_eww_using_subcommand graph" -l force-wayland -d 'Force eww to use wayland. This is a no-op if eww was compiled without wayland support'
complete -c eww -n "__fish_eww_using_subcommand graph" -l logs -d 'Watch the log output after executing the command'
complete -c eww -n "__fish_eww_using_subcommand graph" -l no-daemonize -d 'Avoid daemonizing eww'
complete -c eww -n "__fish_eww_using_subcommand graph" -l restart -d 'Restart the daemon completely before running the command'
complete -c eww -n "__fish_eww_using_subcommand graph" -s h -l help -d 'Print help'
complete -c eww -n "__fish_eww_using_subcommand help; and not __fish_seen_subcommand_from shell-completions daemon logs ping update poll inspector open open-many close reload kill close-all state get list-windows active-windows debug graph help" -f -a "shell-completions" -d 'Generate a shell completion script'
complete -c eww -n "__fish_eww_using_subcommand help; and not __fish_seen_subcommand_from shell-completions daemon logs ping update poll inspector open open-many close reload kill close-all state get list-windows active-windows debug graph help" -f -a "daemon" -d 'Start the Eww daemon'
complete -c eww -n "__fish_eww_using_subcommand help; and not __fish_seen_subcommand_from shell-completions daemon logs ping update poll inspector open open-many close reload kill close-all state get list-windows active-windows debug graph help" -f -a "logs" -d 'Print and watch the eww logs'
complete -c eww -n "__fish_eww_using_subcommand help; and not __fish_seen_subcommand_from shell-completions daemon logs ping update poll inspector open open-many close reload kill close-all state get list-windows active-windows debug graph help" -f -a "ping" -d 'Ping the eww server, checking if it is reachable'
complete -c eww -n "__fish_eww_using_subcommand help; and not __fish_seen_subcommand_from shell-completions daemon logs ping update poll inspector open open-many close reload kill close-all state get list-windows active-windows debug graph help" -f -a "update" -d 'Update the value of a variable, in a running eww instance'
complete -c eww -n "__fish_eww_using_subcommand help; and not __fish_seen_subcommand_from shell-completions daemon logs ping update poll inspector open open-many close reload kill close-all state get list-windows active-windows debug graph help" -f -a "poll" -d 'Update a polling variable using its script'
complete -c eww -n "__fish_eww_using_subcommand help; and not __fish_seen_subcommand_from shell-completions daemon logs ping update poll inspector open open-many close reload kill close-all state get list-windows active-windows debug graph help" -f -a "inspector" -d 'Open the GTK debugger'
complete -c eww -n "__fish_eww_using_subcommand help; and not __fish_seen_subcommand_from shell-completions daemon logs ping update poll inspector open open-many close reload kill close-all state get list-windows active-windows debug graph help" -f -a "open" -d 'Open a window'
complete -c eww -n "__fish_eww_using_subcommand help; and not __fish_seen_subcommand_from shell-completions daemon logs ping update poll inspector open open-many close reload kill close-all state get list-windows active-windows debug graph help" -f -a "open-many" -d 'Open multiple windows at once. NOTE: This will in the future be part of eww open, and will then be removed'
complete -c eww -n "__fish_eww_using_subcommand help; and not __fish_seen_subcommand_from shell-completions daemon logs ping update poll inspector open open-many close reload kill close-all state get list-windows active-windows debug graph help" -f -a "close" -d 'Close the given windows'
complete -c eww -n "__fish_eww_using_subcommand help; and not __fish_seen_subcommand_from shell-completions daemon logs ping update poll inspector open open-many close reload kill close-all state get list-windows active-windows debug graph help" -f -a "reload" -d 'Reload the configuration'
complete -c eww -n "__fish_eww_using_subcommand help; and not __fish_seen_subcommand_from shell-completions daemon logs ping update poll inspector open open-many close reload kill close-all state get list-windows active-windows debug graph help" -f -a "kill" -d 'Kill the eww daemon'
complete -c eww -n "__fish_eww_using_subcommand help; and not __fish_seen_subcommand_from shell-completions daemon logs ping update poll inspector open open-many close reload kill close-all state get list-windows active-windows debug graph help" -f -a "close-all" -d 'Close all windows, without killing the daemon'
complete -c eww -n "__fish_eww_using_subcommand help; and not __fish_seen_subcommand_from shell-completions daemon logs ping update poll inspector open open-many close reload kill close-all state get list-windows active-windows debug graph help" -f -a "state" -d 'Prints the variables used in all currently open window'
complete -c eww -n "__fish_eww_using_subcommand help; and not __fish_seen_subcommand_from shell-completions daemon logs ping update poll inspector open open-many close reload kill close-all state get list-windows active-windows debug graph help" -f -a "get" -d 'Get the value of a variable if defined'
complete -c eww -n "__fish_eww_using_subcommand help; and not __fish_seen_subcommand_from shell-completions daemon logs ping update poll inspector open open-many close reload kill close-all state get list-windows active-windows debug graph help" -f -a "list-windows" -d 'List the names of active windows'
complete -c eww -n "__fish_eww_using_subcommand help; and not __fish_seen_subcommand_from shell-completions daemon logs ping update poll inspector open open-many close reload kill close-all state get list-windows active-windows debug graph help" -f -a "active-windows" -d 'Show active window IDs, formatted linewise `<window_id>: <window_name>`'
complete -c eww -n "__fish_eww_using_subcommand help; and not __fish_seen_subcommand_from shell-completions daemon logs ping update poll inspector open open-many close reload kill close-all state get list-windows active-windows debug graph help" -f -a "debug" -d 'Print out the widget structure as seen by eww'
complete -c eww -n "__fish_eww_using_subcommand help; and not __fish_seen_subcommand_from shell-completions daemon logs ping update poll inspector open open-many close reload kill close-all state get list-windows active-windows debug graph help" -f -a "graph" -d 'Print out the scope graph structure in graphviz dot format'
complete -c eww -n "__fish_eww_using_subcommand help; and not __fish_seen_subcommand_from shell-completions daemon logs ping update poll inspector open open-many close reload kill close-all state get list-windows active-windows debug graph help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
