require "test_helper"

class CardPacientTest < ActiveSupport::TestCase
  require 'test_helper'

  class CardPacientTest < ActiveSupport::TestCase
    def setup
      @pacient = Pacient.create(name: "John")
      @clinic = Clinic.create(name: "Test Clinic", address: "123 Main St")
      @card_pacient = CardPacient.new(pacient: @pacient, clinic: @clinic, name: "John's Card")
    end

    test "should be valid" do
      assert @card_pacient.valid?
    end

    test "should belong to a pacient" do
      @card_pacient.pacient = nil
      assert_not @card_pacient.valid?
    end

    test "should belong to a clinic" do
      @card_pacient.clinic = nil
      assert_not @card_pacient.valid?
    end

    test "should have a name" do
      @card_pacient.name = ""
      assert_not @card_pacient.valid?
    end
  end

end
