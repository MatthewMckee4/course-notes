clean:
	git clean -fdx

compile:
	fd -e typ -x typst compile

rename:
	fd -e pdf -x sh -c ' \
		dir=$$(dirname "{}"); \
		base=$$(basename "{}"); \
		if [ "$$dir" != "." ]; then \
			mv "{}" "$${dir}/$${dir##*/}_$${base}"; \
		fi \
	' \;