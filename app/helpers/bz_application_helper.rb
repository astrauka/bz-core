# -*- coding: utf-8 -*-

module BzApplicationHelper
  # From Lupin V2
  #
  # Highlight the nav item if current page matching controllers_options
  #
  # Examples
  #
  #   nav_item 'Foo', '/foo', 'controller_foo', 'controller_bar'
  #   nav_item 'Foo', '/foo', %w(controller_foo controller_bar)
  #   nav_item 'Foo', '/foo', 'controller_foo', controller_bar: ['edit', 'new']
  #   nav_item 'Foo', '/foo', controller_foo: 'index', controller_bar: ['edit', 'new']
  #
  def nav_item(text, url, *controllers_options)
    controllers_options.flatten!

    options = controllers_options.extract_options!

    wrapper_options = if controller_name.in?(controllers_options) or
                         [ * options[controller_name.to_sym] ].include?(action_name)
                        {class: 'active'}
                      end

    nav_element(text, url, wrapper_options)
  end

  def nav_element(text, url, wrapper_options = {})
    content_tag :li, wrapper_options do
      link_to text, url
    end
  end

  # Localizes item, does not crash is item is nil
  def l(item, options = {})
    if item
      I18n.l(item, options)
    end
  end

  def undecorated(object)
    if object.is_a? Draper::Decorator
      object.source
    else
      object
    end
  end

  def data_controller_name
    if controller.class.name
      controller.class.name.gsub("::", "_")
    else
      controller.to_s
    end
  end

  # Link to object
  #
  # object_link user,
  #             ->(user) { user_path(user) },
  #             name_method: "full_name",
  #             link_opts: { class: "btn" },
  #             for_empty: "anonymous"
  def object_link(object, path_proc, opts = {})
    opts[:for_empty] ||= "-"
    opts[:name_method] ||= "to_s"
    opts[:link_opts] ||= {}

    if object
      link_to object.public_send(opts[:name_method]),
              path_proc.call(object),
              opts[:link_opts]
    else
      opts[:for_empty]
    end
  end

  # Map of links to each object in collection. Please see options in #object_link
  #
  # links_for_collection companies,
  #                      ->(company) { company_path(company) },
  #                      name_method: "name",
  #                      link_opts: { class: "wrapped" },
  #                      for_empty: "-"
  def links_for_collection(collection, path_proc, opts = {})
    collection.map do |object|
      object_link object, path_proc, opts
    end
  end


  # Links to each object in collection. Please see options in #object_link
  #
  # linked_names companies,
  #              ->(company) { company_path(company) },
  #              name_method: "name",
  #              link_opts: { class: "wrapped" },
  #              for_empty: "-",
  #              join_with: ";"
  def linked_names(collection, path_proc, opts = {})
    opts[:join_with] ||= ", "
    opts[:for_empty] ||= "-"
    links_for_collection(collection, path_proc, opts).join(opts[:join_with])
                                                     .html_safe.presence || opts[:for_empty]
  end

  # List of collection objects. Please see options in #object_link
  #
  # collection_list companies,
  #                 ->(company) { company_path(company) },
  #                 name_method: "name",
  #                 for_empty: "-",
  #                 join_with: ";"
  def collection_list(collection, opts = {})
    opts[:for_empty] ||= "-"
    opts[:name_method] ||= "to_s"
    opts[:join_with] ||= ", "

    if collection && collection.any?
      collection.map do |member|
        member.public_send(opts[:name_method])
      end.join(opts[:join_with]).presence || opts[:for_empty]
    else
      opts[:for_empty]
    end
  end

  # Appends http:// if site has no protocol defined
  def external_url(url)
    if url.present?
      if (url.starts_with?("http://") || url.starts_with?("https://"))
        url
      else
        "http://#{url}"
      end
    end
  end

  # Ensures the website is displayed with full url to not link to the
  # current site
  def external_link(url)
    link_to url, external_url(url)
  end

  def confirmation_icon(value)
    if value
      content_tag(:span, '✓', class: 'badge badge-success')
    else
      content_tag(:span, '✘', class: 'badge badge-important')
    end
  end

  # Displays flash messages with proper bootstrap css selector
  #
  # .container
  #   = render "layouts/alerts"
  def flash_class(level)
    case level
      when :notice then "info"
      when :error then "danger"
      when :alert then "warning"
    end
  end
end
