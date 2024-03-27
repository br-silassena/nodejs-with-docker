'use strict';

import { createServer } from 'node:http';

// Crie um servidor HTTP
const server = createServer((req, res) => {
  // Lógica de resposta aqui
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Servidor Node.js esta em execucao!\n');
});

// Defina a porta em que o servidor irá escutar
const porta = 3000;

// Faça o servidor escutar a porta especificada
server.listen(porta, () => {
  console.log(`Servidor está ouvindo na porta  ${porta}`);
});
