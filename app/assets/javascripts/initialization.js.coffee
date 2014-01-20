# application namespace
window.app ||= {}

app.activate_link = ($link, up_to_element = "ul") ->
  $link.closest(up_to_element).find("a").removeClass("active")
  $link.addClass("active")

app.apply_content_load_js = ($context) ->
  $context ||= $("body")

  #########
  ## Select2
  for select in $context.find("select.js-select2")
    options = {
      width: 'resolve',
    }
    # has placeholder and empty option
    if $(select).filter("[placeholder]").find("option[value='']").length
      allow_clear_options =
        placeholder: "",
        allowClear: true,
      $.extend(options, allow_clear_options)

    $(select).select2 options
  ## [END] Select2
  #########

  #########
  ## Date picker
  $context.find(".js-datepicker").datepicker(
    format: "dd/mm/yyyy"
    weekStart: 1
  ).on "changeDate", ->
    $(this).datepicker('hide')

  $context.find(".js-datepicker-month").datepicker(
    format: "mm/yyyy"
    viewMode: 1
    minViewMode: 1
  ).on "changeDate", ->
    $(this).datepicker('hide')
  ## [END] Date picker
  #########

