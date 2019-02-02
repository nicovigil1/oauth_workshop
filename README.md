# Oauth Workshop

This is just a simple proof of concept in dealing with oauth for github to signin a user to the site with information received from the authorization.

## Getting Started

1. After cloning, bundle & install figaro with ```figaro install```
2. Setup a github oauth app on github ```settings>developer settings>New Oauth App```
3. Paste your client secret and id into the application.yml under ```client_secret: (secret_key)``` & ```client_id: (client_key)```

### Prerequisites

- Rails 5.2.2
- Ruby 2.4.1

### Installing

1. run rails server in your terminal
2. visit localhost:3000 (or whatever port rails server prescribes)
3. click login & login using your github credentials
4. you should be redirected to ```localhost:3000/dashboard``` and see your github username


## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* Rails 5.2.2
* Ruby 2.4.1
* GitHub Oauth


## Acknowledgments

* Turing School of Software and Design

