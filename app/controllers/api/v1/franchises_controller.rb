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

    def create_draft_franchises
        objects_array = []
        params[:franchises].each do |franchise| 
            # byebug
            newObj = Franchise.create(franchise.permit(:id, :draft_id, :name, :budget, :draft_position, :is_nominating))
            objects_array << newObj.to_json(include: {:franchise_players => {include: :player, except: [:created_at, :updated_at]}})
        end
            if objects_array.length == 10
                render json: objects_array
            else
                render error: {error: 'Unable to create franchises'}, status: 400
            end
    end

    def franchise_params
        params.require(:franchise).permit(:id, :draft_id, :name, :budget, :draft_position, :is_nominating)
    end

    def franchises_params
        params.permit(_json: [:id, :draft_id, :name, :budget, :draft_position, :is_nominating, :franchise])
    end

end
