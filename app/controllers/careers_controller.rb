class CareersController < ApplicationController
  before_action :find_career, only: [:show, :edit, :update, :destroy]

  def index
    @careers = Career.all.order("created_at DESC")
  end

  def show
  end

  def new
    @career = Career.new
  end

  def create
    @career= Career.new(career_params)

    if @career.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
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
