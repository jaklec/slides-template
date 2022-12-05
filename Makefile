.PHONY: all init revealjs mermaidjs clean css build

ASSDIR=assets
CUSTCSS=styles.css
SRCDIR=src
TARGDIR=target
BLDDIR=$(TARGDIR)/build
SRCS=$(wildcard $(SRCDIR)/*.md)
DECK=$(SRCS:$(SRCDIR)/%.md=$(TARGDIR)/%.html)

all: $(BLDDIR)/$(CUSTCSS) $(DECK)

$(TARGDIR)/%.html: $(BLDDIR)/%.md
	@cd $(BLDDIR) && pandoc --embed-resources --standalone -t revealjs "$(notdir $<)" -o ../$(notdir $@) \
		--slide-level 2 \
		-V theme=white \
		-V transition=ease \
		-V transitionSpeed=fast \
		-V progress=true \
		-V revealjs-url=../../assets/reveal.js;
	@echo "===> Success: $@"

$(BLDDIR)/%.md: $(SRCDIR)/%.md | $(BLDDIR)
	@npx mmdc -i $< -o $@

$(BLDDIR)/$(CUSTCSS): $(ASSDIR)/$(CUSTCSS) | $(BLDDIR)
	@rsync $< $(BLDDIR)/

$(BLDDIR):
	@mkdir -p $@

init: revealjs mermaidjs

revealjs:
	@curl -OL https://github.com/hakimel/reveal.js/archive/master.tar.gz
	@tar -xzvf master.tar.gz
	@mv reveal.js-master ./assets/reveal.js
	@rm master.tar.gz

mermaidjs:
	@npm init -y
	@npm install @mermaid-js/mermaid-cli run

clean:
	rm -rf $(TARGDIR) 
