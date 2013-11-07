require "spec_helper"

describe RegistrationController do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
  
  describe "POST #create" do
    def submit_create
      post :create, { user: {email: "1234@example.com", name: "123", password: "12345678", password_confirmation: "12345678" }}
    end
    
    it "responds successfully with an HTTP 200 status code" do
      submit_create
      
      expect(response).to redirect_to login_url
      expect(response.status).to eq(302)
    end
    
    it "should create a User" do
      expect{submit_create}.to change{User.count}.from(0).to(1)
    end    
  end
  
end