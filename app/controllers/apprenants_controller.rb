class ApprenantsController < ApplicationController

  def index
    @apprenants = Apprenant.all
  end

  def show
    @apprenant = Apprenant.find(params[:id])
  end
end
