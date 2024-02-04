# Apresentação

Este é um servidor Node.js simples que utiliza o módulo nativo do Node.js, operando na porta 3000. O módulo nativo é empregado como padrão para mitigar possíveis erros durante o processo de instalação de dependências externas através do Docker. Portanto, o arquivo package.json não faz uso de quaisquer dependências adicionais.

### package.json

```
{
  "name": "appnode",
  "version": "1.0.0",
  "description": "Node.js on Docker",
  "author": "Silas Sena silassena.dev@gmail.com",
  "main": "server.js",
  "scripts": {
    "start": "node server.js"
  }
}

```
## Construção do Projeto

### Com DockerFile

Para construir este projeto exclusivamente com o DockerFile, siga os seguintes passos:

1. No diretório raiz do projeto, onde se encontra o arquivo Dockerfile, execute o comando para criar a imagem com o nome de sua escolha:

```
 docker build -t nome-imagem-node .

```

2. Após criar a imagem, crie o container mapeando a porta desejada para acessar o servidor. O serviço está configurado para escutar a porta 3000, e o diretório raiz será mapeado para o diretório de trabalho '/app' conforme definido no Dockerfile:

```
 docker run -p 3000:3000 -v $(pwd):/app --name container-app-node nome-imagem-node

```

3. Após a execução destes passos, o container estará disponível para acesso via navegador sem qualquer problema.

### Com Docker Composer

```
version: '3'
services:
  nodeservice:
    container_name: appnode
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - 3000:3000
    volumes:
      - .:/app
```

1. No diretório raiz do projeto, execute o seguinte comando:

```
 docker compose up -d --build 

```
- ** docker compose up ** : Inicializa o container.
- ** -d ** : Ativa o 'detached mode', permitindo que o container seja executado em segundo plano, liberando o terminal.
- **  --build ** : Opcionalmente, essa opção reconstruirá a imagem usada para criar este container.

O container criado com esse docker-compose.yml está configurado para mapear a porta 3000 da máquina host com a porta 3000 do container.


### Instalando dependencias

Com o container em execução, agora você pode instalar as dependências necessárias. Isso resultará na criação do diretório 'node_modules' na raiz do projeto, desde que o volume esteja mapeado corretamente:

```
docker exec -it nome_container npm install -g nodemon

```

- ** docker exec -it ** : Este comando será executado de forma iterativa, permitindo a visualização da saída do comando.
- ** npm install -g nodemon ** :  Este comando será executado dentro do container.

Com o volume devidamente mapeado, todas as alterações ocorrerão em tempo real no container. Configurações adicionais podem ser aplicadas ao serviço de acordo com suas preferências.
