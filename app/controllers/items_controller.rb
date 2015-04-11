class ItemsController < ApplicationController
  before_action :require_user
  before_action :set_item, only: [:show, :edit, :update]

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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:notice] = "Item has been updated."
      redirect_to list_path(@item)
    else
      flash[:error] = "Item has not been updated."
      render :show
    end
  end

  def complete
    @item = Item.find(params[:id])

    if params[:completed] == "true"
      @item.completed_by = current_user.id
    elsif params[:completed] == "false"
      @item.completed_by = nil
    end

    if @item.save
      flash[:notice] = "Item has been updated!"
      redirect_to list_path(@item.list)
    else
      flash[:error] = "That did not work"
      redirect_to :back
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :completed)
    end

    def set_item
      @item = Item.find(params[:id])
    end

end
