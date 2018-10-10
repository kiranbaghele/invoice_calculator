class DashboardsController < ApplicationController
  def index
    @product_count = Product.count
    @invoice_count = Invoice.count

  end
end
