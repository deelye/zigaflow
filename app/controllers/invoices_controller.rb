class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show]
  before_action :all_customers, only: [:new, :create]

  def index
    @invoices = Invoice.all.sort
  end

  def show
    @net = net(@invoice)
    @due_date = due_date(@invoice)
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @customer = Customer.where("name = ?", invoice_params["customer_id"])
    date = invoice_params["date"]

    @invoice = Invoice.new({ customer_id: @customer[0].id, date: date})
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

  def all_customers
    @customers = Customer.all
  end

  def due_date(invoice)
    return (invoice.date.to_date + 30).strftime("%d-%m-%Y")
  end

end
