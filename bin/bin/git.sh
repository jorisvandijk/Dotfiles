#! /bin/bash

COMMIT=$@

git add .
git commit -m "$COMMIT"
git push
