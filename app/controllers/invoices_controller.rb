class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show]

  def index
    @invoices = Invoice.all.sort
  end

  def show
    @net = net(@invoice)
  end

  def new
    @customers = Customer.all
    @invoice = Invoice.new
  end

  def create
    @customer = Customer.find(invoice_params["customer_id"].to_i)
    date = invoice_params["date"]

    @invoice = Invoice.new({ customer_id: @customer.id, date: date})
    if @invoice.save
      redirect_to invoice_path(@invoice)
    else
      render :new
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:customer_id, :date)
  end

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def net(invoice)
    net = 0.00
    invoice.items.each do |item|
      product = Product.find(item.product_id)
      net += item.quantity * product.gross
    end

    return net
  end

end
