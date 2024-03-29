# name: crystal
function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_prompt
  set -l cyan (set_color -o 8BE9FD)
  set -l blue (set_color -o 6272A4)
  set -l green (set_color -o 50FA7B)
  set -l orange (set_color -o FFB86C)
  set -l pink (set_color -o FF79C6)
  set -l purple (set_color -o BD93F9)
  set -l red (set_color -o FF5555)
  set -l yellow (set_color -o F1FA8C)
  set -l normal (set_color normal)

  set -l cwd $green(prompt_pwd)

  if [ (_git_branch_name) ]
    if test (_git_branch_name) = 'master|main'
      set -l git_branch (_git_branch_name)
      set git_info "$normal $blue($red$git_branch$normal$blue)"
    else
      set -l git_branch (_git_branch_name)
      set git_info "$normal $blue($blue$git_branch$normal$blue)"
    end

    if [ (_is_git_dirty) ]
      set -l dirty "$orange ✗"
      set git_info "$git_info$dirty"
    end
  end

  set -l arrow "$pink➜"

  echo -n -s $cwd $git_info $normal ' ' $arrow ' '
end
