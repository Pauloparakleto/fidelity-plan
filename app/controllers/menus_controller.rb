class MenusController < ApplicationController
  before_action :set_menu

  def show; end

  private

  def set_menu
    @menu = Menu.first
  end
end
