class Scouting::ReportsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  # GET /scouting/reports
  # GET /scouting/reports.json
  def index
    @published_reports = Scouting::Report.where(:published => true)
    @draft_reports = Scouting::Report.where(:published => false, :user_id => current_user.id)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /scouting/reports/1
  # GET /scouting/reports/1.json
  def show
    @scouting_report = Scouting::Report.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scouting_report }
    end
  end

  # GET /scouting/reports/new
  # GET /scouting/reports/new.json
  def new
    @scouting_report = Forms::ReportAnalysis.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scouting_report }
    end
  end

  # GET /scouting/reports/1/edit
  def edit
    @scouting_report = Scouting::Report.find(params[:id])
  end
  
  # GET /scouting/reports/1/draft
  def draft
    @scouting_report = Scouting::Report.find(params[:id])
  end
  
  # PUT /scouting/reports/1/publish
  def publish
    @scouting_report = Scouting::Report.find(params[:id])
    @scouting_report.published = true
    
    respond_to do |format|
      if @scouting_report.save
        format.html { redirect_to @scouting_report, notice: 'Report was successfully published.' }
      else
        format.html { render action: "draft" }
      end
    end
  end

  # POST /scouting/reports
  # POST /scouting/reports.json
  def create
    @analyzed = Forms::ReportAnalysis.new(params[:scouting_report])

    respond_to do |format|
      if @analyzed.save
        format.html { redirect_to draft_scouting_report_path(@analyzed.report), notice: 'Report has been analyzed.' }
        format.json { render json: @analyzed, status: :created, location: @analyzed }
      else
        format.html { render action: "new" }
        format.json { render json: @analyzed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /scouting/reports/1
  # PUT /scouting/reports/1.json
  def update
    @scouting_report = Scouting::Report.find(params[:id])

    respond_to do |format|
      if @scouting_report.update_attributes(params[:scouting_report])
        format.html { redirect_to @scouting_report, notice: 'Report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scouting_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scouting/reports/1
  # DELETE /scouting/reports/1.json
  def destroy
    @scouting_report = Scouting::Report.find(params[:id])
    @scouting_report.destroy

    respond_to do |format|
      format.html { redirect_to scouting_reports_url }
      format.json { head :no_content }
    end
  end
end
