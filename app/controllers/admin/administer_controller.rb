class Admin::AdministerController < ApplicationController
  before_filter :find_controller

  def index

  end

  private

  def find_controller
    @controller = params[:controller].slice(0..(params[:controller].index('/'))-1)
    @p = 2
  end
end
