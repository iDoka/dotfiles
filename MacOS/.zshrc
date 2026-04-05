# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

### HOMEBREW ###
export PATH="/opt/homebrew/bin:${PATH}"
eval "$(/opt/homebrew/bin/brew shellenv)"

# for OpenMP
# https://gist.github.com/scivision/16c2ca1dc250f54d34f1a1a35596f4a0
export OpenMP_ROOT=$(brew --prefix)/opt/libomp
export LDFLAGS="$LDFLAGS -L${OpenMP_ROOT}/lib"

export HOMEBREW_NO_ENV_HINTS=1

### starship ###
eval "$(starship init zsh)"


### Important Terminal settings ###
export TERM=xterm-256color
export COLORTERM=truecolor

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

################ ALIASES ################
for file in ~/.aliases/*.alias
do
. ${file}
done
#########################################


fpath+=${ZDOTDIR:-~}/.zsh_functions



# bun completions
[ -s "/Users/doka/.bun/_bun" ] && source "/Users/doka/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

alias claud='claude ‑dangerously‑skip‑permissions'
alias clauded='claude ‑dangerously‑skip‑permissions'
alias act='source .venv/bin/activate'
alias ifc='ifconfig | grep "inet "| cut -d" " -f2 | grep -v "127.0.0.1"'


