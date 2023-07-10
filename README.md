# README

This is a Rails project to receive webhooks from Gitlab MRs and notify people on Slack.  After starting the server, visit [localhost:3000] to create a webhook target. Then, in Gitlab, create a webhook to point to the URL provided by the Rails app.  The Rails app will then send a message to the Slack channel specified in the webhook target.

Currently, I am using a [Tailscale Funnel](https://tailscale.com/kb/1223/tailscale-funnel/) to route the webhook from Gitlab to my local machine.  You can set `RAILS_DEVELOPMENT_HOSTS` to a comma-separated list of hosts to allow webhooks from other hosts.

## Setup

This project is built with Ruby 3.0.1 although it should work with any Ruby 2.7+ version.  It uses Rails 7.0.6.  To get started developing:
- clone the repo
- run `bundle install` to install the dependencies.
- run `rails db:setup` to create the database and run the migrations
- run `rails s` to start the server

## Useful commands

- `rails s` - start the server
- `rails c` - start the console
- `rails routes` - list the routes
