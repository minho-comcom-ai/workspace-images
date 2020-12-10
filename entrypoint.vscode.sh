echo "VSCode-server version: $VSC_SERVER"
echo "Password: $PASSWORD"
echo "Github Repo: $GH_REPO"

if [ "$GH_REPO" ]
then
  git clone ${GH_REPO}
  git config --global user.email "$USER_EMAIL"
  git config --global user.name "$USER_NAME"
fi

if [ -z "$PASSWORD" ]
then
  AUTH=none
else
  AUTH=password
fi

# RUN
/usr/code-server-$VSC_SERVER-linux-amd64/bin/code-server /workspace/ --bind-addr=0.0.0.0:8000 --auth $AUTH
