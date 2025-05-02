# Blog Simples com Persistência Local

Este repositório contém o código de um desafio de projeto do bootcamp **Microsoft Azure Cloud Native** da DIO.
O objetivo principal é criar um blog funcional e simples, permitindo a criação, visualização, edição e exclusão de posts e seus respectivos comentários.
Uma característica importante deste projeto é a utilização do _localStorage_ do navegador para a persistência dos dados, usando uma abordagem client-side para o armazenamento.


## :file_folder: Estrutura do Projeto

```bash
azure-blog/
├── html/
├── js/
├── dockerfile
└── scripts.ps1
```

* `html/`: Contém os arquivos HTML que definem a interface do blog.
* `js/`: Contém os arquivos JavaScript que implementam a interatividade do blog.
* `dockerfile`: Define as instruções para construir uma imagem usando o Nginx como servidor web.
* `scripts.ps1`: Contém Script PowerShell para construir uma imagem, executá-la localmente e realizar o deploy da aplicação no Azure Container Apps.


## :cloud: Tecnologias e Serviços Azure Utilizados
Durante a implantação deste projeto, foram utilizados os seguintes serviços do Microsoft Azure:

* **Grupo de Recursos:** Organiza todos os recursos relacionados ao projeto.
* **Aplicativo de Contêiner:** Serviço para hospedar a aplicação em contêineres de forma escalável.
* **Ambiente de Aplicativos de Contêiner:** Define o ambiente para a execução dos aplicativos de contêiner.
* **Registro de Contêiner:** Serviço para armazenar e gerenciar imagens de contêiner Docker.


## :bulb: Insights e Possibilidades
* **Facilidade de Deploy:** Docker empacota a aplicação, garantindo que ela funcione igual em qualquer ambiente, facilitando a implantação na nuvem e em outras plataformas.
* **Escalabilidade e Simplicidade no Azure:** O Azure Container Apps cuida da infraestrutura, permitindo que a aplicação cresça facilmente e focando apenas no código.
* **Atualizações Automatizadas:** Usar o Azure Container Registry e o Container Apps simplifica a criação e implantação automática de novas versões da aplicação.


## :computer: Instalação e Execução
Para executar este projeto localmente no seu navegador:

1. **Clone o projeto:**
    ```bash
    git clone https://github.com/wastecoder/azure-blog.git
    ```
2. **Abra os arquivos HTML diretamente no seu navegador:**
   * Abra o arquivo ```html/index.html``` para visualizar a página principal do blog.
   * Você pode navegar para as outras páginas a partir da interface.
3. **Executar com Azure Container Apps (Requer Azure CLI e conta Azure):**
   * Execute os comandos no arquivo [scripts.ps1](https://github.com/wastecoder/azure-blog/blob/main/scripts.ps1) utilizando o PowerShell.
   * Caso não tenha o Azure CLI instalado, você pode instalá-lo executando ```winget install --exact --id Microsoft.AzureCLI``` no PowerShell.
   * Após a conclusão do script, procure no terminal pela propriedade ```latestRevisionFqdn``` na saída do comando de criação do Container App.
   * Copie e cole esse link no seu navegador para acessar a aplicação rodando no Azure.


Como este projeto utiliza apenas HTML, CSS (via Bootstrap) e JavaScript, não é necessário um servidor local para executá-lo.
