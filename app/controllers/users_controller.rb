class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @systems_title = "MyRecipe"
    @systems = @user.systems
    @blocks_title = "MyCode"
    @blocks = @user.blocks
  end
end
