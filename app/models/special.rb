class Special < ApplicationRecord
  belongs_to :doctor
  @name
  def self.find_doctor(id)
    tmp = ActiveRecord::Base.connection.execute("SELECT * FROM specials WHERE id = #{id}")[0]
    ActiveRecord::Base.connection.execute("SELECT * FROM doctors WHERE id = #{tmp['doctor_id']}")
  end
  def self.all_sql
    ActiveRecord::Base.connection.execute("SELECT * FROM specials")
  end

  def self.find_by_id(id)
    ActiveRecord::Base.connection.execute("SELECT * FROM specials WHERE id= #{id}")
  end
  def self.delete_by_id(id)
    ActiveRecord::Base.connection.execute("DELETE FROM specials WHERE id= #{id}")
  end
  def self.update_by_sql(element)
    ActiveRecord::Base.connection.execute("UPDATE specials SET name='#{element["name"]}' WHERE id= #{element["id"]}")
  end

end
