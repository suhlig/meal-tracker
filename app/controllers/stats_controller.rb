class StatsController < ApplicationController
  def index
     @top10 = Meal.top10
  end
end
