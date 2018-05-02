class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  end

  def registration_sign_in
  end
end
