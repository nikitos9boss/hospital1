require "test_helper"


class ClinicTest < ActiveSupport::TestCase
    test "should not save Clinic without name" do
      clinic = Clinic.new(address: "123 Main St")
      assert_not clinic.save, "Saved Clinic without a name"
    end

    test "should not save Clinic without address" do
      clinic = Clinic.new(name: "Test Clinic")
      assert_not clinic.save, "Saved Clinic without an address"
    end

    test "should save Clinic with name and address" do
      clinic = Clinic.new(name: "Test Clinic", address: "123 Main St")
      assert clinic.save, "Could not save valid Clinic"
    end
end
