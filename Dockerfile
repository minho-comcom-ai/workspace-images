FROM minhocomcomai/vscode

RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt install -y nodejs

RUN pip install jupyterlab jupyterlab-git
RUN jupyter labextension enable
RUN jupyter labextension install -y @jupyterlab/git
COPY entrypoint.jupyterlab.sh /scripts/entrypoint.sh
RUN chmod +x /scripts/entrypoint.sh

EXPOSE 8888

CMD /scripts/entrypoint.sh
