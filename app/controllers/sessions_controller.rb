class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
    if user.email_confirmed
        sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Please activate your account by following the
      instructions in the account confirmation email you received to proceed'
      render 'new'
    end
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end
end

