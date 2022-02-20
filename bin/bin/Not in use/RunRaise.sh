#!/usr/bin/env bash

[ "$(i3-msg '[class=\"firefox\"] focus')" = "[{\"success\":true\}]" ] || i3-msg exec firefox`