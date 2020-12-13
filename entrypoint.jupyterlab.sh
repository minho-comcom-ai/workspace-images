echo "Run Jupyter Lab"
echo "Password: $PASSWORD"
echo "Github Repo: $GH_REPO"
echo "Launch: $TOOL"

if [ "$GH_REPO" ]
then
  git clone ${GH_REPO}
  git config --global user.email "$USER_EMAIL"
  git config --global user.name "$USER_NAME"
fi

if [ "$TOOL" = "jupyter" ]
then
  echo "Open jupyter-lab"
  jupyter-lab --ip=0.0.0.0 --port=8000 --notebook-dir=/workspace/$REPO_NAME --LabApp.token="$PASSWORD" --allow-root
else
  /usr/code-server-3.6.0-linux-amd64/bin/code-server /workspace/$REPO_NAME --bind-addr=0.0.0.0:8000 --auth $AUTH
fi
