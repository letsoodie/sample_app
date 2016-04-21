class UsersController < ApplicationController
  # Par défaut before_action est appliqué sur toutes les actions du controlleur.
  # Ici il est restreint aux actions edit et update
  before_action :logged_in_user, only: [:index, :edit, :update]
  # S'assure qu'un utilisateur ne puisse modifier que ses propres données.
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      # we could have used the equivalent
      # redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                     :password_confirmation)
    end

    # Before filters

    # S'assure que l'utilisateur est loggé ou redirige vers la page de connexion
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      if current_user.blank? || !current_user.admin?
        flash[:danger] = "Please log in as Admin"
        redirect_to(root_url)
      end
    end
end
