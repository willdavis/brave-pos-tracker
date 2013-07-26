class CorporationsController < ApplicationController
  # GET /corporations
  def index
    @corporation_ids = Scouting::ControlTower.uniq.pluck(:corporation_id)

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  # GET /corporations/1
  def show
    @corporation_id = params[:id]
    @control_towers = Scouting::ControlTower.where(:corporation_id => params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end
end
