#! /bin/bash

for d in *; do stow -v -t ~ "$d" ;done
