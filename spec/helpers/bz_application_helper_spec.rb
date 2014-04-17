require "spec_helper"

describe BzApplicationHelper do
  describe "#nav_item" do
    let(:result) { helper.nav_item("Foo", "/foo", activator).include?("active") }

    context "When providing string" do
      let(:activator) { "controller_foo" }

      context "When path starts with activator" do
        before { controller.request.path = "#{activator}_moo" }

        it "Then active" do
          expect(result).to be_true
        end
      end

      context "When controller name mathes" do
        before { controller.stub(:controller_name).and_return(activator) }

        it "Then active" do
          expect(result).to be_true
        end
      end

      it "No matches - not active" do
        expect(result).to be_false
      end
    end

    context "When providing regexp" do
      let(:activator) { /controller_foo/ }

      context "When path matches activator" do
        before { controller.request.path = "aa/#{activator}/bb" }

        it "Then active" do
          expect(result).to be_true
        end
      end

      it "No matches - not active" do
        expect(result).to be_false
      end
    end

    context "When providing hash" do
      let(:activator) do
        { controller_foo: 'index' }
      end

      context "When defined active_nav in activator" do
        let(:activator) do
          { active_nav: active_nav }
        end
        let(:active_nav) { :foos }
        let(:controller_active_nav) { :bars }

        before { helper.stub(:active_nav).and_return controller_active_nav }

        context "When controller active_nav equals to activator active_nav value" do
          let(:controller_active_nav) { active_nav }

          it "Then active" do
            expect(result).to be_true
          end
        end

        it "No matches - not active" do
          expect(result).to be_false
        end
      end

      context "When matches controller#action" do
        before do
          controller.stub(:controller_name).and_return("controller_foo")
          controller.stub(:action_name).and_return("index")
        end

        it "Then active" do
          expect(result).to be_true
        end
      end

      context "When controller action is 'all_actions'" do
        let(:activator) do
          {
            controller_foo: :all_actions,
            controller_bar: "index"
          }
        end

        before do
          controller.stub(:controller_name).and_return("controller_foo")
          controller.stub(:action_name).and_return("index")
        end

        it "Then active" do
          expect(result).to be_true
        end
      end

      it "No matches - not active" do
        expect(result).to be_false
      end
    end

    context "When providing array" do
      let(:activator) { %w(controller_foo controller_bar) }
      before { controller.stub(:controller_name).and_return("controller_aaa") }

      context "When controller name is in array" do
        before { controller.stub(:controller_name).and_return("controller_foo") }

        it "Then active" do
          expect(result).to be_true
        end
      end

      it "No matches - not active" do
        expect(result).to be_false
      end
    end
  end
end
