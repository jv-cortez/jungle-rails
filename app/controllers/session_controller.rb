class SessionController < ApplicationController
  
  def new
    @user = User.new
  end

   def create
    user = User.find_by_email(session_params[:email])
      # If the user exists AND the password entered is correct.
    if user && user.authenticate(session_params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      puts "in session create"
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to session_path
  end

   private
    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(
        :email, 
        :password,
      )
    end
end