class DishesController < AdminController
  before_action :set_dish, only: :destroy
  before_action :set_cafeteria, only: :create

  # POST /dishes
  # POST /dishes.json
  def create
    @dish = @cafeteria.dishes.new(dish_params)

    respond_to do |format|
      if @dish.save
        format.html { redirect_to @cafeteria, notice: 'Dish was successfully created.' }
        format.json { render :show, status: :created, location: @dish }
      else
        format.html { redirect_to @cafeteria, alert: 'Could not create dish' }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dishes/1
  # DELETE /dishes/1.json
  def destroy
    @dish.destroy
    respond_to do |format|
      format.html { redirect_to dishes_url, notice: 'Dish was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    def set_cafeteria
      @cafeteria = Cafeteria.find(params[:cafeteria_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_params
      params.require(:dish).permit(:name, :cafeteria_id)
    end
end
