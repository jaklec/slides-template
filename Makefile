.PHONY: all build clean

CSS=assets/*.css
TARGET_DIR=target
SOURCES=$(wildcard src/*.md)
TARGETS=$(patsubst src/%.md, target/%.html, $(SOURCES))

all: build

build: $(TARGETS)

$(TARGET_DIR)/%.html: $(SOURCES) $(CSS) | $(TARGET_DIR)
	pandoc --self-contained -s -t revealjs "$<" -o $@ \
		--slide-level 2 \
		-V theme=white \
		-V transition=ease \
		-V transitionSpeed=fast \
		-V progress=true;

$(TARGET_DIR):
	mkdir $@

clean:
	rm -rf $(TARGET_DIR) 
