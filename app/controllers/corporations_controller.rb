class CorporationsController < ApplicationController
  def show
    # GET /corporations/1
    def show
      @corporation = Corporation.new(params[:id])
      @control_towers = Scouting::ControlTower.where(:corporation_id => params[:id])

      respond_to do |format|
        format.html # show.html.erb
      end
    end
  end
end
