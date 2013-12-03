BbBlocks::Application.routes.draw do

  resources :pages do
    resources :sandboxes
  end

  resources :sandboxes do
    resources :blocks
  end

  get "/", to: "home#index"

  mount JasmineRails::Engine => "/specs" if defined?(JasmineRails)
end
