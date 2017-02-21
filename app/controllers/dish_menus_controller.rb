class DishMenusController < ApplicationController
  before_action :set_dish_menu, only: [:destroy]
  # POST /dish_menus
  # POST /dish_menus.json
  def create
    @menu = Menu.find(params[:menu_id])
    @dish_menu = @menu.dish_menus.new(dish_menu_params)

    respond_to do |format|
      if @dish_menu.save
        format.html { redirect_to edit_cafeteria_menu_url(@menu.cafeteria, @menu), notice: 'Dish menu was successfully created.' }
        format.json { render :show, status: :created, location: @dish_menu }
      else
        format.html { redirect_to edit_cafeteria_menu_url(@menu.cafeteria, @menu), alert: 'No se pudo crear el menú' }
        format.json { render json: @dish_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dish_menus/1
  # DELETE /dish_menus/1.json
  def destroy
    @dish_menu.destroy
    respond_to do |format|
      format.html { redirect_to edit_cafeteria_menu_path(@dish_menu.menu.cafeteria, @dish_menu.menu), notice: 'Dish menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish_menu
      @dish_menu = DishMenu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_menu_params
      params.require(:dish_menu).permit(:dish_id, :course)
    end
end
