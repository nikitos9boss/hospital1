class Doctor < ApplicationRecord
  has_one :otdelenie
  has_one :special
  has_many :cardPacient
  validates :stag, presence: true
  validates :name, presence: true
  paginates_per 14
  def self.find_special(id)
    ActiveRecord::Base.connection.execute("SELECT * FROM specials WHERE doctor_id = #{id}")
  end
  def self.find_otdelenie(id)
    ActiveRecord::Base.connection.execute("SELECT * FROM otdelenies WHERE doctor_id = #{id}")
  end
  def self.all_sql
    ActiveRecord::Base.connection.execute("SELECT * FROM doctors")
  end

  def self.find_by_id(id)
    ActiveRecord::Base.connection.execute("SELECT * FROM doctors WHERE id= #{id}")
  end
  def self.delete_by_id(id)
    ActiveRecord::Base.connection.execute("DELETE FROM doctors WHERE id= #{id}")
  end
  def self.update_by_sql(element)
    ActiveRecord::Base.connection.execute("UPDATE doctors SET name='#{element["name"]}', stag ='#{element["stag"]}'  WHERE id= #{element["id"]}")
  end
end
