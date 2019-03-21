class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end
  def create
    value = params[:sale][:value].to_i
    tax = params[:sale][:tax]
    discount = params[:sale][:discount].to_i
    value_disc = (value * discount)/100
    total = value - value_disc

    if tax == '1'
      total = total * 1.19
      tax = 19
    else
      total = total
      tax = 0
    end
    @sale = Sale.new({
      cod: rand(0..99_000),
      detail: params[:sale][:detail],
      category: params[:sale][:category],
      value: params[:sale][:value],
      discount: discount,
      tax: tax,
      total: total
    })

    @sale.save 
    redirect_to sales_done_path

    def done
      @sale = Sale.all
    end

  end 









  private
  def sale_params
    params.require(:sale).permit(:detail, :category, :value, :discount, :tax)
  end
end








