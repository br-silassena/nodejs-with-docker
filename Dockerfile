# Use a imagem oficial do Node.js como base
FROM node:14

# Defina o diretório de trabalho no contêiner
WORKDIR /app

# Copie o arquivo package.json e package-lock.json para o diretório de trabalho
COPY package*.json ./

# Instale as dependências do projeto
RUN npm install

# Copie todo o conteúdo do diretório atual para o diretório de trabalho no contêiner
COPY . .

# Exponha a porta em que o aplicativo estará em execução (substitua pela porta do seu aplicativo)
EXPOSE 3000

# Comando para iniciar a aplicação Node.js (substitua pelo comando real do seu aplicativo)
CMD ["npm", "start"]
