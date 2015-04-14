class ListsController < ApplicationController
  before_action :require_user, except: [:index]
  before_action :require_list_user, except: [:index, :new, :create]
  before_action :set_list, only: [:show, :edit, :update]

  def index
    @lists = logged_in? ? current_user.lists : Array(List.first)
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
    @user = ListUser.new
  end

  def update
    if @list.update(list_params)
      flash[:notice] = "This list has been renamed successfully."
      redirect_to list_path(@list)
    else
      flash[:error] = "This list has not been renamed"
      render :show
    end
  end

  private
    def list_params
      params.require(:list).permit(:name, :user)
    end

    def set_list
      @list = List.find_by slug: params[:id]
    end
    
    def list_user?
      !!@list.users.include?(@current_user)
    end
  
    def require_list_user
      set_list
      access_denied unless logged_in? && list_user?
    end
end
