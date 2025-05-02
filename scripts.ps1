# Cria uma imagem Docker chamada blog-pedro-app, com a tag latest, usando o arquivo Dockerfile presente na raiz do projeto.
docker build -t blog-pedro-app .

# Executa em segundo plano um container baseado na imagem blog-pedro-app, expondo o serviço do container na porta 80 do host.
docker run -d -p 80:80 blog-pedro-app

# ========================================================== #

# Faz autenticação no Azure CLI.
az login

# Para executar o comando acima precisa ter o Azure CLI baixado.
# Caso não tenha execute o comando: winget install --exact --id Microsoft.AzureCLI


# Cria um Grupo de Recurso - Resource Group.
az group create --name containerappslab03 --location eastus


# Cria um Registro de Contêiner - Container Registry.
az acr create --resource-group containerappslab03 --name blogpedroacr --sku Basic

# Loga no ACR criado.
az acr login --name blogpedroacr


# Cria uma nova tag para a imagem blog-pedro-app:latest.
docker tag blog-pedro-app:latest blogpedroacr.azurecr.io/blog-pedro-app:latest

# Envia a imagem para o ACR.
docker push blogpedroacr.azurecr.io/blog-pedro-app:latest


# Dados pego no Microsoft Azure
## Dentro do ACR criado >> Serviços >> Repositórios:
## Referência de artefato/containerID = blogpedroacr.azurecr.io/blog-pedro-app:latest

## Dentro do ACR criado >> Configurações >> Chaves de acesso:
## Usuário =  blogpedroacr
## Senha   = SUA_SENHA_DO_ACR

# Cria ambiente do container app
az containerapp env create  --name blog-pedro-env --resource-group containerappslab03 --location eastus 

# Cria o Container App
az containerapp create --name blog-pedro-app --resource-group containerappslab03 --image blogpedroacr.azurecr.io/blog-pedro-app:latest --environment blog-pedro-env --target-port 80 --ingress external --registry-username blogpedroacr --registry-password SUA_SENHA_DO_ACR --registry-server blogpedroacr.azurecr.io

## Abaixo está o mesmo comando acima, mas organizado em linhas
# az containerapp create \
# --name blog-pedro-app \
# --resource-group containerappslab03 \
# --location eastus \
# --image blogpedroacr.azurecr.io/blog-pedro-app:latest \
# --environment blog-pedro-env \
# --target-port 80 \ 
# --ingress external
# --registry-username blogpedroacr
# --registry-password SUA_SENHA_DO_ACR
# --registry-server blogpedroacr.azurecr.io

# ========================================================== #

# Após executar o "az containerapp create", a aplicação já está funcionando.
# No terminal, procure pelo "latestRevisionFqdn". Copie dele link e coloque no seu navegador.
# Isso permitirá criar posts, listar e adicionar comentários em posts existentes.
