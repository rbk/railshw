class PageController < ApplicationController

  def home
  	@users = User.all
  end


  def about
  end

  def signup
  	@user = User.new
  end

  def login
  end
end
