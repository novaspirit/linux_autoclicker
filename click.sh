#!/bin/sh
# used commands
xprop_command=`which xprop`
xdotool_command=`which xdotool`
xte_command=`which xte`

while :
do
    if [ -n "$xprop_command" -a -n "$xdotool_command" -a -n "$xte_command" ]; then
      # get active window id
      active_window_id=`$xdotool_command getactivewindow`
      # get class of the active window
      window_class=`$xprop_command -id $active_window_id | sed -n -e "s/^WM_CLASS(STRING).*\"\(.*\)\", \".*\"/\1/ p"`
      # execute only when active windows is Google Chrome
      if [ "$window_class" = "scrcpy" ]; then
          $xte_command "mouseclick 1"
          # $xte_command "sleep 1" "mouseclick 1" "mouseclick 1"
      fi
    fi
done
