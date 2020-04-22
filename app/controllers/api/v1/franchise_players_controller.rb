class Api::V1::FranchisePlayersController < ApplicationController

    def index
        franchise_players = FranchisePlayer.all
        render json: franchise_players.to_json
    end

    def show
        franchise_player = FranchisePlayer.find(params[:id])
        render json: franchise_player.to_json(include: {:player => except: [:id]})
    end

    def create
        franchise_player = FranchisePlayer.new(franchise_player_params)
        if franchise_player.save
            render json: franchise_player.to_json
        else
            render error: {error: 'Unable to create franchise_player'}, status: 400
        end
    end

    def destroy
        franchise_player = FranchisePlayer.find(params[:id])
        franchise_player.destroy
        render json: franchise_player
    end

    def franchise_player_params
        params.require(:franchise_player).permit(:id, :player_id, :franchise_id, :salary)
    end

end
