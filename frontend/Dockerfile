# Use uma imagem base oficial do Node.js
FROM node:22

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o arquivo package.json e o package-lock.json para instalar as dependências
COPY package*.json ./

# Instale as dependências do projeto
RUN npm install

# Copie o restante do código do frontend para o contêiner
COPY . .

# Exponha a porta usada pelo Vite
EXPOSE 3000

# Comando para iniciar o servidor Vite
CMD ["npm", "run", "dev", "--", "--host"]
