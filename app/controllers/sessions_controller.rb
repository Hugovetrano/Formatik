class SessionsController < ApplicationController
    before_action :redirect_unlogged_user
    skip_before_action :verify_authenticity_token, only: [:update]

    def new
        @session = Session.new
    end

    def index
        @sessions = Session.all
        # :start_date est une méthode de simple_calendar
        start_date = params.fetch(:start_date, Date.today).to_date
        # date_debut appartient au model
        @sessions = Session.where(date_debut: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week).order(:date_debut)
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

    def update
        column_name = params[:column]
        if column_name.include?('date')
            new_value = DateTime.parse(params[:new_value][0])
        else
            new_value = params[:new_value]
        end
        @session = Session.find(params[:id])
        if @session.update(column_name => new_value)
            if column_name.include?('date')
                render json: { status: 'ok',
                    new_line: json_for_dates(column_name, new_value) }.to_json
            else
                render json: { status: 'ok',
                    new_line: json_for_other(column_name, new_value) }.to_json
            end
        else
            render json: { status: 'failed' }.to_json
        end
    end

    def destroy
        @session = Session.find(params[:id])
        @session.destroy
        redirect_to sessions_formation_index_path
    end

    private

    def json_for_dates(column_name, new_value)
        "<p class='show-session-details-items'>
            <i class='fa-solid fa-pencil' data-show-session-flatpickr-id-value='#{@session.id}'
            data-show-session-flatpickr-column-value='#{column_name.to_s}'
            data-controller='show-session-flatpickr'></i> 
            #{column_name.include?('debut') ? 
                "Du #{@session.date_debut.strftime('%d/%m/%y %Hh%M')}" 
                : 
                "Au #{@session.date_fin.strftime('%d/%m/%y %Hh%M')}"
            }
        </p>"
    end
    
    
    def json_for_other(column_name, new_value)
        "#{case column_name
        when 'nom'
            @session.nom
        when 'prix'
            "#{@session.prix}€"
        when 'adresse'
            @session.adresse
        end}"
    end
    
    
    

    def redirect_unlogged_user
        unless current_user
            redirect_to root_path
        end
    end

    def session_params
        params.require(:session).permit(:nom, :date_debut, :date_fin, :programme_id, :intervenant_id, :prix, :adresse)
    end
end
