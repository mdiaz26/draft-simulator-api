class Api::V1::DraftsController < ApplicationController

    def index
        drafts = Draft.all
        render json: drafts.to_json
    end

    def show
        draft = Draft.find(params[:id])
        render json: draft.to_json(include: {:franchises => {only: [:id, :name]}})
    end

    def create
        draft = Draft.new(draft_params)
        if draft.save
            render json: draft.to_json
        else
            render error: {error: 'Unable to create draft'}, status: 400
        end
    end

    def draft_params
        params.require(:draft).permit(:id, :name, :roster_config_id)
    end

end
