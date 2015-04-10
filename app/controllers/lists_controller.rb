class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end
  
  def new
  end

  def create
    @list = List.create(list_params)
    @list.users << User.first # TODO - change with user sessions
    
    if @list.save
      flash[:notice] = "Your list has been created!"
      redirect_to list_path(@list)
    else
      render :new
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
