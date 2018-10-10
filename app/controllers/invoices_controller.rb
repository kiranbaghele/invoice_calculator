class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all

  end

  def show
    @invoice = Invoice.find_by(id: params[:id])

  end

  def new
    @invoice = Invoice.new
    @products = Product.all
    @invoice.initialize_nested_attributes
  end

  def create
    invoice_count = Invoice.count
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      @invoice.update(invoice_id: "INV-ID-"+invoice_count.to_s)

      redirect_to invoices_path
    else
      render 'new'
    end
  end

  def edit
    @invoice = Invoice.find_by(id: params[:id])
    @products = Product.all
  end

  def update
    @invoice = Invoice.find_by(id: params[:id])
    if @invoice.update(invoice_params)
      redirect_to invoices_path
    else
      render 'edit'
    end
  end


  def destroy
    @invoice = Invoice.find_by(id: params[:id])
    if @invoice.delete

      redirect_to invoices_path
    else
      render @invoice
    end
  end

  private
  def invoice_params
    params.require(:invoice).permit!
  end
end
