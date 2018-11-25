hexo generate
python3 yasuo.py
git add .
git commit -m "Sources update"
git push -u origin source:source
cp -R public/* .deploy/nescirem.github.io
cd .deploy/nescirem.github.io
git add .
git commit -m "Updated blog"
git push origin master
cd ~/blog-git/blog
cp -R public/* .deploy/nescirem
cd .deploy/nescirem
git add .
git commit -m "Backuped"
git push origin master
