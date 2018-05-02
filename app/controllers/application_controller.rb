class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  after_action :set_current_user, unless: :devise_controller?

  def set_current_user
    @current_user = current_user
  end
end
