clean:
	git clean -f
	find . -name '*.pdf' -exec rm -rf {} +



compile:
	find . -name '*.typ' -execdir typst compile {} \;

rename:
	find . -name "*.pdf" -type f -exec sh -c ' \
		dir=$$(dirname "{}"); \
		base=$$(basename "{}"); \
		if [ "$$dir" != "." ]; then \
			mv "{}" "$${dir}/$${dir##*/}_$${base}"; \
		fi \
	' \;