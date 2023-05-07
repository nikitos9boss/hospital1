require 'test_helper'

class SpecialTest < ActiveSupport::TestCase
  def setup
    @doctor = Doctor.create(name: "John Doe")
    @special = Special.create(name: "Cardiology", doctor: @doctor)
  end

  test "should belong to doctor" do
    assert_respond_to @special, :doctor
  end



  test "should return all specials using SQL" do
    specials = Special.all_sql
    assert_equal Special.all.size, specials.count
  end

  test "should find special by id using SQL" do
    assert_equal @special.id, Special.find_by_id(@special.id).first["id"]
  end

  test "should delete special by id using SQL" do
    Special.delete_by_id(@special.id)
    assert_empty Special.where(id: @special.id)
  end

  test "should update special by SQL" do
    new_name = "Neurology"
    Special.update_by_sql({ "id" => @special.id, "name" => new_name })
    @special.reload
    assert_equal new_name, @special.name
  end
end
