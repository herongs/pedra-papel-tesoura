npm run build
cd dist
git init
git branch -m gh-pages
git remote add origin https://github.com/herongs/pedra-papel-tesoura
git add .
git commit -m "Deploy to GitHub Pages"
git push -f origin gh-pages
cd ..
rm -rf dist
