# Arch Completo

A imegm e os seus *containers* são deisgnados para atender as necessidades dos colaboradores da empresa que podem puxar a imagem do Docker, sob a autorização da empresa, para exportar e importar para o WSL. 

A imagem vem com várias diferentes etiquetas, isto depende do que o colaborador quiser ou precisar, você pode entrar a tabela de comparações entre _branches_ e ver quais têm ou têm pacotes que você precisa. 

As etiquetas terminadas em `wsl-1` indicam que você quer utilizar a versão do WSL 1 para poder instalar os pacotes via `npm`, `pip` e clonar e atualizar o repositório da empresa, mas porque a empresa bloqueia o *proxy* na versão 2. Arch Linux não funciona na versão 1, por isso, vem com a alternativa versão de `glibc-wsl`. 

As etiquetas `minimal` e `minimal-wsl-1` não vêm com C#, Java, .NET, Nodejs e Python que você não precisa, porque você já tem eles instalados no Windows, mas precisa utilizar git para clonar e atualizar rapidamente, mais que Git Bash. 

**Importante**

Quando você importar para o WSL, é importante você mudar o nome do utilizador e da pasta, e palavra-passe do utilizador. 

Se você quiser utilizar a versão 1 do WSL para instalar os pacotes via Nodejs e Python, e clonar e atualizar os repositórios, recomendamos primeiramente a configurar o SSH e o _proxy_ antes. 

**Observações**

As etiquetas `full` e `latest` são as mesmas coisas. 

## Comparações entre *branches*

| pacote                                                      |      WSL 1      |             |              |   WSL 2   |          |
| ----------------------------------------------------------- | :-------------: | :---------: | :----------: | :-------: | :------: |
|                                                             | `minimal-wsl-1` | `mid-wsl-1` | `full-wsl-1` | `minimal` | `latest` |
| `base-devel`                                                |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `chafa`                                                     |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `chameleon-git` <a href="#fn1" id="fnref1"><sup>1</sup></a> |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `curl`                                                      |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `fish`                                                      |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `fzf`                                                       |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `gcc`                                                       |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `git`                                                       |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `gitstatus`                                                 |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `glibc-wsl` <a href="#fn2" id="fnref2"><sup>2</sup></a>     |     ![][s]      |   ![][s]    |    ![][s]    |  ![][n]   |  ![][n]  |
| `glibc`                                                     |     ![][n]      |   ![][n]    |    ![][n]    |  ![][s]   |  ![][s]  |
| `htop`                                                      |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `imagemagick`                                               |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `kitty-terminfo`                                            |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `kitty`                                                     |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `libsixel`                                                  |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `libvterm`                                                  |     ![][n]      |   ![][s]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `lsd`                                                       |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `lsix-git`                                                  |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `micro`                                                     |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `neofetch`                                                  |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `oh-my-posh`                                                |     ![][n]      |   ![][s]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `oh-my-zsh`                                                 |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `openssh`                                                   |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `pandoc-crossref`                                           |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `pandoc`                                                    |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `powerlevel10k`                                             |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `sixel-tmux-git`                                            |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `sudo`                                                      |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `unzip`                                                     |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `vte3-git`                                                  |     ![][n]      |   ![][s]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `w3m`                                                       |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `wget`                                                      |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `xclip`                                                     |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `xdotool`                                                   |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `xorg-xauth`                                                |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `xorg-xdpyinfo`                                             |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `xorg-xprop`                                                |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `xorg-xrandr`                                               |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `xorg-xwininfo`                                             |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `xterm`                                                     |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `zsh-autosuggestions`                                       |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `zsh-completions`                                           |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `zsh-history-substring`                                     |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `zsh-syntax-highlighting`                                   |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `zsh`                                                       |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |

<hr/>

<ol>
  <li id="fn1"> Um selector de cor totalmente personalizável num terminal. <a href="#fnref1">↩︎</a></li>
  <li id="fn2"> https://github.com/makotom/glibc-wsl <a href="#fnref2">↩︎</a></li>
</ol>

[n]: https://raw.githubusercontent.com/gusbemacbe/complete-linux/main/config/images/no.png
[s]: https://raw.githubusercontent.com/gusbemacbe/complete-linux/main/config/images/yes.png