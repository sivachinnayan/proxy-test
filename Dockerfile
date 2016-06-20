FROM node:4

WORKDIR /opt
EXPOSE 1337
VOLUME ["/opt/data"]
CMD ["node", "proxy.js"]

ADD package.json /opt/package.json
RUN cd /opt && npm install

ADD . /opt
RUN npm run build
