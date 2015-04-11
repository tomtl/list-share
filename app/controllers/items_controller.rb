class ItemsController < ApplicationController
  before_action :require_user

  def create
    @item = Item.create(item_params)
    @item.list = List.find(params[:list_id])
    @item.creator = current_user

    if @item.save
      flash[:notice] = "You item has been created!"
      redirect_to :back
    else
      flash[:error] = "Item save unsuccessful"
      redirect_to :back
    end
  end

  def complete
    @item = Item.find(params[:id])
    @item.completed_by = current_user.id
    binding.pry

    if @item.save
      flash[:notice] = "Item has been marked completed!"
      redirect_to :back
    else
      flash[:error] = "That did not work"
      redirect_to :back
    end
  end

  private
    def item_params
      params.require(:item).permit(:name)
    end

end
