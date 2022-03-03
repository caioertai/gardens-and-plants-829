class PlantsController < ApplicationController
  # /gardens/169/plants/new
  def new
    @garden = Garden.find(params[:garden_id])
    @plant = Plant.new
  end

  def create
    @garden = Garden.find(params[:garden_id])
    @plant = Plant.new(plants_params)
    @plant.garden = @garden

    if @plant.save!
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  # /plants/:id
  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy

    redirect_to garden_path(@plant.garden)
  end

  private

  def plants_params
    params.require(:plant).permit(:name, :image_url)
  end
end
