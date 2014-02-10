require "spec_helper"

describe "FlashMessages" do

  let(:dummy_class) { Class.new { include BzCore::FlashMessages } }

  before {
    class << dummy_class

      include BzCore::FlashMessages
      def controller_path
        "discussable/emails"
      end
    end
  }

  describe "common message" do
    it "should return correct flash key and translated message" do
      result = dummy_class.common_message(:create, :success, :location)
      expect(result).to eq "Location created"
    end
  end

  describe "custom message" do
    it "should return correct flash key and translated message" do
      result = dummy_class.custom_message(:trash_emptied, :success, user: "Jim")
      expect(result).to eq "Trash for Jim emptied"
    end
  end
end
