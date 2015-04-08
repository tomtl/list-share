class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create

  end

  def show
    @list = List.find(params[:id])
    @items = @list.items
  end
end
