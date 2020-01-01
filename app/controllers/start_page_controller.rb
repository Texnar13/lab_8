class StartPageController < ApplicationController
  def index ()

  end

  def result
    @m = params[:v1].to_i
  end
end
