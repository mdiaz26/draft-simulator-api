class Api::V1::FranchisesController < ApplicationController
    
    def index
        franchises = Franchise.all
        render json: franchises.to_json(include: {:franchise_players => {include: :player, except: [:created_at, :updated_at]}})
    end

    def show
        franchise = Franchise.find(params[:id])
        render json: franchise.to_json(include: {:franchise_players => {include: :player, except: [:created_at, :updated_at]}})
    end

    def create
        franchise = Franchise.new(franchise_params)
        if franchise.save
            render json: franchise.to_json(include: {:franchise_players => {include: :player, except: [:created_at, :updated_at]}})
        else
            render error: {error: 'Unable to create franchise'}, status: 400
        end
    end

    def update
        franchise = Franchise.find(params[:id])
        franchise.update(franchise_params)
        render json: franchise.to_json(include: {:franchise_players => {include: :player, except: [:created_at, :updated_at]}})
    end

    def destroy
        franchise = Franchise.find(params[:id])
        franchise.destroy
        render json: franchise
    end

    def franchise_params
        params.require(:franchise).permit(:id, :draft_id, :name, :budget, :draft_position, :is_nominating)
    end

end
