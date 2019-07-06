class BlocksController < ApplicationController

  before_action :set_block, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy] # deviseのヘルパーメソッド、デフォルトではログイン画面に遷移する
  before_action :ensure_correct_user, only: [:edit, :update, :destroy] # 投稿者でなければリダイレクトではじく

  def index
    @blocks_title = "Codes"
    @blocks = Block.all
  end

  def show
    if user_signed_in?
      @systems = current_user.systems
    end
  end

  def new
    @block = Block.new
    @block.codes.build
    @title = "CREATE BLOCK"
    @action = "create" #URLのparamをidからcodeに変更したためrails側でルーティング先をcreateとupdateで自動に振り分けてくれなくなったので明示的に示すための変数。
  end

  def edit
    @title = "EDIT BOT"
    @action = "update" #URLのparamをidからcodeに変更したためrails側でルーティング先をcreateとupdateで自動に振り分けてくれなくなったので明示的に示すための変数。
  end

  def create
    @block = Block.new(block_params)
    @block.user_id = current_user.id

    if @block.save
      flash[:success] = "CREATE"
      redirect_to block_path(@block.id)
    else
      render :new
    end
  end

  def update
    if @block.update(block_params)
      flash[:success] = "UPDATE"
      redirect_to block_path(@block.id)
    else
      render :edit
    end
  end

  def destroy
    @block.destroy
    flash[:success] = "DELETE"
    redirect_to user_path(@block.user.id)
  end


  private
    def set_block
      @block = Block.find(params[:id])
    end

    def block_params
      params.require(:block).permit(:name, :content, :category, :user_id, codes_attributes: [:id, :_destroy, :name, :source, :description, :url, :image, :image_cache, :remove_image])
    end

    # 管理者または投稿者でない場合はリダイレクトではじく
    def ensure_correct_user
      @block = Block.find_by(id: params[:id])
      if not current_user.id == @block.user.id
        flash[:alert] = "権限がないのでアクセスできません。"
        redirect_to user_path(current_user.id)
      end
    end

end
