FROM base/archlinux

USER root

RUN curl -s \
  "https://www.archlinux.org/mirrorlist/?country=FR&protocol=http&protocol=https&ip_version=4&use_mirror_status=on" | \
  sed -e 's/^#Server/Server/' -e '/^#/d' > /etc/pacman.d/mirrorlist

RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm \
  git \
  bash-completion \
  unzip \
  base-devel \
  protobuf \
  python \
  python-pip \
  vim \
  inotify-tools \
  wget \
  nodejs \
  yarn \
  mosquitto \ 
  zsh \
  the_silver_searcher \
  jq \
  httpie


COPY mosquitto-dev-env.conf /etc/mosquitto/mosquitto-dev-env.conf
COPY Easymile-Root-Certificate-Authority-G1.crt /usr/local/share/ca-certificates/
RUN update-ca-trust
ENV VAULT_ADDR=https://vault.easymile.com REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

USER root

RUN mkdir /chromedriver \
    && wget -q --continue -P /chromedriver "http://chromedriver.storage.googleapis.com/2.45/chromedriver_linux64.zip" \
    && unzip /chromedriver/chromedriver* -d /chromedriver \
    && chmod a+x /chromedriver/chromedriver

RUN echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen \
  && locale-gen \
  && echo 'LANG=en_US.UTF-8' > /etc/locale.conf

ENV LANG en_US.UTF-8
ENV PATH="${PATH}:/chromedriver"

RUN groupadd --gid 1000 dev \
    && useradd --uid 1000 --gid 1000 --shell /bin/bash --create-home dev \
    && echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN groupadd --gid 1001 docker \
    && usermod -aG docker dev

USER dev

# Keybase
RUN git clone https://aur.archlinux.org/keybase-bin.git /tmp/keybase-bin \
  && cd /tmp/keybase-bin \
  && makepkg -si --noconfirm

# Google chrome
RUN git clone https://aur.archlinux.org/google-chrome.git /tmp/google-chrome \
  && cd /tmp/google-chrome \
  && makepkg -si --noconfirm


RUN git clone https://github.com/asdf-vm/asdf.git /home/dev/.asdf --branch v0.4.3
ENV PATH="${PATH}:/home/dev/.asdf/shims:/home/dev/.asdf/bin"

RUN asdf plugin-add vault https://github.com/Banno/asdf-hashicorp.git \
   && asdf install vault 0.9.5 \
   && asdf global vault 0.9.5 \
   && asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git \
   && asdf install erlang 21.1 \
   && asdf global erlang 21.1 \
   && asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git \
   && asdf install elixir 1.7.3 \
   && asdf global elixir 1.7.3 \
   && mix local.hex --force  \
   && mix local.rebar --force

RUN pip install --user awscli

USER root

RUN http -d -o /tmp/elixir-ls.zip GET `http GET https://api.github.com/repos/JakeBecker/elixir-ls/releases/latest | jq -r '.assets[0].browser_download_url'`
RUN unzip /tmp/elixir-ls.zip -d /elixir-ls
RUN chmod +x /elixir-ls/language_server.sh

RUN yarn global add flow-language-server import-js

# Helm, kops and kubectl
ADD https://github.com/kubernetes/kops/releases/download/1.8.0/kops-linux-amd64 /usr/bin/kops
ADD https://storage.googleapis.com/kubernetes-release/release/v1.8.5/bin/linux/amd64/kubectl /usr/bin/kubectl
ADD https://kubernetes-helm.storage.googleapis.com/helm-v2.7.2-linux-amd64.tar.gz /helm
RUN tar xvzf /helm
RUN cp /linux-amd64/helm /usr/bin/helm
RUN chmod +x /usr/bin/*

USER dev

RUN pip3 install --user python-language-server
RUN pip3 install --user pyflakes
RUN pip3 install --user yapf

WORKDIR /home/dev/projects/fleet-management

