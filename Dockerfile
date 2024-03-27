# Use a imagem oficial do Node.js como base
FROM node:18

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

#em producao
#CMD ["npm", "start"] # producao

#em desenvolvimento
CMD ["npm", "run", "dev"]
