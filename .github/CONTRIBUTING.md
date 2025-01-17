# CONTRIBUTING

We are using [GitHub Actions](https://github.com/features/actions) as a continuous integration system.

For details, take a look at the following workflow configuration files:

- [`workflows/integrate.yaml`](workflows/integrate.yaml)

## Coding Standards

We are using [`friendsofphp/php-cs-fixer`](https://github.com/FriendsOfPHP/PHP-CS-Fixer) to enforce coding standards in PHP files.

Run

```sh
make coding-standards
```

to automatically fix coding standard violations.

## Static Code Analysis

We are using [`vimeo/psalm`](https://github.com/vimeo/psalm) to statically analyze the code.

Run

```sh
make static-code-analysis
```

to run a static code analysis.

We are also using the baseline feature of [`vimeo/psalm`](https://psalm.dev/docs/running_psalm/dealing_with_code_issues/#using-a-baseline-file).

Run

```sh
make static-code-analysis-baseline
```

to regenerate the baseline in [`../psalm-baseline.xml`](../psalm-baseline.xml).

:exclamation: Ideally, the baseline should shrink over time.

## Extra lazy?

Run

```sh
make
```

to automatically enforce coding standards and run a static code analysis!


## Help

:bulb: Run

```sh
make help
```

to display a list of available targets with corresponding descriptions.
