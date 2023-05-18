class CardPacientsController < ApplicationController
  before_action :authenticate_user!
    def new
      @cardPacient = CardPacient.new
    end

    def show
      @cardPacient = CardPacient.find(params[:id])
      @pacient = @cardPacient.pacient
      @clinic = @cardPacient.clinic
    end
    def edit
      @cardPacient =CardPacient.find(params[:id])
    end

    def update
      @cardPacient = CardPacient.find(params[:id])
      if @cardPacient.update(cardPacient_params)
        redirect_to card_pacients_path
      else
        render :edit
      end
    end

    def index
      #@cardPacients = CardPacient.all
      @cardPacients = CardPacient.order(:id).page params[:page]
    end

    def destroy
      @cardPacient = CardPacient.find(params[:id])
      @cardPacient.destroy
      redirect_to card_pacients_path
    end

    def create
      @cardPacient = CardPacient.new(cardPacient_params)
      if @cardPacient.save
        redirect_to card_pacients_path
      else
        render :new
      end
    end

    def cardPacient_params
      params.require(:card_pacient).permit(:name, :pacient_id, :clinic_id)
    end

  end
