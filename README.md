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

# Unix processes

* On Unix-like systems such as Linux and OS X, user and system tasks each take place within a well-defined container called a process. To see all the processes on your system, you can use the ps command with the aux options:
  $ ps aux

* To filter the processes by type, you can run the results of ps through the grep pattern-matcher using a Unix pipe |:
  $ ps aux | grep spring
  ubuntu 12241 0.3 0.5 589960 178416 ? Ssl Sep20 1:46
  spring app | sample_app | started 7 hours ago

* The result shown gives some details about the process, but the most important thing is the first number, which is the process id, or pid. To eliminate an unwanted process, use the kill command to issue the Unix kill code (which happens to be 9) to the pid:
  $ kill -9 12241

* This is the technique I recommend for killing individual processes, such as a rogue Rails server (with the pid found via ps aux | grep server), but sometimes it’s convenient to kill all the processes matching a particular process name, such as when you want to kill all the spring processes gunking up your system. In this particular case, you should first try stopping the processes with the spring command itself:
  $ spring stop

* Sometimes this doesn’t work, though, and you can kill all the processes with name spring using the pkill command as follows:
  $ pkill -9 -f spring

- Any time something isn’t behaving as expected or a process appears to be frozen, it’s a good idea to run ps aux to see what’s going on, and then run kill -9 <pid> or pkill -9 -f <name> to clear things up.

# Migrations

* Migrations change the state of the database using the command
$ bundle exec rake db:migrate

* We can undo a single migration step using
$ bundle exec rake db:rollback

* To go all the way back to the beginning, we can use
$ bundle exec rake db:migrate VERSION=0

- As you might guess, substituting any other number for 0 migrates to that version number, where the version numbers come from listing the migrations sequentially.

























