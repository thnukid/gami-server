
```
_____/\\\\\\\\\\\\_____/\\\\\\\\\_____/\\\\____________/\\\\__/\\\\\\\\\\\_        
 ___/\\\//////////____/\\\\\\\\\\\\\__\/\\\\\\________/\\\\\\_\/////\\\///__       
  __/\\\______________/\\\/////////\\\_\/\\\//\\\____/\\\//\\\_____\/\\\_____      
   _\/\\\____/\\\\\\\_\/\\\_______\/\\\_\/\\\\///\\\/\\\/_\/\\\_____\/\\\_____     
    _\/\\\___\/////\\\_\/\\\\\\\\\\\\\\\_\/\\\__\///\\\/___\/\\\_____\/\\\_____    
                  A Generic Gamification Toolbelt in Ruby (on Rails)
       _\/\\\_______\/\\\_\/\\\/////////\\\_\/\\\____\///_____\/\\\_____\/\\\_____   
        _\/\\\_______\/\\\_\/\\\_______\/\\\_\/\\\_____________\/\\\_____\/\\\_____  
         _\//\\\\\\\\\\\\/__\/\\\_______\/\\\_\/\\\_____________\/\\\__/\\\\\\\\\\\_ 
          __\////////////____\///________\///__\///______________\///__\///////////__
                     Bachelor Graduation Project // Eric Bartholemy
```
-----
[![Build Status](https://travis-ci.org/thnukid/gami-server.svg)](https://travis-ci.org/thnukid/gami-server)
[![Code Climate](https://codeclimate.com/github/thnukid/gami-server/badges/gpa.svg)](https://codeclimate.com/github/thnukid/gami-server)
[![Test Coverage](https://codeclimate.com/github/thnukid/gami-server/badges/coverage.svg)](https://codeclimate.com/github/thnukid/gami-server)
### Gami Server
Server for receiving gamification events, currently developed as the graduation
project of [Eric Bartholemy](https://github.com/thnukid) @[KabisaICT](https://github.com/kabisaict). 
Graduation project guidance by [Michel de Graaf](https://github.com/michel).
University guidance by Mr. Boots

#### Graduation Project: Objectives
* Gamification, domain specific language to turn collected events into game rules and add progression to a player or reach milestones
* A stand­alone library containing a Domain Specific Language (DSL) and data collection aspects
* A demo application that uses this library and engages developers in their daily tasks

#### Graduation Project: Basic Idea
1. Receive events form a datasource to run rules on
2. Server evaluates based on rules if a user receives a badge (define rules with a [DSL](#basic-example))
3. A frontend displays the badges receives for a specific user

### Gami Toolbelt
[Gami-Githubwatcher](https://github.com/thnukid/gami-githubwatcher) :
Using the gami client to send events to the gami-server. Forwards [Github webhooks](https://developer.github.com/webhooks/) 
event to the server for evaluation. Compiles the game data

[Gami-Server](https://github.com/thnukid/gami-server) : Evaluates events
based on defined games to apply badges

[Gami-mobileApp](#) (not published) : Mobile cross-platform application
to visualize received badges

### Gami DSL - Synopsis
#### Basic Example
We define a game (in `app/lib/gami/games`) for receiving badges based on github commits. The game is run based on a "git:push" event (sent by [Gami-Githubwatcher](https://github.com/thunkid/gami-githubwatcher)).
 When the total commit count is greater than equal (gteq) 1, the user receives a "Boarding" badge.
```ruby
Game.define "Receive badges for commiting to github" do
  on_event "git:push" do
    receive_badge "Boarding", with_label: "Welcome, to the crew! ", using_property: "commit" ,gteq: 1
    receive_badge "Getting started", with_label: "You commited your first 10 commits, keep it up!", using_property: "commit" , gteq: 10
  end
end
```
#### Abstract Example
```ruby
# define the game and give it a description
Game.define "{DESCRIPTION OF THE GAME}" do
  #describe the event on which the rules shall be evaluated
  on_event "{EVENT}" do
    #define the rules, when satisfied a badge gets assigned to the user
    receive_badge "{BADGE NAME}", with_label: "{BADGE DESCRIPTION} ", using_property: "{EVENT DATA TO EVALUATE CONDITION AGAINST}" , gteq: {CONDITION} 
    #add more rules
  end
end
```
### Gami Assets - Badges
You can define assets in a `.json` file under the `app/lib/gami/assets` folder, its key : value, default it returns the `Badge Name`. For the demo application, [fortawesome icons](http://fortawesome.github.io/Font-Awesome/)
are used. When defining an Badge, gami assets will `lowercase` and `remove whitespace` from the `Badge Name`,
#### Example (see [DSL Basic](#basic-example))
```javascript
// lib/gami/assets/
{
  'boarding' : 'star-o'
  'gettingstarted' : 'starter_badge.png'
}
```
### Getting Gamified: Installation

##Level 0 :: Prerequisite / Technology Stack
* Ruby 2.1.1 [Rbenv](https://github.com/sstephenson/rbenv)
* Rails 4.1.4
* MySQL (Community) Server [download](http://dev.mysql.com/downloads/mysql/)
* Redis [download](http://redis.io/download)
* Sidekiq [info](https://github.com/mperham/sidekiq)

##Level 0.1 :: Install
* `git clone https://github.com/thnukid/gami-server`
* `bundle`
##Level 0.2 :: Configuration
* Rename, and adjust database name for environments, standard: `gamiserver_development`
  * `mv config/database.yml.example config/database.yml` 
  * `vim config/database.yml` 
* Set app secrets and sidekiq credentials for
  (webinterface)[http://localhost:3000/sidekiq]
  * `mv config/secrets.yml.example config/secrets.yml` 
  * `vim config/secrets.yml` 
* For Deployment with [Capistrano 2.x](http://capistranorb.com/), set  `:domain,:deploy_to`
  * `vim config/deploy.rb`
* For Continues Integration (CI) with [TravisCI](https://travis-ci.org/)
  * `vim .travis.database.yml`
  * `vim .travis.secrets.yml`
  * `vim .travis.yml`
##Level 0.3 :: Get running
* `bundle exec rake db:setup`
* `bundle exec rails s` 
  * Server available @ [`http://0.0.0.0:3000`](http://0.0.0.0:3000)
  * (Debug &) routes available: 
    * Events: [`/debug`](http://0.0.0.0:3000/debug)
    * Users: [`/debug/user`](http://0.0.0.0:3000/debug/user) 
    * Aliases: [`/debug/alias`](http://0.0.0.0:3000/debug/alias) 
* `bundle exec sidekiq -c 10 -e production -L log/sidekiq.log -d`
  * Webinterface: [`/sidekiq`](http://0.0.0.0:3000/sidekiq) 
  * Stop detached sidekiq, find process id `ps aux | grep sidekiq | awk '{print $2}' | sed -n 1p` and `kill -15 #{sidekiq_process_id}`
##Level 0.4 :: Create Players and Aliases
The `user table` is used to lookup a specific user and to identify for Frontend API calls. The
`alias table` is used to have multiple services.
* `rails c` or `rails c ENV=production`
* Add a new player: 
  * ```ruby
      irb(main):005:0> User.new
      irb(main):006:0> u = _
      irb(main):007:0> u.username = 'player_name'
      irb(main):008:0> u.email = 'player@company-email.example'
      irb(main):009:0> u.password_digest = 'pw_for_later_implementation'
      irb(main):010:0> u.save
    ```
* Add a alias (eg. github player account)
  * ```ruby
      irb(main):020:0> Alias.new
      irb(main):021:0> a = _
      irb(main):022:0> a.username = 'github_username'
      irb(main):023:0> a.email = 'github_email_login@company.example'
      irb(main):027:0> a.user_id = u.id
      irb(main):028:0> a.save
    ```
##Level 0.5 :: Example: Gamify Github
The current implementation is based on the concept, to receive events (commit/watch)
from Github.com by using
[Webhooks](https://developer.github.com/webhooks/) and to gamify the property 'commit count' of a
repository.
* Deploy the [gami-githubwatcher](https://github.com/thnukid/gami-githubwatcher)
  * Add [webhook](/settings/hooks/new) and set:
    * `Payload URL`, to your publicly accessible server, eg `http://githubwatcher.example.com/github`
    * `Content Type`, to `application/json`
    * `Which events would you like to trigger this webhook?` to `Send me everything`
  * To verify: Start the `gami-githubwatcher` and make an commit to the
    repository (or star the repository - if you send all events), you should see a new entry in your webhook in green. 
* API: Receiving Events (gami-githubwatcher --> gami-server)
  * gami-githubwatcher
    * Required Data:
      * Alias Email (email address used for login to github.com)
      * Gami Event (this example: 'git:commit', 'git:watch')
      * JSON Data Array (Note: You can currently only use properties in the Game DSL
        that are available under the "game" property):
        ```javascript
            { "game"  : {"commits_count": 1, "properties": 1},
              "raw"   : {%raw_payload%}
        ```
  * gami-server 
    * Game DSL are defined in 
      [app/lib/gami/games/](https://github.com/thnukid/gami-server/tree/master/app/lib/gami/games) eg. 
      [git_watch.gami](https://github.com/thnukid/gami-server/blob/master/app/lib/gami/games/git_push.gami), 
        [more about Gami DSL](#basic-example)
     * Fact aggregation:
       * When a game is run, it aggregates_properties based on the JSON 'game' array (see gami-githubwatcher - Required Data)
       * The aggregated properties are currently only integers and get
          increased by the count received ( see (Rails Fact Model)[https://github.com/thnukid/gami-server/blob/master/app/models/fact.rb]).
          Note: When a fact already exist, then current count gets added to the existing property.
      * Event creation:
        Based on the `Alias Email` used for the service, it will lookup and returns 
        `200 OK` or `422 Unprocessable Entity`, if not found (see (Rails Event Model)[https://github.com/thnukid/gami-server/blob/master/app/models/event.rb]
     * Badge Assets (images,css)
       * {'badge_name' : 'media.jpg|css-code'} [example](https://github.com/thnukid/gami-server/blob/master/app/lib/gami/assets/fortawesome-badges.json)
         Note: The `badge_name` has to be lowercase and has whitespace removed, eg ( In DSL: 'Super Awesome Badge' => In Badge_Assets: 'superawesomebadge')
sw:
