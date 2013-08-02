class ControlTowersController < ApplicationController
  # GET /control_towers
  # GET /control_towers.json
  def index
    @control_towers = ControlTower.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @control_towers }
    end
  end

  # GET /control_towers/1
  # GET /control_towers/1.json
  def show
    @control_tower = ControlTower.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @control_tower }
    end
  end

  # GET /control_towers/new
  # GET /control_towers/new.json
  def new
    @control_tower = ControlTower.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @control_tower }
    end
  end

  # GET /control_towers/1/edit
  def edit
    @control_tower = ControlTower.find(params[:id])
  end

  # POST /control_towers
  # POST /control_towers.json
  def create
    @control_tower = ControlTower.new(params[:control_tower])

    respond_to do |format|
      if @control_tower.save
        format.html { redirect_to @control_tower, notice: 'Control tower was successfully created.' }
        format.json { render json: @control_tower, status: :created, location: @control_tower }
      else
        format.html { render action: "new" }
        format.json { render json: @control_tower.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /control_towers/1
  # PUT /control_towers/1.json
  def update
    @control_tower = ControlTower.find(params[:id])

    respond_to do |format|
      if @control_tower.update_attributes(params[:control_tower])
        format.html { redirect_to @control_tower, notice: 'Control tower was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @control_tower.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /control_towers/1
  # DELETE /control_towers/1.json
  def destroy
    @control_tower = ControlTower.find(params[:id])
    @control_tower.destroy

    respond_to do |format|
      format.html { redirect_to control_towers_url }
      format.json { head :no_content }
    end
  end
end
