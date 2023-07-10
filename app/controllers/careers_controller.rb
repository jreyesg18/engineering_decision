class CareersController < ApplicationController
  before_action :find_career, only: [:show, :edit, :update, :destroy]

  def index
    if params[:area].blank?
      @careers = Career.all.order("created_at DESC")
    else
      @area_id = Area.find_by(name_area: params[:area]).id
      @careers = Career.where(:area_id => @area_id).order("created_at DESC")
    end
  end

  def show
  end

  def new
    #@career = Career.new
    @career = current_user.careers.build
    @areas = Area.all.map{|c| [c.name_area, c.id]}
  end

  def create
    @areas = Area.all.map{|c| [c.name_area, c.id]}
    #@career= Career.new(career_params)
    @career = current_user.careers.build(career_params)
    @career.area_id = params[:area_id]

    if @career.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @career = current_user.carrers.build
  end

  def update

    @career.area_id = params[:area_id]

    if @career.update(career_params)
      redirect_to career_path(@career)
    else
      render 'edit'
    end
  end

  def destroy
    @career.destroy
    redirect_to root_path
  end


  private
  def career_params
    params.require(:career).permit(:name_career, :job_title, :grade_title, :duration, :graduate_profile, :occupational_field)
  end
  def find_career
    @career = Career.find(params[:id])
  end
end
