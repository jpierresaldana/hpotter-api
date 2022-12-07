class CharactersController < ApplicationController
  before_action :set_character, only: %w[show update destroy]

  def index
    characters = Character.all
  end

  def show; end

  def create
    character = Character.new(characters_params)
    if character.save

    else

    end
  end

  def update
    character.update!(characters_params)
  end

  def destroy
    character.destroy
  end

  private

  def set_character
    character = Character.find(params[:id])
  end

  def characters_params
    params.require(:character).permit(:name, :review, :actor, :image_url)
  end
end
