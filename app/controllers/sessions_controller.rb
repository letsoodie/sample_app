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

      # redirect to the user's show page
      redirect_to user
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
