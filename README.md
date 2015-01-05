RailsBridge Boston Website
==========================

[![Build
Status](https://travis-ci.org/railsbridge-boston/railsbridgeboston_dot_org.svg?branch=master)](https://travis-ci.org/railsbridge-boston/railsbridgeboston_dot_org)

This is the website for RailsBridge Boston, a chapter of [RailsBridge]. You can
check out the site at <http://www.railsbridgeboston.org>. This does *not*
include any curriculum content.

RailsBridge Boston organizes workshops for women and their friends to learn
Ruby, Rails, and other web technologies.

[RailsBridge]: http://www.railsbridge.org

Running the app locally
----------------------

    $ ./bin/setup
    $ middleman
    $ open http://localhost:4567

Using real event data
---------------------

If you'd like to work with real event data, you'll have to set the
`TITO_AUTH_TOKEN` variable to a real token in your `.env` file.

You can get this via `heroku config:get TITO_AUTH_TOKEN` if you have
Heroku access or from [Eventbrite App Management] if you have access to the
RailsBridge Boston Tito account. Otherwise, ask a maintainer for access.

[Eventbrite App Management]: http://www.eventbrite.com/myaccount/apps/
