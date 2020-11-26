FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx 
COPY --from=0 /app/build /usr/share/nginx/html 
#This means that you want to copy something from another phase of the Dockerfile, in this case the Alpine phase
#You can also have multiple blocks of files in a docker file!
