FROM        nginx:alpine
MAINTAINER  Dan Wahlin
WORKDIR     /usr/share/nginx/html
COPY        . /usr/share/nginx/html

# Could do . ./ for the COPY if you wanted to

EXPOSE      80
CMD         ["nginx", "-g", "daemon off;"]