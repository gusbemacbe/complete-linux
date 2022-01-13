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
<table>
  <thead>
    <tr class="header">
      <th>pacote</th>
      <th colspan="3" style="text-align: center;">WSL 1</th>
      <th colspan="2" style="text-align: center;">WSL 2</th>
    </tr>
  </thead>
  <tbody>
    <tr class="odd">
      <td></td>
      <td style="text-align: center;"><code>minimal-wsl-1</code></td>
      <td style="text-align: center;"><code>mid-wsl-1</code></td>
      <td style="text-align: center;"><code>full-wsl-1</code></td>
      <td style="text-align: center;"><code>minimal</code></td>
      <td style="text-align: center;"><code>latest</code></td>
    </tr>
    <tr class="even">
      <td><code>base-devel</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>chafa</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="even">
      <td><code>chameleon-git</code> <a href="#fn1" class="footnote-ref" id="fnref1"
          role="doc-noteref"><sup>1</sup></a></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>curl</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="even">
      <td><code>fish</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>fzf</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="even">
      <td><code>gcc</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>git</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="even">
      <td><code>gitstatus</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>glibc-wsl</code> <a href="#fn2" class="footnote-ref" id="fnref2" role="doc-noteref"><sup>2</sup></a>
      </td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
    </tr>
    <tr class="even">
      <td><code>glibc</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>htop</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="even">
      <td><code>imagemagick</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>kitty-terminfo</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="even">
      <td><code>kitty</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>libsixel</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="even">
      <td><code>libvterm</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>lsd</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="even">
      <td><code>lsix-git</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>micro</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="even">
      <td><code>neofetch</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>oh-my-posh</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="even">
      <td><code>oh-my-zsh</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>openssh</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="even">
      <td><code>pandoc-crossref</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>pandoc</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="even">
      <td><code>powerlevel10k</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>sixel-tmux-git</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="even">
      <td><code>sudo</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>unzip</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="even">
      <td><code>vte3-git</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>w3m</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="even">
      <td><code>wget</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>xclip</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="even">
      <td><code>xdotool</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>xorg-xauth</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="even">
      <td><code>xorg-xdpyinfo</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>xorg-xprop</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="even">
      <td><code>xorg-xrandr</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>xorg-xwininfo</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="even">
      <td><code>xterm</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/3Fn9BZm" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>zsh-autosuggestions</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="even">
      <td><code>zsh-completions</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>zsh-history-substring</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="even">
      <td><code>zsh-syntax-highlighting</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
    <tr class="odd">
      <td><code>zsh</code></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
      <td style="text-align: center;"><img src="https://bit.ly/34Mnunr" /></td>
    </tr>
  </tbody>
</table>

<hr />

<ol>
  <li id="fn1" role="doc-endnote">
    <p>Um selector de cor totalmente personalizável num terminal. <a href="#fnref1" class="footnote-back"
        role="doc-backlink">↩︎</a></p>
  </li>
  <li id="fn2" role="doc-endnote">
    <p>https://github.com/makotom/glibc-wsl <a href="#fnref2" class="footnote-back" role="doc-backlink">↩︎</a></p>
  </li>
</ol>