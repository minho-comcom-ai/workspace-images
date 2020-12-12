# [Choice] Node.js version: 14, 12, 10
#ARG VARIANT=12
#FROM mcr.microsoft.com/vscode/devcontainers/typescript-node:${VARIANT}

ARG VARIANT=3
FROM mcr.microsoft.com/vscode/devcontainers/python:${VARIANT}

# [Option] Install Node.js
ARG INSTALL_NODE="true"
ARG NODE_VERSION="lts/*"
RUN if [ "${INSTALL_NODE}" = "true" ]; then su vscode -c "source /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# Install Chrome
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN sudo apt-get update
RUN sudo apt -y --fix-broken install ./google-chrome-stable_current_amd64.deb

# Copy Browser Preview Extension settings
COPY vscode.settings.json /root/.local/share/code-server/User/settings.json

# Install VSCODE Server.
ARG VSC_SERVER=3.7.3
ENV VSC_SERVER=${VSC_SERVER}
WORKDIR /usr
RUN wget -q https://github.com/cdr/code-server/releases/download/v$VSC_SERVER/code-server-$VSC_SERVER-linux-amd64.tar.gz
RUN tar xf code-server-$VSC_SERVER-linux-amd64.tar.gz
RUN code-server-$VSC_SERVER-linux-amd64/bin/code-server --install-extension ms-python.python --install-extension dbaeumer.vscode-eslint --install-extension auchenberg.vscode-browser-preview


RUN mkdir /workspace
RUN mkdir -p /root/.ssh
VOLUME /root/.ssh
WORKDIR /workspace

ENV LC_ALL C.UTF-8
ENV SHELL /bin/bash

COPY README.md README.md

RUN mkdir /scripts
COPY entrypoint.vscode.sh /scripts/entrypoint.sh
RUN ["chmod", "+x", "/scripts/entrypoint.sh"]

EXPOSE 8000
#CMD /usr/code-server-$VSC_SERVER-linux-amd64/bin/code-server /workspace --bind-addr=0.0.0.0:8000 --auth none
CMD /scripts/entrypoint.sh

