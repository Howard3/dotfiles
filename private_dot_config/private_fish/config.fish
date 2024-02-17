if status is-interactive
    fish_vi_key_bindings
    fish_add_path /usr/local/go/bin
    fish_add_path ~/go/bin/
    alias nvim="~/.local/bin/nvim.appimage"
    # Commands to run in interactive sessions can go here
end

abbr -a ccd chezmoi cd

function cat
    if type -q batcat
        batcat $argv
    else
        echo "Warning: batcat is not installed, using standard cat."
        command cat $argv
    end
end

