class BirdsController < ApplicationController

  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    # could also----> render json: birds, except: [:created_at, :updated_at]
    # could also----> render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # using find_by returns nil, which is falsy and helps with error messages
    if bird
      render json: bird.slice(:id, :name, :species)
    # could also----> render json: {id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end

end
