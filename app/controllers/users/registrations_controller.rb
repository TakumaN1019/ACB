class Users::RegistrationsController < Devise::RegistrationsController

  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy] # 管理者または投稿者でなければリダイレクトではじく

  def new
    super
  end

  def create
    super
  end

  #ユーザープロフィールの編集
  def edit
    @title = "ユーザー編集"
  end

  def update
    # パスワードが空であればpasswordカラムをバリデーションしない
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end
    at_user = @user
    if @user.update(user_params)

        sign_in(at_user, bypass: true) # パスワード変更してもログアウトしないようにする。
        flash[:success] = "UPDATE"
        if devise_mapping.confirmable? && resource.pending_reconfirmation?
          flash[:notice] = "新しいメールアドレス(#{resource.unconfirmed_email})あてに確認メールを送信しています。メールアドレス変更を完了するにはメール内のリンクをクリックしてください。
"
        end
        redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    flash[:notice] = nil
    flash[:success] = "DELETE"
    super
  end

  # ユーザー登録した直後のリダイレクト先を指定
  def after_sign_up_path_for(resource)
    flash[:success] = "WELCOME"
    login_get_path
  end


  # 確認メール送信後のリダイレクト先を指定
  def after_inactive_sign_up_path_for(resource)
    flash[:notice] = "確認メールを送信したのでメール内のリンクから登録を完了させましょう。"
    login_get_path
  end


  private

    def set_user
      @user = User.find_by(id: params[:id])
    end

    def user_params
      params.require(:user).permit(:image, :image_cache, :name, :email, :provider, :uid, :password, :password_confirmation)
    end

    # 他人のページにアクセスしようとしたらリダイレクトではじく
    def ensure_correct_user
      @user = User.find_by(id: params[:id])
      if not current_user.id == @user.id
        flash[:alert] = "権限がないのでアクセスできません。"
        redirect_to root_path
      end
    end


end
