class Api::V1::RankingPlayersController < ApplicationController

    def index
        ranking_players = RankingPlayer.all
        render json: ranking_players, include: {:player => {except: [:id, :created_at, :updated_at]}}, except: [:created_at, :updated_at]
    end

    def show
        ranking_player = RankingPlayer.find(params[:id])
        render json: ranking_player
    end

    def create
        ranking_player = RankingPlayer.new(ranking_player_params)
        if ranking_player.save
            render json: ranking_player.to_json
        else
            render error: {error: 'Unable to create ranking_player'}, status: 400
        end
    end

    def destroy
        ranking_player = RankingPlayer.find(params[:id])
        ranking_player.destroy
        render json: ranking_player
    end

    def ranking_player_params
        params.require(:ranking_player).permit(:id, :player_id, :ranking_id, :value, :tier)
    end

end
