clean:
	git clean -fdx

compile:
	find . -name "*.typ" -exec typst compile {} \;

rename:
	find . -name "*.pdf" -exec sh -c ' \
		dir=$$(dirname "{}"); \
		base=$$(basename "{}"); \
		if [ "$$dir" != "." ]; then \
			mv "{}" "$${dir}/$${dir##*/}_$${base}"; \
		fi \
	' \;