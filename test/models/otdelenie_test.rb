require 'test_helper'

class OtdelenieTest < ActiveSupport::TestCase
  def setup
    @clinics = ActiveRecord::FixtureSet.create_fixtures("test/fixtures", "clinics")
  end

  test "should not save otdelenie without name" do
    otdelenie = Otdelenie.new
    assert_not otdelenie.save, "Saved the otdelenie without a name"
  end


  test "should belong to doctor" do
    otdelenie = Otdelenie.new(name: "Test Otdelenie")
    doctor = Doctor.new(name: "Test Doctor", otdelenie: otdelenie)
    assert_equal doctor.otdelenie, otdelenie
  end
end
