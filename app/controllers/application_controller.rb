require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      new_team = params[:team]
      @team = Team.new(new_team[:name], new_team[:motto])
      new_hero1 = params[:team][:members][0]
      @hero_one = Superhero.new(new_hero1[:name], new_hero1[:power], new_hero1[:bio])
      new_hero2= params[:team][:members][1]
      @hero_two = Superhero.new(new_hero2[:name], new_hero2[:power], new_hero2[:bio])
      new_hero3 = params[:team][:members][2]
      @hero_three = Superhero.new(new_hero3[:name], new_hero3[:power], new_hero3[:bio])
      erb :team
    end
end
