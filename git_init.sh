#!/usr/bin/env bash
# Initialize git repository
echo "# alx-backend-storage" >> README.md
git init
git add README.md
git commit -m "Initialized project repository"
git branch -M master
git remote add origin git@github.com:alexUd01/alx-backend-storage.git
git push -u origin master
