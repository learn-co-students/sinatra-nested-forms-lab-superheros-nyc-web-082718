require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end
    #end get request method to '/ '

    post '/team' do
      @team = Team.new(params[:team][:name], params[:team][:motto])


      params[:team][:members].each do |details|

        Member.new(details[:name], details[:power], details[:biography])
      end

      @members = Member.all
      
      erb :team

    end
    #end post request method to '/team '
end
#end App class
