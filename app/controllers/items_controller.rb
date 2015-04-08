class ItemsController < ApplicationController
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
  
end