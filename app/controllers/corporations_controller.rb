class CorporationsController < ApplicationController
  # GET /corporations
  def index
    @corporations = []
    
    corporation_ids = Scouting::ControlTower.uniq.pluck(:corporation_id)
    corporation_ids.each do |id|
      @corporations.push(Corporation.new(id))
    end

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  # GET /corporations/1
  def show
    @corporation = Corporation.new(params[:id])
    @control_towers = Scouting::ControlTower.where(:corporation_id => params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end
end
