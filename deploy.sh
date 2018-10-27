hexo generate
python3 yasuo.py
git add .
git commit -m "Source updated: %Y-%m-%d %H:%M:%S"
git push origin source
cp -R public/* .deploy/nescirem.github.io
cd .deploy/nescirem.github.io
git add .
git commit -m "Site updated: %Y-%m-%d %H:%M:%S"
git push origin master
cd ~/blog-git/blog
cp -R public/* .deploy/nescirem
cd .deploy/nescirem
git add .
git commit -m "Site backuped: %Y-%m-%d %H:%M:%S"
git push origin master
