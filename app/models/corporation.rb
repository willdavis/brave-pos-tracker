class Corporation
  # ActiveModel plumbing to make `form_for` work
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  
  # ActiveModel support
  def persisted?; false; end
  
  ATTRIBUTES = [:id, :name, :ticker, :ceo_name, :alliance_id, :member_count]
  attr_accessor *ATTRIBUTES
  
  def initialize(corp_id)
    
  end
end
