# Arch Completo

A imegm e os seus *containers* são deisgnados para atender as necessidades dos colaboradores da empresa que podem puxar a imagem do Docker, sob a autorização da empresa, para exportar e importar para o WSL. 

A imagem vem com várias diferentes etiquetas, isto depende do que o colaborador quiser ou precisar, você pode entrar a tabela de comparações entre _branches_ e ver quais têm ou têm pacotes que você precisa. 

Para visualizar a tabela, por obséquio, visite directamente a [lista de pacotes numa tabela de comparações de _branches_](https://github.com/gusbemacbe/complete-linux/blob/main/complete-arch/README.md)

As etiquetas terminadas em `wsl-1` indicam que você quer utilizar a versão do WSL 1 para poder instalar os pacotes via `npm`, `pip` e clonar e atualizar o repositório da empresa, mas porque a empresa bloqueia o *proxy* na versão 2. Arch Linux não funciona na versão 1, por isso, vem com a alternativa versão de `glibc-wsl`. 

As etiquetas `minimal` e `minimal-wsl-1` não vêm com C#, Java, .NET, Nodejs e Python que você não precisa, porque você já tem eles instalados no Windows, mas precisa utilizar git para clonar e atualizar rapidamente, mais que Git Bash. 

**Importante**

Se a sua empresa limitar a imagem ou o *container* a 1 GB, recomendamos que comece com o menor tamanho das eqtieutas até ao maior tamanho, pois os *containers* dos maiores tamanhos já têm *layers* existentes dos *containers* dos menores tamanhos. 

Quando você importar para o WSL, é importante você mudar o nome do utilizador e da pasta, e palavra-passe do utilizador. 

Se você quiser utilizar a versão 1 do WSL para instalar os pacotes via Nodejs e Python, e clonar e atualizar os repositórios, recomendamos primeiramente a configurar o SSH e o _proxy_ antes. 

**Observações**

As etiquetas `full` e `latest` são as mesmas coisas.