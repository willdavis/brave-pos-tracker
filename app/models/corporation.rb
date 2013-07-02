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
  
  def id
    return corporationID.text.to_i
  end
  
  def ceo_id
    return ceoID.text.to_i
  end
  
  def alliance_id
    return allianceID.text.to_i
  end
  
  def name
    return  corporationName.text
  end
  
  def ticker_symbol
    return ticker.text
  end
  
  def ceo_name
    return ceoName.text
  end
  
  def alliance_name
    return allianceName.text
  end
  
  def member_count
    return memberCount.text.to_i
  end
end
