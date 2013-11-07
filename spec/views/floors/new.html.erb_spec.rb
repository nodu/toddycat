require 'spec_helper'

describe "floors/new" do
  before(:each) do
    assign(:floor, stub_model(Floor,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new floor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", floors_path, "post" do
      assert_select "input#floor_name[name=?]", "floor[name]"
    end
  end
end
