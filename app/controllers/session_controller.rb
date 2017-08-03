class SessionController < ApplicationController
  
  def new
    @user_session = User.new
  end

  # def create
  # end

  def destroy
    user = User.find params[:id]
    product.destroy
    redirect_to [:admin, :products], notice: 'Product deleted!'
  end
end