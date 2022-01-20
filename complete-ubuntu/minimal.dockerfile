# Ubuntu 21.10 Impish

FROM ubuntu:rolling AS base

LABEL description "Minimal version of Ubuntu 21.10 image comes with Git, Micro, Neofetch, Oh My Zsh, Powerlevel10k, SSH and ZSH"
LABEL maintainer="Gustavo Costa <gusbemacbe@gmail.com>" 
LABEL vendor="Gustavo Costa" 
LABEL version="1.5.1"

# 🇬🇧 SYSTEM
# 🇵🇹 SISTEMA
# =============================

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV TERM xterm-256color
RUN set -ex

RUN ldconfig

ARG DEBIAN_FRONTEND=noninteractive

# 🇬🇧 Setting pacman configuration
# 🇵🇹 A definir a configuração do pacman
COPY ./config/arch/pacman.conf /etc/

# 🇬🇧 Firstly it needs to be synced and then “glibc” (“locales”) needs to be installed before generating the languages
# 🇵🇹 Primeiramente, precisa ser sincronizado e depois a biblioteca «glibc» (“locales”) precisa ser instalada antes de gerar os idiomas
RUN apt update && apt upgrade -y && apt install -y locales locales-all

# 🇬🇧 Setting the time zone and symlinking it with force, so it will not be stuck during the tzdata setting
# 🇵🇹 Definindo o fuso horário e ligando-o simbolicamente com força, então não ficará preso durante a configuração de tzdata
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 🇬🇧 Setting the system keyboard and language
# 🇵🇹 A definir o idioma e o teclado do sistema
COPY ./config/languages/locale-minimal.gen /etc/locale.gen.orig
RUN sed -e 's/[[:space:]]*#.*//' -e '/^$/d' /etc/locale.gen.orig >/etc/locale.gen
RUN cat /etc/locale.gen
RUN locale-gen

ENV LANG pt_PT.utf8
ENV LANGUAGE pt_PT:pt_BR:en  
ENV LC_ALL pt_PT.UTF-8

# 🇬🇧 Keyboard
# 🇵🇹 Teclado
COPY ./config/keyboards/kbd-apple-en-us-mac /etc/default/keyboard
RUN apt install -y kbd

# 🇬🇧 Necessary missed dependencies for the system
# 🇵🇹 Dependências faltadas necessárias para o sistema
RUN apt install -y build-essential
RUN apt install -y gcc sudo

# 🇬🇧 SSH to generate the SSH keys for the enterprise's GitLab account
# 🇵🇹 SSH para gerar as chaves de SSH para a conta do GitLab da empresa
RUN apt install -y openssh-client openssh-server

# 🇬🇧 To check for the authenticity of SSL connections, clone the repositories and download the compressed packges from internet
# 🇵🇹 Para verificar a autenticidade das conexões SSL, clonar os repositórios e transferir os pacotes compactados da Internet
RUN apt install -y ca-certificates curl git wget unzip

# 🇬🇧 Ah, pandoc and xclip are missed!
# 🇵🇹 Ah, faltam os pacotes pandoc e xclip!
RUN apt install -y pandoc xclip

# 🇬🇧 My favourite tools
# 🇵🇹 Minhas ferramentas favoritas
RUN apt install -y htop micro neofetch zsh

# 🇬🇧 Some tools for zsh need to be Neofetch!
# 🇵🇹 Faltam algumas ferramentas para Neofetch!
RUN apt install -y xdotool x11-utils x11-xserver-utils

# 🇬🇧 Installing LSDeluxe
# 🇵🇹 A instalar o LSDeluxe
ENV LSDELUXE_VERSION 0.21.0
RUN wget -nv -O lsdeluxe.deb https://github.com/Peltoche/lsd/releases/download/${LSDELUXE_VERSION}/lsd_${LSDELUXE_VERSION}_amd64.deb
RUN dpkg -i lsdeluxe.deb
RUN rm lsdeluxe.deb

# 🇬🇧 To clean the cache and temporary files
# 🇵🇹 Para limpar o cache e arquivos temporários
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 🇬🇧 Changing the default shell
# 🇵🇹 A modificar o shell padrão
RUN chsh -s /usr/bin/zsh

# 🇬🇧 Entering the new shell
# 🇵🇹 A entrar no novo shell
RUN zsh

# 🇬🇧 USER
# 🇵🇹 UTILIZADOR
# =============================

RUN echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user
COPY ./config/sudoers /etc/sudoers
RUN chmod 0440 /etc/sudoers.d/user
RUN chmod 0440 /etc/sudoers

ENV UUSER=benegus
ENV GROUP=www-data
ARG USER_FOLDER=/home/$UUSER

RUN useradd -m $UUSER
RUN usermod -aG root $UUSER
RUN usermod -aG users $UUSER
RUN addgroup wheel
RUN usermod -aG wheel $UUSER
RUN usermod -aG $GROUP $UUSER
RUN usermod -g root $UUSER
RUN usermod -u 1001 $UUSER
RUN usermod $UUSER -p "$(openssl passwd -1 piltover-and-zaun)"
RUN groups $UUSER

USER $UUSER
WORKDIR $USER_FOLDER

RUN mkdir -pv $USER_FOLDER/.{aspnet,config/neofetch/{ascii,images,styles},dotnet,jupyter,kite,local/{bin,share/{apps,icons}},fzf,p10k/themes,poetry,poshthemes,ssh}
RUN mkdir -pv $USER_FOLDER/{Documentos,Git,GitHub,GitLab,Imagens,Transferências,Videos,Workspaces}

# 🇬🇧 Installing FZF - executable only (required for “zsh-interactive-cd”)
# 🇵🇹 A instalar o FZF - somente executável (obrigatório para «zsh-interactive-cd»)
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
RUN ~/.fzf/install

# 🇬🇧 Installing Oh my ZSH
# 🇵🇹 A instalar o Oh My ZSH
RUN wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh || true

ARG ZSH_CUSTOM=$USER_FOLDER/.oh-my-zsh/custom
RUN echo $ZSH_CUSTOM

# 🇬🇧 Installing Oh My ZSH plugins and themes, and Powerlevel10k
# 🇵🇹 A instalar os plugins e os temas de Oh My ZSH, e Powerlevel10k
ENV ZSH_PLUGINS $ZSH_CUSTOM/plugins
ENV ZSH_THEMES $ZSH_CUSTOM/themes

RUN git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_PLUGINS/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-completions.git $ZSH_PLUGINS/zsh-completions
RUN git clone https://github.com/zsh-users/zsh-history-substring-search  $ZSH_PLUGINS/zsh-history-substring-search
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGINS/zsh-syntax-highlighting
RUN git clone https://github.com/romkatv/powerlevel10k.git $ZSH_THEMES/powerlevel10k

# 🇬🇧 Installing Oh My ZSH configuration files
# 🇵🇹 A instalar os meus ficheiros de configuração de Oh my ZSH
COPY --chown=$UUSER:$GROUP ./config/zsh/themes/*.zsh $USER_FOLDER/.p10k/themes/
COPY --chown=$UUSER:$GROUP ./config/zsh/.zshrc $USER_FOLDER/
COPY --chown=$UUSER:$GROUP ./config/zsh/alias/aliases.zsh $ZSH_CUSTOM

# 🇬🇧 Copying the ANSI and ASII art files to Neofetch folders
# 🇵🇹 A copiar os ficheiros de arte de ANSI e ASCII à pasta de Neofetch
COPY ./config/ansi/with-neofetch/itau*.txt $USER_FOLDER/.config/neofetch/ascii/

# 🇬🇧 To clean the caches to optimise the Docker container size
# 🇵🇹 Para limpar os caches para optimizar o tamanho do container do Docker
RUN sudo rm -rf /tmp/*
RUN printf "S" | sudo apt clean
RUN printf "S" | sudo apt autoclean

CMD ["zsh"]
