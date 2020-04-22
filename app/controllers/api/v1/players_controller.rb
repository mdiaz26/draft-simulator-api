class Api::V1::PlayersController < ApplicationController

    def index
        players = Player.all
        render json: players, except: [:created_at, :updated_at]
    end

    def show
        player = Player.find(params[:id])
        render json: player
    end

    def create
        player = Player.new(player_params)
        if player.save
            render json: player.to_json
        else
            render error: {error: 'Unable to create player'}, status: 400
        end
    end

    def destroy
        player = Player.find(params[:id])
        player.destroy
        render json: player
    end

    def player_params
        params.require(:player).permit(:id, :name, :pro_team, :position)
    end

end
