# Auriga

## Getting Started

We need to start mongodb

start Powder server

`powder up`

after change you can use

`powder restart && powder applog`

We have to start on dev mode mailcatcher

`mailcatcher -fv`

For ensure you have a set of data to play you can run this rake task

`bundle exec rake db:populate:fake`

Or

`yes | bundle exec rake db:populate:fake`

After that you can login in with => `joel@auriga.dev / secret`
