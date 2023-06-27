class SessionsController < ApplicationController
    before_action :redirect_unlogged_user

    def new
        @session = Session.new
    end

    def create
        @session = Session.new(session_params)
        if @session.save
            redirect_to sessions_formation_path(@session)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @session = Session.find(params[:id])
    end

    private

    def redirect_unlogged_user
        unless current_user
            redirect_to root_path
        end
    end

    def session_params
        params.require(:session).permit(:nom, :date_debut, :date_fin, :programme_id, :intervenant_id, :prix, :adresse)
    end
end
