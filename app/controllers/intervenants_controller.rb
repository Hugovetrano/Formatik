class IntervenantsController < ApplicationController
  def index
    @intervenants = Intervenant.all
  end

  def show
    @intervenant = Intervenant.find(params[:id])
    @sessions = @intervenant.sessions.where("date >= ?", Date.today)
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
