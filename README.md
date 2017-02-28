# URLockBox

## Table of Contents
- [Onboarding Tips](#onboarding)
  - [Heroku](#heroku)
- [Requirements](#requirements)
  - [Ruby on Rails](#ror)
- [Installation](#installation)
- [API Endpoints](#api-endpoints)
- [Gems](#gems)
- [Maintainer](#maintainer)
- [Running the Test Suite](#testing)
  - [Testing with PhantomJS using poltergeist](#poltergeist)
- [Extra](#extra)

## [Onboarding tips](#onboarding)
### [Heroku](#heroku)
* URL Lockbox: https://bg-url-lockbox.herokuapp.com/
* Hot Reads: https://bg-hot-reads.herokuapp.com/

### [Hot Reads](#hotreads)
* URLockbox sends information about read articles to Hot Reads. Hot Reads stores the information and gives you the opportunity to see if your links are on the Hot Reads Top Ten List. No Hot Reads account is necessary. 

## [Requirements](#requirements)
### [Ruby on Rails](#ror)
```
RAILS VERSION
  - 5.0.0.1

RUBY VERSION
  - 2.3.0p0

BUNDLED WITH
  - 1.13.7
```

## [Installation](#installation)

To install, clone https://git.heroku.com/bg-url-lockbox.git and run the following commands:

```
bundle install
bundle exec rake db:{create,migrate}
```

To run development locally, use the command:
```
rails server
```

*Hot Reads API endpoints are hardcoded to production urls, but local host urls are commented out*

## [API Endpoints](#api-endpoints)

To search links by URL or title:
```
GET 'https://bg-url-lockbox/api/v1/links/search_all?q=[query]'
```

To receive all links:
```
GET 'https://bg-url-lockbox/api/v1/links/'
```

To create a new link:
```
POST 'https://bg-url-lockbox/api/v1/links/'
pass in title, url, and read status as params
```

To edit a link:
```
PATCH/PUT 'https://bg-url-lockbox/api/v1/links/:id'
```

### [Gems](#gems)
View Gemfile for notable dependencies

## [Maintainer](#maintainer)

* Brad Green - [bradgreen3](https://github.com/bradgreen3)

### [Running The Test Suite](#testing)

```ruby
rspec
```

### [Testing with PhantomJS using poltergeist](#poltergeist)

The app has phantom.js, a headless webdriver installed for JS testing.

To set it up you will just need to run `npm install phantomjs -g`. Everything else will be installed with Bundle.

You can then write capybara feature tests and add `js: true` tag to each test the has JavaScript.  Your tests will execute and recognize your JavaScript.

If you're having problems troubleshooting asynchronous actions (like DOM changes after an AJAX request), [peruse this section of Capybara's docs](https://github.com/teamcapybara/capybara#asynchronous-javascript-ajax-and-friends)

### [Extra](#extra)
The major __GOTCHA__ here is that phantomjs doesn't recognize es6. So if you write es6 you will need to make your file extenstion `.js.es6`.
