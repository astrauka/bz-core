require "spec_helper"

describe "Basic Layout" do
  it "gets rendered" do
    visit basic_layout_home_path
    expect_to_see "Basic Layout"
  end
end
