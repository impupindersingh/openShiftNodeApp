FROM node:8.12.0
RUN  echo "Asia/Istanbul" > /etc/timezone
RUN  dpkg-reconfigure -f noninteractive tzdata
RUN mkdir -p /app && chown -R node:node /app

RUN mkdir -p /app && chown -R node:node /app

WORKDIR /app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY . .
USER node

EXPOSE 5555
CMD [ "node", "app.js" ]