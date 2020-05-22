function fish_right_prompt
  set -l green (set_color -o green)
  set -l red (set_color -o red)

  set -l last_status $status

  if test $last_status = 0
      set status_indicator "$green✔︎ "
  else
      set status_indicator "$red✗ "
  end

  set -l last_status $status

  echo -n -s $status_indicator 
end