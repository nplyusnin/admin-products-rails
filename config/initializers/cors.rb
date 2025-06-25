Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "*"  # 👈 только этот домен

    resource "/api/*",
      headers: :any,
      methods: [ :get, :post, :patch, :put, :delete, :options, :head ],
      expose: [ "Authorization" ]
  end
end
