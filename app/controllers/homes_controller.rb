class HomesController < ApplicationController
  def show
    render :show, layout: "landing"
  end
end
