class ItemsController < ApplicationController
  def new
    @invoice = Invoice.find(params[:invoice_id])
    @products = Product.all
    @item = Item.new
  end

  def create
    @invoice = Invoice.find(params[:invoice_id])
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
    @invoice = Invoice.find(params[:invoice_id])
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to invoice_path(@invoice)
  end

  private

  def item_params
    params.require(:item).permit(:product_id, :quantity)
  end
end
