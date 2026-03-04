# dots git bare repo
alias config='/usr/bin/git --git-dir=$HOME/dots/ --work-tree=$HOME'
alias gitlog='git log --oneline -n 10 --graph --decorate --abbrev-commit'
alias gitlist='git diff-tree --no-commit-id --name-only -r'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles'

precmd() {
        update_git_info
}

# git functions
function git_staged_count() {
	echo $(git diff --cached --numstat | wc -l | tr -d '[:space:]')
}

function git_unstaged_count() {
        echo $(git diff --name-only | wc -l | tr -d '[:space:]')
}

# Here git status porcelain works as untracked have '??'
# but not for existing files staged/unstaged where 
# both have 'M'
function git_untracked_count() {
	echo $(git status --porcelain | grep -c '^??')
}

function update_git_info() {
	git_prompt=""
	if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
		local staged_changes=$(git_staged_count)
		local unstaged_changes=$(git_unstaged_count)
		local untracked_changes=$(git_untracked_count)
		local branch=$(git symbolic-ref --short HEAD)
		git_prompt=" %F{green}%f$branch"

		if [ $unstaged_changes -gt 0 ]; then
		git_prompt+=" %F{magenta}-$unstaged_changes%f"
		fi

		if [ $staged_changes -gt 0 ]; then
			git_prompt+=" %F{green}+$staged_changes%f"
		fi

		if [ $untracked_changes -gt 0 ]; then
			git_prompt+=" %F{red}!$untracked_changes%f"
		fi
	fi
}

# enable environment variable sub in prompt option
setopt PROMPT_SUBST

# %n: name %m: machine %2d: 2 levels of dir
# PROMPT='%n@%m %F{yellow}(%2d)%f %# '
PROMPT='%F{blue}(%2d)%f${git_prompt} %# '

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Fez shell integration to support 'fez cd' directory changes
[ -f "$HOME/dev/fez/shell-integration.sh" ] && source "$HOME/dev/fez/shell-integration.sh"
