require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/register' do
    @name = params[:name]
    erb :register
  end

  get '/game' do
    $GAME = Game.new Player, Board
    @name = params[:name]
    erb :game
  end

  set :views, Proc.new { File.join(root, "..", "views") }
  # start the server if ruby file executed directly
  run! if app_file == $0
end
