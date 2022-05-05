class CookingsController < ApplicationController
  def create
    @meal = Meal.find(params[:meal_id])
    @cooking = @meal.cookings.create(cooking_params)
    redirect_to meal_path(@meal)
  end

  private

  def cooking_params
    params.require(:cooking).permit(:cooked_at)
  end
end
