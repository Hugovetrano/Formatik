class ProgrammesController < ApplicationController

  def getDetails
    render plain: "#{Programme.find(params[:id]).prix},#{Programme.find(params[:id]).titre}"
  end

  def getprogrammes
    @programmes = Programme.all
    prog_name = []
    prog_ca = []
    @programmes.each do |programme|
      prog_name << programme.titre
      prog_ca << (programme.inscriptions.count * programme.prix.to_i)
    end
    render json: { "nom" => prog_name, "ca" => prog_ca }.to_json

  end
end
