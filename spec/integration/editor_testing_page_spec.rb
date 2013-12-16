require "spec_helper"

feature "Testing Page Loads Properly" do

  before :each do
    visit "/"
  end

  it "loads the page" do
    expect(page.status_code).to be(200)
  end

  ["primary", "secondary"].each do |sandbox_name|
    it "has the #{sandbox_name} sandbox" do
      expect(!!page.find("#sandbox-#{sandbox_name}")).to be_true
    end
  end
end
