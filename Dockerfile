FROM node:14
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install the dependencies
COPY package.json /usr/src/app/
RUN yarn install

# Install everything else
COPY . /usr/src/app/

# Point at some other data directory
RUN mkdir /data
ENV DATA_DIR=/data
# Application code can look at process.env.DATA_DIR

# Usual application metadata
EXPOSE 3000
CMD ["node", "index.js"]