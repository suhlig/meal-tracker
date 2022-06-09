class MealsController < ApplicationController
  before_action :authenticate_user!

  def index
    @meals = Meal.includes(:cookings).order('cookings.cooked_at DESC')
    @tags = Meal.tag_counts_on(:tags)
  end

  def search
    @query = params[:query].strip
    title_matcher = Meal.arel_table[:title]
    @meals = Meal.where(title_matcher.matches("%#{ActiveRecord::Base::sanitize_sql_like(@query)}%"))
  end

  def tags
    @tags = Meal.tag_counts_on(:tags)
  end

  def tag
    if params[:id].present?
      @tag = params[:id]
      @meals = Meal.tagged_with(@tag)
    else
      raise "no tag"
    end
  end

  def show
    @meal = Meal.find(params[:id])
    @tags = @meal.tag_counts_on(:tags)
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)

    if @meal.save
      redirect_to @meal
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:id])

    if @meal.update(meal_params)
      redirect_to @meal
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def meal_params
    params.require(:meal).permit(:title, :notes, :tag_list)
  end
end
