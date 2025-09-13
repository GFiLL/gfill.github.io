#!binbash

# Exit on any error
set -e

echo 🚀 Starting deployment...

# Build the Hugo site
echo 📦 Building Hugo site...
hugo --minify

# Copy files to root for GitHub Pages
echo 📂 Copying files to root...
cp -r public .

# Ensure .nojekyll exists (tells GitHub this isn't Jekyll)
touch .nojekyll

# Check if there are changes to commit
if [[ -z $(git status --porcelain) ]]; then
    echo ⚠️  No changes to deploy
    exit 0
fi

echo ✅ Ready to deploy! Files copied to root.
echo 🔄 Now commit and push using GitHub Desktop
echo 🌐 After pushing, visit httpsgfill.github.io
echo ⏱️  Changes may take 1-2 minutes to appear