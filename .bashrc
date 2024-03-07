#
# ~/.bashrc
#

export PATH="$PATH:/opt/nvim/"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias nvim-primeagen="NVIM_APPNAME=primeagen nvim"
alias nvim-chad="NVIM_APPNAME=chad nvim"
alias nvim-kickstart="NVIM_APPNAME=kickstart nvim"

nvims() {
	items=("default" "primeagen" "chad" "kickstart")
	config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config >> " --height=~50% --layout=reverse --border --exit-0)
	if [[ -z $config ]]; then
		echo "Nothing selected"
		return 0
	elif [[ $config == "default" ]]; then
		config=""
	fi
	NVIM_APPNAME=$config nvim $@
}

bind -x '"\C-a": nvims'

PS1='[\u@\h \W]\$ '
