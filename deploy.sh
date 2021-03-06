#!/usr/bin/env bash
user=${BOT_USER}
host=${BOT_HOST}
path=${BOT_PATH}
echo "HOST:" + ${user}@${host}
echo "PATH:" + ${path}

ssh-keyscan ${host} >> ~/.ssh/known_hosts
scp -r package.json dist/** ${user}@${host}:${path}
ssh ${user}@${host} 'cd $path;npm i; exit;'
