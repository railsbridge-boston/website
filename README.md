RailsBridge Boston Website
==========================

[![Build
Status](https://travis-ci.org/railsbridge-boston/website.svg?branch=master)](https://travis-ci.org/railsbridge-boston/website)

This is a redesign of the current RailsBridge Boston [website](http://www.railsbridgeboston.org).

It is currently hosted on Heroku: http://railsbridge-boston-staging.herokuapp.com/.

To run the app locally:
```sh
$ ./bin/setup
$ middleman
$ open http://localhost:4567
```

Using real event data
---------------------

If you'd like to work with actual Eventbrite data, you'll have to set the
`EVENTBRITE_ACCESS_TOKEN` variable to a real token in your `.env` file.

You can get this via `heroku config:get EVENTBRITE_ACCESS_TOKEN` if you have
Heroku access or from [Eventbrite App Management] if you have access to the
RailsBridge Boston Eventbrite account. Otherwise, ask a maintainer for access.

[Eventbrite App Management]: http://www.eventbrite.com/myaccount/apps/
