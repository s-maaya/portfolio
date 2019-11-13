Rails.application.routes.draw do

  namespace :admin do
    devise_for :admin_users, controllers: {
    sessions: 'admin/admin_users/sessions',
    registrations: 'admin/admin_users/registrations',
    passwords: 'admin/admin_users/passwords'
    }
    root to: 'rooms#top'
    resources :rooms
  end

  scope module: 'end_user' do
    devise_for :users, controllers: {
      sessions: 'end_user/users/sessions',
      registrations: 'end_user/users/registrations',
      passwords: 'end_user/users/passwords'
    }
    root to: 'rooms#top'
    resources :rooms
    resources :messages
    mount ActionCable.server => '/cable'
  end
end