# Auriga Vault

[![Code Climate](https://codeclimate.com/github/joel/auriga.png)](https://codeclimate.com/github/joel/auriga)

[![Dependency Status](https://gemnasium.com/joel/auriga.svg)](https://gemnasium.com/joel/auriga)

[![Build Status](https://travis-ci.org/joel/auriga.png?branch=master)](https://travis-ci.org/joel/auriga) (Travis CI)

[![Coverage Status](https://coveralls.io/repos/joel/auriga/badge.png)](https://coveralls.io/r/joel/auriga)

Auriga is a simple rails app allows to store and share passwords, notes with your team like [Roswell](https://github.com/blahed/roswell) or like another awesome project [Swordfish](https://github.com/github/swordfish), [Last Pass](https://lastpass.com/how-it-works), and so on...

You can play with [demo](http://demo.passle.eu/) demo@example.com / secret

or simply use it on [passle.eu](http://www.passle.eu/)

<img src="https://cloud.githubusercontent.com/assets/5789/4032621/f25ffa20-2c71-11e4-82ee-2680f4afaa54.png" alt="ScreenShot" style="height: 400px; width: 600px;"/>

## Features

* Simple web accounts

## Is it secure?

Not extremely secure, but more secure than a shared google spreadsheet. The `production` environment requires SSL, this is to ensure that cleartext passwords aren't sent/received over the wire.

## How can it be more secure?

Actually we just needed something better than a spreadsheet.

## Installing Auriga

Auriga is just a rails app so clone it down somewhere and:

    > bundle              # install gem dependencies

Then just start your choice of server (you'll wanna put it behind SSL).

## Create & configure for Heroku

	> gem install heroku
	> heroku create example-auriga --stack cedar
	> heroku addons:add mongolab:starter
	> git push heroku master

## Dependencies

* Ruby 2.2
* MongoDB

## Testing

  RAILS_ENV=test bundle exec rspec spec

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
