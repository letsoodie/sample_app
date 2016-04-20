class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in
      log_in user

      # si la checkbox remember_me est cochée la session sera sauvegardée en local
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)

      redirect_back_or user
    else
      # *flash* persiste pour une requête mais renvoyer un template avec
      # *render* ne compte pas pour une requête.
      #*flash.now* est prévu pour ce cas particulier
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end



  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
