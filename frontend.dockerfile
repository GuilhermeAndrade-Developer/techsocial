# Use uma imagem leve com servidor web
FROM nginx:alpine

# Copie os arquivos do front-end para o diretório de trabalho do Nginx
COPY frontend/ /usr/share/nginx/html

# Exponha a porta do servidor web
EXPOSE 80

# Comando padrão para iniciar o servidor Nginx
CMD ["nginx", "-g", "daemon off;"]
