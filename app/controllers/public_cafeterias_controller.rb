class PublicCafeteriasController < ApplicationController
  layout 'public'

  def index
    @cafeterias = Cafeteria.all
  end

  def show
    @cafeteria = Cafeteria.find(params[:id])
  end
end
