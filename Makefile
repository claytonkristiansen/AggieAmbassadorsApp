run:
	rails server --binding=0.0.0.0

fresh:
	rails db:drop
	rails db:create
	rails db:migrate
	rails db:seed