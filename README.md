RailsBridge Boston Website
==========================

This is a redesign of the current RailsBridge Boston [website](http://www.railsbridgeboston.org).

It is currently hosted on Heroku: http://railsbridge-boston-staging.herokuapp.com/.

To run the app locally:
```sh
$ bundle install
$ middleman
$ open http://localhost:4567
```

To update the styles:
```sh
$ cd source
$ sass --watch stylesheets/scss/:stylesheets
```
