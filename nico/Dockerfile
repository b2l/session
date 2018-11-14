FROM dev

ARG USERNAME=dev

USER root

RUN apt-get update && apt-get install -y \
  jq \
  neovim \
  silversearcher-ag \
  httpie


RUN http -d -o /tmp/elixir-ls.zip GET `http GET https://api.github.com/repos/JakeBecker/elixir-ls/releases/latest | jq -r '.assets[0].browser_download_url'`
RUN unzip /tmp/elixir-ls.zip -d /elixir-ls
RUN chmod +x /elixir-ls/language_server.sh

RUN yarn global add flow-language-server import-js

RUN pip3 install 'python-language-server[all]'

USER ${USERNAME}

