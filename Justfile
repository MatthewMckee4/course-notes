clean:
    git clean -fdx

compile:
    #!/usr/bin/env bash
    set -e
    find . -name "*.typ" | while read -r file; do
        echo "Compiling $file"
        typst compile "$file"
    done

rename:
    find . -name "*.pdf" -exec sh -c 'dir=$(dirname "$1"); base=$(basename "$1"); if [ "$dir" != "." ]; then mv "$1" "${dir}/${dir##*/}_${base}"; fi' _ {} \;

watch file:
    @if [ "{{file}}" = "pl" ]; then \
        typst watch notes/year_4/computing_science/programming_languages/notes.typ; \
    elif [ "{{file}}" = "fp" ]; then \
        typst watch notes/year_4/computing_science/functional_programming/notes.typ; \
    elif [ "{{file}}" = "spre" ]; then \
        typst watch notes/year_4/computing_science/software_product_release_engineering/notes.typ; \
    else \
        typst watch notes/year_4/computing_science/advanced_systems_programming/notes.typ; \
    fi