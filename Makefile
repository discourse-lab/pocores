# a '-' before a shell command causes make to ignore its exit code (errors)

.PHONY: install uninstall reinstall clean lint
.DELETE_ON_ERROR:

install:
	python setup.py install

uninstall:
	yes | pip uninstall pocores
	yes | pip uninstall discoursegraphs

clean:
	-find . -name '*.pyc' -delete
	-rm -rf build dist src/pocores.egg-info

reinstall: clean uninstall install

lint:
	flake8 src
