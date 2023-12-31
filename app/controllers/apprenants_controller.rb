class ApprenantsController < ApplicationController
  before_action :set_apprenant, only: %i[show edit update destroy]
  skip_forgery_protection only: %i[update_by_mail create]
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
      respond_to do |format|
        format.html { redirect_to apprenant_path(@apprenant) }
        format.json { render json: { status: 'Created' } }
      end  
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: { status: 'Not created' } }
      end    
    end
  end

  def self.edusign_create(apprenant)
    @apprenant = Apprenant.new(apprenant)
    if @apprenant.save
      EdusignService.new.add_student(@apprenant)
    end
  end

  def edit
  end

  def update
    if @apprenant.update(apprenant_params)
      @apprenant.update(apprenant_params)
      redirect_to apprenant_path(@apprenant)
    else
      render :edit
    end
  end

  def destroy
    @apprenant.destroy
    redirect_to apprenants_path, status: :see_other
  end

  def update_by_mail
    @apprenant = Apprenant.find_by_email(params[:email])
    @apprenant.update(apprenant_params)
    if @apprenant.save
      render json: { status: 'Updated' }
    else
      render json: { status: 'Not updated' }
    end
  end

  private

  def set_apprenant
    @apprenant = Apprenant.find(params[:id])
  end

  def apprenant_params
    params.require(:apprenant).permit(:nom, :prenom, :email, :profession, :adresse_facturation,
                                      :code_postal, :ville, :telephone, :niveau_etude, :entreprise_id, :photo)
  end
end
