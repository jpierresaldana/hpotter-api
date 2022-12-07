class CharactersController < ApplicationController
  before_action :set_character, only: %w[show edit update destroy]

  def index
    @characters = Character.all
  end

  def show
  end

  def create
    @character = Character.new(characters_params)
    if @character.save
      flash[:notice] = "Personaje creada con éxito"
    else
      render :new, status: :unprocessable_entity
      flash[:notice] = "ERROR - Revise los datos a registrar para crear el Personaje"
    end
  end

  def update
    @character.update!(characters_params)
    flash[:notice] = "Personaje actualizado con éxito"
  end

  def destroy
    @character.destroy
    flash[:notice] = "Personaje eliminado con éxito"
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def characters_params
    params.require(:character).permit(:name, :review, :actor, :image_url)
  end
end
