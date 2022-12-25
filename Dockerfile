# Dockerfile

FROM node:alpine
RUN mkdir -p /opt/factoriolab
WORKDIR /opt/factoriolab
RUN apk --no-cache add curl unzip
RUN curl -L https://github.com/warfuric/factoriolab/archive/refs/heads/master.zip -o file.zip
RUN unzip file.zip
WORKDIR /opt/factoriolab/factoriolab-master/
RUN npm install -g @angular/cli
RUN npm ci
EXPOSE 4200
CMD [ "npm", "start", "-H", "0.0.0.0"]