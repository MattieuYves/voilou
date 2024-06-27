class CarsController < ApplicationController
  # En tant qu’utilisateur, je peux voir la liste de toutes les voitures.
  def index
    @cars = Car.all
  end

  # En tant qu’utilisateur, je peux accéder aux détails d’une voiture.
  def show
    @car = Car.find(params[:id])
  end

  # En tant qu’utilisateur, je peux réserver une voiture.

end
