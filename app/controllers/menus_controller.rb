class MenusController < AdminController
  before_action :set_menu, only: [:show, :edit, :update, :destroy, :link_dish]

  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.where(cafeteria_id: params[:cafeteria_id])
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @menu = Menu.new(cafeteria: Cafeteria.find(params[:cafeteria_id]))
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params.merge({cafeteria_id: params[:cafeteria_id]}))

    respond_to do |format|
      if @menu.save
        format.html { redirect_to cafeteria_menus_url(@menu.cafeteria), notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to cafeteria_url(@menu.cafeteria), notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to cafeteria_url(@menu.cafeteria), notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def link_dish
    if params[:dish][:name]
      @menu.create_or_link_dish(params[:dish][:name])
      respond_to do |f|
        f.html { redirect_to edit_cafeteria_menu_url(@menu.cafeteria, @menu), notice: 'Se añadió el plato al menú.' }
        # TODO: JSON
      end
    else
      respond_to do |f|
        f.html { redirect_to edit_cafeteria_menu_url(@menu.cafeteria, @menu), error: 'No se pudo añadir el plato.' }
      end
    end
  end

  def unlink_dish
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
    @menu = Menu.find_by(id: params[:id], cafeteria_id: params[:cafeteria_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:served_at, :meal)
    end
end
