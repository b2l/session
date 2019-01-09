FROM base/archlinux

USER root

# RUN curl -s \
#   "https://www.archlinux.org/mirrorlist/?country=FR&protocol=http&protocol=https&ip_version=4&use_mirror_status=on" | \
#   sed -e 's/^#Server/Server/' -e '/^#/d' > /etc/pacman.d/mirrorlist

RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm \
  git \
  base-devel

RUN useradd --shell /bin/bash --create-home dev \
    && echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER dev

# Slack
RUN git clone https://aur.archlinux.org/slack-desktop.git /tmp/slack \
  && cd /tmp/slack \
  && makepkg -si --noconfirm

ENTRYPOINT ["slack", "--disable-gpu"]
