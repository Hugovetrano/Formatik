class ParcoursadminsController < ApplicationController
  def index
    @parcoursadmins = Parcoursadmin.all
  end

  def show
    @parcoursadmin = Parcoursadmin.find(params[:id])
  end
end
