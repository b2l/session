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
  python \
  python-pip \
  vim \
  inotify-tools \
  wget \
  nodejs \
  yarn \
  zsh \
  the_silver_searcher \
  jq \
  httpie

RUN echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen \
  && locale-gen \
  && echo 'LANG=en_US.UTF-8' > /etc/locale.conf

ENV LANG en_US.UTF-8

RUN groupadd --gid 1000 dev \
    && useradd --uid 1000 --gid 1000 --shell /bin/bash --create-home dev \
    && echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN groupadd --gid 1001 docker \
    && usermod -aG docker dev

RUN yarn global add \
  ts-node \
  ts-node-dev \
  typescript \
  @types/node \
  @types/react \
  @types/react-dom \
  @types/jest \
  import-js

USER dev
WORKDIR /home/dev/perso

