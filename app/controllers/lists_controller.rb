class ListsController < ApplicationController
  before_action :require_user, except: [:index]
  before_action :set_list, only: [:show, :edit, :update]

  def index
    @lists = List.all
    @list = List.new
  end

  def new
  end

  def create
    @list = List.create(list_params)
    @list.users << User.find(current_user)

    if @list.save
      flash[:notice] = "Your list has been created!"
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def show
    @item = Item.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @list.users << @user

    if @list.update(list_params)
      flash[:notice] = "List has been updated."
      redirect_to list_path(@list)
    else
      flash[:error] = "List has not been updated."
      render :show
    end
  end

  def add_user

  end

  private
    def list_params
      params.require(:list).permit(:name, :user)
    end

    def set_list
      @list = List.find(params[:id])
    end
end
