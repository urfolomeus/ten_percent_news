[![Build Status](https://travis-ci.org/urfolomeus/ten_percent_news.svg?branch=master)](https://travis-ci.org/urfolomeus/ten_percent_news)
[![Code Climate](https://codeclimate.com/github/urfolomeus/ten_percent_news/badges/gpa.svg)](https://codeclimate.com/github/urfolomeus/ten_percent_news)
[![Test Coverage](https://codeclimate.com/github/urfolomeus/ten_percent_news/badges/coverage.svg)](https://codeclimate.com/github/urfolomeus/ten_percent_news)
[![Dependency Status](https://gemnasium.com/urfolomeus/ten_percent_news.svg)](https://gemnasium.com/urfolomeus/ten_percent_news)

# Ten Percent News

Description goes here.

## Ruby version
2.1.2

## Database creation

Ensure that you have SQLite 3 installed on your machine.

## Database initialization

`rake db:migrate`

## How to run the test suite

The test suite contains feature style end-to-end tests that run slower that the unit and functional
tests. You can run the test suite with or without these tests as follows:

If you want to run all of the tests: `bin/rspec`
If you only want to run the feature tests: `bin/rspec --tag feature:true`
If you want to run everything *apart* from the feature tests: `bin/rspec --tag ~feature:true`

## Continuous Integration

We are using Travis CI to build the app and run our test suite on every push to the master branch.
You don't need to do anything extra. Just `git push origin master`.

We also use Code Climate to check the codebase for code smells and test coverage, and Gemnasium to
ensure that any dependencies we have on external gems are up to date. CLicking on the approriate button
at the top of this README will take you to the site in question.

## Deployment instructions

We are currently deploying to Heroku. In order to deploy you will need to add the required git remote
and ensure that you have an SSL key for the machine that you are deploying from attached to the GitHub
account that is attached to the project. Most of the time you won't deploy yourself (to keep things simple)
but rather fork the project and then submit a pull request (see [CONTRIBUTING.md](CONTRIBUTING.md))

`git push heroku master`

