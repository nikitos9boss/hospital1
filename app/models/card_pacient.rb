class CardPacient < ApplicationRecord
  belongs_to :pacient
  belongs_to :clinic
  belongs_to :doctor
  validates :name, presence: true
  paginates_per 14
end
