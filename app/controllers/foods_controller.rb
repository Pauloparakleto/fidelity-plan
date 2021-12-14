class FoodsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_new_food, only: %i[create]
  before_action :set_food, only: %i[show edit update destroy]

  def index
    @foods = Food.all
  end

  def show; end

  def new
    @food = Food.new
  end

  def edit; end

  def create
    if @food.save
      redirect_to @food, notice: "Food was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @food.update(food_params)
      redirect_to @food, notice: "Food was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @food.destroy
    redirect_to foods_url, notice: "Food was successfully destroyed."
  end

  private

  def set_new_food
    @food = Food.new(food_params)
  end

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :description, :price)
  end
end
