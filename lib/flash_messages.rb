module BzCore
  module FlashMessages

    # Example                                                                                                                                                                                           
    #   common_notice :create, :success, :location                                                                                                                                                      
    #   common_notice :update, :error, "users.roles"
    #   redirect_to some_path,
    #               common_notice(:create, :success, :task)                                                                                                                                               
    def common_notice(action, status, entity)                                                                                                                                                       
      t "common.flash.#{action.to_s}.#{status.to_s}",                                                                                                                                                   
      entity: t("activerecord.models.#{entity.to_s}")                                                                                                                                                      
    end

    # Example                                                                                                                                                                                           
    #   custom_notice :notice, :trash_emptied
    #   redirect_to some_path,
    #               custom_notice(:notice, :trash_emptied)                                                                                                                                               
    def custom_notice(flash_key, status)
      { flash_key => t("#{controller_path.gsub('/', '.')}.#{status}") }                                                                                                                                        
    end
  end
end