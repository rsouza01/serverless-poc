FROM node:12-alpine

LABEL maintainer="Rodrigo de Souza <rsouza01@gmail.com>"
LABEL build_date="2020-12-10"

RUN apk add --no-cache \
  python \
  py-pip \
  py-setuptools \
  ca-certificates \
  groff \
  less \
  bash && \
  pip install --no-cache-dir --upgrade pip awscli

ENV NODE_ENV development

RUN npm install -g npm@latest && npm install -g serverless@2.15.0

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN cp -R /root/.oh-my-zsh /home/$USERNAME
RUN cp /root/.zshrc /home/$USERNAME
RUN sed -i -e "s/\/root\/.oh-my-zsh/\/home\/$USERNAME\/.oh-my-zsh/g" /home/$USERNAME/.zshrc
RUN chown -R $USER_UID:$USER_GID /home/$USERNAME/.oh-my-zsh /home/$USERNAME/.zshrc

ENTRYPOINT ["/bin/bash", "-c"]