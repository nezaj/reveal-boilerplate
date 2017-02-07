MAKEFLAGS = --no-print-directory --always-make --silent
MAKE = make $(MAKEFLAGS)

.PHONY: build slideshow

all:
	$(MAKE) build
	$(MAKE) slideshow

build:
	@echo "Building slides..."
	pandoc -t html5 \
		--template=template-revealjs.html \
		--standalone \
		--section-divs \
		--variable theme="moon" \
		--variable transition="none" \
		slides.md -o slides.html

slideshow:
	@echo "Opening slideshow..."
	open slides.html
