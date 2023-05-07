class OtdeleniesController < ApplicationController
  before_action :authenticate_user!
    def new
      @otdilenie = Otdelenie.new
    end

    def show
      @otdilenie = Otdelenie.find(params[:id])
      @doctor = @otdilenie.doctor
      @clinic = @otdilenie.clinic
    end
    def edit
      @otdilenie = Otdelenie.find(params[:id])
    end

    def update
      @otdilenie = Otdelenie.find(params[:id])
      if @otdilenie.update(otdelenie_params)
        redirect_to otdelenies_path
      else
        render :edit
      end
    end

    def index
      @otdilenies = Otdelenie.all
    end

    def destroy
      @otdilenie = Otdelenie.find(params[:id])
      @otdilenie.destroy
      redirect_to otdelenies_path
    end

    def create
      @otdilenie = Otdelenie.new(otdelenie_params)
      if @otdilenie.save
        redirect_to otdelenies_path
      else
        render :new
      end
    end

    def otdelenie_params
      params.require(:otdelenie).permit(:name, :clinic_id, :doctor_id)
    end

end
