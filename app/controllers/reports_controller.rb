class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @report = Report.new
  end

  # POST /reports
  # POST /reports.json
  def create
    @flock = Flock.find(report_params[:flock_id])
    @from = report_params[:from_date]
    @to   = report_params[:to_date]
    @runs = Run.where(created_at: @from.to_time.beginning_of_day..@to.to_time.end_of_day, flock: @flock, active: (params[:active]||true))
    render 'flock_report'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:flock_id, :from_date, :to_date, :active)
    end
end
