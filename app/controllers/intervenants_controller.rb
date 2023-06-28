class IntervenantsController < ApplicationController
  def index
    @intervenants = Intervenant.all
  end

  def show
    @intervenant = Intervenant.find(params[:id])
    # :start_date est une méthode de simple_calendar
    start_date = params.fetch(:start_date, Date.today).to_date
    # date_debut appartient au model
    @sessions = Session.where(date_debut: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def new
    @intervenant = Intervenant.new
  end

  def create
    @intervenant = Intervenant.new(intervenant_params)
    if @intervenant.save
      redirect_to intervenants_path
    else
      render :new
    end
  end

  def edit
    @intervenant = Intervenant.find(params[:id])
  end

  def update
    @intervenant = Intervenant.find(params[:id])
    if @intervenant.update(intervenant_params)
      redirect_to intervenant_path(@intervenant)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @intervenant = Intervenant.find(params[:id])
    @intervenant.destroy
    redirect_to intervenants_path, status: :see_other
  end

  private

  def intervenant_params
    params.require(:intervenant).permit(:prenom, :nom, :email, :adresse, :code_postal, :ville,
                                        :telephone, :num_da, :siret, :tarif, :photo)
  end


end
