require 'test_helper'

class PacientTest < ActiveSupport::TestCase
  def setup
    @pacient = Pacient.new(name: "John Doe")
    @pacient.save
  end

  test "should have one card pacient" do
    assert_respond_to @pacient, :cardPacient
  end

  test "should find card pacient by id" do
    card_pacient = CardPacient.new(pacient: @pacient)
    card_pacient.save
    result = Pacient.find_card_pacient(@pacient.id)
    assert_equal card_pacient.id, result.first["id"] if result.present?
  end

  test "should return all pacients using SQL" do
    pacients = Pacient.all_sql
    assert_equal Pacient.all.size, pacients.count
  end

  test "should find pacient by id using SQL" do
    assert_equal @pacient.id, Pacient.find_by_id(@pacient.id).first["id"]
  end

  test "should delete pacient by id using SQL" do
    Pacient.delete_by_id(@pacient.id)
    assert_empty Pacient.where(id: @pacient.id)
  end

  test "should update pacient by SQL" do
    new_name = "Jane Doe"
    Pacient.update_by_sql({ "id" => @pacient.id, "name" => new_name })
    @pacient.reload
    assert_equal new_name, @pacient.name
  end
end
