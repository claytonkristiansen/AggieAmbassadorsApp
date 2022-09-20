
For Clayton:

rails db

drop_table Users;

table \dt (Running this command you should no longer be able to see the users table)

exit out of the db editor ( i think the command was \q but typing exit or quit should tell you)

rails db:migrate

commands to run to access site:

bundle install

rails db:create

rails db:migrate

rails db:seed
