Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # SPA用の設定
  # ---以下の設定はroutingの最後にマッチするようにファイルの最後に置いてください---
  if Rails.env.production? || ENV["FORCE_SPA"]
    class SPAHandler
      def initialize
        @file_handler = ActionDispatch::FileHandler.new(Rails.root.join("public", "react-router", "client").to_s)
      end

      def call(env)
        env["PATH_INFO"] = "index.html" # always serve the index.html
        @file_handler.call(env)
      end
    end

    get "*path", to: SPAHandler.new
  else
    proxy = Rack::Proxy.new(backend: "http://localhost:5173") # to react-router dev server
    root to: proxy
    get "*path", to: proxy
  end
end
