# Red Hat

FROM redhat/ubi8:latest

LABEL description "Latest and complete version of Red Hat image comes with Fish, git, htop, Micro, Neofetch, Oh My Posh, Oh My Zsh, Powerlevel10k, SSH and ZSH, minimal Python and minimal NPM"
LABEL maintainer="Gustavo Costa <gusbemacbe@gmail.com>" 
LABEL vendor="Gustavo Costa" 
LABEL version="1.5.0"

# 🇬🇧 SYSTEM
# 🇵🇹 SISTEMA
# =============================

SHELL  ["/bin/bash", "-o", "pipefail", "-c"]

ENV TERM xterm-256color
RUN set -ex

RUN ldconfig

RUN dnf -y upgrade
RUN dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm