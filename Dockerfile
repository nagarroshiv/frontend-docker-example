FROM node:14.18.1 as builder

RUN mkdir -p /home/app
WORKDIR /home/app
COPY . /home/app
RUN npm i
RUN npm run build

FROM nginx
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=builder /home/app/build .
CMD ["nginx", "-g", "daemon off;"]