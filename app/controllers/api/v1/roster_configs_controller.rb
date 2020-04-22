class Api::V1::RosterConfigsController < ApplicationController

    def index
        roster_configs = RosterConfig.all
        render json: roster_configs
    end

    def show
        roster_config = RosterConfig.find(params[:id])
        render json: roster_config
    end

    def create
        roster_config = RosterConfig.new(roster_config_params)
        if roster_config.save
            render json: roster_config
        else
            render error: {error: 'Unable to create roster_config'}, status: 400
        end
    end

    def destroy
        roster_config = RosterConfig.find(params[:id])
        roster_config.destroy
        render json: roster_config
    end

    def roster_config_params
        params.require(:roster_config).permit(:id, :name, :qb, :rb, :wr, :te, :def, :k, :rb_wr, :wr_te, :flex, :superflex, :bench)
    end

end
