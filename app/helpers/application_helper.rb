module ApplicationHelper

  #--- Devise Methods
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def minimum_password_length
    10
  end

end
