# Ruby on Rails Tutorial: sample application

This is the sample application for the
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).

# Rails methods

* donne à :title la valeur "Salut"
provide(:title, "Salut")

* Retourne "Salut" à l'endroit ou la fonction est évaluée sur la vue
yield(:title)

# rails console shorcuts

$ rails server	    $ rails s
$ rails console	    $ rails c
$ rails generate	  $ rails g
$ bundle install	  $ bundle
$ rake test	        $ rake

# Git

* set remote repo
$ git remote add origin git@bitebucket.org:<username>/sample_app.git

* pushes up the repo and its refs for the first time
$ git push -u origin --all

* Add a new branch to the remote repository
$ git checkout -b newbranch
$ git push -u origin newbranch

# Heroku

$ heroku create

* deploy
$ git push heroku master

* look at the production logs
$ heroku logs #production logs

# Rails generate script

* generate controller
$ rails generate controller newController action1 action2 action3

* delete controller
$ rails destroy  controller newController action1 action2 action3

* generate model (for example the model 'User')
$ rails generate model User name:string email:string admin:boolean

* delete model
$ rails destroy model User

- Controller generation automatically updates the routes file that why we must to specify matched actions when we want to delete a controller

# Unix commands

$ mv 

* We can use this Unix command to create file.txt
$ touch direction/salut/ici/file.txt

- Although touch is designed to update the modification timestamp of a file or directory without otherwise affecting it, as a side-effect it creates a new (blank) file if one doesn’t already exist.

# Migrations

* Migrations change the state of the database using the command
$ bundle exec rake db:migrate

* We can undo a single migration step using
$ bundle exec rake db:rollback

* To go all the way back to the beginning, we can use
$ bundle exec rake db:migrate VERSION=0

- As you might guess, substituting any other number for 0 migrates to that version number, where the version numbers come from listing the migrations sequentially.
























