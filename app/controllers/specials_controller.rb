class SpecialsController < ApplicationController
  before_action :authenticate_user!
    def new
      @special = Special.new
    end

    def show
      @special = Special.find(params[:id])
      @doctor = @special.doctor
    end
    def edit
      @special =Special.find(params[:id])
    end

    def update
      @special = Special.find(params[:id])
      if @special.update(special_params)
        redirect_to specials_path
      else
        render :edit
      end
    end

    def index
      @specials = Special.all
      @specials = Special.order(:id).page params[:page]
    end

    def destroy
      @special = Special.find(params[:id])
      @special.destroy
      redirect_to specials_path
    end

    def create
      @special = Special.new(special_params)
      if @special.save
        redirect_to specials_path
      else
        render :new
      end
    end

    def special_params
      params.require(:special).permit(:name, :doctor_id)
    end

end
