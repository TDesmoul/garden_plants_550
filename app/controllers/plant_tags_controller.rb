class PlantTagsController < ApplicationController
  def new
    # pour le formulaire
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    params[:plant_tag][:tag].each do |tag_name|
      tag = Tag.find_by(name: tag_name)
      PlantTag.create(plant: @plant, tag: tag)
    end
    redirect_to garden_path(@plant.garden)
  end
end
