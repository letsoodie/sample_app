# Ruby on Rails Tutorial: sample application

```ruby
  def salut
    dsfsdfsd
  end
```

This is the sample application for the
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).

# Ruby

* identifie les attributs d'une classe
attr_accessor : :attr1, :attr2, :attr3

* plueralize
pluralize(1, "error")
=> "1 error"
>> pluralize(5, "error")
=> "5 errors"

.count
.empty?
.any?

# Rails methods

* donne à :title la valeur "Salut"
provide(:title, "Salut")

* Retourne "Salut" à l'endroit ou la fonction est évaluée sur la vue
yield(:title)

# Rails console

* shortcuts
$ rails server	    $ rails s
$ rails console	    $ rails c
$ rails generate	  $ rails g
$ bundle install	  $ bundle
$ rake test	        $ rake

* open console mode sandbox
rails c --sandbox

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

* first deploy
$ git push heroku master

* then
$ git push heroku

* look at the production logs
$ heroku logs #production logs

* migrer la bdd coté serveur avec heroku
$ heroku run rake db:migrate

* console coté serveur
$ heroku run console

# Rails generate script

- Convention => controller names are plural, model names are singular

* generate controller
$ rails generate controller newController action1 action2 action3

* delete controller
$ rails destroy  controller newController action1 action2 action3

* generate model (for example the model 'User')
$ rails generate model User name:string email:string admin:boolean

* delete model
$ rails destroy model User

* generate migration
$ rails generate migration new_migration

* generate migration + attribute + type of attribute
rails generate migration add_password_digest_to_users password_digest:string

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

# Rake

* test all
rake test

* test only models
rake test:models

* Run only one test file
rake test TEST=test/integration/users_login_test.rb

* Run a specific test 
rake test TESTOPTS="--name test_name"

# Migrations

* Migrations change the state of the database using the command
$ bundle exec rake db:migrate

* We can undo a single migration step using
$ bundle exec rake db:rollback

* To go all the way back to the beginning, we can use
$ bundle exec rake db:migrate VERSION=0

- As you might guess, substituting any other number for 0 migrates to that version number, where the version numbers come from listing the migrations sequentially.

* reset database
$ bundle exec rake db:migrate:reset

# Authentication system

Clearance, Authlogic, Devise, CanCan

# Glossaire

* ORM/ODM
https://github.com/activeadmin/activeadmin/wiki/Object-Mapper-%28ORM-:-ODM%29-ActiveRecord,-Mongoid-and-co.

# Active Record

* crée une instance de User
salut = User.new

* vérifie si l'objet est valide
salut.valid?

* si non valid voir le message d'erreur complet
salut.errors.full_messages

* créer un utilisateur 'salut' dans la bdd
salut.save

* supprime l'utilisateur 'salut' de la bdd
salut.destroys

* combinaison de new + save
User.create

* recherche un user par son id
User.find(id)

* recherche un user par une clé
User.find_by(name:'jeanjean')

User.first
User.all

* affiche l'email de l'utilisateur salut en bdd
salut.reload.email

* update dude user info (si pass obligatoire ne fonctionnera pas)
dude.update_attributes(name: "The Dude", email: "dude@abides.org")

* singulier pour une info
dude.update_attribute(name: "The Dude")

* update attributes
user.update_attributes(name: "newname", email: "new@abides.org")

# Model

* converti l'email en downcase avant qu'il soit sauvé en bdd
before_save { self.email = email.downcase }
=
before_save { self.email = self.email.downcase }
=
before_save { email = email.downcase }

- inside the User model the self keyword is optional 

# Debug

* somewhere in view
<%= debug(params) if Rails.env.development? %>

* byebug gem
debugger

# Dev environments

- If you ever need to run a console in a different environment (to debug a test, for example), you can pass the environment as a parameter to the console script:

  $ rails console test

- As with the console, development is the default environment for the Rails server, but you can also run it in a different environment:

  $ rails server --environment production

# Digest library


# Secure Sockets Layer (SSL)

# WEBrick

#  Ternary operator

* classique
  if boolean?
    do_one_thing
  else
    do_something_else
  end

  boolean? ? do_one_thing : do_something_else

* assignement
  if boolean?
    var = foo
  else
    var = bar
  end

  var = boolean? ? foo : bar

* retour d'une valeur
  def foo
    do_stuff
    boolean? ? "bar" : "baz"
  end
- Comme ruby retourne implicitement la valeur de la dernière expression dans une fonction, ici la méthode foo retourne "bar" or "baz" selon si le booléen est true or false.






















