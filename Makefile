.PHONY: it
it: coding-standards static-code-analysis ## Runs the coding-standards and static-code-analysis targets

.PHONY: coding-standards
coding-standards: vendor ## Fixes code style issues with friendsofphp/php-cs-fixer
	mkdir -p .build/php-cs-fixer/
	vendor/bin/php-cs-fixer fix --config=.php-cs-fixer.php --diff --verbose

.PHONY: help
help: ## Displays this list of targets with descriptions
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: static-code-analysis
static-code-analysis: vendor ## Runs a static code analysis with vimeo/psalm
	mkdir -p .build/psalm/
	vendor/bin/psalm --config=psalm.xml --clear-cache
	vendor/bin/psalm --config=psalm.xml --show-info=false --stats --threads=4

.PHONY: static-code-analysis-baseline
static-code-analysis-baseline: vendor ## Generates a baseline for static code analysis with vimeo/psalm
	mkdir -p .build/psalm/
	vendor/bin/psalm --config=psalm.xml --clear-cache
	vendor/bin/psalm --config=psalm.xml --set-baseline=psalm-baseline.xml

vendor: composer.json composer.lock
	composer validate --strict
	composer install --no-interaction --no-progress
