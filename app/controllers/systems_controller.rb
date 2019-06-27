class SystemsController < ApplicationController
  before_action :set_system, only: [:show, :edit, :update, :destroy]

  def index
    @systems_title = "Recipes"
    @systems = System.all
  end

  def show
    @blocks = @system.blocks.order(order: "ASC") #orderカラムの小さいもの順に並べ替え
  end

  def new
    @title = "レシピ作成"
    @system = System.new
  end

  def edit
    @title = "レシピ編集"
  end

  def create
    @system = System.new(system_params)
    @system.user_id = current_user.id

    if @system.save
      flash[:success] = "CREATE"
      redirect_to @system
    else
      render :new 
    end
  end

  def update
    if @system.update(system_params)
      flash[:success] = "UPDATE"
      redirect_to @system
    else
      render :edit
    end
  end

  def destroy
    @system.destroy
    flash[:success] = "DELETE"
    redirect_to systems_url
  end

  private
    def set_system
      @system = System.find(params[:id])
    end

    def system_params
      params.require(:system).permit(:name, :description, :url, :user_id)
    end
end
