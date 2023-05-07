require "test_helper"

class DoctorTest < ActiveSupport::TestCase
  def setup
    @doctor = Doctor.new(name: "John Doe", stag: 5)
  end

  test "should save valid doctor" do
    assert @doctor.save
  end

  test "should not save doctor without name" do
    @doctor.name = nil
    assert_not @doctor.save
  end

  test "should not save doctor without stag" do
    @doctor.stag = nil
    assert_not @doctor.save
  end


  test "all_sql should return all doctors" do
    assert_equal 0, Doctor.all_sql.count
    @doctor.save
    assert_equal 1, Doctor.all_sql.count
  end


  test "delete_by_id should delete doctor" do
    @doctor.save
    Doctor.delete_by_id(@doctor.id)
    assert_equal 0, Doctor.all_sql.count
  end


end