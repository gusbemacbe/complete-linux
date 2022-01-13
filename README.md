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

| pacote                    |                   WSL 1                    |||        WSL 2        ||
| ------------------------- | :-------------: | :---------: | :----------: | :-------: | :------: |
|                           | `minimal-wsl-1` | `mid-wsl-1` | `full-wsl-1` | `minimal` | `latest` |
| `base-devel`              |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `chafa`                   |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `chameleon-git` [^2]      |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `curl`                    |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `fish`                    |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `fzf`                     |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `gcc`                     |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `git`                     |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `gitstatus`               |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `glibc-wsl` [^1]          |     ![][s]      |   ![][s]    |    ![][s]    |  ![][n]   |  ![][n]  |
| `glibc`                   |     ![][n]      |   ![][n]    |    ![][n]    |  ![][s]   |  ![][s]  |
| `htop`                    |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `imagemagick`             |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `kitty-terminfo`          |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `kitty`                   |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `libsixel`                |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `libvterm`                |     ![][n]      |   ![][s]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `lsd`                     |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `lsix-git`                |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `micro`                   |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `neofetch`                |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `oh-my-posh`              |     ![][n]      |   ![][s]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `oh-my-zsh`               |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `openssh`                 |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `pandoc-crossref`         |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `pandoc`                  |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `powerlevel10k`           |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `sixel-tmux-git`          |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `sudo`                    |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `unzip`                   |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `vte3-git`                |     ![][n]      |   ![][s]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `w3m`                     |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `wget`                    |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `xclip`                   |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `xdotool`                 |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `xorg-xauth`              |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `xorg-xdpyinfo`           |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `xorg-xprop`              |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `xorg-xrandr`             |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `xorg-xwininfo`           |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `xterm`                   |     ![][n]      |   ![][n]    |    ![][s]    |  ![][n]   |  ![][s]  |
| `zsh-autosuggestions`     |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `zsh-completions`         |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `zsh-history-substring`   |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `zsh-syntax-highlighting` |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |
| `zsh`                     |     ![][s]      |   ![][s]    |    ![][s]    |  ![][s]   |  ![][s]  |

[^1]: https://github.com/makotom/glibc-wsl
[^2]: Um selector de cor totalmente personalizável num terminal.

[n]: data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAJPSURBVHgB7VexUtwwEH13JJPrwuQLrqBPSxeXIU3CJFVgBujogC+w7wuAkoqhuIIKOih9JR10zEBxlDRACQ3mrW2BrdNathmGhjdzJ8la7XuWtNIa+MA7o9PE+ACY/gIErP7oAv2EbdPH+imL0QMQzwN3dX3WEiDEPWCNxutFUsXhHW0OWR3MAWO8VsAxiVlEPmIHxjKOIvbQVsAREIoTvA4iYqB1TuFtyQXBIv+G3B+uzo5Cvsxit/hsJgzT8nKgvkylHZdw4xewZdtPOcj7Ofl00elMFOFbEKTtm9FIJdfsGDWzf4GdfeC+UgCnaxNZqJWcGmgiatj1PgEPXIq4OK5bbEi4cU3+lDx3JldJiMxUu8i1sWytHVjRVJqBJeAnsvV/xk0cp47MGxmYtpQuctkDl5PPeyQ84SycOwUsAKtUOWuPqhJhP6sgN7gepsdLhtISkPy7Nkoc+iKgBrlw9IvtLhrAJ8JHnuNrawEpkqRdn4KSgMRzi6m73fRb0dFYAHGFluR1RfAlz6oExGhAnq65Y094RMRaR3oQMT5ueRwn5ncRhokLF1H0YsO604Zji77Et30QlWZgPksmtkuqHCehvdvV6LDGSqJiZ0sTd8E/plafeSCx2pO2fQhpoVbDbszfytAnQG6r/7w0OtmxXHIuF0tVnHvs1uccOYGaER1lyUizmNIh+WHk6lAzIrk2FzOBAd6IXOBNSvPsSGaijwaQ7PiR5K4syLLzI8+SIhr/rpmWbzPt2arzfdD2wyQo3pz528opGjf9MPnAu+MJkfkdXynrRT0AAAAASUVORK5CYII=
[s]: data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAMnSURBVHgB7VcxTBRBFP2zd5xkyXIWR4EasMHEgEZdsVAj2JgoxAYCLBgKSS5Ca4OFFjbQYAnkDDZGFoRrCIHK5KLYaLZQkAQ0QSnAyBWcGzbh7pxx5i5sbvdm7/buNDS8YrM78+e/v2/+zPwBOMIhAxViHJi4LyVFQwaCZeJB1UCQZDrCeB2QoHkNUYv2vdDd+nQVACNOiIYCHqJkkvI9Ep0QFPFheB5Vprag1AAqpzsUhFAwL3GWY7L1h0BI75qez22XA361KwgCBKEUYAjFlKmQU7cH/ic5AwK5vK0B9sMrGq9b4DVKM52tpZD7y0Q4d7w2kyVYOa0o4CYAMXyv2oNL+/OhS73w7tYwDNa3mW0IkSBL5rwB+JLJIAF0AooEI+2ubUq9d59ugpqKQLqDgJSQDCVnAIGJuxJBpBlKIB+sbze/h7/MwuZeNNNEsatgCSAp+uRCl9sBWk7KFvKx9QWY/P7WakRVSIpx2TEAEAQZikCNWAWjjQPm9+beDv37MN9YyBEAIcIZ3pj+utvWrLaRz998DH6faLb1vB+BWMLg2tP8qnYMgAc2r0MXeynJEyrzZUsfW26MvKaiymwbXpmF5d0fzg4Rcs4BOxhBf90d8/3VtYc0s2+Y/aONDyzkKelXw1AIvNZPomfuzkxGlslMAZP0Sj+Vu4JKH4CWU42W0a2Rp1AoLAHQzWKb2I6Hsa+LcL3qrIVs6EJvliMmvW3JcYEIPbYzYJ0CjLn79cDH8ZS8Tlje3XAvPfZpjgF4jbjGznP7GDYVAx/GgYdY3KBZ/wxcAYHuNXIEEO2bYzmg8sYu7azC2NpCVjtnt3MEIRCxV0tZq6BMN1SeCgyPPr1MyX2AyY1IKkfcAAHaYlWSvT2rHjDm1uLH2s/HaSpe5Tl68/MzlX0Pln5RRb4tOm44dmDiGdlVVC07MAf4X9OChPyDgiTNEop18Ksix4pof2ZFK+9oYK9FnQ9uyNPdeSDN9LR6MKY1AimsRqAZT6vj0O9OVc1t5gKsSvJhWqgQaGZHKuQhpk+1TBdVN/eD4i4mAr2YZJ6cdNXQMnwbcOEXkyMcOv4CtXkzSCCtQ4sAAAAASUVORK5CYII=