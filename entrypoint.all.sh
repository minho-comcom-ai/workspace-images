echo "Run Jupyter Lab & VSCode & TTYD"
echo "Password: $PASSWORD"

if [ "$GH_REPO" ]
then
  echo "Github Repo: $GH_REPO"
  git clone ${GH_REPO}
  git config --global user.email "$USER_EMAIL"
  git config --global user.name "$USER_NAME"
fi

jupyter-lab --ip=0.0.0.0 --port=8000 --notebook-dir=/workspace/ --LabApp.token="$PASSWORD" --allow-root &

if [ -z "$PASSWORD" ]
then
AUTH=none
else
AUTH=password
fi
/usr/code-server-3.6.0-linux-amd64/bin/code-server /workspace/ --bind-addr=0.0.0.0:8010 --auth $AUTH &

if [ -z "$PASSWORD" ]
then
TTYD_PASS=
else
TTYD_PASS="-c username:$PASSWORD"
fi
/ttyd -p 8020 $TTYD_PASS bash &

/pause