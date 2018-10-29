#!/usr/bin/env bash
set -o errexit #abort if any command fails
me=$(basename "$0")

update_git_server() {
  echo "Update the git server"
  /usr/bin/ssh gitserver '~/deploy_docs.sh'
 
}

./deploy.sh
update_git_server

