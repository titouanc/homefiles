# Prompt
set theme_display_git_untracked no
. $functions/fish_prompt.fish

# Aliases
alias urlab-ssh "ssh -t azog.urlab.be ssh"
alias ls "ls --color"
alias ll "ls -l"
alias la "ll -A"
alias lll "tree -C"

# grc (colorize command output)
alias ps "grc ps"
alias mount "grc mount"
alias netstat "grc netstat"

function cpu-hard-limit
    for i in (seq 0 7)
        sudo cpufreq-set -c $i -u 800000
    end
end
