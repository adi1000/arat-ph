class UsersCOntroller < ApplicationController

  def new
    if current_user
      redirect_to suppliers_path
    else
      @user = User.new
    end
  end

  def create
      @user = User.new(user_params)
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      flash[:success] = "Please confirm your email address to continue"
      redirect_to root_url
    else
      flash[:error] = "Ooooppss, something went wrong!"
      render 'new'
    end
  end


  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user_params
        user.email_activated
        flash[:success] = 'Welcome to Arat App! Your account has now been confirmed.'
        redirect_to suppliers_url
    else
      flash[:error] = 'Error: User does not exist.'
      redirect_to suppliers_url
    end
  end


    private

    def user_params
      params[:user].permit(:email, :password, :name, :phone_number)
    end

end
