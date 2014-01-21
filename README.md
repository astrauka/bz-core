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

## Usage

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

Please see LINK TO HELPER FILE for the common methods defined

### Initial css

Please see CORE ASSETS for assets that are defined and DUMMY APP ASSETS
example for assets to be created.

The core application defines ```core_application.css.scss``` importing bootstrap,
datepicker. You should import it in ```application.css.scss``` as
done in DUMMY APP

### Initial javascript

Please see CORE ASSETS for assets that are defined and DUMMY APP ASSETS
example for assets to be created.

The core application defines ```core_application.js.coffee``` importing bootstrap,
datepicker, jquery-ui, jquery-ujs, etc.

You should import it in ```application.js.coffee```


### Javascript organization per controller action basis

Javascript is loaded per controller action basis. Please read
https://coderwall.com/p/mhvucw?i=4&p=1&q=author%3Atadas_t&t%5B%5D=tadas_t

To add common javascript that should be executed on content loaded
(both when rendering new page and when updating DOM via ajax) please
place it in ```initialization.js.coffee```. It gets loaded from LINK
TO INITIALIZATION so you should define it as described in DUMMY
INITIALIZATION

Please find LINK TO DUMMY on how to add javascript per controller action.
Bare in mind that you need to ```#= require_tree ./public``` in
```application.js.coffee``` in order to load the js files.
