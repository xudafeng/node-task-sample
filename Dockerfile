FROM node:6

COPY sources.list /etc/apt/sources.list

COPY . /server

ENTRYPOINT ["/server/entrypoint.sh"]
