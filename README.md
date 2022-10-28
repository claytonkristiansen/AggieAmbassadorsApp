This website is the Aggie Ambassadors club and has many features.

For whoever is the admin for the website will have control over many things such as who will be able to make an account as well as the ability to create a new organization.

Method for making new users:
    There is a secret link that is only known by the owners of the website that will allow to create new users and be able to log in.

Method for creating new organizations:
    For those who have access they will be able to click on the organizations tab and not only see the organizations but also create new ones with the create new organization button.

# Aggie Ambassadors App

#### [Link to Test Website](https://aggieambassa-test-branc-m6awge.herokuapp.com/)

#### [Link to Production Website](https://aggieambassadorsapp.herokuapp.com/)

# README

## Introduction ##

Application Description

## Requirements ##

This code has been run and tested on:

* Ruby - 3.0.2p107
* Rails - 6.1.4.1
* Ruby Gems - Listed in `Gemfile`
* PostgreSQL - 13.3 
* Nodejs - v16.9.1
* Yarn - 1.22.11


## External Deps  ##

* Docker - Download latest version at https://www.docker.com/products/docker-desktop
* Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
* Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

## Installation ##

Download this code repository by using git:

 `git clone git@github.com:claytonkristiansen/AggieAmbassadorsApp.git`


## Tests ##

An RSpec test suite is available and can be ran using:

  `rspec spec .`

## Execute Code ##

Run the following code in Powershell if using windows or the terminal using Linux/Mac

  `cd AggieAbmassadorsApp`

  `docker run --rm -it --volume "$(pwd):/rails_app" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`

  `cd rails_app`

Install the app

  `bundle install && rails webpacker:install && rails db:create && db:migrate`

Run the app
  `rails server --binding:0.0.0.0`

The application can be seen using a browser and navigating to http://localhost:3000/

## Environmental Variables/Files ##

** We do not currently require any environment variables to run this project.

## Deployment ##

** To deploy to Heroku, make sure the github repository is up to date, and all required tests are configured correctly in the workflow.

Then follow the instructions [here](https://devcenter.heroku.com/articles/github-integration)


## CI/CD ##

TBD

## Support ##

Admins looking for support should first look at the application help page.
Users looking for help seek out assistance from the customer.
