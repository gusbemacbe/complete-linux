if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"

POWERLEVEL9K_DISABLE_GITSTATUS=false

ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(brackets cursor main pattern)

# 🇬🇧 Settings
# 🇵🇹 Configurações
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd/mm/yyyy"

source /usr/share/gitstatus/gitstatus.prompt.zsh

# 🇬🇧 Plugins
# 🇵🇹 Complementos
plugins=(colored-man-pages colorize command-not-found cp copydir copyfile dirhistory extract globalias z zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-interactive-cd zsh-navigation-tools zsh-syntax-highlighting)

# 🇬🇧 Sourcing the plugins
# 🇵🇹 A obter os complementos
source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# 🇬🇧 Fixing for Docker plugin and capture the ZSH plugins
# 🇵🇹 Corrigir para o complemento do Docker e capturar os complementos do ZSH
autoload -U compinit && compinit

# 🇬🇧 Searching the plugins and sourcing them
# 🇵🇹 A localizar os complementos e obtê-los
[ -f $HOME/.asdf/asdf.sh ] && . $HOME/.asdf/asdf.sh
[ -f $HOME/.asdf/completions/asdf.bash ] && . $HOME/.asdf/completions/asdf.bash
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# 🇬🇧 You can find a lot of themes at “~/.p10k/themes” and choose one of themn to modify the theme name in the path. Or you can create your own new theme, using “pk10 configure” and add it to the folder. 
# 🇵🇹 Podes encontrar muitos temas na pasta «~/.p10k/themes» e escolher um deles para modificar o nome do tema no caminho. Ou podes criar o teu próprio novo tema e adicioná-lo à pasta.
[[ ! -f $HOME/.p10k/themes/p10k-flat.zsh ]] || source $HOME/.p10k/themes/p10k-flat.zsh

# Aliases
alias neo_gd="neofetch --ascii_colors 202 024 011 --ascii ~/.config/neofetch/ascii/itau-ascii-grande.txt"
alias neo_pq="neofetch --ascii_colors 202 024 011 --ascii ~/.config/neofetch/ascii/itau-ascii-pequeno.txt"

# 🇬🇧 Exportations
# 🇵🇹 Exportações

if [[ -d $HOME/.local/bin ]]
then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [[ -d $HOME/.node_modules/bin ]]
then
    export PATH="$HOME/.node_modules/bin:$PATH"
fi

if [[ -d $HOME/.yarn/bin ]]
then
    export PATH="$HOME/.yarn/bin:$PATH"
fi
