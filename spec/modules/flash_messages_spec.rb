require "spec_helper"

describe "FlashMessages" do

  let(:dummy_class) { Class.new { include BzCore::FlashMessages } }

  before {
    class << dummy_class

      include BzCore::FlashMessages
      def controller_path
        "discussable/messages"
      end
    end
  }

  describe "common notice" do
    let(:location_created_message) { 'created successfuly!' }
    let(:location_created_entity) { 'Location' }

    it "should return correct flash key and translated message" do
      I18n.stub(:t).with("en.common.flash.create.success") { location_created_message }
      I18n.stub(:t).with("activerecord.models.location") { location_created_entity }

      result = dummy_class.common_notice(:create, :success, :location)
      expect(result.is_a?(Array)).to be_true
      expect(result[0]).to be_eql(location_created_message)
      expect(result[1][:entity]).to be_eql(location_created_entity)
    end
  end

  describe "custom notice" do
    let(:trash_emptied_message) { 'Trash emptied!' }

    it "should return correct flash key and translated message" do
      I18n.stub(:t).with("discussable.messages.trash_emptied") { trash_emptied_message }

      result = dummy_class.custom_notice(:notice, :trash_emptied)
      expect(result.is_a?(Hash)).to be_true
      expect(result[:notice]).to be_eql(trash_emptied_message)
    end
  end
end
