function fish_right_prompt
  set -l last_status $status

  set -l green (set_color -o green)
  set -l red (set_color -o red)

  if not test $last_status = 0
    set status_indicator "$red✗ "
  else
    set status_indicator "$green✔︎ "
  end

  echo -n -s $status_indicator 
end