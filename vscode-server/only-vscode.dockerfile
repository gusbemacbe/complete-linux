# Ubuntu 21.10 Impish
FROM ubuntu:rolling as base

LABEL description "A small emergency image for broken self-updated VSCode Insiders on WSL 1 and 2"
LABEL maintainer="Gustavo Costa <gusbemacbe@gmail.com>" 
LABEL vendor="Gustavo Costa" 
LABEL version="1.1.0"

# 🇬🇧 SYSTEM
# 🇵🇹 SISTEMA
# =============================

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV TERM xterm

RUN set -ex
COPY ./config/ubuntu/source/vscode.7z ./

CMD ["bash"]