# 使用 Node 官方提供的镜像
FROM daocloud.io/wshudong/docker-vue-cli:latest
MAINTAINER shudong <shudong.wang>

RUN mkdir -p /var/www/html/
WORKDIR /var/www/html/

COPY package.json /var/www/html/
# 由于使用 npm 官方源下载较慢，故改用淘宝的源
RUN npm config set registry https://registry.npm.taobao.org
RUN npm install
COPY . /var/www/html/
# 执行构建命令并将代码构建在 /var/www/html/dist 目录
RUN npm run build
