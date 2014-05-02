study-app-website
=================

To install all dependencies, run:

    $ ./install.sh

Once you have run install.sh, you will already have nodejs, mongodb, etc installed. If you just need to setup this project's dependencies (like if you cloned the git repo to a different location), run:

    $ ./setup.sh

=================

# [![MEAN Logo](http://www.mean.io/img/logos/meanlogo.png)](http://mean.io/) MEAN Stack

MEAN is a boilerplate that provides a nice starting point for [MongoDB](http://www.mongodb.org/), [Node.js](http://www.nodejs.org/), [Express](http://expressjs.com/), and [AngularJS](http://angularjs.org/) based applications. It is designed to give you a quick and organized way to start developing MEAN based web apps with useful modules like Mongoose and Passport pre-bundled and configured. We mainly try to take care of the connection points between existing popular frameworks and solve common integration problems.

## Additional Packages
* Express - Defined as npm module in the [package.json](package.json) file.
* Mongoose - Defined as npm module in the [package.json](package.json) file.
* Passport - Defined as npm module in the [package.json](package.json) file.
* AngularJS - Defined as bower module in the [bower.json](bower.json) file.
* Twitter Bootstrap - Defined as bower module in the [bower.json](bower.json) file.
* UI Bootstrap - Defined as bower module in the [bower.json](bower.json) file.

## Run the Server

We recommend using [Grunt](https://github.com/gruntjs/grunt-cli) to start the server:

    $ grunt

If grunt aborts because of JSHINT errors, these can be overridden with the `force` flag:

    $ grunt -f

Alternatively, when not using `grunt` you can run:

    $ node server

Then, open a browser and go to:

    http://localhost:3000


## Configuration
All configuration is specified in the [server/config](server/config/) folder, particularly the [config.js](server/config/config.js) file and the [env](server/config/env/) files. Here you will need to specify your application name, database name, and hook up any social app keys if you want integration with Twitter, Facebook, GitHub, or Google.

### Environmental Settings

There are three environments provided by default: __development__, __test__, and __production__.

Each of these environments has the following configuration options:

 * __db__ - This is the name of the MongoDB database to use, and is set by default to __mean-dev__ for the development environment.
* __app.name__ - This is the name of your app or website, and can be different for each environment. You can tell which environment you are running by looking at the TITLE attribute that your app generates.
* __Social OAuth Keys__ - Facebook, GitHub, Google, Twitter. You can specify your own social application keys here for each platform:
  * __clientID__
  * __clientSecret__
  * __callbackURL__

To run with a different environment, just specify NODE_ENV as you call grunt:

    $ NODE_ENV=test grunt

If you are using node instead of grunt, it is very similar:

    $ NODE_ENV=test node server

> NOTE: Running Node.js applications in the __production__ environment enables caching, which is disabled by default in all other environments.

## Getting Started
We pre-included an article example. Check out:

  * [The Model](server/models/article.js) - Where we define our object schema.
  * [The Controller](server/controllers/articles.js) - Where we take care of our backend logic.
  * [NodeJS Routes](server/routes) - Where we define our REST service routes.
  * [AngularJs Routes](public/articles/routes/articles.js) - Where we define our CRUD routes.
  * [The AngularJs Service](public/articles/services/articles.js) - Where we connect to our REST service.
  * [The AngularJs Controller](public/articles/controllers/articles.js) - Where we take care of  our frontend logic.
  * [The AngularJs Views Folder](public/articles/views) - Where we keep our CRUD views.

## Heroku Quick Deployment
Before you start make sure you have the <a href="https://toolbelt.heroku.com/">Heroku toolbelt</a> installed and an accessible MongoDB instance - you can try <a href="http://www.mongohq.com/">MongoHQ</a> which has an easy setup).
Add the db string to the production env in server/config/env/production.js.

```
git init
git add .
git commit -m "initial version"
heroku apps:create
heroku config:add NODE_ENV=production
heroku config:add BUILDPACK_URL=https://github.com/mbuchetics/heroku-buildpack-nodejs-grunt.git
git push heroku master
heroku config:set NODE_ENV=production
```
