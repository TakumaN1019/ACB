class HomeController < ApplicationController
  def top
    @systems_title = "Recipes"
    @systems = System.all
    @blocks_title = "MyCodes"
    @blocks = Block.all
  end
end
