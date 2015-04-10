class ItemsController < ApplicationController
  def new
  end
  
  def create
    @item = Item.create(item_params)
    @item.list = List.find(params[:list_id])
    @item.creator = User.first # TODO - Change after sessions set up
    
    if @item.save
      flash[:notice] = "You item has been created!"
      redirect_to :back
    else
      flash[:error] = "Item save unsuccessful"
      redirect_to :back
    end
    
  end
  
  def edit
  
  end
  
  def complete
    @item = Item.find(params[:id])
    
    if @item.update(completed_by: User.first.id)
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