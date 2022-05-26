class RootController < ApplicationController
  def index
    redirect_to :meals if current_user
  end
end
