class Api::V1::DraftsController < ApplicationController

    def index
        drafts = Draft.all
        render json: drafts.to_json
    end

    def show
        draft = Draft.find(params[:id])
        render json: draft.to_json(include: [{:franchises => {include: :franchise_players}}, :roster_config])
    end

    def create
        draft = Draft.new(draft_params)
        if draft.save
            render json: draft.to_json
        else
            render error: {error: 'Unable to create draft'}, status: 400
        end
    end

    def draft_franchise_players
        draft = Draft.find(params[:id])
        players = draft.franchises.map{|franchise| franchise.franchise_players}.flatten
        render json: players.to_json(include: [:player, :franchise])
    end

    # def draft_franchises
    #     draft = Draft.find(params[:id])
    #     franchises
    # end

    def draft_params
        params.require(:draft).permit(:id, :name, :roster_config_id)
    end

end
