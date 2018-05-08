class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :authorize_user

  def index
    @users = User.all.order(email: "ASC")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = (0...50).map { ('a'..'z').to_a[rand(26)] }.join

    if @user.save(user_params)
      redirect_to admin_users_path, notice: "User was successfully created."
    else
      render :new, notice: "Oops, the user was not saved."
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "User was successfully updated."
    else
      render :edit
    end
  end

  #Unsure if we want this
  #def destroy
  #  @user.destroy
  #  redirect_to admin_users_path, notice: "The user was deleted."
  #end

  private
    def set_user
      @user = User.find((params[:id] || params[:user_id]))
    end

    def user_params
      params.require(:user).permit(:email, :role)
    end

    def authorize_user
      authorize current_user
    end
end
