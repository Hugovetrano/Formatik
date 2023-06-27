class ApprenantsController < ApplicationController
  before_action :set_apprenant, only: %i[show edit update destroy]
  def index
    @apprenants = Apprenant.all
  end

  def show
  end

  def new
    @apprenant = Apprenant.new
  end

  def create
    @apprenant = Apprenant.new(apprenant_params)
    if @apprenant.save
      redirect_to apprenant_path(@apprenant)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @apprenant.update(apprenant_params)
      redirect_to apprenant_path(@apprenant)
    else
      render :edit
    end
  end

  def destroy
    @apprenant.destroy
    redirect_to apprenants_path, status: :see_other
  end


  private

  def set_apprenant
    @apprenant = Apprenant.find(params[:id])
  end

  def apprenant_params
    params.require(:apprenant).permit(:nom, :prenom, :email, :profession, :adresse_facturation, :code_postal, :ville, :telephone, :niveau_etude, :entreprise_id)
  end
end
