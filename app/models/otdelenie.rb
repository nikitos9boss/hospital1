class Otdelenie < ApplicationRecord
  belongs_to :clinic
  belongs_to :doctor
  validates :name, presence: true

end
