require 'open-uri'

class Corporation
  # ActiveModel plumbing to make `form_for` work
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  
  # ActiveModel support
  def persisted?; false; end
  
  ATTRIBUTES = [:corporationID, :corporationName, :ticker, :ceoID, :ceoName, :allianceID, :allianceName, :memberCount]
  attr_accessor *ATTRIBUTES
  
  def initialize(corp_id)
    corp = Nokogiri::XML(open("https://api.eveonline.com/corp/CorporationSheet.xml.aspx?corporationID=#{corp_id}"))
    
    ATTRIBUTES.each do |attribute|
      send("#{attribute}=", corp.xpath("//result/#{attribute}"))
    end
  end
end
