class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
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

end
