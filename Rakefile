require 'active_record_migrations'
require 'rack/cors'

use Rack::Cors do
  allow do
    origins *

    resource '/file/list_all/', :headers => 'x-domain-token'
    resource '/file/at/*',
        methods: [:get, :post, :delete, :put, :patch, :options, :head],
        headers: 'x-domain-token',
        expose: ['Some-Custom-Response-Header'],
        max_age: 600
        # headers to expose
  end

  allow do
    origins '*'
    resource '*', headers: :any, methods: :get
  end
end

ActiveRecordMigrations.load_tasks
