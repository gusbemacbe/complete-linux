# Ubuntu 21.10 Impish
FROM ubuntu:rolling as base

LABEL description="Ubuntu 21.10 image comes with Fish, git, htop, Micro, Neofetch, Oh My Posh, Oh My Zsh, Powerlevel10k, SSH and ZSH, minimal Python and complete NPM" maintainer="Gustavo Costa <gusbemacbe@gmail.com>" vendor="Gustavo Costa" version="1.5.0"

# 🇬🇧 SYSTEM
# 🇵🇹 SISTEMA
# =============================

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV TERM xterm

# 🇬🇧 Setting the time zone and symlinking it with force, so it will not be stuck during the tzdata setting
# 🇵🇹 Definindo o fuso horário e ligando-o simbolicamente com força, então não ficará preso durante a configuração de tzdata
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ARG DEBIAN_FRONTEND=noninteractive

RUN set -ex
RUN apt update && apt upgrade -y

# 🇬🇧 Necessary missed dependencies for the system
# 🇵🇹 Dependências faltadas necessárias para o sistema
RUN apt install -y build-essential gcc sudo

# 🇬🇧 Setting the system keyboard and language
# 🇵🇹 A definir o idioma e o teclado do sistema
RUN apt install -y locales locales-all

COPY ./config/locale.gen /etc/locale.gen

RUN localedef -i pt_PT -c -f UTF-8 -A /usr/share/locale/locale.alias pt_PT.UTF-8
RUN locale-gen

ENV LANG pt_PT.utf8
ENV LANGUAGE pt_PT:pt_BR:en  
ENV LC_ALL pt_PT.UTF-8

# 🇬🇧 Keyboard
# 🇵🇹 Teclado
COPY ./config/keyboard /etc/default/keyboard
RUN apt install -y kbd

# 🇬🇧 SSH to generate the SSH keys for the enterprise's GitLab account
# 🇵🇹 SSH para gerar as chaves de SSH para a conta do GitLab da empresa
RUN apt install -y openssh-client openssh-server

# 🇬🇧 To check for the authenticity of SSL connections, clone the repositories and download the compressed packges from internet
# 🇵🇹 Para verificar a autenticidade das conexões SSL, clonar os repositórios e transferir os pacotes compactados da Internet
RUN apt install -y ca-certificates git wget unzip

# 🇬🇧 My favourite tools
# 🇵🇹 Minhas ferramentas favoritas
RUN apt install -y fish htop micro neofetch zsh

# 🇬🇧 Ah, curl, pandoc and xclip are missed!
# 🇵🇹 Ah, faltam os pacotes curl, pandoc e xclip!
RUN apt install -y curl pandoc xclip

# 🇬🇧 Installing LSDeluxe
# 🇵🇹 A instalar o LSDeluxe
ENV LSDELUXE_VERSION 0.20.1
RUN wget -nv -O lsdeluxe.deb https://github.com/Peltoche/lsd/releases/download/${LSDELUXE_VERSION}/lsd_${LSDELUXE_VERSION}_amd64.deb
RUN dpkg -i lsdeluxe.deb
RUN rm lsdeluxe.deb

# 🇬🇧 Installing Oh My Posh
# 🇵🇹 A instalar o Oh My Posh
RUN wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
RUN chmod +x /usr/local/bin/oh-my-posh

# 🇬🇧 To clean the cache and temporary files
# 🇵🇹 Para limpar o cache e arquivos temporários
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 🇬🇧 USER
# 🇵🇹 UTILIZADOR
# =============================

RUN echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user && chmod 0440 /etc/sudoers.d/user

ENV APP_USER=benegus
ENV APP_USER_GROUP=www-data
ARG APP_USER_HOME=/home/$APP_USER

RUN useradd -rm -d $APP_USER_HOME -s /bin/bash -g root -G sudo -u 1001 $APP_USER -p "$(openssl passwd -1 ubuntu)"

USER $APP_USER
WORKDIR $APP_USER_HOME

RUN mkdir $APP_USER_HOME/{Documentos,Git,GitHub,GitLab,Imagens,Transferências,Videos,Workspaces}
RUN mkdir $APP_USER_HOME/.{aspnet,config,dotnet,jupyter,kite,local,p10k,poetry,ssh}

# 🇬🇧 Copying the ASCCI art text files to Neofetch configuration folder
# 🇵🇹 A copiar os ficheiros de texto de arte ASCII para a pastas de configuracões de Neofetch
RUN mkdir -p $APP_USER_HOME/.config/neofetch/ascii
COPY --chown=$APP_USER:$APP_USER_GROUP ./config/itau*.txt $APP_USER_HOME/.config/neofetch/ascii/

# 🇬🇧 Installing FZF - executable only (required for “zsh-interactive-cd”)
# 🇵🇹 A instalar o FZF - somente executável (obrigatório para «zsh-interactive-cd»)
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
RUN ~/.fzf/install

# 🇬🇧 Downlading Oh My Posh themes
# 🇵🇹 A transferir os temas de Oh My Posh
RUN mkdir ~/.poshthemes
RUN wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
RUN unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
RUN chmod u+rw ~/.poshthemes/*.json
RUN rm ~/.poshthemes/themes.zip

# 🇬🇧 Installing Oh my ZSH
# 🇵🇹 A instalar o Oh My ZSH
RUN wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh || true

ARG ZSH_CUSTOM=$APP_USER_HOME/.oh-my-zsh/custom

# 🇬🇧 Installing Oh My ZSH plugins and themes, and Powerlevel10k
# 🇵🇹 A instalar os plugins e os temas de Oh My ZSH, e Powerlevel10k
RUN \
  ZSH_PLUGINS=$ZSH_CUSTOM/plugins \
  && ZSH_THEMES=$ZSH_CUSTOM/themes \
  && git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_PLUGINS/zsh-autosuggestions \
  && git clone https://github.com/zsh-users/zsh-completions.git $ZSH_PLUGINS/zsh-completions \
  && git clone https://github.com/zsh-users/zsh-history-substring-search  $ZSH_PLUGINS/zsh-history-substring-search \
  && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGINS/zsh-syntax-highlighting \
  && git clone --single-branch --depth 1 https://github.com/romkatv/powerlevel10k.git $ZSH_THEMES/powerlevel10k

# 🇬🇧 Installing Oh My ZSH configuration files
# 🇵🇹 A instalar os meus ficheiros de configuração de Oh my ZSH
COPY --chown=$APP_USER:$APP_USER_GROUP ./config/.p10k.zsh $APP_USER_HOME/
COPY --chown=$APP_USER:$APP_USER_GROUP ./config/.zshrc $APP_USER_HOME/
COPY --chown=$APP_USER:$APP_USER_GROUP ./config/aliases.zsh $ZSH_CUSTOM

CMD ["zsh"]
