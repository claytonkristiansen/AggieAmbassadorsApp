run:
	rails server --binding=0.0.0.0

fresh:
	rails db:drop
	rails db:create
	rails db:migrate
	rails db:seed

html:
	cd ./app/views
	which htmlbeautifier
	find . -type f -name '*.html.erb' -not -name '_*' -exec htmlbeautifier {} ';' -exec ls {} ';'