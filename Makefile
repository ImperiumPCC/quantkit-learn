# NOTE: is needed to pass arguments to makefile
# see https://stackoverflow.com/questions/6273608/how-to-pass-argument-to-makefile-from-command-line/6273809
%:
	@:

##############################################################################################################

install:
	pip install poetry && poetry install

lint:
	poetry run pre-commit run -a --hook-stage manual

add:
	poetry add $(filter-out $@,$(MAKECMDGOALS))

add_dev:
	poetry add $(filter-out $@,$(MAKECMDGOALS)) -D

remove:
	poetry remove $(filter-out $@,$(MAKECMDGOALS))

remove_dev:
	poetry remove $(filter-out $@,$(MAKECMDGOALS)) -D

test:
	poetry run pytest ./tests
