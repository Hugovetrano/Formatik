class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def dashboard
    @session = Session.where(Date.new("date_debut".to_i) > Time.now).sort_by(&:date_debut).first
    @programme = @session.programme.titre
    @intervenant = "#{@session.intervenant.prenom} #{@session.intervenant.nom}"

    @inscriptions = @session.inscriptions
    @non_participants = []
    @inscriptions.each do |inscription|
      p = inscription.parcoursadmin
      @non_participants << inscription unless p.convocation_envoye
    end

    @participants_confirmes = @inscriptions - @non_participants
  end
end
