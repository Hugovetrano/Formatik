class EntreprisesController < ApplicationController
  def getentreprises
    @entreprises = Entreprise.all

    results = {}

    @entreprises.each do |entreprise|
      entreprise.apprenants.each_with_index do |apprenant, index|
        i = 0
        apprenant.inscriptions.each do |inscription|
          i = i + inscription.session.prix.to_i
        end
        results[entreprise.nom] = i
      end
    end

    top_results = results.sort_by { |nom, ca| ca }.reverse
    top_name = []
    top_ca = []
    top_results[0..2].each_with_index do |result, index|
      case index
      when 0
        top_name[1] = result[0]
        top_ca[1] = result[1]
      when 1
        top_name[0] = result[0]
        top_ca[0] = result[1]
      when 2
        top_name[2] = result[0]
        top_ca[2] = result[1]
      end
    end
    # binding.break
    render json: { "nom" => top_name, "ca" => top_ca }.to_json
  end
end
