class RunTypesController < ApplicationController
  before_action :set_run_type, only: [:show, :edit, :update, :destroy]

  # GET /run_types
  # GET /run_types.json
  def index
    @run_types = RunType.all
  end

  # GET /run_types/1
  # GET /run_types/1.json
  def show
  end

  # GET /run_types/new
  def new
    @run_type = RunType.new
  end

  # GET /run_types/1/edit
  def edit
  end

  # POST /run_types
  # POST /run_types.json
  def create
    @run_type = RunType.new(run_type_params)

    respond_to do |format|
      if @run_type.save
        format.html { redirect_to @run_type, notice: 'Run type was successfully created.' }
        format.json { render :show, status: :created, location: @run_type }
      else
        format.html { render :new }
        format.json { render json: @run_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /run_types/1
  # PATCH/PUT /run_types/1.json
  def update
    respond_to do |format|
      if @run_type.update(run_type_params)
        format.html { redirect_to @run_type, notice: 'Run type was successfully updated.' }
        format.json { render :show, status: :ok, location: @run_type }
      else
        format.html { render :edit }
        format.json { render json: @run_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /run_types/1
  # DELETE /run_types/1.json
  def destroy
    @run_type.destroy
    respond_to do |format|
      format.html { redirect_to run_types_url, notice: 'Run type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy
    @run_type.active = false
  
    respond_to do |format|
      if @run_type.save

        format.html { redirect_to root_url, notice: 'Run Type was successfully deactivated.'}
        format.json { head :no_content }
      else
        format.html { render :show }
        format.json { render json: @run_type.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_run_type
      @run_type = RunType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def run_type_params
      params.require(:run_type).permit(:type, :active)
    end
end
