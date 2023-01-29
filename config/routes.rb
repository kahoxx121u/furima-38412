Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
  #購入機能に必要なルーティングを設定する（上記の例では、indexアクションとcreateアクション。ネストすることに注意する）
  end
end
