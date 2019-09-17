#!/bin/bash

hexo generate
python3 yasuo.py
git add .
git commit -m "$(date "+%Y-%m-%d %H:%M:%S")"
git push -u origin source:source
cp -R public/* .deploy/nescirem.github.io
cd .deploy/nescirem.github.io
git add .
git commit -m "$(date "+%Y-%m-%d %H:%M:%S")"
git push origin master
cd ~/blog-git/blog
cp -R public/* .deploy/nescirem
cd .deploy/nescirem
git add .
git commit -m "Backuped $(date "+%Y-%m-%d %H:%M:%S")"
git push origin master
