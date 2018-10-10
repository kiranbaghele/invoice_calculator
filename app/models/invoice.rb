class Invoice
  include Mongoid::Document
  include Mongoid::Timestamps

  field :invoice_id, type: String
  field :mop, type: String
  field :amount, type: Float

  embeds_many :invoice_product, class_name: "InvoiceProduct"
  accepts_nested_attributes_for :invoice_product, reject_if: proc { |attributes| attributes['name'].blank? }, allow_destroy: true #products

  def initialize_nested_attributes
    1.times do
      self.invoice_product.build
    end
  end

end
