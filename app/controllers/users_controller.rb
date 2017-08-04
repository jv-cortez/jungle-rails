class UsersController < ApplicationController

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

      if @user.save
        redirect_to products_path, notice: 'User was successfully created.' 
      else
        redirect_to new_session_path, notice: 'Please log in.' 
      end
    end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(
        :first_name, 
        :last_name, 
        :email, 
        :password,
        :password_confirmation
      )
    end
end
