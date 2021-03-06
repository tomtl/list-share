class ItemsController < ApplicationController
  before_action :require_user
  before_action :require_item_user, except: [:create]
  before_action :set_item, only: [:show, :edit, :update, :complete]

  def create
    @item = Item.create(item_params)
    @item.list = List.find_by slug: params[:list_id]
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
      redirect_to list_path(@item.list)
    else
      flash[:error] = "Item has not been updated."
      render :show
    end
  end

  def complete
    @list = @item.list
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
      render 'lists/show'
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :completed)
    end

    def set_item
      @item = Item.find_by slug: params[:id]
    end
    
    def item_user?
      !!@item.list.users.include?(@current_user)
    end
    
    def require_item_user
      set_item
      access_denied unless logged_in? && item_user?
    end
    
end
