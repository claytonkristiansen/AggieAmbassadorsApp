run:
	rails server --binding=0.0.0.0

fresh:
	rails db:drop
	rails db:create
	rails db:migrate
	rails db:seed
	rails db:migrate RAILS_ENV=test

tests:
	rails spec .

html:
	cd ./app/views
	which htmlbeautifier
	find . -type f -name '*.html.erb' -exec htmlbeautifier {} ';' -exec ls {} ';'

rubocop:
	bundle exec rubocop --autocorrect
