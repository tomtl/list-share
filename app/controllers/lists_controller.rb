class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    @list.users << User.first # TODO - change with user sessions
    
    if @list.save
      flash[:notice] = "Your list has been created!"
      redirect_to lists_path
    else
      flash[:error] = "Your list was not created."
      render :index
    end
  end

  def show
    @list = List.find(params[:id])
    @item = Item.new
  end
  
  private
    def list_params
      params.require(:list).permit(:name)
    end
end
