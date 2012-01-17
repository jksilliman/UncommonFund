class Admin::UsersController < Admin::BaseController 
  load_and_authorize_resource
  respond_to :html, :js

  def index
    @users = User.find_all_by_is_admin(true)
    @user ||= User.new
  end

  def new
    respond_with(@user)
  end

  def create
    if temp = User.find_by_username(@user.username)
      @user = temp
    end
    @user.is_admin = true
    @user.save
    respond_with(@user) do |format|
      format.html do
        if not @user.valid?
          self.index
          render :index
        else
          redirect_to admin_users_path
        end
      end
    end
  end

  def destroy
    @user.is_admin = false
    @user.save
    respond_with(@user)
  end
end
