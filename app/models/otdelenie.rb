class Otdelenie < ApplicationRecord
  belongs_to :clinic
  belongs_to :doctor
  @name

end
