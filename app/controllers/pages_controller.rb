class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  end

  def sign_in_register
  end
end
