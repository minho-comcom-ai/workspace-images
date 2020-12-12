echo "Password: $PASSWORD"
echo "Github Repo: $GH_REPO"

if [ "$GH_REPO" ]
then
  git clone ${GH_REPO}
  git config --global user.email "$USER_EMAIL"
  git config --global user.name "$USER_NAME"
fi

jupyter-lab --ip=0.0.0.0 --port=8000 --notebook-dir=/workspace/$REPO_NAME --LabApp.token="$PASSWORD" --allow-root
