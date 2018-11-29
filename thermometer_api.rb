require 'active_record_migrations'
require 'active_record'
require 'sinatra'
require 'sinatra/base'
require_relative './lib/state_model.rb'
require 'pg'
require 'json'

def db_configuration
   db_configuration_file = File.join(File.expand_path('..', __FILE__), 'db', 'config.yml')
   YAML.load(File.read(db_configuration_file))
end

class ThermometerApi < Sinatra::Base
  ActiveRecord::Base.establish_connection(db_configuration["development"])

  enable :sessions

  before do
    headers['Access-Control-Allow-Headers'] = "content-type"
    headers['Access-Control-Allow-Origin'] = "*"
    headers['Access-Control-Allow-Methods'] = "POST, GET, OPTIONS, PUT, DELETE"
  end

  get '/' do
    redirect "/thermostat"
  end

  get "/thermostat" do
    p State.find(1).to_json
  end

  post '/thermostat/update/state' do
    @data = JSON.parse(request.body.read)
    State.find(1).update_attribute(:state, @data["state"])
  end

  post '/thermostat/update/city' do
    @data = JSON.parse(request.body.read)
    State.find(1).update_attribute(:city, @data["city"])
  end

  post '/thermostat/update/temp' do
    @data = JSON.parse(request.body.read)
    State.find(1).update_attribute(:temp, @data["temp"])
  end

  run! if app_file == $0
end
