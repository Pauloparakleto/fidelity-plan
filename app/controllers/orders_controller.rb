class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]
  before_action :build_order, only: :create

  def index
    @orders = Order.all
  end

  def show; end

  def new
    @order = Order.new
    @food = Food.all
    @food.each do |food|
      @order.items.build({ name: food.name, price: food.price })
    end
  end

  def edit; end

  def create
    if @order.save
      redirect_to @order, notice: "Order was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: "Order was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: "Order was successfully destroyed."
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def build_order
    @order = Order.new(order_params)
  end

  def order_params
    params.require(:order).permit(:user_id, items_attributes: [:id, :name, :quantity, :price])
  end
end
