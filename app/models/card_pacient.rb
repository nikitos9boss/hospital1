class CardPacient < ApplicationRecord
  belongs_to :pacient
  belongs_to :clinic
  @name
end
