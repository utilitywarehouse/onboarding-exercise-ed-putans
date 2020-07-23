# yeeted from https://medium.com/swlh/an-example-ci-process-for-react-apps-with-docker-2247171a218
FROM node:11.10.1-alpine as build

WORKDIR /app

COPY package*.json /app/

RUN yarn install

COPY ./ /app/

RUN yarn run build

FROM nginx:1.15.8-alpine

COPY --from=build /app/build /usr/share/nginx/html
COPY --from=build /app/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]