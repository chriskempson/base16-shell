# Ref: https://github.com/fnune/base16-qutebrowser
.PHONY: all clean update build

BUILD=pybase16
REPO=$(shell pwd)
TEMPLATE=$(shell basename ${REPO})
THEME_DIR=scripts
TEMPLATE_DIR=templates
OUTPUT=output

all: update build

update:
	$(BUILD) update

build:
	$(BUILD) build -t ${REPO} -o ${OUTPUT}
	rm -rf ${THEME_DIR}
	mv ${OUTPUT}/${TEMPLATE}/${THEME_DIR}/ ${THEME_DIR}/

clean:
	rm -rf ${OUTPUT} ${TEMPLATE_DIR}/*/
