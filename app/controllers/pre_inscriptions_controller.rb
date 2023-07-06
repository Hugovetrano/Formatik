class PreInscriptionsController < ApplicationController
    skip_before_action :authenticate_user!, only: %i[indexsessions new create confirmation]

    def index
        @preinscriptions = PreInscription.all
    end

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
        @session = Session.find(@preinscription.session_id)
        @civilite = @preinscription.genre == 'Homme' ? 'Mr' : 'Mme'
        if Apprenant.find_by_email(@preinscription.email)
            @apprenant_exist = true
            @apprenant = Apprenant.find_by_email(@preinscription.email)
            @inscription = Inscription.new(apprenant_id: @apprenant.id, session_id: params[:session_id])
        else
            @apprenant = Apprenant.new(@preinscription.as_json.reject { |k| k == "session_id" || k == "created_at" || k == "updated_at" })
            @inscription = Inscription.new
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

    def check_preinscription
        new_preinscriptions = PreInscription.where("created_at > ?", 5.seconds.ago).count
        render json: { newPreinscriptions: new_preinscriptions }
    end

    private

    def preinscription_params
        params.require(:pre_inscription).permit(:nom, :prenom, :genre, :email, :telephone, :profession, :niveau_etude, :adresse_facturation, :code_postal, :ville)
    end
end
