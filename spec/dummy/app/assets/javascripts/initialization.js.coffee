app.apply_content_load_js = ($context) ->
  # application specific js on content loaded

  $context.append("<p>initialization js loaded</p>")
