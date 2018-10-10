class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :cost_price, type: Float
  field :discount, type: Float
  field :gst, type: Integer
  field :total_price, type: Float

end
