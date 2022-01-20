# Arch Linux

FROM archlinux/archlinux AS base-devel

LABEL description "Latest version of Arch Linux image comes with Fish, git, htop, Micro, Neofetch, Oh My Posh, Oh My Zsh, Powerlevel10k, SSH and ZSH, minimal Python and complete NPM"
LABEL maintainer="Gustavo Costa <gusbemacbe@gmail.com>" 
LABEL vendor="Gustavo Costa" 
LABEL version="1.5.1"

# 🇬🇧 SYSTEM
# 🇵🇹 SISTEMA
# =============================

SHELL  ["/bin/bash", "-o", "pipefail", "-c"]

ENV TERM xterm-256color
RUN set -ex

RUN ldconfig

ARG DEBIAN_FRONTEND=noninteractive

COPY ./config/sh/colours.sh ./
RUN chmod au+x ./colours.sh

# 🇬🇧 Setting pacman configuration
# 🇵🇹 A definir a configuração do pacman
RUN source ./colours.sh && echo -en "$(piltover_2 1:) A copiar o ficheiro de configuração de $(italico pacman).\n"
COPY ./config/arch/pacman.conf /etc/

# 🇬🇧 Firstly it needs to be synced and then “glibc” needs to be installed before generating the languages
# 🇵🇹 Primeiramente, precisa ser sincronizado e depois a biblioteca «glibc» precisa ser instalada antes de gerar os idiomas
RUN source ./colours.sh && echo -en "$(piltover_2 2:) A instalar «$(italico glibc)».\n"
RUN pacman -Sy --noconfirm
COPY ./config/arch/aurs/glibc-2.33-5.zst ./
COPY ./config/arch/aurs/lib32-glibc-2.33-5.zst ./
RUN pacman -U --noconfirm *.zst

# 🇬🇧 Setting the time zone and symlinking it with force, so it will not be stuck during the tzdata setting
# 🇵🇹 A definir o fuso horário e ligando-o simbolicamente com força, então não ficará preso durante a configuração de tzdata
RUN source ./colours.sh && echo -en "$(piltover_2 3:) A configurar o fuso horário e o horário.\n"
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 🇬🇧 Setting the system keyboard and language
# 🇵🇹 A definir o idioma e o teclado do sistema
RUN source ./colours.sh && echo -en "$(piltover_2 4:) A instalar os meus idiomas favoritos e o teclado do sistema.\n"
COPY ./config/languages/locale-minimal.gen /etc/locale.gen.orig
RUN sed -e 's/[[:space:]]*#.*//' -e '/^$/d' /etc/locale.gen.orig >/etc/locale.gen
RUN cat /etc/locale.gen
RUN locale-gen

RUN source ./colours.sh && echo -en "$(piltover_2 5:) A aplicar o idioma 🇵🇹 para o sistema.\n"
ENV LANG pt_PT.utf8
ENV LANGUAGE pt_PT:pt_BR:en  
ENV LC_ALL pt_PT.UTF-8

# 🇬🇧 Keyboard
# 🇵🇹 Teclado
COPY ./config/keyboards/kbd-apple-en-us-mac /etc/default/keyboard
RUN pacman -S --needed --noconfirm kbd xkeyboard-config

# 🇬🇧 Necessary missed dependencies for the system
# 🇵🇹 Dependências faltadas necessárias para o sistema
RUN source ./colours.sh && echo -en "$(piltover_2 6:) A instalar as dependências perdidas para o sistema.\n"
RUN source ./colours.sh && echo -en "São $(shurima base-devel), $(shurima gcc) e $(shurima sudo).\n"
RUN pacman -S --needed --noconfirm base-devel
RUN pacman -S --needed --noconfirm gcc sudo

# 🇬🇧 SSH to generate the SSH keys for the enterprise's GitLab account
# 🇵🇹 SSH para gerar as chaves de SSH para a conta do GitLab da empresa
RUN source ./colours.sh && echo -en "$(piltover_2 7:) A instalar $(shurima openssh) para poder gerar a chave de SSH para a conta do GitLab.\n"
RUN pacman -S --needed --noconfirm openssh

# 🇬🇧 To check for the authenticity of SSL connections, clone the repositories and download the compressed packges from internet
# 🇵🇹 Para verificar a autenticidade das conexões SSL, clonar os repositórios e transferir os pacotes compactados da Internet
RUN source ./colours.sh && echo -en "$(piltover_2 8:) A instalar $(shurima curl) e $(shurima wget) para poder transferir os pacotes como o de $(zaun 'Oh my Posh') e $(shurima unzip) para extrair os pacotes, como o de $(zaun 'Oh my Posh').\n"
RUN pacman -S --needed --noconfirm curl git wget unzip

# 🇬🇧 Ah, pandoc and xclip are missed!
# 🇵🇹 Ah, faltam os pacotes pandoc e xclip!
RUN source ./colours.sh && echo -en "$(piltover_2 9:) Realmente preciso de $(shurima pandoc) para exportar os ficheiros contendo os variáveis de Pandoc para Markdown e $(shurima xclip) para poder copiar e colar do Micro Editor.\n"
RUN pacman -S --needed --noconfirm pandoc pandoc-crossref xclip

# 🇬🇧 My favourite tools
# 🇵🇹 Minhas ferramentas favoritas
RUN source ./colours.sh && echo -en "$(piltover_2 10:) As ferramentas que adoramos mais e utilizamos mais para mostrar a alguém.\n"
RUN pacman -S --needed --noconfirm fish htop micro neofetch zsh

### 🇬🇧 Nodejs and NPM
### 🇵🇹 Nodejs e NPM
RUN source ./colours.sh && echo -en "$(piltover_2 11:) A instalar Nodejs e $(shurima npm) para instalar as bibliotecas de Angular e de Voxel.\n"
RUN pacman -S --needed --noconfirm nodejs npm

# 🇬🇧 Python and PyPi
# 🇵🇹 Python e PyPi
RUN source ./colours.sh && echo -en "$(piltover_2 12:) A instalar Python e $(shurima pip) para utilizar Jupyter e as bibliotecas de ciências de dados.\n"
RUN pacman -S --needed --noconfirm python python-pip

# 🇬🇧 Other tools that are not part part of Arch's official repositories
# 🇵🇹 Outras ferramentas que não fazem parte dos repositórios oficiais do Arch
RUN source ./colours.sh && echo -en "$(piltover_2 'A copiar e instalar o') $(shurima chameleon) $(piltover_2 e o) $(shurima gitstatus).\n"
COPY ./config/arch/aurs/chameleon-git.zst ./
COPY ./config/arch/aurs/gitstatus.zst ./
RUN pacman -U --needed --noconfirm chameleon-git.zst
RUN pacman -U --needed --noconfirm gitstatus.zst

# 🇬🇧 Some tools for zsh need to be Neofetch!
# 🇵🇹 Faltam algumas ferramentas para Neofetch!
RUN source ./colours.sh && echo -en "$(piltover_2 13:) Quem precisa ou quer mostrar as imagens via $(shurima neofetch) ou mostrar as funções $(italico fancy) no Windows Terminal ou no Kitty?\n"
RUN pacman -S --needed --noconfirm chafa imagemagick libvterm w3m xdotool xorg-xdpyinfo xorg-xprop xorg-xrandr xorg-xwininfo xterm

# 🇬🇧 Since WSL and Windows Terminal do not support displaying the image with Neofetch, we can try to use Kitty
# 🇵🇹 Como o WSL e o Windows Terminal não suportam exibindo a imagem com Neofetch, podemos tentar usar Kitty
RUN pacman -S --needed --noconfirm kitty kitty-terminfo xorg-xauth

RUN source ./colours.sh && echo -en "$(piltover_2 'A copiar e instalar as ferramentas de Sixel').\n"
COPY ./config/arch/aurs/libsixel.zst ./
COPY ./config/arch/aurs/lsix-git.zst ./
COPY ./config/arch/aurs/sixel-tmux-git.zst ./
COPY ./config/arch/aurs/vte3-git.zst ./
RUN pacman -U --need --noconfirm *.zst

# 🇬🇧 Installing LSDeluxe
# 🇵🇹 A instalar o LSDeluxe
ENV LSDELUXE_VERSION 0.20.1
RUN pacman -S --needed --noconfirm lsd

# 🇬🇧 Installing Oh My Posh
# 🇵🇹 A instalar o Oh My Posh
RUN source ./colours.sh && echo -en "$(piltover_2 14:) A instalar o Oh My Posh, alternativo ao Oh my Zsh e ao Powerlevel10k.\n"
RUN wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
RUN chmod +x /usr/local/bin/oh-my-posh

# 🇬🇧 To clean the cache and temporary files
# 🇵🇹 Para limpar o cache e arquivos temporários
RUN source ./colours.sh && echo -en "$(piltover_2 15:) A limpar os $(italico caches) e os $(italico cookies) de modo a optimizar o tamanho do $(italico container) da imagem do Docker.\n"
RUN rm -rf /var/cache/pacman/pkg/* /tmp/* /var/tmp/*
RUN rm *.zst

# 🇬🇧 Changing the default shell
# 🇵🇹 A modificar o shell padrão
RUN source ./colours.sh && echo -en "$(piltover_2 16:) A mudar o shell padrão para ZSH e adeus, Bash 💔.\n"
RUN chsh -s /usr/bin/zsh

# 🇬🇧 Entering the new shell
# 🇵🇹 A entrar no novo shell
RUN zsh

# 🇬🇧 USER
# 🇵🇹 UTILIZADOR
# =============================
RUN source ./colours.sh && echo -en "$(piltover_2 17:) A criar o utilizador.\n"
RUN echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user
COPY ./config/sudoers /etc/sudoers
RUN chmod 0440 /etc/sudoers.d/user
RUN chmod 0440 /etc/sudoers

ENV UUSER=benegus
ENV GROUP=www-data
ARG USER_FOLDER=/home/$UUSER

RUN useradd -m $UUSER && groupadd $GROUP
RUN usermod -aG root $UUSER
RUN usermod -aG users $UUSER
RUN usermod -aG wheel $UUSER
RUN usermod -aG $GROUP $UUSER
RUN usermod -g root $UUSER
RUN usermod -u 1001 $UUSER
RUN usermod $UUSER -p "$(openssl passwd -1 piltover-and-zaun)"
RUN groups $UUSER

RUN rm ./colours.sh

USER $UUSER
WORKDIR $USER_FOLDER

COPY ./config/sh/colours.sh ./
RUN source ./colours.sh && echo -en "$(piltover_2 18:) A criar as pastas necessárias.\n"
RUN mkdir -pv $USER_FOLDER/.{aspnet,config/neofetch/{ascii,images,styles},dotnet,fzf,jupyter,kite,local/{bin,share/{apps,icons}},node_modules/cache,p10k/themes,poetry,poshthemes,r,ssh,yarn/global}
RUN mkdir -pv $USER_FOLDER/{Documentos,Git,GitHub,GitLab,Imagens,Transferências,Videos,Workspaces}

# 🇬🇧 Installing FZF - executable only (required for “zsh-interactive-cd”)
# 🇵🇹 A instalar o FZF - somente executável (obrigatório para «zsh-interactive-cd»)
RUN source ./colours.sh && echo -en "$(piltover_2 19:) A transferir e instalar o FZF.\n"
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
RUN ~/.fzf/install

# 🇬🇧 Downlading Oh My Posh themes
# 🇵🇹 A transferir os temas de Oh My Posh
RUN source ./colours.sh && echo -en "$(piltover_2 20:) A transferir os temas para o Oh my Posh.\n"
RUN wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
RUN unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
RUN chmod u+rw ~/.poshthemes/*.json
RUN rm ~/.poshthemes/themes.zip

# 🇬🇧 Installing Oh my ZSH
# 🇵🇹 A instalar o Oh My ZSH
RUN source ./colours.sh && echo -en "$(piltover_2 21:) A transferir e instalar o Oh my ZSH.\n"
RUN wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh || true

ARG ZSH_CUSTOM=$USER_FOLDER/.oh-my-zsh/custom
RUN echo $ZSH_CUSTOM

# 🇬🇧 Installing Oh My ZSH plugins and themes, and Powerlevel10k
# 🇵🇹 A instalar os plugins e os temas de Oh My ZSH, e Powerlevel10k
ENV ZSH_PLUGINS $ZSH_CUSTOM/plugins
ENV ZSH_THEMES $ZSH_CUSTOM/themes

RUN source ./colours.sh && echo -en "$(piltover_2 22:) A transferir e instalar o os complementos de ZSH e Oh My ZSH, e a instalar o Powerlevel10k.\n"
RUN git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_PLUGINS/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-completions.git $ZSH_PLUGINS/zsh-completions
RUN git clone https://github.com/zsh-users/zsh-history-substring-search  $ZSH_PLUGINS/zsh-history-substring-search
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGINS/zsh-syntax-highlighting
RUN git clone https://github.com/romkatv/powerlevel10k.git $ZSH_THEMES/powerlevel10k

# 🇬🇧 Installing Oh My ZSH configuration files
# 🇵🇹 A instalar os meus ficheiros de configuração de Oh my ZSH
RUN source ./colours.sh && echo -en "$(piltover_2 23:) A copiar o tema de Powerlevel10k e os ficheiros de configuração de ZSH.\n"
COPY --chown=$UUSER:$GROUP ./config/zsh/themes/*.zsh $USER_FOLDER/.p10k/themes/
COPY --chown=$UUSER:$GROUP ./config/zsh/.zshrc $USER_FOLDER/
COPY --chown=$UUSER:$GROUP ./config/zsh/alias/aliases.zsh $ZSH_CUSTOM

# 🇬🇧 Copying the ANSI and ASII art files to Neofetch folders
# 🇵🇹 A copiar os ficheiros de arte de ANSI e ASCII à pasta de Neofetch
RUN source ./colours.sh && echo -en "$(piltover_2 24:) A copiar as artes de ANSI e ASCII para Neofetch.\n"
COPY ./config/ansi/with-neofetch/itau*.txt $USER_FOLDER/.config/neofetch/ascii/
COPY ./config/images/* $USER_FOLDER/.config/neofetch/images/

# 🇬🇧 NPM, PNPM AND YARN
# 🇵🇹 NPM, PNPM E YARN
# =============================
RUN source ./colours.sh && echo -en "$(piltover_2 25:) A configurar o caminho do $(shurima npm).\n"
RUN npm config set prefix ~/.node_modules
RUN npm config set cache ~/.node_modules/cache
RUN export PATH="~/.node_modules/bin:$PATH"

RUN source ./colours.sh && echo -en "$(piltover_2 26:) A instalar o $(shurima yarn).\n"
RUN npm i -g yarn
RUN curl -fsSL https://get.pnpm.io/install.sh | sh -

# 🇬🇧 Installing the favourite packages via yarn
# 🇵🇹 A instalar os pacotes favoritos via yarn
RUN source ./colours.sh && echo -en "$(piltover_2 27:) A copiar o ficheiro de configuração de Yarn.\n"
COPY --chown=$UUSER:$GROUP ./config/node/package.json $USER_FOLDER/.config/yarn/global/

# PYTHON
# =============================
RUN source ./colours.sh && echo -en "$(piltover_2 28:) A instalar o Poetry.\n"
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

# OUTROS
# =============================

# 🇬🇧 To clean the caches to optimise the Docker container size
# 🇵🇹 Para limpar os caches para optimizar o tamanho do container do Docker
RUN source ./colours.sh && echo -en "$(piltover_2 29:) A limpar os $(italico caches) para optimizar o tamanho do $(italico container) do Docker.\n"
RUN sudo rm -rf /tmp/*
RUN printf "S" | sudo pacman -Sccc

RUN sudo npm cache clean --force
RUN npm cache verify

RUN printf "S" | sudo pacman -S community/ttf-joypixels

# RUN xauth add gustavo-endeavour/unix:0  MIT-MAGIC-COOKIE-1  4be697fc158742b3befce30e8616ec60
# RUN xauth add X370GT7/unix:0  MIT-MAGIC-COOKIE-1  33848675efe5fdffcf4bfb792ae5cbc0
# RUN xauth list

# EXPOSE 8887
# CMD kitty

CMD ["zsh"]