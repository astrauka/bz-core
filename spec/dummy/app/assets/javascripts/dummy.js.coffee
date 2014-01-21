# testing app specific js being loaded
$ ->
  $finder = $("p.basic")
  $finder.text($finder.text() + ". js works")
