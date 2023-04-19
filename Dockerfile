FROM node:14.18.1

RUN mkdir -p /home/app
WORKDIR /home/app
COPY . /home/app
RUN npm i
CMD ["npm", "start"]
EXPOSE 3000