Sutler
======

This project is still only a pet project, and is not yet released as a proper gem

Setup Steps
-----------

Install the gem in your project:

`gem 'sutler', github: 'Mortaro/Sutler'`

Move the migrations from the engine into your main app:

`rake sutler:install:migrations`

Add the following into your application `routes.rb`

`mount Sutler::Engine => "/sutler"`

obs: it's possible to change the path in which the gem will be mounted

Create a folder named `sutler` inside your app folder

Create an admin user:

`rake sutler:user[email@domain.com,password]`

Usage Guide
-----------

Sutler creates a CMS interface so the final user can edit your models easily, this way you can build your models normally, and leave the dirty work for the engine.

For each model you wish to make editable you must create a file inside the sutler folder named `model_name.yml`.

As you can check in the dummy app, each of these files is labeled under `attributes:`, and for each column that you wanna make editable you can inform the following options:

* `input:` defines which input will be displayed for that field in the cms (the options are the same as the rails input types + `gallery` for now).
* `index:` if this option is present, the column will be listed on the index of the resource, any method name for that resource can be used to display the attribute.

TO-DO
-----

* Add a generator for the setup steps
* Add support for more types of inputs, like "wysiwyg"
* Improve the documentation
