# name: RobbyRussel
#
# You can override some default options in your config.fish:
#   set -g theme_display_git_untracked no

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  set -l show_untracked (git config --bool bash.showUntrackedFiles)
  set untracked ''
  if [ "$theme_display_git_untracked" = 'no' -o "$show_untracked" = 'false' ]
    set untracked '--untracked-files=no'
  end
  echo (command git status -s --ignore-submodules=dirty $untracked ^/dev/null)
end

function fish_prompt
  set -l last_status $status
  set -l cyan (set_color cyan)
  set -l magenta (set_color magenta)
  set -l yellow (set_color yellow)
  set -l red (set_color red)
  set -l blue (set_color blue)
  set -l green (set_color green)
  set -l normal (set_color normal)

  set -l cwd $magenta(prompt_pwd)

  if [ (_git_branch_name) ]
    set -l git_branch $red(_git_branch_name)
    set git_info "$blue ($git_branch"

    if [ (_is_git_dirty) ]
      set git_info "$git_info $yellow✗"
    else
      set git_info "$git_info $green✔"
    end

    set git_info "$git_info$blue)"
  end

  set -l hour (command date +%H:%M:%S)
  set -l hourstr "[$hour]"
  set -l host (command hostname)
  set -l userhost "$green$USER$normal@$cyan$host:"
  set -l colorz (eval $HOME/bin/colorhash "$USER@$host")

  echo -n -s "|$colorz|$userhost$cwd$git_info$normal$hourstr "
end

