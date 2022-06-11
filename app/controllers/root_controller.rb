class RootController < ApplicationController
  def index
    redirect_to :cookings if current_user
  end
end
