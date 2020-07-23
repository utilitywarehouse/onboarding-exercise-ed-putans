# # yeeted fron https://mherman.org/blog/dockerizing-a-react-app/

# # pull official base image
# FROM node:13.12.0-alpine

# # set working directory
# WORKDIR /.

# # add `/app/node_modules/.bin` to $PATH
# ENV PATH ./node_modules/.bin:$PATH

# # install app dependencies
# COPY package.json ./
# COPY package-lock.json ./
# RUN npm install --silent
# RUN npm install react-scripts@3.4.1 -g --silent

# # add app
# COPY . ./

# # start app
# CMD ["npm", "start"]

# skedadled from https://medium.com/greedygame-engineering/so-you-want-to-dockerize-your-react-app-64fbbb74c217
# stage: 1
# FROM node:12 as react-build
# WORKDIR /app
# COPY . ./
# RUN yarn
# RUN yarn build
# # stage2?

# FROM nginx:alpine

# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;]


# this worked:
# FROM nginx:alpine
# COPY build/ /usr/share/nginx/html/
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]

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