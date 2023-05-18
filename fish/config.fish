if status is-interactive
set -U fish_greeting ""

	# Commands to run in interactive sessions can go here
starship init fish | source
set SPACEFISH_PROMPT_ADD_NEWLINE false

end
alias vim=nvim
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME' 
alias bspwmrc='vim .config/bspwm/bspwmrc'
alias neovim='vim .config/nvim/'
