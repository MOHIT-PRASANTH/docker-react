#FOR THE FIRST CONTAINER

FROM node:alpine
WORKDIR /apps/frontend/
COPY package.json .
RUN npm install
COPY ./ ./
RUN npm run build

#FOR THE SECOND CONTAINER
#nginx picks files from /usr/share/nginx/html/

FROM nginx
EXPOSE 80
COPY --from=0 /apps/frontend/build /usr/share/nginx/html