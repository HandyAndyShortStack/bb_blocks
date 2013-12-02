BbBlocks::Application.routes.draw do
  resources :scaffolds, :blocks
  resources :sandboxes do
    resources :blocks
  end
  get "/", to: "home#index"
  mount JasmineRails::Engine => "/specs" if defined?(JasmineRails)
end
