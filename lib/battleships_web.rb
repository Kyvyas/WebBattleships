require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views") }

  enable :sessions

  $GAME = Game.new(Player, Board)

  get '/' do
    # @name = params[:name]
    # puts @name
    # session[:name] = @name
    # puts session[:name]
    if $GAME
      session[:player] = 'player_2'
    else
      session[:player] = 'player_1'
    end
    erb :index
  end

  post '/game' do
    $GAME
    @name = params[:name]
    puts @name
    # @name = session[:name]

    erb :game
  end

  post '/game' do
    @ship = params[:ship]
    @coordinates = params[:coordinates]
    @orientation = params[:orientation]
    # if session[:player] == 'player_1'
     $GAME.player_1.place_ship(Ship.new(@ship), @coordinates, @orientation)
    # else
    #   $GAME.player_2.place_ship(Ship.new(@ship), @coordinates, @orientation)    
    # end
    erb :game
  end

  post '/play' do
    @fire = params[:fire]
    if @fire
      if session[:player] == 'player_1'
        $GAME.player_1.shoot(@fire)
      else
        $GAME.player_1.shoot(@fire)
      end
    end
    erb :play
  end
  
  # start the server if ruby file executed directly
  run! if app_file == $0
end
