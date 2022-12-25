# Dockerfile

FROM node:alpine
RUN mkdir -p /opt/factoriolab
WORKDIR /opt/factoriolab
RUN apk --no-cache add curl unzip
RUN curl -L https://github.com/NOLA-CML/factoriolab/archive/c14f17727f894c805b4e475636b1a98667ae0741.zip -o file.zip
RUN unzip file.zip
WORKDIR /opt/factoriolab/factoriolab-c14f17727f894c805b4e475636b1a98667ae0741/
RUN npm install -g @angular/cli
RUN npm ci
EXPOSE 4200
CMD [ "npm", "start", "-H", "0.0.0.0"]