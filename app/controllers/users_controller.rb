class UsersController < ApplicationController
  ## Use to discover the class User methods
  ## @methods_list = current_user.methods - Object.methods
  ## puts "\n\current_user.methods : "+ @methods_list.sort.join("\n").to_s+"\n\n"
  ## Don't cancel if it's not important

  before_filter :authenticate_user!
  before_filter :find_controller
  after_action :verify_authorized

  def index
    @users = User.all
    authorize User
  end

  def view_locked
    @users = User.where.not(locked_at: nil)
    authorize User
    if @users.nil?
      redirect_to admin_administer_index_path, :warning => "None blocked User."
    end
  end

  def new
    @user = User.new
    authorize User
  end

  def create
    @user = User.new(secure_params)
    authorize @user
    if @user.save
      redirect_to admin_administer_index_path, :notice => "User updated."
    else
      link_to_function "Back", "history.back()"
      redirect_to users_path, :alert => "Unable to update user."
    end

  end

  def show
    @user = User.find_by_id(params[:id])
    if @user
      authorize @user
    else
      authorize current_user
      if !request.env["HTTP_REFERER"].blank? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
        redirect_to :back, :alert => "Unable to find this user."
      else
        redirect_to root_path, :alert => "Unable to find this user."
      end
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
    if @user
      authorize @user
    else
      authorize current_user
      if !request.env["HTTP_REFERER"].blank? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
        redirect_to :back, :alert => "Unable to find this user."
      else
        redirect_to root_path, :warning => "Unable to find this user."
      end
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    authorize @user
    if current_user.admin?
      params[:user].delete(:current_password)
      if params[:user][:password].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
      if params[:user][:locked_at] == 'LockNOW'
        params[:user][:locked_at] = Time.now
        params[:user][:failed_attempts] = 5
      elsif params[:user][:locked_at].blank?
        params[:user][:failed_attempts] = 0
      end
      if @user.update_without_password(secure_params)
        redirect_to admin_administer_index_path, :notice => "User updated."
      else
        redirect_to admin_administer_index_path, :alert => "Unable to update user."
      end
    else
      if @user.update_with_password(super_secure_params)
        redirect_to root_path, :notice => "User updated."
      else
        redirect_to root_path, :alert => "Unable to update user."
      end
    end
  end

  def destroy
    user = User.find_by_id(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit({:admin_role_ids => []}, :email, :password, :password_confirmation,
                                  :username, :name, :locked_at, :failed_attempts)
    ##params.require(:user).permit(:admin_role_ids => [])
  end

  def super_secure_params
    params.require(:user).permit(:role, :email, :password, :password_confirmation, :current_password, :username, :name)
  end

  def find_controller
    @controller = params[:controller]
  end

end
