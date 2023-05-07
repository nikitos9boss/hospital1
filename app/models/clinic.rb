class Clinic < ApplicationRecord

  has_many :otdelenie
  has_many :cardPacient
  validates :address, presence: true
  validates :name, presence: true

end
