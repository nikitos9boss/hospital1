class PacientsController < ApplicationController
  before_action :authenticate_user!
    def new
      @pacient = Pacient.new
    end

    def show
      @pacient = Pacient.find(params[:id])
      @card_pacient = @pacient.cardPacient
    end

    def edit
      @pacient = Pacient.find(params[:id])
    end

    def update
      @pacient = Pacient.find(params[:id])
      if @pacient.update(pacient_params)
        redirect_to pacients_path
      else
        render :edit
      end
    end

    def index
      #@pacients = Pacient.all
      #@pacients = Pacient.order(:id).page params[:page]

      @query = PacientQuery.new(Pacient.all)
      @query = @query.call(params)
      @pacients = Kaminari.paginate_array(@query).page(params[:page]).per(14)

      #@clinics = Clinic.order(:id).page params[:page]
    end

    def destroy
      @pacient = Pacient.find(params[:id])
      @pacient.destroy
      redirect_to pacients_path
    end

    def create
      @pacient = Pacient.new(pacient_params)
      if @pacient.save
        redirect_to pacients_path
      else
        render :new
      end
    end

    def pacient_params
      params.require(:pacient).permit(:name)
    end

end
