# Common PATHs to add
for p in "$HOME/bin" "$HOME/.local/bin" "$HOME/.cargo/bin"
    if test -d "$p"
        set fish_user_paths $fish_user_paths $p
    end
end


# Prompt
set theme_display_git_untracked no
. $functions/fish_prompt.fish


# Aliases
alias urlab-ssh "ssh -t azog.urlab.be ssh"
alias legacy-ssh "ssh -oKexAlgorithms=+diffie-hellman-group1-sha1"
alias legacy-scp "scp -oKexAlgorithms=+diffie-hellman-group1-sha1"
alias ls "ls --color"
alias ll "ls -lh"
alias la "ll -A"
alias lll "tree -C"
alias less "less -R"
alias lock "xscreensaver-command --lock"

# grc (colorize command output)
alias ps "grc ps"
alias mount "grc mount"
alias netstat "grc netstat"
alias df "grc df"
alias du "grc du"
