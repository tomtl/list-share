class ListUsersController < ApplicationController
  before_action :require_list_user
  before_action :set_list, only: [:new, :create, :destroy]
  before_action :set_list_user, only: [:destroy]
  
  def new
    @list_user = ListUser.new
  end

  def create
    @list_user = ListUser.create
    @list_user.list = @list
    @list_user.user = User.find_by username: list_user_params[:user]

    if @list_user.save
      flash[:notice] = "User has been added to this list."
      redirect_to list_path(@list)
    else
      flash[:error] = "User was not added. Please check username is correct."
      render :new
    end
  end
  
  def destroy
    if @list_user.destroy
      flash[:notice] = "#{@list_user.user.username} has been removed from this list."
    else
      flash[:error] = "User has not been removed."
    end
    
    redirect_to new_list_list_user_path(@list, @list_user)
  end
  
  private
    def list_user_params
      params.require(:list_user).permit(:user)
    end
    
    def set_list
      @list = List.find_by slug: params[:list_id]
    end
    
    def set_list_user
      @list_user = ListUser.find(params[:id])
    end
    
    def require_list_user
      set_list
      access_denied unless logged_in? && @list.users.include?(@current_user)
    end
end