class CookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params.include?(:week_of)
      @week_of = Time.parse(params[:week_of]).beginning_of_week.to_date
    else
      @week_of = Time.now.beginning_of_week.to_date
    end

    full_week = @week_of.beginning_of_week..@week_of.end_of_week
    cookings_of_week = Cooking.includes(:meal).where(cooked_at: full_week).to_a

    @cookings_for_week = full_week.inject(Hash.new) do |cookings, date|
      cookings[date] = cookings_of_week.select{|c| c.cooked_at == date}
      cookings
    end
  end

  def new
    @cooking = Cooking.new(cooked_at: params[:cooked_at])
  end

  def create
    @meal = Meal.find(params[:meal_id])
    @cooking = @meal.cookings.create(cooking_params)
    redirect_to meal_path(@meal)
  end

  def destroy
    @meal = Meal.find(params[:meal_id])
    @cooking = @meal.cookings.find(params[:id])
    @cooking.destroy
    redirect_to meal_path(@meal), status: 303
  end

  private

  def cooking_params
    params.require(:cooking).permit(:cooked_at, :meal_id)
  end
end
