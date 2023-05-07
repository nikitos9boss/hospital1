class CardPacient < ApplicationRecord
  belongs_to :pacient
  belongs_to :clinic
  validates :name, presence: true

end
