class Scouting::ControlTowersController < ApplicationController
  # GET /scouting/control_towers
  # GET /scouting/control_towers.json
  def index
    @scouting_control_towers = Scouting::ControlTower.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scouting_control_towers }
    end
  end

  # GET /scouting/control_towers/1
  # GET /scouting/control_towers/1.json
  def show
    @scouting_control_tower = Scouting::ControlTower.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scouting_control_tower }
    end
  end

  # GET /scouting/control_towers/new
  # GET /scouting/control_towers/new.json
  def new
    @scouting_control_tower = Scouting::ControlTower.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scouting_control_tower }
    end
  end

  # GET /scouting/control_towers/1/edit
  def edit
    @scouting_control_tower = Scouting::ControlTower.find(params[:id])
  end

  # POST /scouting/control_towers
  # POST /scouting/control_towers.json
  def create
    @scouting_control_tower = Scouting::ControlTower.new(params[:scouting_control_tower])

    respond_to do |format|
      if @scouting_control_tower.save
        format.html { redirect_to @scouting_control_tower, notice: 'Control tower was successfully created.' }
        format.json { render json: @scouting_control_tower, status: :created, location: @scouting_control_tower }
      else
        format.html { render action: "new" }
        format.json { render json: @scouting_control_tower.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /scouting/control_towers/1
  # PUT /scouting/control_towers/1.json
  def update
    @scouting_control_tower = Scouting::ControlTower.find(params[:id])

    respond_to do |format|
      if @scouting_control_tower.update_attributes(params[:scouting_control_tower])
        format.html { redirect_to @scouting_control_tower, notice: 'Control tower was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scouting_control_tower.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scouting/control_towers/1
  # DELETE /scouting/control_towers/1.json
  def destroy
    @scouting_control_tower = Scouting::ControlTower.find(params[:id])
    @scouting_control_tower.destroy

    respond_to do |format|
      format.html { redirect_to scouting_control_towers_url }
      format.json { head :no_content }
    end
  end
end
