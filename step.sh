#!/bin/bash

# Required Input Checks
if [ -z "${heroku_api_token}" ] ; then
  echo "[!] No heroku_api_token specified!"
  exit 1
fi
if [ -z "${heroku_app_id}" ] ; then
  echo "[!] No heroku_app_id specified!"
  exit 1
fi

if [[ "$(uname)" == "Linux" ]] ; then
  heroku --version &> /dev/null
  heroku_ver_res=$?
  if [ $heroku_ver_res -eq 0 ] ; then
    echo " (i) Heroku Toolbelt already installed"
  else
    echo " (i) Installing Heroku"
    wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
    if [ $? -ne 0 ] ; then
      echo " [!] Failed to install Heroku Toolbelt!"
      exit 1
    fi
  fi
fi

set -e
touch ~/.netrc
tempdir="$(mktemp -d)"
temp_netrc_path="$tempdir/orig.netrc"
cp ~/.netrc "$temp_netrc_path"

function restore_orig_netrc {
  # restore original ~/.netrc
  cp "$temp_netrc_path" ~/.netrc
}

echo >> ~/.netrc
echo "machine api.heroku.com" >> ~/.netrc
echo "  login bot@bitrise.io" >> ~/.netrc
echo "  password ${heroku_api_token}" >> ~/.netrc
echo "machine git.heroku.com" >> ~/.netrc
echo "  login bot@bitrise.io" >> ~/.netrc
echo "  password ${heroku_api_token}" >> ~/.netrc

set +e

heroku git:remote -a ${heroku_app_id}
if [ $? -ne 0 ] ; then
  echo " [!] Failed to add heroku remote"
  restore_orig_netrc
  exit 1
fi

git push heroku HEAD:master
if [ $? -ne 0 ] ; then
  echo " [!] Failed to git push to heroku"
  restore_orig_netrc
  exit 1
fi

restore_orig_netrc
exit 0
