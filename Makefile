install:
	bundle install

test:
	rake test --verbose

lint:
	bundle exec rubocop

lint-fix:
	bundle exec rubocop -A

.PHONY: test
