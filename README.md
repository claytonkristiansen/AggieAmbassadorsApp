This website is the Aggie Ambassadors club and has many features.

For whoever is the admin for the website will have control over many things such as who will be able to make an account as well as the ability to create a new organization.

Method for making new users:
# TODO once it is implemented

Method for creating new organizations:
# TODO once it is implemented


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
