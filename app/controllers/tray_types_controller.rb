class TrayTypesController < ApplicationController
  before_action :set_tray_type, only: [:show, :edit, :update, :destroy]

  # GET /tray_types
  # GET /tray_types.json
  def index
    @tray_types = TrayType.all
  end

  # GET /tray_types/1
  # GET /tray_types/1.json
  def show
  end

  # GET /tray_types/new
  def new
    @tray_type = TrayType.new
  end

  # GET /tray_types/1/edit
  def edit
  end

  # POST /tray_types
  # POST /tray_types.json
  def create
    @tray_type = TrayType.new(tray_type_params)

    respond_to do |format|
      if @tray_type.save
        format.html { redirect_to @tray_type, notice: 'Tray type was successfully created.' }
        format.json { render :show, status: :created, location: @tray_type }
      else
        format.html { render :new }
        format.json { render json: @tray_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tray_types/1
  # PATCH/PUT /tray_types/1.json
  def update
    respond_to do |format|
      if @tray_type.update(tray_type_params)
        format.html { redirect_to @tray_type, notice: 'Tray type was successfully updated.' }
        format.json { render :show, status: :ok, location: @tray_type }
      else
        format.html { render :edit }
        format.json { render json: @tray_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tray_types/1
  # DELETE /tray_types/1.json
  def destroy
    @tray_type.destroy
    respond_to do |format|
      format.html { redirect_to tray_types_url, notice: 'Tray type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tray_type
      @tray_type = TrayType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tray_type_params
      params.require(:tray_type).permit(:type)
    end
end
