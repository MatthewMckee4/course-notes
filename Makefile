TYP_FILES := $(shell find . -name "*.typ")

clean:
	git clean -fdx

compile:
	@set -e; \
	for file in $(TYP_FILES); do \
		echo "Compiling $$file"; \
		typst compile "$$file"; \
	done

rename:
	find . -name "*.pdf" -exec sh -c ' \
		dir=$$(dirname "{}"); \
		base=$$(basename "{}"); \
		if [ "$$dir" != "." ]; then \
			mv "{}" "$${dir}/$${dir##*/}_$${base}"; \
		fi \
	' \;