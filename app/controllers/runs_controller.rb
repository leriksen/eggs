class RunsController < ApplicationController
  before_action :set_run, only: [:show, :edit, :update, :destroy]

  # GET /runs
  # GET /runs.json
  def index
    @runs = Run.all
  end

  # GET /runs/1
  # GET /runs/1.json
  def show
  end

  # GET /runs/new
  def new
    @run = Run.new
  end

  # GET /runs/1/edit
  def edit
  end

  # POST /runs
  # POST /runs.json
  def create
    @run = Run.new(run_params)
    
    @run.delivered ||= 0
    @run.standard  ||= 0
    @run.jumbo     ||= 0
    @run.seconds   ||= 0

    @run.waste = @run.delivered - @run.standard - @run.jumbo - @run.seconds
    
    respond_to do |format|
      if @run.save
        format.html { redirect_to @run, notice: 'Run was successfully created.' }
        format.json { render :show, status: :created, location: @run }
      else
        format.html { render :new }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /runs/1
  # PATCH/PUT /runs/1.json
  def update
    run = {}

    run[:delivered] = (run_params[:delivered_trays].to_i * 36) + run_params[:delivered_singles].to_i
    run[:standard]  = (run_params[:standard_trays].to_i  * 36) + run_params[:standard_singles].to_i
    run[:jumbo]     = (run_params[:jumbo_trays].to_i     * 36) + run_params[:jumbo_singles].to_i
    run[:seconds]   = (run_params[:seconds_trays].to_i   * 36) + run_params[:seconds_singles].to_i

    run[:waste] = run[:delivered] - run[:standard] - run[:jumbo] - run[:seconds]
    
    run[:run_type_id] = run_params[:run_type_id]
    run[:flock_id] = run_params[:flock_id]
    run[:user_id] = run_params[:user_id]
    run[:active] = run_params[:active]

    respond_to do |format|
      if @run.update(run)
        format.html { redirect_to @run, notice: 'Run was successfully updated.' }
        format.json { render :show, status: :ok, location: @run }
      else
        format.html { render :edit }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /runs/1
  # DELETE /runs/1.json
  def destroy
    @run.active = false
  
    respond_to do |format|
      if @run.save
        format.html { redirect_to root_url, notice: 'Run was successfully deactivated.'}
        format.json { head :no_content }
      else
        format.html { render :show }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_run
      @run = Run.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def run_params
      params.require(:run).permit(:delivered_trays,
                                  :delivered_singles,
                                  :standard_trays,
                                  :standard_singles,
                                  :seconds_trays,
                                  :seconds_singles,
                                  :jumbo_trays,
                                  :jumbo_singles,
                                  :run_type_id,
                                  :flock_id,
                                  :user_id,
                                  :run_id,
                                  :active)
    end
end
