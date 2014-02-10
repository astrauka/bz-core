# BzCore

Includes the slim generation templates, scaffolding configuration,
application helper commonly used methods such that we could include the
engine instead of copy pasting the code for each project. This should
go for the stuff which does not change per application basis and can be
versioned (via gem version).

## Provides

* Scaffold generators

* Application helper methods

* Initial css

* Initial javascript

* Javascript organization per controller action basis

* Application layout

## Usage

### Add to Gemfile

```
gem "bz-core", "0.0.1", require: "bz_core",
    git: "git@github.com:bitzesty/bz-core"
```

### Scaffold generators

Please use the following generators to get the templates designed to be
used with *decent_exposure* gem:

* Generate model *Event*:

```
bundle exec rails g model Event name:string event_type:string
```

* Generate controller scaffold for */events*:

```
bundle exec rails g exposable_scaffold_controller Event name:string event_type:string
```

* Generate controller scaffold for */admin/events*:

```
bundle exec rails g exposable_scaffold_controller Admin::Event name:string event_type:string
```

### Application helper methods

Please see
https://github.com/bitzesty/bz-core/blob/master/app/helpers/bz_application_helper.rb
for the common methods defined.

### Initial css

Please see
https://github.com/bitzesty/bz-core/tree/master/app/assets/stylesheets
for assets that are defined in bz-core and
https://github.com/bitzesty/bz-core/tree/master/spec/dummy/app/assets/stylesheets
for application assets to be created.

The core application defines ```core_application.css.scss``` importing bootstrap,
datepicker.

You should import it in ```application.css.scss``` as
shown in dummy app example.

### Initial javascript

Please see
https://github.com/bitzesty/bz-core/tree/master/app/assets/javascripts
for assets that are defined in bz-core and
https://github.com/bitzesty/bz-core/tree/master/spec/dummy/app/assets/javascripts
for application assets to be created.

The core application defines ```core_application.js.coffee``` importing bootstrap,
datepicker, jquery-ui, jquery-ujs, etc.

You should import it in ```application.js.coffee``` as show in dummy app
example.


### Javascript organization per controller action basis

Javascript is loaded per controller action basis. Please read
https://coderwall.com/p/mhvucw?i=4&p=1&q=author%3Atadas_t&t%5B%5D=tadas_t

To add common javascript that should be executed on content load
(both when rendering new page and when updating DOM via ajax) please
place it in ```initialization.js.coffee```.

It gets loaded from
https://github.com/bitzesty/bz-core/blob/master/app/assets/javascripts/core_initialization.js.coffee#L48
so you should define it as described in dummy app:
https://github.com/bitzesty/bz-core/blob/master/spec/dummy/app/assets/javascripts/initialization.js.coffee#L1

Please see
https://github.com/bitzesty/bz-core/tree/master/spec/dummy/app/assets/javascripts/public/controllers
on how to add javascript per controller action.
Bare in mind that you need to ```#= require_tree ./public``` in
```application.js.coffee``` in order to load the js files.

### Application layout

Application layout is defined in
https://github.com/bitzesty/bz-core/tree/master/app/views/layouts.

Please use it once possible as it will evolve over time and use the most
recent stuff.

#### Header navigation

Please override the
https://github.com/bitzesty/bz-core/blob/master/app/views/layouts/_header.html.slim
for navigation.

