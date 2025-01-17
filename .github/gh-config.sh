if [[ -z ${GH_CONFIG_DIR-} ]]; then
	BSH_GH_CONFIG=.tpt-libs-gh-config
	if [[ ! -z ${XDG_CONFIG_HOME-} ]]; then
		src="$XDG_CONFIG_HOME/gh"
	else
		src="$HOME/.config/gh"
	fi
	if [[ -d "$src" ]]; then
		cp -r "$src" "$BSH_GH_CONFIG"
	else
		mkdir "$BSH_GH_CONFIG"
	fi
	export GH_CONFIG_DIR="$(realpath "$BSH_GH_CONFIG")"
fi
