class MenusController < ApplicationController
  before_action :set_menu

  def show; end

  def update_image
    menu_param = menu_params.to_h
    food_image = menu_param[:food_image]
    @menu.food_image.attach(food_image)

    redirect_to menu_path, notice: "Food Image Uploaded!"
  end

  private

  def menu_params
    params.require(:menu).permit(:food_image)
  end

  def set_menu
    @menu = Menu.first
  end
end
