class ItemsController < ApplicationController
  before_action :set_invoice, only: [:new, :create, :destroy]

  def new
    @net = net(@invoice)
    @due_date = due_date(@invoice)
    @products = Product.all.sort
    @item = Item.new
  end

  def create
    @product = Product.where("description = ?", item_params["product_id"])
    quantity = item_params["quantity"]

    @item = Item.new({ invoice_id: @invoice.id, product_id: @product[0].id, quantity: quantity })
    if @item.save
      redirect_to new_invoice_item_path(@invoice)
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to new_invoice_item_path(@invoice)
  end

  private

  def item_params
    params.require(:item).permit(:product_id, :quantity)
  end

  def set_invoice
    @invoice = Invoice.find(params[:invoice_id])
  end

  def net(invoice)
    net = 0.00
    invoice.items.each do |item|
      product = Product.find(item.product_id)
      net += item.quantity * product.gross
    end

    return net
  end

  def due_date(invoice)
    return (invoice.date.to_date + 30).strftime("%d-%m-%Y")
  end

end
