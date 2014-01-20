= BzCore

Includes the slim generation templates, scaffolding configuration,
application helper commonly used methods such that we could include the
engine instead of copy pasting the code for each project. This should
go for the stuff which does not change per application basis and can be
versioned (via gem version).

## Provides

* Scaffold generators

* Application helper methods

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

### Javascript organization per controller action basis
