require 'spec_helper'

describe "floors/index" do
  before(:each) do
    assign(:floors, [
      stub_model(Floor,
        :name => "Name"
      ),
      stub_model(Floor,
        :name => "Name"
      )
    ])
  end

  it "renders a list of floors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
