module BzCore
  module FlashMessages

    # Example
    #   common_message :create, :success, :location
    #   common_message :update, :error, "users.roles"
    #   redirect_to some_path,
    #               notice: common_message(:create, :success, :task)
    def common_message(action, status, entity)
      I18n.t "flash.common.#{action}.#{status}",
             { entity: I18n.t("activerecord.models.#{entity}") }
    end

    # Example
    #   custom_message :trash_emptied, :success
    #   redirect_to some_path,
    #               notice: custom_message(:trash_emptied, :success)
    def custom_message(action, status, opts = {})
      I18n.t("flash.#{controller_path.gsub('/', '.')}.#{action}.#{status}", opts)
    end
  end
end
