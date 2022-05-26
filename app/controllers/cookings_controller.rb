class CookingsController < ApplicationController
  before_action :authenticate_user!

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
    params.require(:cooking).permit(:cooked_at)
  end
end
