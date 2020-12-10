## update and install some things we should probably have
apt-get update
apt-get install -y \
  curl \
  git \
  gnupg2 \
  jq \
  sudo \
  zsh \
  ca-certificates \
  groff \
  less


# Python related tools

apt-get install -y software-properties-common
add-apt-repository ppa:deadsnakes/ppa
apt-get update && apt-get install -y python3.7 python3-pip

python3.7 -m pip install pip

apt-get update && apt-get install -y \
  python3-distutils \
  python3-setuptools

python3.7 -m pip install pip --upgrade pip awscli

# set-up and install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update && apt-get install yarn -y

# instsal nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install --lts

# SecretHub cli
echo "deb [trusted=yes] https://apt.secrethub.io stable main" > /etc/apt/sources.list.d/secrethub.sources.list && \
apt-get update
apt-get install -y secrethub-cli

# setup and install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp -R /root/.oh-my-zsh /home/$USERNAME
cp /root/.zshrc /home/$USERNAME
sed -i -e "s/\/root\/.oh-my-zsh/\/home\/$USERNAME\/.oh-my-zsh/g" /home/$USERNAME/.zshrc
chown -R $USER_UID:$USER_GID /home/$USERNAME/.oh-my-zsh /home/$USERNAME/.zshrc
