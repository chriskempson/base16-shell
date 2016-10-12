.PHONY: test
test: lint unit-test

.PHONY: lint
lint:
	-shellcheck realpath.sh
	-checkbashisms realpath.sh

.PHONY: unit-test
unit-test: t/*

t/%: force
	bash "$@"
	dash "$@"

.PHONY: force
force: ;

