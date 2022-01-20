# Linux Completo

As imegns e os seus *containers* de distirbuições Arch Linux são deisgnados para atender as necessidades dos colaboradores da empresa que podem puxar as imagens do Docker, sob a autorização da empresa, para exportar e importar para o WSL. 

A imagem vem com várias diferentes etiquetas, isto depende do que o colaborador quiser ou precisar, você pode entrar a tabela de comparações entre _branches_ e ver quais têm ou têm pacotes que você precisa. 

**Importante**

Se a sua empresa limitar a imagem ou o *container* a 1 GB, recomendamos que comece com o menor tamanho das eqtieutas até ao maior tamanho, pois os *containers* dos maiores tamanhos já têm *layers* existentes dos *containers* dos menores tamanhos. 

Quando você importar para o WSL, é importante você mudar o nome do utilizador e da pasta, e palavra-passe do utilizador. 

Devido aos *proxies* da sua empresa, se você quiser utilizar a versão 1 do WSL para ser capaz de instalar os pacotes via Nodejs e Python, e clonar e atualizar os repositórios da empresa, recomendamos primeiramente a configurar o SSH e o _proxy_ antes. 

**Observações**

As etiquetas `full` e `latest` são as mesmas coisas.