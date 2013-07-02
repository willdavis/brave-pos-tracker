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
    begin
      corp = Nokogiri::XML(open("https://api.eveonline.com/corp/CorporationSheet.xml.aspx?corporationID=#{corp_id}"))
    
      ATTRIBUTES.each do |attribute|
        send("#{attribute}=", corp.xpath("//result/#{attribute}"))
      end
    rescue OpenURI::HTTPError => error
      puts "Invalid corporation id.  Unable to parse eve api response.\nError:#{error}"
      false
    end
  end
  
  def id
    corporationID.nil? ? -1 : corporationID.text.to_i
  end
  
  def ceo_id
    ceoID.nil? ? -1 : ceoID.text.to_i
  end
  
  def alliance_id
    allianceID.nil? ? -1 : allianceID.text.to_i
  end
  
  def name
    corporationName.nil? ? nil : corporationName.text
  end
  
  def ticker_symbol
    ticker.nil? ? nil : ticker.text
  end
  
  def ceo_name
    ceoName.nil? ? nil : ceoName.text
  end
  
  def alliance_name
    allianceName.nil? ? nil : allianceName.text
  end
  
  def member_count
    memberCount.nil? ? nil : memberCount.text.to_i
  end
end
