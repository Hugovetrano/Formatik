class IntervenantsController < ApplicationController
  def index
    @intervenants = Intervenant.all
  end

  def show
    @intervenant = Intervenant.find(params[:id])
  end

  def new
    @intervenant = Intervenant.new
  end

  def create
    @intervenant = Intervenant.new(intervenant_params)
    if @intervenant.save
      redirect_to intervenant_path(@intervenant)
    else
      render :new
    end
  end

  def





  private

  def intervenant_params
    params.require(:intervenant).permit(:prenom, :nom, :email, :adress, :code_postal, :ville,
                                        :telephone, :num_da, :siret, :tarif)
  end


end
