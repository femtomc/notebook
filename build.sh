cd pollen
raco pollen reset
rm css/*.css
rm *.html
rm -rf notes/images
rm -rf notes/latex
raco pollen render -r .
raco pollen render index.html.pm
raco pollen render search.html.pm
rm notes/*.db
raco pollen publish . $(pwd)/../example
raco pollen reset
rm css/*.css
rm *.html
rm -rf notes/images
rm -rf notes/latex
rm -rf images
cd ..
msg="Rebuilding example - $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
cd docs
rm -rf *
cp -r ../example/* .
cd ..
rm -rf example
git add .
git commit -m "$msg"
git push origin master
