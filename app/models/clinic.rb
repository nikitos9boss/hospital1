class Clinic < ApplicationRecord

  has_many :otdelenie
  has_many :cardPacient
  validates :address, presence: true
  validates :name, presence: true
  validates :year, presence: true
  attribute :typeClinic, :string
  attribute :city, :string
  attribute :ratingMortality, :string
  paginates_per 14
  def count_doctors()
    otdelenie.joins(:doctor).count
  end

  def count_otdelenies()
    otdelenie.count
  end
end
