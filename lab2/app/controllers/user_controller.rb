class UserController < ApplicationController
  before_action :set_user, only: [:update, :create, :show]
  def index
    @users = User.all
  end

  def create
  end

  def update
    
  end

  def delete
  end

  def show
  end

  def set_user
    @user = User.find(params[:id])
  end
end
