class DrinksController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_new_drink, only: %i[create]
  before_action :set_drink, only: %i[show edit update destroy]

  def index
    @drinks = Drink.all
  end

  def show; end

  def new
    @drink = Drink.new
  end

  def edit; end

  def create
    if @drink.save
      redirect_to @drink, notice: "Drink was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @drink.update(drink_params)
      redirect_to @drink, notice: "Drink was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @drink.destroy
    redirect_to drinks_url, notice: "Drink was successfully destroyed."
  end

  private

  def set_new_drink
    @drink = Drink.new(drink_params)
  end

  def set_drink
    @drink = Drink.find(params[:id])
  end

  def drink_params
    params.require(:drink).permit(:name, :price)
  end
end
