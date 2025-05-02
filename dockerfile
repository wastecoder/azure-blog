# Usa o Nginx como servidor web
FROM nginx:alpine

# Copia o HTML para o container
COPY html /usr/share/nginx/html

# Indica que usará a porta 80 - apenas indica, não publica
EXPOSE 80
