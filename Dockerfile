#Use an existing docker image as a base
FROM node:alpine3.11

WORKDIR /usr/app

#Download and install dependencies 
COPY ./package.json ./
RUN npm install
COPY ./ ./

#Tell the image what to do when it starts
RUN npm run build





FROM nginx
COPY --from=0 /usr/app/build /usr/share/nginx/html
