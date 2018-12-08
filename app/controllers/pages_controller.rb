class PagesController < ApplicationController
  def home
    @users = User.all
    @user = User.new
  end
end
