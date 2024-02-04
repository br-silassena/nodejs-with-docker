# nodejs-with-docker
## Este projeto

Este é um servidor Node.js simples que utiliza o módulo nativo do Node.js, ouvindo na porta 3000. O módulo nativo está sendo usado como padrão para evitar erros durante a instalação de dependências externas pelo Docker. Por este motivo, o arquivo package.json não faz uso de nenhuma dependência.

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