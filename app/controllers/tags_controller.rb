class TagsController < ApplicationController
  def index
    @tags = Meal.tag_counts_on(:tags)
  end

  def show
    if params[:id].present?
      @tag = params[:id]
      @meals = Meal.tagged_with(@tag)
    end
  end
end
