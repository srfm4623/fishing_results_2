class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @results = Result.all
  end
  
end
