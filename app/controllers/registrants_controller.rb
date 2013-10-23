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
    registrant = Registrant.create( registrant_params )
    
    if registrant
      head :created
    else
      render json: registrant.errors, status: :unprocessable_entity
    end
  end
  
  def edit
    @registrant = Registrant.find_by(id: params[:id])
  end
  
  def update
    registrant = Registrant.find_by(id: params[:id])
    
    if registrant.update_attributes( registrant_params )
      head :no_content
    else
      render json: registrant.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    Registrant.find_by(id: params[:id]).destroy
    
    redirect_to registrants_url
  end
  
  private
  
  def registrant_params
    params.require(:registrant).permit(
      :id,
      :email,
      :expires_at
    )
  end
end