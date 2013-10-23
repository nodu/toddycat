class RegistrantsController < ApplicationController
  def index
    @registrants = Registrant.all.entries
  end
  
  def show
    @registrant = Registrant.find_by(id: params[:id])
  end
  
  def new
    @registrant = Registrant.new
  end
  
  def create
    @registrant = Registrant.new( registrant_params )
    @registrant.id = SecureRandom.urlsafe_base64
    
    if @registrant.save
      redirect_to registrant_url(@registrant)
    else
      render :new, error: "This thing won't save!"
    end
  end
  
  def edit
    @registrant = Registrant.find_by(id: params[:id])
  end
  
  def update
    @registrant = Registrant.find_by(id: params[:id])
    
    if @registrant.update_attributes( registrant_params )
      redirect_to registrant_url(@registrant)
    else
      render :edit, error: "Can't do no update!"
    end
  end
  
  def destroy
    Registrant.find_by(id: params[:id]).destroy
    
    redirect_to registrants_url
  end
  
  private
  
  def registrant_params
    params.require(:registrant).permit( :email )
  end
end