require 'spec_helper'

describe "floors/show" do
  before(:each) do
    @floor = assign(:floor, stub_model(Floor,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
