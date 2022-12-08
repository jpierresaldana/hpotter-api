class CharactersController < ApplicationController
  before_action :set_character, only: %w[show update destroy]

  def index
    characters = Character.all
    render json: characters.to_json(
      only: %i[id name actor image_url review]
    ), status: 200
    # raise
  end

  def show
    if @character
      render json: @character.to_json(
        only: %i[id name actor image_url review]
      ), status: 200
    else
      render json: { status: 404, message: 'Character not found' }, status: 404
    end
  end

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
    @character = Character.find_by_id(params[:id])
  end

  def characters_params
    params.require(:character).permit(:name, :review, :actor, :image_url)
  end
end
