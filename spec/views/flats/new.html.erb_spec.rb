require 'spec_helper'

describe "flats/new" do
  before(:each) do
    assign(:flat, stub_model(Flat,
      :floor_id => 1,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new flat form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", flats_path, "post" do
      assert_select "input#flat_floor_id[name=?]", "flat[floor_id]"
      assert_select "input#flat_name[name=?]", "flat[name]"
    end
  end
end
