class ItemsController < ApplicationController
  before_action :set_invoice, only: [:new, :create, :destroy]

  def new
    @products = Product.all
    @item = Item.new
  end

  def create
    @product = Product.find(item_params["product_id"].to_i)
    quantity = item_params["quantity"]

    @item = Item.new({ invoice_id: @invoice.id, product_id: @product.id, quantity: quantity })
    if @item.save
      redirect_to invoice_path(@invoice)
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to invoice_path(@invoice)
  end

  private

  def item_params
    params.require(:item).permit(:product_id, :quantity)
  end

  def set_invoice
    @invoice = Invoice.find(params[:invoice_id])
  end
end
