class AreasController < ApplicationController
  before_action :find_area, only: [:show, :edit, :update, :destroy]

  def index
    @areas = Area.all
  end

  def new
    @area = Area.new
  end

  def show
  end

  def create
    @area= Area.new(area_params)

    if @area.save
      redirect_to areas_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @area.update(area_params)
      redirect_to areas_path(@area)
    else
      render 'edit'
    end
  end

  def destroy
    @area.destroy
    redirect_to areas_path
  end

  private
  def area_params

    params.require(:area).permit(:name_area)
  end

  def find_area
    @area = Area.find(params[:id])
  end

end
