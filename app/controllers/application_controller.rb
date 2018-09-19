require 'sinatra/base'
require 'pry'
class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      @team = SuperHero.new(params[:team])
    

      params[:team][:members].each do |details|
        Member.new(details)
      end
      @members = Member.all
      erb :"member"
    end

end
