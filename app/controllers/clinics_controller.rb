require_relative '../queries/ClinicQuery'
require 'kaminari'
class ClinicsController < ApplicationController
  before_action :authenticate_user!
  def new
    @clinic = Clinic.new
  end

  def show
    @clinic = Clinic.find(params[:id])
  end
  def edit
    @clinic = Clinic.find(params[:id])
  end

  def update
    @clinic = Clinic.find(params[:id])
    if @clinic.update(clinic_params)
      redirect_to clinics_path
    else
      render :edit
    end
  end

  def index
    #@clinics = Clinic.all
    @query = ClinicQuery.new(Clinic.all)
    @query = @query.call(params)


    @clinics = Kaminari.paginate_array(@query).page(params[:page]).per(14)
    #@clinics = Clinic.order(:id).page params[:page]

  end

  def destroy
    @clinic = Clinic.find(params[:id])
    @clinic.destroy
    redirect_to clinics_path
  end

  def create
    @clinic = Clinic.new(clinic_params)
    if @clinic.save
      redirect_to clinics_path
    else
      render :new
    end
  end

  def clinic_params
    params.require(:clinic).permit(:name, :address)
  end

end