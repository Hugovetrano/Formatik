class PreInscriptionsController < ApplicationController
    skip_before_action :authenticate_user!, only: %i[indexsessions new create confirmation]
    def indexsessions
        @sessions = Session.select { |session| session.date_debut > Date.new }
    end

    def index_par_session
        @session = Session.find(params[:session_id])
        @preinscriptions = PreInscription.where(session_id: @session.id)
    end

    def new
        @session = Session.find(params[:session_id])
        @preinscription = PreInscription.new
    end

    def show
        @preinscription = PreInscription.find(params[:id])
        if Apprenant.find_by_email(@preinscription.email)
            @apprenant_exist = true
            @apprenant = Apprenant.find_by_email(@preinscription.email)
        else
            @apprenant = Apprenant.new(@preinscription)
        end
    end

    def create
        @preinscription = PreInscription.new(preinscription_params)
        @preinscription.session = Session.find(params[:session_id])
        if @preinscription.save
            redirect_to pre_inscription_confirmation_path(@preinscription)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def confirmation
        @preinscription = PreInscription.find(params[:id])
    end

    private

    def preinscription_params
        params.require(:pre_inscription).permit(:nom, :prenom, :genre, :email, :telephone, :profession, :niveau_etude, :adresse_facturation, :code_postal, :ville)
    end
end
