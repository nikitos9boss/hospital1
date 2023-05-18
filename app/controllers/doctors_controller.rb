class DoctorsController < ApplicationController
  before_action :authenticate_user!
    def new
      @doctor = Doctor.new
    end

    def show
      @doctor =  Doctor.find(params[:id])
    end
    def edit
      @doctor =  Doctor.find(params[:id])
    end

    def update
      @doctor =  Doctor.find(params[:id])
      if @doctor.update(doctor_params)
        redirect_to doctors_path
      else
        render :edit
      end
    end

    def index
      @doctors =  Doctor.all
      @doctors = Doctor.order(:id).page params[:page]
    end

    def destroy
      @doctor =  Doctor.find(params[:id])
      @doctor.destroy
      redirect_to doctors_path
    end

    def create
      @doctor =  Doctor.new(doctor_params)
      if @doctor.save
        redirect_to doctors_path
      else
        render :new
      end
    end

    def doctor_params
      params.require(:doctor).permit(:name, :stag)
    end

  end