#!/usr/bin/env bash
#
# Script name: 	git.sh
# Author:		Joris van Dijk
# Author URL:	gitlab.com/jorisvandijk 
# License:		GNU General Public License v3.0
# 
# Dependencies: git
# Usage:		git.sh <commit message>
# Description: 	Quickly push to git with a single command.

COMMIT=$@

git add .
git commit -m "$COMMIT"
git push
