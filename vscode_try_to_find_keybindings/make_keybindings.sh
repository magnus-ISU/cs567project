#!/bin/bash
rg '"command": "' keybindings.json |
	sed '/"when": /d ; /\/\//d' |
	sed 's/^.*"command": "\(.*\)".*$/\1/' > keybindings

pushd vscode
rg 'localize\(' > ../localize_things
popd
mv vscode/localize_things .
cat ../localize_things | sed 's/^.*localize(\(.*\)).*$/\1/' > localize_internal
rg 'key: ' ./localize_internal > localize_certainly_actions
