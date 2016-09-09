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
    $ heroku local
    $ open http://localhost:5000

Hiding registration
-------------------

Sometimes we create an event, make it live, but don't want people to sign up
yet. In that case we can set `ENV["HIDE_REGISTRATION]` to `"true"` on Heroku,
and the registration link won't be shown at all:

    heroku config:set HIDE_REGISTRATION=true

Don't forget to un-hide it!

Using real event data
---------------------

If you'd like to work with actual Eventbrite data, you'll have to set the
`EVENTBRITE_ACCESS_TOKEN` variable to a real token in your `.env` file.

You can get this via `heroku config:get EVENTBRITE_ACCESS_TOKEN` if you have
Heroku access or from [Eventbrite App Management] if you have access to the
RailsBridge Boston Eventbrite account. Otherwise, ask a maintainer for access.

[Eventbrite App Management]: http://www.eventbrite.com/myaccount/apps/
