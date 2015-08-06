require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views") }

  enable :sessions

  $GAME = Game.new(Player, Board)

  get '/' do
    @name = params[:name]
    erb :index
  end

  get '/game' do
    $GAME
    @name = params[:name]
    session[:name]
    erb :game
  end

  post '/game' do
    @ship = params[:ship]
    @coordinates = params[:coordinates]
    @orientation = params[:orientation]
    $GAME.player_1.place_ship(Ship.new(@ship), @coordinates, @orientation)
    erb :game
  end
  
  # start the server if ruby file executed directly
  run! if app_file == $0
end
