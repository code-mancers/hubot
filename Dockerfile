FROM node:latest

RUN apt-get install libexpat1-dev
RUN adduser --disabled-password --gecos "" hubot; \
  echo "hubot ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
ENV HOME /home/hubot
WORKDIR ${HOME}
ADD . alfred
RUN chown -R hubot:hubot alfred
USER hubot
WORKDIR alfred
RUN npm install
ENTRYPOINT ["./bin/hubot", "--adapter hipchat"]
