class PublicCafeteriasController < ApplicationController
  layout 'public'

  def index
    @cafeterias = Cafeteria.all
  end

  def show
    @cafeteria = Cafeteria.find_by(slug: params[:slug])
  end
end
