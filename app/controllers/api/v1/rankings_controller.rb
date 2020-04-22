class Api::V1::RankingsController < ApplicationController

    def index
        rankings = Ranking.all
        render json: rankings
    end

    def show
        ranking = Ranking.find(params[:id])
        render json: ranking.to_json(include: {:ranking_players => {include: {:player => {except: [:id, :created_at, :updated_at]}}, except: [:created_at, :updated_at]}}, except: [:created_at, :updated_at])
    end

    def create
        ranking = Ranking.new(ranking_params)
        if ranking.save
            render json: ranking
        else
            render error: {error: 'Unable to create ranking'}, status: 400
        end
    end

    def destroy
        ranking = Ranking.find(params[:id])
        ranking.destroy
        render json: ranking
    end

    def ranking_params
        params.require(:ranking).permit(:id, :name, :user_id)
    end

end
