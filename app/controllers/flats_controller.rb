class FlatsController < ApplicationController
  before_action :set_floor
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  # GET /flats
  def index
    #limit the index to floor flats
    @flats = @floor.flats
    #current_user.floors  #kinda security features so the current user can only see the floors belinging to him
  end

  # GET /flats/1
  def show
  end

  # GET /flats/new
  def new
    @flat = Flat.new
  end

  # GET /flats/1/edit
  def edit
  end

  # POST /flats
  def create
    @flat = Flat.new(flat_params)

    if @flat.save
      redirect_to floor_flats_path(@floor), notice: 'Flat was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /flats/1
  def update
    if @flat.update(flat_params)
      redirect_to floor_flats_path(@floor), notice: 'Flat was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /flats/1
  def destroy
    @flat.destroy
    redirect_to floor_flats_path(@floor), notice: 'Flat was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flat
      #limits the flat based on the floor
      @flat = @floor.flats.find(params[:id])
    end

    def set_floor
      @floor = Floor.find(params[:floor_id])
    end

    # Only allow a trusted parameter "white list" through.
    def flat_params
      params.require(:flat).permit(:floor_id, :name)
    end
end
