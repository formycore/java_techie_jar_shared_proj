#!/bin/bash
git add .
git status
echo "Enter the comment"
read comment
git commit -m "$comment"
git push origin master
