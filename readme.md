
```
_____/\\\\\\\\\\\\_____/\\\\\\\\\_____/\\\\____________/\\\\__/\\\\\\\\\\\_        
 ___/\\\//////////____/\\\\\\\\\\\\\__\/\\\\\\________/\\\\\\_\/////\\\///__       
  __/\\\______________/\\\/////////\\\_\/\\\//\\\____/\\\//\\\_____\/\\\_____      
   _\/\\\____/\\\\\\\_\/\\\_______\/\\\_\/\\\\///\\\/\\\/_\/\\\_____\/\\\_____     
    _\/\\\___\/////\\\_\/\\\\\\\\\\\\\\\_\/\\\__\///\\\/___\/\\\_____\/\\\_____    
     _\/\\\_______\/\\\_\/\\\/////////\\\_\/\\\____\///_____\/\\\_____\/\\\_____   
      _\/\\\_______\/\\\_\/\\\_______\/\\\_\/\\\_____________\/\\\_____\/\\\_____  
       _\//\\\\\\\\\\\\/__\/\\\_______\/\\\_\/\\\_____________\/\\\__/\\\\\\\\\\\_ 
        __\////////////____\///________\///__\///______________\///__\///////////__
```
A reuseable generic gamification toolbelt in ruby
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
### Getting Gamified
TODO: Setup Guide
