class Scouting::ReportWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker
  
  def perform(id, dscan_data, probe_data)
    parse_dscan_results(dscan_data)
    parse_probe_results(probe_data)
    
    if create_objects
      report = Scouting::Report.find(id)
      report.control_towers << control_towers
    else
      raise "unable to save control towers"
    end
  end
  
  private
  
  def control_towers
    @control_towers ||= []
  end
  
  def moons
    @moons ||= []
  end
  
  def parse_dscan_results(dscan_data)
    CSV.parse(dscan_data, options = { :col_sep => "\t" }) do |row|
      object_name = row[0]
      object_group = row[1]
      object_distance = row[2]
      
      analyze_moon(object_name, object_distance) if object_group.match(/\AMoon\Z/) and object_distance.match(/AU/).nil?
    end
  end
  
  def parse_probe_results(probe_data)
    towers = []
    structures = []
    CSV.parse(probe_data, options = { :col_sep => "\t" }) do |row|
      object_category = row[1]
      object_group = row[2]
      object_name = row[3]
      object_distance = row[5]
      
      towers.push(analyze_control_tower(object_name, object_distance)) if object_group.match(/Control Tower/) and object_distance.match(/AU/).nil?
      structures.push(analyze_structure(object_name, object_distance)) if object_category.match(/Structure/) and object_group.match(/Control Tower/).nil? and object_distance.match(/AU/).nil?
    end
    
    #build control towers
    towers.each do |tower|
      moons.each do |moon|
        if tower["distance"].between?(moon["distance"]-10000,moon["distance"]+10000)
          tower["moon_id"] = moon["id"]
          control_towers.push(build_control_tower(tower, moon))
        end
      end
    end
    
    #attach structures to control towers
    structures.each do |structure|
      towers.each do |tower|
        if structure["distance"].between?(tower["distance"]-1000,tower["distance"]+1000) and !tower["moon_id"].nil?
          control_tower = control_towers.select{ |tower| tower.moon_id == tower["moon_id"] }.first
          control_tower.structure_ids.nil? ? control_tower.structure_ids = structure["id"].to_s : control_tower.structure_ids << ",#{structure["id"]}"
        end
      end
    end
  end
  
  def analyze_moon(name, distance)
    puts "Moon detected!"
    
    #convert from "X,YYY,ZZZ km" to XYYYZZZ
    number = distance.gsub(/[^0-9]/,'').to_i
    
    url_safe_moon_name = name.gsub(/ /,'%20')
    moon = JSON.parse(open("http://evedata.herokuapp.com/celestials?name=#{url_safe_moon_name}").read).first
    moon["distance"] = number
    
    puts moon
    moons.push(moon)
  end
  
  def analyze_control_tower(name, distance)
    puts "Control Tower detected!"
    
    #convert from "X,YYY,ZZZ km" to XYYYZZZ
    number = distance.gsub(/[^0-9]/,'').to_i
    
    url_safe_tower_name = name.gsub(/ /,'%20')
    tower = JSON.parse(open("http://evedata.herokuapp.com/control_towers?name=#{url_safe_tower_name}").read).first
    tower["distance"] = number
    
    puts tower
    tower
  end
  
  def analyze_structure(name, distance)
    puts "Structure detected!"
    
    #convert from "X,YYY,ZZZ km" to XYYYZZZ
    number = distance.gsub(/[^0-9]/,'').to_i
    
    url_safe_name = name.gsub(/ /,'%20')
    structure = JSON.parse(open("http://evedata.herokuapp.com/structures?name=#{url_safe_name}").read).first
    structure["distance"] = number
    
    puts structure
    structure
  end

  def create_objects
    ActiveRecord::Base.transaction do
      control_towers.each do |tower|
        tower.save!
      end
    end
  rescue
    false
  end
  
  def build_control_tower(tower, moon)
    Scouting::ControlTower.where(:moon_id => moon["id"]).first_or_initialize(
      :control_tower_type_name => tower["name"],
      :control_tower_type_id => tower["id"],
      :moon_name => moon["name"],
      :region_id => moon["region_id"],
      :constellation_id => moon["constellation_id"],
      :solar_system_id => moon["solar_system_id"],
    )
  end
end
