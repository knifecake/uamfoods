class MenusController < AdminController
  before_action :set_cafeteria, except: [:edit]
  before_action :set_menu, only: [:show, :update, :destroy]

  # GET /menus/new
  def new
    @menu = Menu.new(cafeteria: Cafeteria.find(params[:cafeteria_id]))
  end

  # GET /menus/1/edit
  def edit
    @cafeteria = Cafeteria.includes(:dishes).find(params[:cafeteria_id])
    @menu = @cafeteria.menus.includes(:dishes).find(params[:id])
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = @cafeteria.menus.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to edit_cafeteria_menu_url(@cafeteria, @menu), notice: 'Menu was successfully created.' }
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
        format.html { redirect_to cafeteria_url(@cafeteria), notice: 'Menu was successfully updated.' }
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
      format.html { redirect_to cafeteria_url(@cafeteria), notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_cafeteria
      @cafeteria = Cafeteria.find(params[:cafeteria_id])
    end

    def set_menu
      @menu = @cafeteria.menus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:served_at, :meal)
    end
end
