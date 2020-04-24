class Api::V1::FranchisesController < ApplicationController
    
    def index
        franchise = Franchise.all
        render json: franchise.to_json
    end

    def show
        franchise = Franchise.find(params[:id])
        render json: franchise.to_json(include: {:franchise_players => {include: :player, except: [:created_at, :updated_at]}})
    end

    def create
        franchise = Franchise.new(franchise_params)
        if franchise.save
            render json: franchise.to_json
        else
            render error: {error: 'Unable to create franchise'}, status: 400
        end
    end

    def destroy
        franchise = Franchise.find(params[:id])
        franchise.destroy
        render json: franchise
    end

    def franchise_params
        params.require(:franchise).permit(:id, :draft_id, :name, :budget)
    end

end
