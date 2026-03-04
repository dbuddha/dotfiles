[ -f "$HOME/.secrets" ] && source "$HOME/.secrets"

export PATH="$HOME/.local/bin:$PATH"

if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
fi

# pnpm
if [[ "$(uname)" == "Darwin" ]]; then
  export PNPM_HOME="$HOME/Library/pnpm"
else
  export PNPM_HOME="$HOME/.local/share/pnpm"
fi
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

if [[ "$(uname)" == "Darwin" ]]; then
  export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
  source ~/.orbstack/shell/init.zsh 2>/dev/null || :
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/dev/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/dev/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/dev/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/dev/google-cloud-sdk/completion.zsh.inc"; fi
