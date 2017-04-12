class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_tickets = @user.tickets
  end
end
