FROM        node:alpine

LABEL       author="Dan Wahlin"

ENV         NODE_ENV=development
WORKDIR     /var/www
COPY        . /var/www

RUN         npm install

EXPOSE      3000

CMD         ["npm", "start"]
