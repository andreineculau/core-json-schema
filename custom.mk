# Setup
SOURCES := $(wildcard src/**/*.json)
LIBS := $(patsubst src%, lib%, $(SOURCES))

# PHONY
.PHONY: all clean prepublish custom.mk

all: libs
	@$(MAKE) -f .coffee.mk/coffee.mk $@

prepublish: clean all

libs: $(LIBS)

clean:
	@rm -f $(LIBS)
	@$(MAKE) -f .coffee.mk/coffee.mk $@

custom.mk:
	@:

# Non PHONY
$(LIBS): $(1)

src/%.json: ;

lib/%.json: src/%.json
	@$(eval input := $<)
	@$(eval output := $@)
	@mkdir -p `dirname $(output)`
	@cp $(input) $(output)
