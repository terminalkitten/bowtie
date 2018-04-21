.PHONY: test unit lint style eslint checkdocs coverage upload outdated

all: test

test:
	py.test --cov=./ --codestyle --pylint --pylint-rcfile=pylintrc --pylint-error-types=RCWEF --ignore=doc --ignore=bowtie/src/node_modules

unit:
	py.test --cov=./

lint:
	py.test --pylint -m pylint --pylint-rcfile=pylintrc --pylint-error-types=RCWEF --ignore=doc --ignore=bowtie/src/node_modules

style:
	py.test --codestyle -m codestyle --ignore=doc --ignore=bowtie/src/node_modules

eslint:
	eslint bowtie/src/*.js{,x}

checkdocs:
	pydocstyle --count --match-dir='(?!examples|build|doc|.*templates)[^\.].*'

coverage:
	py.test --cov=./ --cov-report html --ignore=doc

loop:
	py.test --pylint --pylint-rcfile=pylintrc --pylint-error-types=RCWEF -f --ignore=doc

debug:
	py.test --pylint --pylint-rcfile=pylintrc --pylint-error-types=RCWEF -s --pdb --ignore=doc

static:
	mypy -m bowtie --ignore-missing-imports

monkeytype:
	monkeytype run `which pytest`

outdated:
	cd bowtie/src && yarn install && yarn outdated
