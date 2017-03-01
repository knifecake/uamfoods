class CafeteriasController < AdminController
  before_action :set_cafeteria, only: [:show, :edit, :update, :destroy]

  # GET /cafeterias
  # GET /cafeterias.json
  def index
    @cafeterias = Cafeteria.all
  end

  # GET /cafeterias/1
  # GET /cafeterias/1.json
  def show
  end

  # GET /cafeterias/new
  def new
    @cafeteria = Cafeteria.new
  end

  # GET /cafeterias/1/edit
  def edit
  end

  # POST /cafeterias
  # POST /cafeterias.json
  def create
    @cafeteria = Cafeteria.new(cafeteria_params)

    respond_to do |format|
      if @cafeteria.save
        format.html { redirect_to @cafeteria, notice: 'La cafetería se ha creado.' }
        format.json { render :show, status: :created, location: @cafeteria }
      else
        format.html { render :new }
        format.json { render json: @cafeteria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cafeterias/1
  # PATCH/PUT /cafeterias/1.json
  def update
    respond_to do |format|
      if @cafeteria.update(cafeteria_params)
        format.html { redirect_to @cafeteria, notice: 'La cafetería se ha actualizado.' }
        format.json { render :show, status: :ok, location: @cafeteria }
      else
        format.html { render :edit }
        format.json { render json: @cafeteria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cafeterias/1
  # DELETE /cafeterias/1.json
  def destroy
    @cafeteria.destroy
    respond_to do |format|
      format.html { redirect_to cafeterias_url, notice: 'La cafetería se ha eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cafeteria
      @cafeteria = Cafeteria.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cafeteria_params
      params.require(:cafeteria).permit(:name, :slug, :image_url, :location, :hours, :phone, :contributor_name, :last_contribution_date, :menu_price)
    end
end
