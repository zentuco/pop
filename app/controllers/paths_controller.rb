class PathsController < Devise::SessionsController
   def new
     self.resource = resource_class.new(sign_in_params)
     store_location_for(resource, params[:redirect_to])
     super
   end

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)

    if !session[:return_to].blank?
      redirect_to session[:return_to]
      session[:return_to] = nil
    else
      respond_with resource, :location => after_sign_in_path_for(resource)
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end
end
