class ReinforcementTimersController < ApplicationController
  # GET /reinforcement_timers
  # GET /reinforcement_timers.json
  def index
    @reinforcement_timers = ReinforcementTimer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reinforcement_timers }
    end
  end

  # GET /reinforcement_timers/1
  # GET /reinforcement_timers/1.json
  def show
    @reinforcement_timer = ReinforcementTimer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reinforcement_timer }
    end
  end

  # GET /reinforcement_timers/new
  # GET /reinforcement_timers/new.json
  def new
    @reinforcement_timer = ReinforcementTimer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reinforcement_timer }
    end
  end

  # GET /reinforcement_timers/1/edit
  def edit
    @reinforcement_timer = ReinforcementTimer.find(params[:id])
  end

  # POST /reinforcement_timers
  # POST /reinforcement_timers.json
  def create
    @reinforcement_timer = ReinforcementTimer.new(params[:reinforcement_timer])

    respond_to do |format|
      if @reinforcement_timer.save
        format.html { redirect_to @reinforcement_timer, notice: 'Reinforcement timer was successfully created.' }
        format.json { render json: @reinforcement_timer, status: :created, location: @reinforcement_timer }
      else
        format.html { render action: "new" }
        format.json { render json: @reinforcement_timer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reinforcement_timers/1
  # PUT /reinforcement_timers/1.json
  def update
    @reinforcement_timer = ReinforcementTimer.find(params[:id])

    respond_to do |format|
      if @reinforcement_timer.update_attributes(params[:reinforcement_timer])
        format.html { redirect_to @reinforcement_timer, notice: 'Reinforcement timer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reinforcement_timer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reinforcement_timers/1
  # DELETE /reinforcement_timers/1.json
  def destroy
    @reinforcement_timer = ReinforcementTimer.find(params[:id])
    @reinforcement_timer.destroy

    respond_to do |format|
      format.html { redirect_to reinforcement_timers_url }
      format.json { head :no_content }
    end
  end
end
