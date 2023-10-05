#!/usr/bin/env bash

URL=https://github.com/tree-sitter/tree-sitter-
SNIPS="./pkgs-29.1/yasnippet-snippets-20230815.820/snippets"
OUTPUT_SNIPS="./snippets"

run() {
    for snip in $(ls "${SNIPS}"/); do
	local url
	local mode=${snip/-mode/}
	local ts_mode="${mode}"
	local ts_mode_dir=

	# update modes if needed
	case ${ts_mode} in
	    c++) ts_mode=cpp;;
	    sh) ts_mode=bash;;
	    *-ts) continue;;	# Skip already created -ts directories
	esac

	# dumb
	ts_mode_dir="${OUTPUT_SNIPS}/${mode}-ts-mode"
	case ${ts_mode} in
	    bash) ts_mode_dir="${OUTPUT_SNIPS}/${ts_mode}-ts-mode";;
	esac

	url="${URL}${ts_mode}"
	if curl --output /dev/null --silent --head --fail "${url}"; then
	    printf "Found=${url}\n"
	    # [ -d "${ts_mode_dir}" ] && {
	    # 	printf "${ts_mode_dir} already exists, continuing...\n"
	    # 	continue
	    # }

	    [ -f "${ts_mode_dir}/.yas-parents" ] && {
		printf "${ts_mode_dir}/.yas-parents already exists, continuing...\n"
		continue
	    }

	    printf "Creating ${ts_mode_dir}\n"
	    mkdir -p "${ts_mode_dir}"
	    if [ $? -ne 0 ]; then
		printf "Failed to create ${ts_mode_dir}"
		continue
	    fi

	    echo "${snip}" > "${ts_mode_dir}/.yas-parents"
	else
	    printf "Not found=${url}\n"
	fi
    done
}

run
