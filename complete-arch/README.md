# Arch Completo

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