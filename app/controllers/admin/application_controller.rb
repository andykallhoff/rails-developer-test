class Admin::ApplicationController < ApplicationController
  before_action :redirect_non_admin

  private
    def redirect_non_admin
      return if current_user&.admin?
      redirect_to root_path, flash: {error: "You are not authorized for that area of the site."}
    end
end
