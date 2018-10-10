class InvoiceProduct
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include Mongoid::Timestamps

  field :name, type: String
  field :cost_price, type: Float
  field :discount, type: Float
  field :gst, type: Integer
  field :total_price, type: Float
  field :quantity, type: Integer
  field :product_id, type: BSON::ObjectId

  embedded_in :invoice, class_name: "Invoice"

end
