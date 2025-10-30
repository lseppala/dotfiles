# Sources
# - https://romanzipp.com/blog/ghostty-zellij-fish-shell
#
# Unset the default fish greeting text which messes up Zellij
set fish_greeting

# Check if we're in an interactive shell
if status is-interactive

    # At this point, specify the Zellij config dir, so we can launch it manually if we want to
    export ZELLIJ_CONFIG_DIR=$HOME/.config/zellij

	#fish_vi_key_bindings
	#rbenv init - fish | source

	pyenv init - | source
    # Check if our Terminal emulator is Ghostty
    if [ "$TERM" = "xterm-ghostty" ]
        # Launch zellij
        eval (zellij setup --generate-auto-start fish | string collect)
    end
end

