class Pacient < ApplicationRecord
  has_one :cardPacient
  @name
  def self.find_card_pacient(id)
    ActiveRecord::Base.connection.execute("SELECT * FROM card_pacients WHERE pacient_id = #{id}")
  end
  def self.all_sql
    ActiveRecord::Base.connection.execute("SELECT * FROM pacients")
  end

  def self.find_by_id(id)
    ActiveRecord::Base.connection.execute("SELECT * FROM pacients WHERE id= #{id}")
  end
  def self.delete_by_id(id)
    ActiveRecord::Base.connection.execute("DELETE FROM pacients WHERE id= #{id}")
  end
  def self.update_by_sql(element)
    ActiveRecord::Base.connection.execute("UPDATE pacients SET name='#{element["name"]}' WHERE id= #{element["id"]}")
  end

end
