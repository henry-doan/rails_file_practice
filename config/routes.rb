Rails.application.routes.draw do
  root 'dashboard#index'
  post 'dashboard', to: 'dashboard#write', as: 'write_file'
  get 'read_file', to: 'dashboard#read', as: 'read_file'
  get 'read_csv', toL 'dashboard#read_csv', as: 'read_csv'
end
