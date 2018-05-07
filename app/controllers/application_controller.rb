class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
    def after_sign_out_path_for(resource_or_scope)
      root_path
    end

    def user_not_authorized
      flash[:error] = "You are not authorized to perform that action."
      redirect_to(request.referrer || root_path)
    end
end
