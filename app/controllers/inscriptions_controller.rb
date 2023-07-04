class InscriptionsController < ApplicationController
    def create
        @inscription = Inscription.new(inscription_params)
        @inscription.parcoursadmin = Parcoursadmin.create
        if @inscription.save
            PreInscription.where(email: @inscription.apprenant.email).destroy_all
            redirect_to sessions_formation_path(inscription_params[:session_id])
        end
    end

    private

    def inscription_params
        params.require(:inscription).permit(:apprenant_id, :session_id)
    end
end
