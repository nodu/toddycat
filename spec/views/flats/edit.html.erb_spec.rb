require 'spec_helper'

describe "flats/edit" do
  before(:each) do
    @flat = assign(:flat, stub_model(Flat,
      :floor_id => 1,
      :name => "MyString"
    ))
  end

  it "renders the edit flat form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", flat_path(@flat), "post" do
      assert_select "input#flat_floor_id[name=?]", "flat[floor_id]"
      assert_select "input#flat_name[name=?]", "flat[name]"
    end
  end
end
