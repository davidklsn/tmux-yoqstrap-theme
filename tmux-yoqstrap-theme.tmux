#!/bin/bash
black="#363636"
blue="#61afef"
yellow="#e5c07b"
red="#e06c75"
white="#aab2bf"
pink="#E9CAC8"
pastel_blue="#A9B1D6"
visual_grey="#3e4452"
comment_grey="#5c6370"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$white"
set "message-bg" "$black"

set "message-command-fg" "$white"
set "message-command-bg" "$black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$black"
setw "window-status-bg" "$black"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$black"
setw "window-status-activity-fg" "$black"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$comment_grey"
set "window-active-style" "fg=$white"

set "pane-border-fg" "$white"
set "pane-border-bg" "$black"
set "pane-active-border-fg" "$pastel_blue"
set "pane-active-border-bg" "$black"

set "display-panes-active-colour" "$yellow"
set "display-panes-colour" "$blue"

set "status-bg" "$black"
set "status-fg" "$white"

set "@prefix_highlight_fg" "$black"
set "@prefix_highlight_bg" "$pastel_blue"
set "@prefix_highlight_copy_mode_attr" "fg=$black,bg=$pastel_blue"
set "@prefix_highlight_output_prefix" ""

time_format=$(get "@time_format" "%R")
date_format=$(get "@date_format" "%d/%m/%Y")

set "status-right" "#[fg=$white,bg=$black,nounderscore,noitalics]${time_format}  ${date_format} #[fg=$visual_grey,bg=$black]#[fg=$visual_grey,bg=$visual_grey]#[fg=$white, bg=$visual_grey]#[fg=$pastel_blue,bg=$visual_grey,nobold,nounderscore,noitalics]#[fg=$white,bg=$visual_grey,nobold] #h #[fg=$yellow, bg=$pastel_blue]#[fg=$red,bg=$yellow]"
set "status-left" "#[fg=$black,bg=$pastel_blue,nobold] #S #{prefix_highlight}#[fg=$pastel_blue,bg=$black,nobold,nounderscore,noitalics]"

set "window-status-format" "#[fg=$black,bg=$black,nobold,nounderscore,noitalics] #[fg=$white,bg=$black] #I #W #[fg=$black,bg=$black,nobold,nounderscore,noitalics]"
set "window-status-current-format" "#[fg=$black,bg=$visual_grey,nobold,nounderscore,noitalics] #[fg=$white,bg=$visual_grey,nobold] #I #W #[fg=$visual_grey,bg=$black,nobold,nounderscore,noitalics]"
