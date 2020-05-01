#FOR THE FIRST CONTAINER

FROM node:alpine AS builder
WORKDIR /apps/frontend/
COPY package.json .
RUN npm install
COPY ./ ./
RUN npm run build

#FOR THE SECOND CONTAINER
#nginx picks files from /usr/share/nginx/html/

FROM nginx
COPY --from=builder /apps/frontend/build /usr/share/nginx/html