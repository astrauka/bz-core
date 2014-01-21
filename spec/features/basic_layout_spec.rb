require "spec_helper"

describe "Basic Layout" do
  it "gets rendered" do
    visit basic_layout_home_path
    expect_to_see "Basic Layout"
  end

  it "loads application specific javascript", js: true do
    visit basic_layout_home_path
    within "p.basic" do
      expect_to_see "js works"
    end

    within "body" do
      expect_to_see "initialization js loaded"
    end

    within "body" do
      expect_to_see "home controller action loaded"
    end
  end
end
