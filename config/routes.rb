Rails.application.routes.draw do
  root to: "home#top"

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks', #コールバック
    registrations: 'users/registrations', #登録
    confirmations: "users/confirmations", #確認メール
    sessions: 'users/sessions', #セッション
    passwords: "users/passwords", #パスワード
    unlocks: "users/unlocks" #ロック解除
  }

  devise_scope :user do
    get 'login' => 'users/sessions#new', as: :login_get # ログインページ
    post 'login/:id' => 'users/sessions#create', as: :login_post # ログイン
    delete 'logout/:id' => 'users/sessions#destroy', as: :logout # ログアウト
    get 'signup' => 'users/registrations#new', as: :signup_get # 新規登録ページ
    post 'signup/:id' => 'users/registrations#create', as: :signup_post # 新規登録
    get 'users/:id/edit' => 'users/registrations#edit', param: :id, as: :edit_user # ユーザー編集ページ
    put 'users/:id/update' => 'users/registrations#update', param: :id, as: :update_user # ユーザーアップデート
    delete 'users/:id/destroy' => 'users/registrations#destroy', as: :destroy_user # ユーザー削除
    get 'password' => 'users/passwords#new', as: :new_password # パスワード忘れたページ
    post 'password' => 'users/passwords#create', as: :password # パスワードリセットメールの送信
    get 'password/:id/edit' => 'users/passwords#edit', param: :id, as: :edit_password # パスワードの再発行ページ
    patch 'password/:id/update' => 'users/passwords#update', param: :id
    put 'password/:id/update' => 'users/passwords#update', param: :code, as: :update_password # パスワード再発行
    get 'confirmation' => 'users/confirmations#new', as: :new_confirmation # 確認メール届かなかったページ
    post 'confirmation' => 'users/confirmations#create', as: :confirmation # 確認メールの再送信
    get 'confirmation/:code/check' => 'users/confirmations#show', param: :id, as: :check_confirmation # 確認メールを確認したことを確認するURL
    get 'unlock' => 'users/unlocks#new', as: :new_unlock # ロック解除ページ
    post 'unlock' => 'users/unlocks#create', as: :unlock # ロック解除のメールを送信
    get 'unlock/:id/check' => 'users/unlocks#show', param: :id, as: :check_unlock # ロック解除
  end

  get "user/:id", to: "users#show", param: :id, as: "user" # プロフィール画面

  #resources :systems
  resources :systems do
    post "up/:block_id" => "picks#up" #１つ上に移動
    post "down/:block_id" => "picks#down" #１つ下に移動
  end

  resources :blocks do
    post ":system_id" => "picks#create" #ピックアップ
    delete "/:system_id" => "picks#destroy" #ピックアップを解除
  end

end
