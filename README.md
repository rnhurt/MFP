# M.ain F.orce P.atrol

## Introduction

### Helpful links
* <b>Repository:</b> http://github.com/rnhurt/mfp
* <b>Live example:</b> n/a
* <b>Bugs / feature suggestions:</b> http://github.com/rnhurt/mfp/issues
* <b>Professional support:</b> http://KangarooBox.com/dingo

## Requirements
* Ruby >= v1.9.2
* Rails 3.0.5

## Installation
This is a typical Ruby on Rails project and it is installed just like any other RoR
project.  Since most of the development/testing is done on Debian & Ubuntu, it 
will be simpler to get up and running if you are using one of those OSs.  However,
it should run on any system that runs Rails.

1. Get the source code (http://github.com/rnhurt/mfp/tree/master)
2. Add the dependencies noted in the Requirements section
3. Modify <tt>database.yml</tt> to point to your database
4. Run <tt>rake db:migrate</tt> to create the database schema
5. Run <tt>rake fixtures:load</tt> to load the test data
6. Run <tt>./script/server</tt> to start the development web server
7. Fire up your web browser and point it to http://localhost:3000

## Building Documentation
M.F.P. is documented using the standard, built-in RDoc system.  To build 
the documentation with the just run the command:
  rake doc:app
However, to build better looking documentation you might want to use this command: 
  rake doc:app_horo
which uses the Horo template and results in documentation that is much easier 
on the eyes.

## Testing
Currently, M.F.P. tests are written using the standard, built-in test framework.
However, RSpec looks very attractive and when I get a bit more time I might move
them over to that.  In the meantime, just use the standard Rails testing commands
to run the test (<tt>rails test:units</tt>, etc.)

I've just been turned on to Webrat[http://gitrdoc.com/brynary/webrat/tree/master]
and am very impressed with it and all of the integration tests (or the majority of them)
will be soon converted to it.  So, if you want to run the full test suite, you'll
have to install Webrat.

## Professional Support & Maintenance
If your interested in using M.ain F.orce P.atrol in your area but don't want to install
and maintain it yourself, consider using a KangarooBox[http://KangarooBox.com] 
server appliance running Dingo[http://KangarooBox.com/dingo] 
(the commercial version of M.F.P.).  

## Legal Information
Author:: Richard Hurt
Copyright:: Copyright (c) 2010-2011 KangarooBox, LLC
License:: GPL-2.  See LICENSE file in this directory.